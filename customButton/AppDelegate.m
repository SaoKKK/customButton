//
//  AppDelegate.m
//  customButton
//
//  Created by 河野 さおり on 2014/08/11.
//  Copyright (c) 2014年 Saori Kohno. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (){
    IBOutlet CCButton *pshMGroup;
    IBOutlet CCButton *btn1;
}
@end

@implementation AppDelegate

@synthesize txtState;

- (IBAction)chkBtnEnabled:(id)sender {
    [pshMGroup setEnabled:[sender state]];
}
- (IBAction)chkBtnEnabled2:(id)sender {
    [btn1 setEnabled:[sender state]];
}

@end
