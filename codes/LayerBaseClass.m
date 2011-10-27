//
//  LayerBaseClass.m
//  PAT
//
//  Created by zhang laibin on 11-10-10.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "LayerBaseClass.h"
#import "GameplayScene.h"
#import "SettingsPageScene.h"
#import "InfoPageScene.h"
#import "MainMenuScene.h"
#import "GameMenuScene.h"
#import "AppConfig.h"
#import "ScorePageLayer.h"
#import "CubeGameplayLayer.h"
#import "AngleRankingGameplayLayer.h"
#import "KeyHoleGameplayLayer.h"
#import "HolePunchingGameplayLayer.h"
#import "PattenFoldingGameplayLayer.h"
#import "TopFrontEndGameplayLayer.h"

@implementation LayerBaseClass
@synthesize screenSize, bgImage;

-(void) initBGImageName{
    bgImage = @"default_bg.jpg";
}

-(void) initBG{
    CCSprite *bg = [CCSprite spriteWithFile:bgImage];
    bg.position = ccp(screenSize.width/2, screenSize.height/2);
    [self addChild:bg];
}

-(void) addBackToMainBtn{
    CCLabelTTF *back = [CCLabelTTF labelWithString:@"back" fontName:[AppConfig sharedConfig].defaultFont fontSize:20];
    SEL callback = @selector(gotoMainMenu);
    CCMenuItemLabel *backBtn = [CCMenuItemLabel itemWithLabel:back target:self selector:callback];
    CCMenu *menu = [CCMenu menuWithItems:backBtn, nil];
    menu.position = ccp(screenSize.width/2, backBtn.contentSize.height);
    [self addChild:menu];
}

-(void) initContent{
    
}

-(void) initNavButtons{
    [self addBackToMainBtn];
}

-(id) init{
    screenSize = [CCDirector sharedDirector].winSize;
    if (self=[super init]){
        [self initBGImageName];
        [self initBG];
        [self initContent];
        [self initNavButtons];
    }
    return self;
}

#pragma mark - navigation callback

-(void) gotoMainMenu{
    [[CCDirector sharedDirector] replaceScene:[MainMenuScene node]];
}


-(void) gotoGameMenu{
    [[CCDirector sharedDirector] replaceScene:[GameMenuScene node]];
}

-(void) gotoCubeGame:(Level)level{
    [[GameManager sharedManager] updateType:GameTypeCubeCounting];
    [GameManager sharedManager].level = level;
    [[CCDirector sharedDirector] replaceScene:[CubeGameplayLayer node]];
}

-(void) gotoPlay:(GameType)type andLevel:(Level)level{
    [[GameManager sharedManager] updateType:type];
    [GameManager sharedManager].level = level;
    CCScene *layer;
    switch (type) {
        case GameTypeKeyHole:
            layer = [KeyHoleGameplayLayer node];
            break;
        case GameTypeTopFrontEnd:
            layer = [TopFrontEndGameplayLayer node];
            break;
        case GameTypeAngleRanking:
            layer = [AngleRankingGameplayLayer node];
            break;
        case GameTypeHolePunching:
            layer = [HolePunchingGameplayLayer node];
            break;
        case GameTypeCubeCounting:
            layer = [CubeGameplayLayer node];
            break;
        case GameTypePatternFolding:
            layer = [PattenFoldingGameplayLayer node];
            break;
            
        default:
            break;
    }
    [[CCDirector sharedDirector] replaceScene:layer];
}

-(void) gotoInfoPage{
    [[CCDirector sharedDirector] replaceScene:[InfoPageScene node]];
}

-(void) gotoSettingsPage{
    [[CCDirector sharedDirector] replaceScene:[SettingsPageScene node]];
}

-(void) gotoScore{
    [[CCDirector sharedDirector] replaceScene:[ScorePageLayer node]];
}

-(void) retryCurrentGame{
    Level level = [GameManager sharedManager].level;
    [[GameManager sharedManager] reset];
    [self gotoPlay:[[GameManager sharedManager] getCurrentGameType]  andLevel:level];
}

@end
