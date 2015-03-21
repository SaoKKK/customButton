//
//  CCButton.m
//  customButton
//
//  Created by 河野 さおり on 2014/08/11.
//  Copyright (c) 2014年 Saori Kohno. All rights reserved.
//

#import "CCButton.h"
#import "AppDelegate.h"

@implementation CCButton

-(id)init{
    self = [super init];
    if (self){
        enterFlg = NO;
    }
    return self;
}

-(void)awakeFromNib{
    [self createTrackingArea];
}

//マウスが領域内に入った
-(void)mouseEntered:(NSEvent *)theEvent{
    if ([self isEnabled]){
        [self iconSet:[self identifier] status:@"on"];
        [self setImage:[NSImage imageNamed:icnName]];
        AppDelegate *appDelegate = (AppDelegate*)[[NSApplication sharedApplication]delegate];
        [appDelegate.txtState setStringValue:@"Enter"];
        enterFlg = YES;
    }
}

//マウスが領域内を出た
-(void)mouseExited:(NSEvent *)theEvent{
    [self iconSet:[self identifier] status:@"off"];
    [self setImage:[NSImage imageNamed:icnName]];
    AppDelegate *appD = (AppDelegate*)[[NSApplication sharedApplication]delegate];
    [appD.txtState setStringValue:@"Exit"];
    enterFlg = NO;
}

//マウスダウン
-(void)mouseDown:(NSEvent *)theEvent{
    if ([self isEnabled]){
        [self iconSet:[self identifier] status:@"down"];
        [self setImage:[NSImage imageNamed:icnName]];
        AppDelegate *appDelegate = (AppDelegate*)[[NSApplication sharedApplication]delegate];
        [appDelegate.txtState setStringValue:@"Down"];
    }
}

//マウスアップ
-(void)mouseUp:(NSEvent *)theEvent{
    if (enterFlg) {
        AppDelegate *appDelegate = (AppDelegate*)[[NSApplication sharedApplication]delegate];
        [appDelegate.txtState setStringValue:@"Up"];
        [self iconSet:[self identifier] status:@"off"];
        [self setImage:[NSImage imageNamed:icnName]];
    }
}


//アイコン変更処理
- (void)iconSet:(NSString*)buttonName status:(NSString*)btnStatus{
    icnName = [NSString stringWithFormat:@"icn%@_%@",buttonName,btnStatus];
}

//トラッキング・エリアを設定
-(void)createTrackingArea{
    NSTrackingAreaOptions focusTrackingAreaOptions = NSTrackingActiveInActiveApp;
    focusTrackingAreaOptions |= NSTrackingMouseEnteredAndExited;
    focusTrackingAreaOptions |= NSTrackingAssumeInside;
    focusTrackingAreaOptions |= NSTrackingInVisibleRect;
    
    NSTrackingArea *focusTrackingArea = [[NSTrackingArea alloc] initWithRect:NSZeroRect options:focusTrackingAreaOptions owner:self userInfo:nil];
    [self addTrackingArea:focusTrackingArea];
}

//アイコン変更処理の実行判定
-(BOOL)judgeIconSet{
    if (self.isEnabled) {
        return YES;
    }else{
        return NO;
    }
}

@end
