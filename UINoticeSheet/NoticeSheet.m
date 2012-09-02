//
//  NoticeSheet.m
//  UINoticeSheet
//
//  Created by Rasmus Styrk on 9/2/12.
//  Copyright (c) 2012 Rasmus Styrk. All rights reserved.
//

#import "NoticeSheet.h"

@interface NoticeSheet ()

@end

@implementation NoticeSheet

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
