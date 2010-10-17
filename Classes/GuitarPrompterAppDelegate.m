//
//  GuitarPrompterAppDelegate.m
//  GuitarPrompter
//
//  Created by Inoue 徹 on 10/10/16.
//  Copyright KISSAKI 2010. All rights reserved.
//

#import "GuitarPrompterAppDelegate.h"
#import "GuitarPrompt_ConstSetting.h"


@implementation GuitarPrompterAppDelegate

@synthesize window;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
	
	messenger = [[MessengerSystem alloc] initWithBodyID:self withSelector:@selector(messageCenter:) withName:GPMASTER];
    
	bvCont = [[BaseViewController alloc] initBaseViewController];
	tVCont = [[TitleViewController alloc] initTitleViewController];
	csCont = [[CreateSongController alloc] initCreateSongController];
	
		
	
	[window addSubview:bvCont.view];
	
	
	
	setState(GP_STATE_TITLE_INIT);
	[messenger callMyself:@"初期化完了",nil];
	
	
    [window makeKeyAndVisible];
	
	return YES;
}



- (void) messageCenter:(NSNotification * )nort {
	/**
	 遷移
	 */
	NSMutableDictionary * dict = (NSMutableDictionary * )[nort userInfo];
	
	
	switch (getState()) {
		case GP_STATE_TITLE_INIT:
			setState(GP_STATE_TITLE_PROC);
			[self titleInit:dict];
		case GP_STATE_TITLE_PROC:
			[self titleProc:dict];
			break;
			
			
		case GP_STATE_CREATE_INIT:
			setState(GP_STATE_CREATE_PROC);
			[self createInit:dict];
			
		case GP_STATE_CREATE_PROC:
			[self createProc:dict];
			break;
			
			
		case GP_STATE_PLAY_INIT:
			setState(GP_STATE_PLAY_PROC);
			[self playInit:dict];
		case GP_STATE_PLAY_PROC:
			[self playProc:dict];
			break;
			
			
		default:
			NSAssert(FALSE, @"ダミーとして");
			break;
	}
}


- (void) titleInit:(NSMutableDictionary * )dict {
	
	[messenger call:GPBASEVIEWCONT withExec:@"基本ビューにセット",
	 [messenger tag:@"ビュー" val:tVCont.view],
	 nil];
	
	
}
- (void) titleProc:(NSMutableDictionary * )dict {
	NSString * exec = [messenger getExecAsString:dict];
	
	if ([exec isEqualToString:@"プレイボタンが押された"]) {
		setState(GP_STATE_PLAY_INIT);
		[messenger callMyself:@"プレイへ遷移", nil];
		
		[messenger call:GPTITLEVIEWCONT withExec:@"ビューを外す", nil];
	}
	
	if ([exec isEqualToString:@"新規作成ボタンが押された"]) {
		setState(GP_STATE_CREATE_INIT);
		[messenger callMyself:@"新規作成へ遷移", nil];
		
		[messenger call:GPTITLEVIEWCONT withExec:@"ビューを外す", nil];
	}
	
}






- (void) createInit:(NSMutableDictionary * )dict {
	//画面を付ける
	[messenger call:GPBASEVIEWCONT withExec:@"基本ビューにセット",
	 [messenger tag:@"ビュー" val:csCont.view],
	 nil];
}

- (void) createProc:(NSMutableDictionary * )dict {
	NSString * exec = [messenger getExecAsString:dict];
	
	/**
	 [messenger callParent:@"タイトルとアーティスト入力完了",
	 [messenger tag:@"name" val:title],
	 [messenger tag:@"pass" val:[artistText.text copy]],
	 nil];
	 */	 
	if ([exec isEqualToString:@"タイトルとアーティスト入力完了"]) {
		//曲名をつくったので保存
		
	}
	
	if ([exec isEqualToString:@"新規作成キャンセル"]) {
		//新規作成キャンセルで、タイトル画面に戻る？のかな、スタックかな。
		setState(GP_STATE_TITLE_INIT);
		[messenger call:GPCREATESONGVIEW withExec:@"ビューを外す",nil];
	}
	
	
	
}





- (void) playInit:(NSMutableDictionary * )dict {
	//画面を付ける 画面自体が未だ無い
//	[messenger call:GPBASEVIEWCONT withExec:@"基本ビューにセット",
//	 [messenger tag:@"ビュー" val:tVCont.view],
//	 nil];
}

- (void) playProc:(NSMutableDictionary * )dict {
	
}







/**
 ステートマシン関連
 */
int m_nowState;

int getState() {
	return m_nowState;
} 

void setState(int state) {
	m_nowState = state;
}

 


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
