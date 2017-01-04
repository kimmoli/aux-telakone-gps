# Dummy QtC project file for telakone

TEMPLATE=aux
SOURCES += \
    main.c \
    adc.c \
    threads/blinker.c \
    shell/cmd_reboot.c \
    shell/cmd_status.c \
    shell/shellcommands.c \
    board/board.c \
    shell/cmd_out.c \
    pwm.c \
    i2c.c \
    spi.c \
    shell/cmd_ping.c \
    shell/cmd_diic.c \
    shell/cmd_piic.c \
    exti.c \
    wdog.c \
    flash.c \
    shell/cmd_env.c \
    shell/cmd_dm.c \
    env.c \
    threads/messaging.c \
    shell/cmd_blink.c \
    threads/threadkiller.c \
    shell/cmd_date.c \
    helpers.c \
    analog_data.c \
    threads/auxlink.c \
    threads/gps.c \
    shell/cmd_gps.c

HEADERS += \
    adc.h \
    threads/blinker.h \
    chconf.h \
    halconf.h \
    mcuconf.h \
    shell/shellcommands.h \
    shell/shellconf.h \
    board/board.h \
    pwm.h \
    halconf_community.h \
    mcuconf_community.h \
    i2c.h \
    spi.h \
    exti.h \
    helpers.h \
    wdog.h \
    flash.h \
    env.h \
    threads/messaging.h \
    threads/threadkiller.h \
    analog_data.h \
    threads/auxlink.h \
    threads/gps.h

OTHER_FILES += \
    Makefile

INCLUDEPATH += \
 ./threads \
 ./shell \
 ./board \
 ../ChibiOS/os/license \
 ../ChibiOS/os/common/startup/ARMCMx/compilers/GCC \
 ../ChibiOS/os/common/startup/ARMCMx/devices/STM32F4xx \
 ../ChibiOS/os/common/ext/CMSIS/include \
 ../ChibiOS/os/common/ext/CMSIS/ST/STM32F4xx \
 ../ChibiOS/os/rt/include \
 ../ChibiOS/os/common/oslib/include \
 ../ChibiOS/os/common/ports/ARMCMx \
 ../ChibiOS/os/common/ports/ARMCMx/compilers/GCC \
 ../ChibiOS/os/hal/osal/rt \
 ../ChibiOS/os/hal/include \
 ../ChibiOS/os/hal/ports/common/ARMCMx \
 ../ChibiOS/os/hal/ports/STM32/STM32F4xx \
 ../ChibiOS/os/hal/ports/STM32/LLD/ADCv2 \
 ../ChibiOS/os/hal/ports/STM32/LLD/CANv1 \
 ../ChibiOS/os/hal/ports/STM32/LLD/DACv1 \
 ../ChibiOS/os/hal/ports/STM32/LLD/DMAv2 \
 ../ChibiOS/os/hal/ports/STM32/LLD/EXTIv1 \
 ../ChibiOS/os/hal/ports/STM32/LLD/GPIOv2 \
 ../ChibiOS/os/hal/ports/STM32/LLD/I2Cv1 \
 ../ChibiOS/os/hal/ports/STM32/LLD/MACv1 \
 ../ChibiOS/os/hal/ports/STM32/LLD/OTGv1 \
 ../ChibiOS/os/hal/ports/STM32/LLD/QUADSPIv1 \
 ../ChibiOS/os/hal/ports/STM32/LLD/RTCv2 \
 ../ChibiOS/os/hal/ports/STM32/LLD/SDIOv1 \
 ../ChibiOS/os/hal/ports/STM32/LLD/SPIv1 \
 ../ChibiOS/os/hal/ports/STM32/LLD/TIMv1 \
 ../ChibiOS/os/hal/ports/STM32/LLD/USARTv1 \
 ../ChibiOS/os/hal/ports/STM32/LLD/xWDGv1 \
 ../ChibiOS/os/various/shell \
 ../ChibiOS/os/hal/lib/streams \
 ../ChibiOS-Contrib/os/hal/include \
 ../ChibiOS-Contrib/os/hal/ports/STM32/LLD/CRCv1 \
 ../ChibiOS-Contrib/os/hal/ports/STM32/LLD/DMA2Dv1 \
 ../ChibiOS-Contrib/os/hal/ports/STM32/LLD/FSMCv1 \
 ../ChibiOS-Contrib/os/hal/ports/STM32/LLD/LTDCv1 \
 ../ChibiOS-Contrib/os/hal/ports/STM32/LLD/TIMv1 \
 ../ChibiOS-Contrib/os/hal/ports/STM32/LLD/USBHv1 \
 ../../gcc-arm-none-eabi-5_4-2016q2/arm-none-eabi/include

