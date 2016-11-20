#include <stdlib.h>
#include <string.h>

#include "ch.h"
#include "hal.h"
#include "chprintf.h"
#include "shell.h"

#include "helpers.h"
#include "shellcommands.h"
#include "adc.h"
#include "pwm.h"
#include "i2c.h"
#include "spi.h"
#include "exti.h"
#include "wdog.h"
#include "env.h"
#include "threadkiller.h"

#include "blinker.h"
#include "auxlink.h"
#include "messaging.h"

char *environment;
char **environ;

int main(void)
{
    halInit();
    chSysInit();
    wdogTKInit(WDG_TIMEOUT_NORMAL);

    sdStart(&SD6, NULL);  /* Serial console in USART6, 115200 */

    consoleStream = (BaseSequentialStream *) &SD6;

    PRINT("\n\r");
    PRINT("\n\rtelakone GPS\n\r");
    PRINT("------------\n\r");
    PRINT("\n\r");

    environment = chHeapAlloc(NULL, ENV_PAGE_SIZE);
    environ = chHeapAlloc(NULL, ENV_PAGE_SIZE*sizeof(char*));

    memset(environment, 0, ENV_PAGE_SIZE);
    memset(environ, 0, ENV_PAGE_SIZE*sizeof(char*));

    PRINT(" - Loaded %d variables\n\r", envLoader());

    rtcSTM32SetPeriodicWakeup(&RTCD1, NULL);
    crcStart(&CRCD1, NULL);

    i2cTKInit();
    spiTKInit();
    adcTKInit();
    adcTKStartConv();
    pwmTKInit();
    extiTKInit();
    auxLinkInit(0x00);

    wdogTKKick();
#ifndef TK_USE_WDOG
    PRINT(" - Watchdog is disabled\n\r");
#endif

    PRINT(" - Initialisation complete\n\r");

    /* Start threads */
    startThreadKiller();
    startI2cThread();
    startMessagingThread(); /* Parses messages from network */
    startBlinkerThread(); /* Controls the external warning lamps on OUT1 */
    startAuxLinkThread(); /* Auxiliary device link */

    PRINT(" - Threads started\n\r");

    PRINT("\n\r");
//    cmd_status((BaseSequentialStream *)&SD6, 0, NULL);

    /* Everything is initialised, turh red led off */
    palClearLine(LINE_REDLED);

    shellInit();

    chThdCreateFromHeap(NULL, SHELL_WA_SIZE, "shell", NORMALPRIO + 1, shellThread, (void *)&shell_cfg_uart);

    while (true)
    {
        wdogTKKick();
        chThdSleepMilliseconds(200);
        palToggleLine(LINE_GREENLED);
    }
}