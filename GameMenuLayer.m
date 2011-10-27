//
//  GameMenuLayer.m
//  PAT
//
//  Created by zhang laibin on 11-10-10.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "GameMenuLayer.h"
#import "constants.h"
#import "GameManager.h"

@implementation GameMenuLayer

-(void) initBGImageName{
    bgImage = @"game_menu_bg.png";
}

-(void) initNavButtons{
    // settings btn
    CCMenuItemImage *settingsBtn = [CCMenuItemImage itemFromNormalImage:@"settings_btn.png" selectedImage:@"settings_btn.png" target:self selector:@selector(gotoSettingsPage)];
    CCMenu *menu = [CCMenu menuWithItems:settingsBtn, nil];
    menu.position = ccp(kSettingsBtnLeftPadding, screenSize.height - kSettingsBtnTopPadding);
    [self addChild:menu];
    
    // mode and other options
    
}

-(void) onPlayEasy{
    [[GameManager sharedManager] reset];
    [self gotoCubeGame:LevelBeginner];
}

-(void) onPlayIntermediate{
    [[GameManager sharedManager] reset];
    [self gotoCubeGame:LevelIntemediate];
}


-(void) onPlayDifficult{
    [[GameManager sharedManager] reset];
    [self gotoCubeGame:LevelDifficult];
}

// for key hole
-(void) onPlayKeyHoleEasy{
    [[GameManager sharedManager] reset];
    [self gotoPlay:GameTypeKeyHole andLevel:LevelBeginner];
}

-(void) onPlayKeyHoleIntermediate{
    [[GameManager sharedManager] reset];
    [self gotoPlay:GameTypeKeyHole andLevel:LevelIntemediate];
}

-(void) onPlayKeyHoleDifficult{
    [[GameManager sharedManager] reset];
    [self gotoPlay:GameTypeKeyHole andLevel:LevelDifficult];
}

// top front end
-(void) onPlayTopFrontEndEasy{
    [[GameManager sharedManager] reset];
    [self gotoPlay:GameTypeTopFrontEnd andLevel:LevelBeginner];
}

-(void) onPlayTopFrontEndIntermediate{
    [[GameManager sharedManager] reset];
    [self gotoPlay:GameTypeTopFrontEnd andLevel:LevelIntemediate];
}

-(void) onPlayTopFrontEndDifficult{
    [[GameManager sharedManager] reset];
    [self gotoPlay:GameTypeTopFrontEnd andLevel:LevelDifficult];
}

// hole punching
-(void) onPlayHolePunchingEasy{
    [[GameManager sharedManager] reset];
    [self gotoPlay:GameTypeHolePunching andLevel:LevelBeginner];
}

-(void) onPlayHolePunchingIntermediate{
    [[GameManager sharedManager] reset];
    [self gotoPlay:GameTypeHolePunching andLevel:LevelIntemediate];
}

-(void) onPlayHolePunchingDifficult{
    [[GameManager sharedManager] reset];
    [self gotoPlay:GameTypeHolePunching andLevel:LevelDifficult];
}
// pattern folding
-(void) onPlayPatternFoldingEasy{
    [[GameManager sharedManager] reset];
    [self gotoPlay:GameTypePatternFolding andLevel:LevelBeginner];
}

-(void) onPlayPatternFoldingIntermediate{
    [[GameManager sharedManager] reset];
    [self gotoPlay:GameTypePatternFolding andLevel:LevelIntemediate];
}

-(void) onPlayPatternFoldingDifficult{
    [[GameManager sharedManager] reset];
    [self gotoPlay:GameTypePatternFolding andLevel:LevelDifficult];
}

// angle ranking
-(void) onPlayAngleRankingEasy{
    [[GameManager sharedManager] reset];
    [self gotoPlay:GameTypeAngleRanking andLevel:LevelBeginner];
}

-(void) onPlayAngleRankingIntermediate{
    [[GameManager sharedManager] reset];
    [self gotoPlay:GameTypeAngleRanking andLevel:LevelIntemediate];
}

-(void) onPlayAngleRankingDifficult{
    [[GameManager sharedManager] reset];
    [self gotoPlay:GameTypeAngleRanking andLevel:LevelDifficult];
}

// random mode
-(GameType) getRandomGameType{
    int type = arc4random() % 6;
    return type;
}

