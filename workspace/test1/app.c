#include "kernel.h"
#include "t_syslog.h"
#include "spike/hub.h"

void main_task(intptr_t exinf)
{
    hub_set_led(255, 0, 0);
    tslp_tsk(1000);
    hub_set_led(0, 255, 0);
    tslp_tsk(1000);
    hub_set_led(0, 0, 255);
}
