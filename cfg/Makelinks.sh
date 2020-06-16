#!/bin/bash

# links cmsis folder into our inc folder
ln -s /storage/Shared/Documents/ASF_LIBS/xdk-asf-3.48.0/thirdparty/CMSIS/Include ./inc/cmsis

# links asf3 samd21 include folder into our inc folder
ln -s /storage/Shared/Documents/ASF_LIBS/xdk-asf-3.48.0/sam0/utils/cmsis/samd21/include ./inc/asf3-inc

# links linker script into our linker folder 
ln -s /storage/Shared/Documents/ASF_LIBS/xdk-asf-3.48.0/sam0/utils/linker_scripts/samd21/gcc/samd21j18a_flash.ld ./linker/.

# links asf3 startup code for d21 into our src folder
ln -s /storage/Shared/Documents/ASF_LIBS/xdk-asf-3.48.0/sam0/utils/cmsis/samd21/source/gcc/startup_samd21.c ./src/.
ln -s /storage/Shared/Documents/ASF_LIBS/xdk-asf-3.48.0/sam0/utils/cmsis/samd21/source/system_samd21.c ./src/.
ln -s /storage/Shared/Documents/ASF_LIBS/xdk-asf-3.48.0/sam0/utils/cmsis/samd21/source/system_samd21.h ./inc/.
