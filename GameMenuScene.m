//
//  GameMenuScene.m
//  PAT
//
//  Created by zhang laibin on 11-10-10.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "GameMenuScene.h"
#import "GameMenuLayer.h"

@implementation GameMenuScene

-(id) init{
    if (self=[super init]){
        [self addChild:[GameMenuLayer node]];
    }
    return self;
}

@end
