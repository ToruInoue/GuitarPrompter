//
//  BaseViewController.m
//  GuitarPrompter
//
//  Created by Inoue 徹 on 10/10/16.
//  Copyright 2010 KISSAKI. All rights reserved.
//

#import "BaseViewController.h"
#import "GuitarPrompt_ConstSetting.h"


@implementation BaseViewController
- (id) initBaseViewController {
	if (self = [super init]) {
		messenger = [[MessengerSystem alloc] initWithBodyID:self withSelector:@selector(baseViewCenter:) withName:GPBASEVIEWCONT];
		[messenger inputParent:GPMASTER];
	}
	return self;
}




- (void) baseViewCenter:(NSNotification * )nort {
	NSMutableDictionary * dict = (NSMutableDictionary * )[nort userInfo];
	NSString * exec = [messenger getExecAsString:dict];
	
	if ([exec isEqualToString:@"基本ビューにセット"]) {
		[self.view addSubview:[dict valueForKey:@"ビュー"]];
	}
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


- (void)dealloc {
    [super dealloc];
}


@end
