cmd_scripts/mod/devicetable-offsets.s := /home/panyoujie/cm12.1/kernel/tcl/q39/scripts/gcc-wrapper.py /home/panyoujie/cm12.1/prebuilts/misc/linux-x86/ccache/ccache aarch64-linux-android-gcc -Wp,-MD,scripts/mod/.devicetable-offsets.s.d  -nostdinc -isystem /home/panyoujie/cm12.1/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin/../lib/gcc/aarch64-linux-android/4.9/include -I/home/panyoujie/cm12.1/kernel/tcl/q39/arch/arm64/include -Iarch/arm64/include/generated  -I/home/panyoujie/cm12.1/kernel/tcl/q39/include -Iinclude -I/home/panyoujie/cm12.1/kernel/tcl/q39/arch/arm64/include/uapi -Iarch/arm64/include/generated/uapi -I/home/panyoujie/cm12.1/kernel/tcl/q39/include/uapi -Iinclude/generated/uapi -include /home/panyoujie/cm12.1/kernel/tcl/q39/include/linux/kconfig.h  -I/home/panyoujie/cm12.1/kernel/tcl/q39/scripts/mod -Iscripts/mod -D__KERNEL__ -mlittle-endian -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-format-security -fno-delete-null-pointer-checks -Os -Wno-maybe-uninitialized -mgeneral-regs-only -fno-pic -Wframe-larger-than=2048 -fno-stack-protector -Wno-unused-but-set-variable -fno-omit-frame-pointer -fno-optimize-sibling-calls -g -Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GOTO    -D"KBUILD_STR(s)=\#s" -D"KBUILD_BASENAME=KBUILD_STR(devicetable_offsets)"  -D"KBUILD_MODNAME=KBUILD_STR(devicetable_offsets)" -fverbose-asm -S -o scripts/mod/devicetable-offsets.s /home/panyoujie/cm12.1/kernel/tcl/q39/scripts/mod/devicetable-offsets.c

source_scripts/mod/devicetable-offsets.s := /home/panyoujie/cm12.1/kernel/tcl/q39/scripts/mod/devicetable-offsets.c

deps_scripts/mod/devicetable-offsets.s := \
  /home/panyoujie/cm12.1/kernel/tcl/q39/include/linux/kbuild.h \
  /home/panyoujie/cm12.1/kernel/tcl/q39/include/linux/mod_devicetable.h \
  /home/panyoujie/cm12.1/kernel/tcl/q39/include/linux/types.h \
    $(wildcard include/config/uid16.h) \
    $(wildcard include/config/lbdaf.h) \
    $(wildcard include/config/arch/dma/addr/t/64bit.h) \
    $(wildcard include/config/phys/addr/t/64bit.h) \
    $(wildcard include/config/64bit.h) \
  /home/panyoujie/cm12.1/kernel/tcl/q39/include/uapi/linux/types.h \
  arch/arm64/include/generated/asm/types.h \
  /home/panyoujie/cm12.1/kernel/tcl/q39/include/uapi/asm-generic/types.h \
  /home/panyoujie/cm12.1/kernel/tcl/q39/include/asm-generic/int-ll64.h \
  /home/panyoujie/cm12.1/kernel/tcl/q39/include/uapi/asm-generic/int-ll64.h \
  /home/panyoujie/cm12.1/kernel/tcl/q39/arch/arm64/include/uapi/asm/bitsperlong.h \
  /home/panyoujie/cm12.1/kernel/tcl/q39/include/asm-generic/bitsperlong.h \
  /home/panyoujie/cm12.1/kernel/tcl/q39/include/uapi/asm-generic/bitsperlong.h \
  /home/panyoujie/cm12.1/kernel/tcl/q39/include/uapi/linux/posix_types.h \
  /home/panyoujie/cm12.1/kernel/tcl/q39/include/linux/stddef.h \
  /home/panyoujie/cm12.1/kernel/tcl/q39/include/uapi/linux/stddef.h \
  /home/panyoujie/cm12.1/kernel/tcl/q39/include/linux/compiler.h \
    $(wildcard include/config/sparse/rcu/pointer.h) \
    $(wildcard include/config/trace/branch/profiling.h) \
    $(wildcard include/config/profile/all/branches.h) \
    $(wildcard include/config/enable/must/check.h) \
    $(wildcard include/config/enable/warn/deprecated.h) \
    $(wildcard include/config/kprobes.h) \
  /home/panyoujie/cm12.1/kernel/tcl/q39/include/linux/compiler-gcc.h \
    $(wildcard include/config/arch/supports/optimized/inlining.h) \
    $(wildcard include/config/optimize/inlining.h) \
  /home/panyoujie/cm12.1/kernel/tcl/q39/include/linux/compiler-gcc4.h \
    $(wildcard include/config/arch/use/builtin/bswap.h) \
  /home/panyoujie/cm12.1/kernel/tcl/q39/arch/arm64/include/uapi/asm/posix_types.h \
  /home/panyoujie/cm12.1/kernel/tcl/q39/include/uapi/asm-generic/posix_types.h \
  /home/panyoujie/cm12.1/kernel/tcl/q39/include/linux/uuid.h \
  /home/panyoujie/cm12.1/kernel/tcl/q39/include/uapi/linux/uuid.h \
  /home/panyoujie/cm12.1/kernel/tcl/q39/include/linux/string.h \
    $(wildcard include/config/binary/printf.h) \
  /home/panyoujie/cm12.1/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/lib/gcc/aarch64-linux-android/4.9/include/stdarg.h \
  /home/panyoujie/cm12.1/kernel/tcl/q39/include/uapi/linux/string.h \
  /home/panyoujie/cm12.1/kernel/tcl/q39/arch/arm64/include/asm/string.h \

scripts/mod/devicetable-offsets.s: $(deps_scripts/mod/devicetable-offsets.s)

$(deps_scripts/mod/devicetable-offsets.s):
