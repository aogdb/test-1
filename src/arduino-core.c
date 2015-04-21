#include "config.h"
#include "arduino-core.h"

void setup() {
#ifdef CONFIG_USB_TRACE
	p("setup");
#endif

}
 
int myMain();
 
void loop() { myMain(); }

