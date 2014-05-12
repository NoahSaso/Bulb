export ARCHS = arm64 armv7 armv7s

include theos/makefiles/common.mk

TWEAK_NAME = Bulb
Bulb_FILES = Tweak.xm

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
