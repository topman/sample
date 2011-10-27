//
//  KasinoConfig.m
//  Kasino
//
//  Created by zhang laibin on 11-10-2.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "AppConfig.h"
#import "ScoreManager.h"
#import "DataStorageManager.h"
#import "SoundManager.h"
@implementation AppConfig
@synthesize defaultFont;
@synthesize soundEnabled;
@synthesize questionOption;
@synthesize totalTime;
@synthesize questionLevel;

static AppConfig *sharedConfig=nil;

-(void) initConfig{
//    defaultFont = @"Courier-Bold";
    defaultFont = @"Impact";
    soundEnabled = [[DataStorageManager sharedManager].hasMusic boolValue];
    questionOption = Question_10;
    questionLevel = QuestionLevelEasy;
    totalTime = TimeOption1;
}

+ (AppConfig *) sharedConfig
{
    @synchronized(self)     {
        if (!sharedConfig){
            sharedConfig = [[AppConfig alloc] init];
            [sharedConfig initConfig];
        }
        return sharedConfig;
    }
    return nil;
}   

-(void) setSoundEnabled:(BOOL)_soundEnabled{
    soundEnabled = _soundEnabled;
    [DataStorageManager sharedManager].hasMusic = [NSNumber numberWithBool: soundEnabled];
}

-(void) setQuestionOption:(QuestionOption)_questionOption{
    questionOption = _questionOption;
    switch (questionOption) {
        case Question_10:
            [ScoreManager sharedManager].totalQuestions = 10; 
            totalTime = TimeOption1;
            break;
        case Question_15:
            totalTime = TimeOption2;
            [ScoreManager sharedManager].totalQuestions = 15;
            break;
        case Question_20:
            totalTime = TimeOption3;
            [ScoreManager sharedManager].totalQuestions = 20;
            break;
            
        default:
            break;
    }
}

-(void)refreshSettings{
    if (soundEnabled){
        [SoundManager playBGMusic];
    }
    else{
        [SoundManager stopBGMusic];
    }
}

@end
