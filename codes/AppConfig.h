//
//  KasinoConfig.h
//  Kasino
//
//  Created by zhang laibin on 11-10-2.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#define TimeOption1 400
#define TimeOption2 600
#define TimeOption3 800

typedef enum{
    Question_10,
    Question_15,
    Question_20
}QuestionOption;

typedef enum{
    QuestionLevelEasy,
    QuestionLevelIntermediate,
    QuestionLevelDifficult
}QuestionLevel;



@interface AppConfig : NSObject
{
    NSString *defaultFont;
    BOOL soundEnabled;
    QuestionOption questionOption;
    QuestionLevel questionLevel;
    int totalTime;
    
}
@property (nonatomic, retain) NSString *defaultFont;
@property (nonatomic) BOOL soundEnabled;
@property (nonatomic) QuestionOption questionOption;
@property (nonatomic) QuestionLevel questionLevel;
@property (nonatomic) int totalTime;

-(void) refreshSettings;
+(AppConfig *) sharedConfig;
@end
