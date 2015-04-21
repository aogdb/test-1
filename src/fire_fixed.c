#include "config.h"
#include "arduino-core.h"
#include "fire.h"

void fire(void) {
#ifdef CONFIG_USB_TRACE
        p("fire_fixed");
#endif
}
