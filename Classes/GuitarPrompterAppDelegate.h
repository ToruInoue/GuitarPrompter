//
//  GuitarPrompterAppDelegate.h
//  GuitarPrompter
//
//  Created by Inoue 徹 on 10/10/16.
//  Copyright KISSAKI 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MessengerSystem.h"

#import "BaseViewController.h"

#import "CreateSongController.h"
#import "TitleViewController.h"



@interface GuitarPrompterAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	
	MessengerSystem * messenger;
	
	BaseViewController * bvCont;
	
	TitleViewController * tVCont;
	
	CreateSongController * csCont;
	
}
@property (nonatomic, retain) IBOutlet UIWindow *window;


- (void) messageCenter:(NSNotification * )nort;


/**
 タイトル画面での所作
 */
- (void) titleProc:(NSMutableDictionary * )dict;


/**
 新規作成画面での所作
 */
- (void) createInit:(NSMutableDictionary * )dict;
- (void) createProc:(NSMutableDictionary * )dict;


/**
 プレイ時の所作
 */
- (void) playInit:(NSMutableDictionary * )dict;
- (void) playProc:(NSMutableDictionary * )dict;



/**
 ユーティリティ
 */
int getState();
void setState(int state);




@end

