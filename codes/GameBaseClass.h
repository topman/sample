//
//  GameBaseClass.h
//  PAT
//
//  Created by zhang laibin on 11-10-14.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LayerBaseClass.h"
#import "GameManager.h"
#define kInfoLayerTag 1101
#define kClockTag 1201

@interface GameBaseClass : LayerBaseClass{
    int remainTime;
    CCLabelTTF *timeLabel;
    NSDictionary *data;
    int countdown;
    NSString *title;
    NSString *info;
    BOOL isMenuItemsEnabled;
}

@property (nonatomic) int remainTime;
@property (nonatomic, retain) CCLabelTTF *timeLabel;
@property (nonatomic, retain) NSDictionary *data;
@property (nonatomic) int countdown;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *info;
@property (nonatomic) BOOL isMenuItemsEnabled;

-(void) initQuestionsArea;
-(void) initAnswersArea;
-(void) initData;
-(void) showResult;
-(void) showCorrectResult;
-(void) showFailResult;
-(void) nextStep;
-(void) initPaginator;
-(void) gotoNext4CurrentGame;
-(void) showInfo;
-(void) initInfoData;

-(void) showCountDown:(id)sender;
@end
