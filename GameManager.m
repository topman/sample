//
//  GameManager.m
//  PAT
//
//  Created by zhang laibin on 11-10-14.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "GameManager.h"
#import "AppConfig.h"
#import "StaticDataManager.h"
#import "ScoreManager.h"

@implementation GameManager
@synthesize level;
@synthesize type;
@synthesize wrongAnswers, correctAnswers, answeredQuestions;
@synthesize currentQuestionNum;
@synthesize isWin;
@synthesize timeRemain;

static GameManager *sharedManager=nil;

-(BOOL) finishedAnswer{
    return [self getAnsweredQuestionsNum] == [self getTotalQuestionsNum];
}

-(BOOL) needShowCountdown{
    return [answeredQuestions count] == 0;
}

-(void) initConfig{
    wrongAnswers = 0;
    correctAnswers = 0;
    answeredQuestions = [NSMutableArray arrayWithCapacity:20];
    isWin = NO;
    timeRemain = 0;
    [answeredQuestions retain];
}

-(void) reset{
    wrongAnswers = 0;
    correctAnswers = 0;
    isWin = NO;
    timeRemain = [AppConfig sharedConfig].totalTime;
    [answeredQuestions removeAllObjects];
}

+(GameManager *)sharedManager{
    @synchronized(self){
        if (!sharedManager){
            sharedManager = [[GameManager alloc] init];
            [sharedManager initConfig];
        }
        return  sharedManager;
    }
    return nil;
}

-(NSDictionary *) getQuestion{
    NSArray *candidates = [[StaticDataManager sharedManager] getConfig4Type:type andLevel:level];
    int num = arc4random() % [candidates count];
    while ([answeredQuestions containsObject:[NSNumber numberWithInt:num]]){
        num = arc4random() % [candidates count];
    }
    currentQuestionNum = num;
    return [[StaticDataManager sharedManager] getConfig4Type:type andLevel:level andNumber:num];
}

-(void) answerQuestion:(int)choice{
    NSDictionary *data = [[StaticDataManager sharedManager] getConfig4Type:type andLevel:level andNumber:currentQuestionNum];
    NSString *correctAnswer = [NSString stringWithFormat:@"%i", choice];
    isWin = [correctAnswer isEqualToString: [data objectForKey:@"answer"]];
    if (isWin){
        correctAnswers ++;
    }
    else{
        wrongAnswers ++;
    }
    [answeredQuestions addObject:[NSNumber numberWithInt:currentQuestionNum]];
}

-(void) answerQuestionWithString:(NSString *)choice{
    NSDictionary *data = [[StaticDataManager sharedManager] getConfig4Type:type andLevel:level andNumber:currentQuestionNum];
    isWin = [choice isEqualToString: [data objectForKey:@"answer"]];
    if (isWin){
        correctAnswers ++;
    }
    else{
        wrongAnswers ++;
    }
    [answeredQuestions addObject:[NSNumber numberWithInt:currentQuestionNum]];
}

-(int) getAnsweredQuestionsNum{
    return [answeredQuestions count];
}

-(int) getTotalQuestionsNum{
    switch ([AppConfig sharedConfig].questionOption) {
        case Question_10:
            return 10;
            break;
        case Question_15:
            return 15;
            break;
        case Question_20:
            return 20;
            break;
            
        default:
            return 10;
            break;
    }
}

-(void) updateType:(GameType)_type{
    switch (_type) {
        case GameTypeKeyHole:
            type = @"key_hole";
            break;
        case GameTypeTopFrontEnd:
            type = @"top_front_end";
            break;
        case GameTypeHolePunching:
            type = @"hole_punching";
            break;
        case GameTypeCubeCounting:
            type = @"cube_counting";
            break;
        case GameTypeAngleRanking:
            type = @"angle_ranking";
            break;
        case GameTypePatternFolding:
            type = @"pattern_folding";
            break;
            
        default:
            type = @"key_hole";
            break;
    }
}

-(GameType) getCurrentGameType{
    if ([type isEqualToString: @"key_hole"]) {
        return GameTypeKeyHole;
    }
    else if ([type isEqualToString:@"pattern_folding"]){
        return GameTypePatternFolding;
    }
    else if ([type isEqualToString:@"angle_ranking"]){
        return GameTypeAngleRanking;
    }
    else if ([type isEqualToString:@"cube_counting"]){
        return GameTypeCubeCounting;
    }
    else if ([type isEqualToString:@"hole_punching"]){
        return GameTypeHolePunching;
    }
    else if ([type isEqualToString:@"top_front_end"]){
        return GameTypeTopFrontEnd;
    }
    else{
        return GameTypeKeyHole;
    }
}

@end
