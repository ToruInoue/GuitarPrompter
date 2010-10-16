//
//  CreateSongController.m
//  GuitarPrompter
//
//  Created by Inoue 徹 on 10/10/16.
//  Copyright 2010 KISSAKI. All rights reserved.
//

#import "CreateSongController.h"
#import "GuitarPrompt_ConstSetting.h"

@implementation CreateSongController


- (id) initCreateSongController {
	if (self = [super init]) {
		messenger = [[MessengerSystem alloc] initWithBodyID:self withSelector:@selector(createSongCenter:) withName:GPCREATESONGVIEW];
		[messenger inputParent:GPMASTER];
		
	}
	return self;
}


- (void) createSongCenter:(NSNotification * )nort { 
	
}


/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/


// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (IBAction) titleEdited {
	NSString * title = [[titleText.text copy] autorelease];
	
	if (0 < [title length]) {
		if (0 < [artistText.text length]) {
			[messenger callParent:@"タイトルとアーティスト入力完了",
			 [messenger tag:@"name" val:title],
			 [messenger tag:@"pass" val:[artistText.text copy]],
			 nil];
		} else {//入力の必要があると認められる場合
			[artistText becomeFirstResponder];
		}
		
	}
}


- (IBAction) artistEdited {
	NSString * artist = [[artistText.text copy] autorelease];
	
	if (0 < [artist length]) {
		if (0 < [titleText.text length]) {
			[messenger callParent:@"タイトルとアーティスト入力完了",
			 [messenger tag:@"title" val:[titleText.text copy]],
			 [messenger tag:@"artist" val:artist],
			 nil];
		} else {//入力の必要があると認められる場合
			[titleText becomeFirstResponder];
		}
	}
}


- (void)dealloc {
    [super dealloc];
}


@end
