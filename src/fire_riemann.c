#include "config.h"
#include "arduino-core.h"
#include "fire.h"

void fire(void) {
#ifdef CONFIG_USB_TRACE
#ifdef CONFIG_POWER_IS_8_4_V 
        p("fire_riemann 8.4");
#else
	p("fire_riemann 4.2");
#endif
#endif
}
