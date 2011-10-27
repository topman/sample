//
//  GameManager.h
//  PAT
//
//  Created by zhang laibin on 11-10-14.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StaticDataManager.h"

@interface GameManager : NSObject
{
    Level level;
    NSString *type;
    int wrongAnswers;
    int correctAnswers;
    NSMutableArray *answeredQuestions;
    int currentQuestionNum;
    BOOL isWin;
    int timeRemain;
}
@property (nonatomic) Level level;
@property (nonatomic) int currentQuestionNum;
@property (nonatomic, retain) NSString *type;
@property (nonatomic) int wrongAnswers;
@property (nonatomic) int correctAnswers;
@property (nonatomic, retain) NSMutableArray *answeredQuestions;
@property (nonatomic) BOOL isWin;
@property (nonatomic) int timeRemain;

+(GameManager *)sharedManager;
-(NSDictionary *) getQuestion;
-(void) reset;
-(void) answerQuestion:(int)choice;
-(void) answerQuestionWithString:(NSString *)choice;
-(BOOL) finishedAnswer;
-(void) updateType:(GameType)_type;
-(int) getAnsweredQuestionsNum;
-(int) getTotalQuestionsNum;

-(GameType) getCurrentGameType;
-(BOOL) needShowCountdown;
@end
