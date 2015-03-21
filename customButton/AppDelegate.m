//
//  AppDelegate.m
//  customButton
//
//  Created by 河野 さおり on 2014/08/11.
//  Copyright (c) 2014年 Saori Kohno. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (){
    __weak IBOutlet NSButton *pshMGroup;
}
@end

@implementation AppDelegate

@synthesize txtState;

- (IBAction)chkBtnEnabled:(id)sender {
    [pshMGroup setEnabled:[sender state]];
}

@end