-(void) onPlayRandomEasy{
    [[GameManager sharedManager] reset];
    [self gotoPlay:[self getRandomGameType] andLevel:LevelBeginner];
}

-(void) onPlayRandomIntermediate{
    [[GameManager sharedManager] reset];
    [self gotoPlay:[self getRandomGameType] andLevel:LevelIntemediate];
}

-(void) onPlayRandomDifficult{
    [[GameManager sharedManager] reset];
    [self gotoPlay:[self getRandomGameType] andLevel:LevelDifficult];
}



-(void) addBox4TopFrontEnd{
    CCMenuItemImage *box1 = [CCMenuItemImage itemFromNormalImage:@"box.png" selectedImage:@"box.png" target:self selector:@selector(onPlayTopFrontEndEasy)];
    CCMenuItemImage *box2 = [CCMenuItemImage itemFromNormalImage:@"box.png" selectedImage:@"box.png" target:self selector:@selector(onPlayTopFrontEndIntermediate)];
    CCMenuItemImage *box3 = [CCMenuItemImage itemFromNormalImage:@"box.png" selectedImage:@"box.png" target:self selector:@selector(onPlayTopFrontEndDifficult)];
    CCMenu *menu = [CCMenu menuWithItems:box1, box2, box3, nil];
    [menu alignItemsHorizontallyWithPadding:-100];
    menu.position = ccp(kLevelPaddingLeft, screenSize.height - kLevelPaddingTop - 10);
    [self addChild:menu];
}



-(void) addBox4KeyHole{
    CCMenuItemImage *box1 = [CCMenuItemImage itemFromNormalImage:@"box.png" selectedImage:@"box.png" target:self selector:@selector(onPlayKeyHoleEasy)];
    CCMenuItemImage *box2 = [CCMenuItemImage itemFromNormalImage:@"box.png" selectedImage:@"box.png" target:self selector:@selector(onPlayKeyHoleIntermediate)];
    CCMenuItemImage *box3 = [CCMenuItemImage itemFromNormalImage:@"box.png" selectedImage:@"box.png" target:self selector:@selector(onPlayKeyHoleDifficult)];
    CCMenu *menu = [CCMenu menuWithItems:box1, box2, box3, nil];
    [menu alignItemsHorizontallyWithPadding:-100];
    menu.position = ccp(kLevelPaddingLeft, screenSize.height - kLevelPaddingTop - 50);
    [self addChild:menu];
}

-(void) addBox4HolePunching{
    CCMenuItemImage *box1 = [CCMenuItemImage itemFromNormalImage:@"box.png" selectedImage:@"box.png" target:self selector:@selector(onPlayHolePunchingEasy)];
    CCMenuItemImage *box2 = [CCMenuItemImage itemFromNormalImage:@"box.png" selectedImage:@"box.png" target:self selector:@selector(onPlayHolePunchingIntermediate)];
    CCMenuItemImage *box3 = [CCMenuItemImage itemFromNormalImage:@"box.png" selectedImage:@"box.png" target:self selector:@selector(onPlayHolePunchingDifficult)];
    CCMenu *menu = [CCMenu menuWithItems:box1, box2, box3, nil];
    [menu alignItemsHorizontallyWithPadding:-100];
    menu.position = ccp(kLevelPaddingLeft, screenSize.height - kLevelPaddingTop - 90);
    [self addChild:menu];
}

-(void) addBox4CubeCounting{
    CCMenuItemImage *box1 = [CCMenuItemImage itemFromNormalImage:@"box.png" selectedImage:@"box.png" target:self selector:@selector(onPlayEasy)];
    CCMenuItemImage *box2 = [CCMenuItemImage itemFromNormalImage:@"box.png" selectedImage:@"box.png" target:self selector:@selector(onPlayIntermediate)];
    CCMenuItemImage *box3 = [CCMenuItemImage itemFromNormalImage:@"box.png" selectedImage:@"box.png" target:self selector:@selector(onPlayDifficult)];
    CCMenu *menu = [CCMenu menuWithItems:box1, box2, box3, nil];
    [menu alignItemsHorizontallyWithPadding:-100];
    menu.position = ccp(kLevelPaddingLeft, screenSize.height - kLevelPaddingTop - 130);
    [self addChild:menu];
}

