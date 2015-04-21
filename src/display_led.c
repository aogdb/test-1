#include "config.h"
#include "arduino-core.h"
#include "display.h"

void display(void) {
#ifdef CONFIG_USB_TRACE
        p("display_led");
#endif
}
