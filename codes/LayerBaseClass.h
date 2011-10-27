//
//  LayerBaseClass.h
//  PAT
//
//  Created by zhang laibin on 11-10-10.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "StaticDataManager.h"

typedef enum{
    PageMainMenu,
    PageGameMenu,
    PageSettings,
    PageInfo,
    PageGame
}GamePage;

@interface LayerBaseClass : CCLayer
{
    CGSize screenSize;
    NSString *bgImage;
}

@property (nonatomic) CGSize screenSize;
@property (nonatomic, retain) NSString *bgImage;

-(void) initBGImageName;
-(void) initBG;
-(void) initNavButtons;
-(void) initContent;
-(void) addBackToMainBtn;

-(void) gotoMainMenu;
-(void) gotoGameMenu;
-(void) gotoInfoPage;
-(void) gotoSettingsPage;
-(void) gotoCubeGame:(Level)level;
-(void) gotoPlay:(GameType)type andLevel:(Level)level;
-(void) gotoScore;
-(void) retryCurrentGame;

@end
