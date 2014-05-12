#import <LSStatusBarItem.h>

LSStatusBarItem* sbItem = nil;

%hook AVCaptureDevice

- (void)setTorchMode:(BOOL)state {
	%orig;
	if(state) {
		sbItem.visible = YES;
	} else {
		sbItem.visible = NO;
	}
}

- (void)setFlashMode:(BOOL)state {
	%orig;
	if(state) {
		sbItem.visible = YES;
	} else {
		sbItem.visible = NO;
	}
}

%end

void createImage() {
	sbItem = [[NSClassFromString(@"LSStatusBarItem") alloc] initWithIdentifier:@"com.sassoty.bulb" alignment:StatusBarAlignmentRight];
	sbItem.imageName = @"Bulb";
}

%ctor {
	createImage();
}
