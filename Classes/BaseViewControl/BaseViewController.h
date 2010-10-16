//
//  BaseViewController.h
//  GuitarPrompter
//
//  Created by Inoue 徹 on 10/10/16.
//  Copyright 2010 KISSAKI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MessengerSystem.h"


@interface BaseViewController : UIViewController {	
	MessengerSystem * messenger;
}

- (id) initBaseViewController;
- (void) baseViewCenter:(NSNotification * )nort;
@end
