#ifndef ARDUINO_CORE_H
#define ARDUINO_CORE_H

#include "config.h"

#ifdef CONFIG_USB_IS_ON
        #define initSerial(baud) Serial.begin(baud)
	//#define p(s) Serial.println(s)
	#define p(s) puts(s)
#else
        #define initSerial(baud)
	#define p(s)
#endif


#endif

