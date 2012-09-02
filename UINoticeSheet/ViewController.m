//
//  ViewController.m
//  UINoticeSheet
//
//  Created by Rasmus Styrk on 31/08/12.
//  Copyright (c) 2012 Rasmus Styrk. All rights reserved.
//

#import "ViewController.h"
#import "NoticeSheet.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)displaySimple:(id)sender
{
    [NoticeSheet showNotice:@"Tester da lige" selector:@selector(doSomething) target:self];
}

- (void) doSomething
{
    NSLog(@"Notice was pressed!");
}

@end