-(void) addBox4PatternFolding{
    CCMenuItemImage *box1 = [CCMenuItemImage itemFromNormalImage:@"box.png" selectedImage:@"box.png" target:self selector:@selector(onPlayPatternFoldingEasy)];
    CCMenuItemImage *box2 = [CCMenuItemImage itemFromNormalImage:@"box.png" selectedImage:@"box.png" target:self selector:@selector(onPlayPatternFoldingIntermediate)];
    CCMenuItemImage *box3 = [CCMenuItemImage itemFromNormalImage:@"box.png" selectedImage:@"box.png" target:self selector:@selector(onPlayPatternFoldingDifficult)];
    CCMenu *menu = [CCMenu menuWithItems:box1, box2, box3, nil];
    [menu alignItemsHorizontallyWithPadding:-100];
    menu.position = ccp(kLevelPaddingLeft, screenSize.height - kLevelPaddingTop - 170);
    [self addChild:menu];
}

-(void) addBox4AngleRanking{
    CCMenuItemImage *box1 = [CCMenuItemImage itemFromNormalImage:@"box.png" selectedImage:@"box.png" target:self selector:@selector(onPlayAngleRankingEasy)];
    CCMenuItemImage *box2 = [CCMenuItemImage itemFromNormalImage:@"box.png" selectedImage:@"box.png" target:self selector:@selector(onPlayAngleRankingIntermediate)];
    CCMenuItemImage *box3 = [CCMenuItemImage itemFromNormalImage:@"box.png" selectedImage:@"box.png" target:self selector:@selector(onPlayAngleRankingDifficult)];
    CCMenu *menu = [CCMenu menuWithItems:box1, box2, box3, nil];
    [menu alignItemsHorizontallyWithPadding:-100];
    menu.position = ccp(kLevelPaddingLeft, screenSize.height - kLevelPaddingTop - 210);
    [self addChild:menu];
}

-(void) addBox4RandomMode{
    CCMenuItemImage *box1 = [CCMenuItemImage itemFromNormalImage:@"box.png" selectedImage:@"box.png" target:self selector:@selector(onPlayRandomEasy)];
    CCMenuItemImage *box2 = [CCMenuItemImage itemFromNormalImage:@"box.png" selectedImage:@"box.png" target:self selector:@selector(onPlayRandomIntermediate)];
    CCMenuItemImage *box3 = [CCMenuItemImage itemFromNormalImage:@"box.png" selectedImage:@"box.png" target:self selector:@selector(onPlayRandomDifficult)];
    CCMenu *menu = [CCMenu menuWithItems:box1, box2, box3, nil];
    [menu alignItemsHorizontallyWithPadding:-100];
    menu.position = ccp(kLevelPaddingLeft, screenSize.height - kLevelPaddingTop - 250);
    [self addChild:menu];
}

-(void) onClickTimer{
    
}

-(void) onClickInstruction{
    [self gotoInfoPage];
}

-(void) onClickBackToMain{
    [self gotoMainMenu];
}

-(void) initBottomButtons{
    CCMenuItemImage *timer = [CCMenuItemImage itemFromNormalImage:@"timer_icon.png" selectedImage:@"timer_icon.png" target:self selector:@selector(onClickTimer)];
    CCMenuItemImage *instruction = [CCMenuItemImage itemFromNormalImage:@"instruction.png" selectedImage:@"instruction.png" target:self selector:@selector(onClickInstruction)];
    CCMenuItemImage *back = [CCMenuItemImage itemFromNormalImage:@"back_btn_main.png" selectedImage:@"back_btn_main.png" target:self selector:@selector(onClickBackToMain)];
    CCMenu *menu = [CCMenu menuWithItems:timer, instruction, back, nil];
    [menu alignItemsHorizontallyWithPadding:10];
    menu.position = ccp(screenSize.width/2, 40);
    [self addChild:menu];
}

-(void) initContent{
    // init bottom buttons
    [self initBottomButtons];
    
    // init levels and modes
    // keyhole
    [self addBox4KeyHole];
    
    // cube counting
    [self addBox4CubeCounting];
    
    [self addBox4TopFrontEnd];
    [self addBox4HolePunching];
    [self addBox4PatternFolding];
    [self addBox4AngleRanking];
    [self addBox4RandomMode];
}

@end
