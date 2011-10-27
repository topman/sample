//
//  GameplayScene.m
//  PAT
//
//  Created by zhang laibin on 11-10-10.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "GameplayScene.h"
#import "GameplayLayer.h"
@implementation GameplayScene

-(id) init{
    if (self=[super init]){
        [self addChild:[GameplayLayer node]];
    }
    return self;
}

@end
