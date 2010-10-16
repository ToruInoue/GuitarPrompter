//
//  TitleViewController.h
//  GuitarPrompter
//
//  Created by Inoue 徹 on 10/10/16.
//  Copyright 2010 KISSAKI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MessengerSystem.h"

@interface TitleViewController : UIViewController {
	MessengerSystem * messenger;
	IBOutlet UIButton * playButton;
	IBOutlet UIButton * newButton;
	
//	IBOutlet UIButton * listButton;
}

- (id) initTitleViewController;

- (void) titleViewContCenter:(NSNotification * )nort;

- (IBAction) playTapped;
- (IBAction) newTapped;

@end
