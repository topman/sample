//
//  MainMenuLayer.m
//  PAT
//
//  Created by zhang laibin on 11-10-10.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "MainMenuLayer.h"
#import "constants.h"
#import "GameMenuScene.h"
#import "SoundManager.h"

@implementation MainMenuLayer

-(void) addInfoBtn{
    CCMenuItemImage *info = [CCMenuItemImage itemFromNormalImage:@"info.png" selectedImage:@"info.png" target:self selector:@selector(gotoInfoPage)];
    CCMenu *menu = [CCMenu menuWithItems:info, nil];
    CGSize infoSize = info.contentSize;
    menu.position = ccp(screenSize.width - infoSize.width / 4, screenSize.height - infoSize.height / 3);
    [self addChild:menu];
}

-(void) addPlayBtn{
    SEL callback;
    callback = @selector(gotoGameMenu);
    CCMenuItemImage *play = [CCMenuItemImage itemFromNormalImage:@"play_btn.png" selectedImage:@"play_btn.png" target:self selector:callback];
    CCMenu *menu = [CCMenu menuWithItems:play, nil];
//    CGSize infoSize = play.contentSize;
    menu.position = ccp(screenSize.width / 2, kMainMenuPlayBtnBottomPadding);
    [self addChild:menu];
}

-(void) initBGImageName{
    bgImage = @"mainmenu_bg.png";
    // add bg music here
    [SoundManager playBGMusic];
}

-(void) initNavButtons{
    [self addInfoBtn];
    [self addPlayBtn];
}

@end
