//
//  MainMenuScene.m
//  PAT
//
//  Created by zhang laibin on 11-10-10.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "MainMenuScene.h"
#import "MainMenuLayer.h"

@implementation MainMenuScene

-(id) init{
    if (self=[super init]){
        
        MainMenuLayer *main = [MainMenuLayer node];
        [self addChild:main];
    }
    return self;
}

@end
