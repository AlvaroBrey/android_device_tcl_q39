cmd_scripts/mod/empty.o := /home/panyoujie/cm12.1/kernel/tcl/q39/scripts/gcc-wrapper.py /home/panyoujie/cm12.1/prebuilts/misc/linux-x86/ccache/ccache aarch64-linux-android-gcc -Wp,-MD,scripts/mod/.empty.o.d  -nostdinc -isystem /home/panyoujie/cm12.1/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin/../lib/gcc/aarch64-linux-android/4.9/include -I/home/panyoujie/cm12.1/kernel/tcl/q39/arch/arm64/include -Iarch/arm64/include/generated  -I/home/panyoujie/cm12.1/kernel/tcl/q39/include -Iinclude -I/home/panyoujie/cm12.1/kernel/tcl/q39/arch/arm64/include/uapi -Iarch/arm64/include/generated/uapi -I/home/panyoujie/cm12.1/kernel/tcl/q39/include/uapi -Iinclude/generated/uapi -include /home/panyoujie/cm12.1/kernel/tcl/q39/include/linux/kconfig.h  -I/home/panyoujie/cm12.1/kernel/tcl/q39/scripts/mod -Iscripts/mod -D__KERNEL__ -mlittle-endian -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-format-security -fno-delete-null-pointer-checks -Os -Wno-maybe-uninitialized -mgeneral-regs-only -fno-pic -Wframe-larger-than=2048 -fno-stack-protector -Wno-unused-but-set-variable -fno-omit-frame-pointer -fno-optimize-sibling-calls -g -Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GOTO    -D"KBUILD_STR(s)=\#s" -D"KBUILD_BASENAME=KBUILD_STR(empty)"  -D"KBUILD_MODNAME=KBUILD_STR(empty)" -c -o scripts/mod/empty.o /home/panyoujie/cm12.1/kernel/tcl/q39/scripts/mod/empty.c

source_scripts/mod/empty.o := ../../../../../../kernel/tcl/q39/scripts/mod/empty.c

deps_scripts/mod/empty.o := \

scripts/mod/empty.o: $(deps_scripts/mod/empty.o)

$(deps_scripts/mod/empty.o):
