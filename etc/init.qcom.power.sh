# Copyright (c) 2014, The Linux Foundation. All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are
# met:
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above
#       copyright notice, this list of conditions and the following
#       disclaimer in the documentation and/or other materials provided
#       with the distribution.
#     * Neither the name of The Linux Foundation nor the names of its
#       contributors may be used to endorse or promote products derived
#       from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED
# WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT
# ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS
# BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
# BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
# OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
# IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

# double check here since we only gonna handle 8939 for now
target=`getprop ro.board.platform`
case "$target" in
    "msm8916")
        if [ -f /sys/devices/soc0/soc_id ]; then
            soc_id=`cat /sys/devices/soc0/soc_id`
        else
            soc_id=`cat /sys/devices/system/soc/soc0/id`
        fi
        case "$soc_id" in
            "239")
		echo "8939 chip detected."
		;;
	    "*")
		exit 0
		;;
	esac
	;;
    "*")
	exit 0
	;;
esac
power_ctrl=`getprop persist.sys.power_ctrl`
#power_ctrl=1
power_ctrl_name="power_engine"
if [ "$power_ctrl" == "1" ]; then
	setprop persist.sys.power_ctrl.version v2.0

	power_ctrl_interval=`getprop persist.sys.power_ctrl.interval`
	power_ctrl_off_cores=`getprop persist.sys.power_ctrl.off_cores`
	power_ctrl_on_threshold=`getprop persist.sys.power_ctrl.on_threshold`
	power_ctrl_off_threshold=`getprop persist.sys.power_ctrl.off_threshold`
	power_ctrl_ctrl_gpu=`getprop persist.sys.power_ctrl.ctrl_gpu`
	power_ctrl_ctrl_gpu_low_max_freq=`getprop persist.sys.power_ctrl.gpu_low_max_freq`
	power_ctrl_ctrl_gpu_high_max_freq=`getprop persist.sys.power_ctrl.gpu_high_max_freq`
	power_ctrl_log=`getprop persist.sys.power_ctrl.log`
	if [ "$power_ctrl_interval" == "" ]; then
		# Check duration is 1 second
		power_ctrl_interval=1
	fi
	if [ "$power_ctrl_off_cores" == "" ]; then
		# Only try to hotplug CPU1/2 performance cores by default
	        power_ctrl_off_cores=6
	fi
	if [ "$power_ctrl_on_threshold" == "" ]; then
	        power_ctrl_on_threshold=1344000
	fi
	if [ "$power_ctrl_off_threshold" == "" ]; then
	        power_ctrl_off_threshold=1344000
	fi
	if [ "$power_ctrl_ctrl_gpu" == "" ]; then
		# by default, will not try to control GPU
		# it should be controlled by GPU DCVS
                power_ctrl_ctrl_gpu=false
        fi
	if [ "$power_ctrl_ctrl_gpu_low_max_freq" == "" ]; then
                power_ctrl_ctrl_gpu_low_max_freq=400000000
        fi
	if [ "$power_ctrl_ctrl_gpu_high_max_freq" == "" ]; then
                power_ctrl_ctrl_gpu_high_max_freq=550000000
        fi
	if [ "$power_ctrl_log" == "" ]; then
		# normally, it will trash logs. If needed, set the property to a file
		power_ctrl_log=/dev/null
        fi

	echo "$power_ctrl_name: #### multi-core power control enabled ####" >> $power_ctrl_log

	state="unknown"

	while true; do
		# echo "power_engine: start of the control" >> /data/local/tmp/power_engine_log
		# echo /proc/uptime >> $power_ctrl_log
		# echo /proc/uptime >> /data/local/tmp/power_engine_log

		# check if the backlight is on
		#cat /sys/power/wake_lock | grep PowerManagerService.Display
		# backlight is off
		#if [ "$?" != "0" ]; then
		#	if [ "$state" != "powersave" ]; then
				#echo 252 > /sys/module/msm_thermal/core_control/cpus_offlined
				#state="powersave"
				# echo "$power_ctrl_name: Enable 2x big cores for power save mode which only support audio playback and I/O access" >> $power_ctrl_log
		#	fi
		#	sleep 5
		#	continue
		#else
		#	sleep $power_ctrl_interval
		#fi

		sleep $power_ctrl_interval
		cpu0_freq=`cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq`
		# cpus_offlined=`cat /sys/module/msm_thermal/core_control/cpus_offlined`
		#
		# Separate CPU DCVS to below regions:
		#	------------------------- 1.7GHz ------------------------------------
		#	 		High region of turbo mode
		#	  In the mode, we need try the best to achieve better performance
		#	  for benchmark situation. So, will enable all cores by default to
		#	  achieve the best performance in short time within power/thermal
		#				limitations.
		#	------------------------- 1.34GHz -----------------------------------
		#	  		Low region of turbo mode
		#			High region of normal mode
		#	  In the mode, we need shutdown 2 perf cores to save power so that
		#	  we could have better performance within power/thermal limitations.
		#	------------------------- 400MHz -----------------------------------
		#				SVS mode
		#	  In the mode, we need all cores for better performance and let
		#	  let thermal-engine to control power/thermal.
		#	------------------------- 200MHz -----------------------------------
		case "$cpu0_freq" in
			# high turbo mode cpr_corner should be 24 - 17(Big cluster needed).
			"1708800" | "1689600" | "1651200" | "1632000" | "1612800" | "1574400" |\
			 "1536000" | "1497600" | "1420800")
				if [ "$state" != "turbo" ]; then
					#echo 0 > /sys/module/msm_thermal/core_control/cpus_offlined
					echo 1 > /sys/devices/system/cpu/cpu1/online
					echo 1 > /sys/devices/system/cpu/cpu2/online
					state="turbo"
					# echo "$power_ctrl_name: Enable cores for turbo mode high region" >> $power_ctrl_log
				fi
				;;
			# low turbo mode cpr_corner should be 17(Big cluster needed) or 14(Big cluster needed)
			# normal mode cpr_corner should be 12(Little cluster needed) or 11(CCI needed)
			"1344000" | "1267200" | "1190400" | "1113600" | "1036800" | "960000" |\
			"883200" | "806400" | "800000" | "729600" | "652800" | "533330" | \
			"499200" | "422400" )
				if [ "$state" != "normal" ]; then
					#echo 12 > /sys/module/msm_thermal/core_control/cpus_offlined
					echo 0 > /sys/devices/system/cpu/cpu1/online
					echo 0 > /sys/devices/system/cpu/cpu2/online
					# echo "$power_ctrl_name: Enable 2x big cores + 4x little cores for normal mode" >> $power_ctrl_log
					state="normal"
				fi
				;;
			# svs mode cpr_corner should be 3
			"400000" | "345600" | "200000" )
				if [ "$state" != "svs" ]; then
					#echo 0 > /sys/module/msm_thermal/core_control/cpus_offlined
					echo 1 > /sys/devices/system/cpu/cpu1/online
					echo 1 > /sys/devices/system/cpu/cpu2/online
					# echo "$power_ctrl_name: Enable 4x big cores and 4x little cores for svs mode" >> $power_ctrl_log
					state="svs"
				fi
				;;
			*)
				# echo 240 > /sys/module/msm_thermal/core_control/cpus_offlined
				# echo "$power_ctrl_name: CPU0 is offlined which is controlled by other module or new chip freq is coming. Do nothing" >> $power_ctrl_log
				state="unknown"
				;;
		esac
	done
	# echo "power_engine: end of the control" >> /data/local/tmp/power_engine_log
	# cat /proc/uptime >> $power_ctrl_log
	# cat /proc/uptime >> /data/local/tmp/power_engine_log
	# echo "" >> /data/local/tmp/power_engine_log
else
	echo "$power_ctrl_name: #### multi-core power control disabled ####"
fi
