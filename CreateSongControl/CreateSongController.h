//
//  CreateSongController.h
//  GuitarPrompter
//
//  Created by Inoue 徹 on 10/10/16.
//  Copyright 2010 KISSAKI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MessengerSystem.h"

@interface CreateSongController : UIViewController {
	MessengerSystem * messenger;
	IBOutlet UITextField * titleText;
	IBOutlet UITextField * artistText;
}

- (id) initCreateSongController;

- (void) createSongCenter:(NSNotification * )nort;


- (IBAction) titleEdited;
- (IBAction) artistEdited;
@end
