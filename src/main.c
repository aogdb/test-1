#include "config.h"
#include "arduino-core.h"

int main(void) {
#ifdef CONFIG_USB_TRACE
        p("main");
#endif
}
