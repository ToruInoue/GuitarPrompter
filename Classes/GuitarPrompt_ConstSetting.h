//
//  GuitarPrompt_ConstSetting.h
//  GuitarPrompter
//
//  Created by Inoue 徹 on 10/10/16.
//  Copyright 2010 KISSAKI. All rights reserved.
//


#define GPMASTER			(@"GPMaster")

#define GPBASEVIEWCONT		(@"GOBaseViewController")

#define GPTITLEVIEWCONT		(@"GPTitleViewController")
#define GPCREATESONGVIEW	(@"GPCreateSongViewController")

/**
 ステート名管理リスト
 */

enum GP_STATES {
	GP_STATE_TITLE_INIT,
	GP_STATE_TITLE_PROC,
	
	GP_STATE_CREATE_INIT,
	GP_STATE_CREATE_PROC,
		
	GP_STATE_PLAY_INIT,
	GP_STATE_PLAY_PROC,
	
	NUM_OF_GP_STATES,
};