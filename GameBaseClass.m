//
//  GameBaseClass.m
//  PAT
//
//  Created by zhang laibin on 11-10-14.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "GameBaseClass.h"
#import "AppConfig.h"
#import "constants.h"
#import "SoundManager.h"

@implementation GameBaseClass
@synthesize timeLabel, remainTime;
@synthesize data;
@synthesize countdown;
@synthesize info, title;
@synthesize isMenuItemsEnabled;

-(void) initNavButtons{
    
}

-(void) initQuestionsArea{
    
}

-(void) initAnswersArea{
    
}

-(void) initData{
    data = [[GameManager sharedManager] getQuestion];
}

-(void) showResult{
    if ([GameManager sharedManager].isWin){
        // show win result
        [self showCorrectResult];
    }
    else{
        // show fail result
        [self showFailResult];
    }
}
// next question or show final result
-(void) nextStep{
    // whether finish the last question
    if ([[GameManager sharedManager] finishedAnswer]){
        // show result
        [self gotoScore];
    }
    else{
        // next question
        [self gotoNext4CurrentGame];
    }
}

-(void) gotoNext4CurrentGame{
    [self gotoCubeGame:[GameManager sharedManager].level];
}

-(void) disableMenuItems{
    if (isMenuItemsEnabled){
        isMenuItemsEnabled = NO;
        for(id node in self.children){
            if ([node class] == [CCMenu class] || [[node class] isSubclassOfClass:[CCMenu class]]){
                CCMenu *_node = node;
                _node.isTouchEnabled = NO;
            }
        }
    }
}

-(void) enableMenuItems{
    if (!isMenuItemsEnabled){
        isMenuItemsEnabled = YES;
        for(id node in self.children){
            if ([node class] == [CCMenu class] || [[node class] isSubclassOfClass:[CCMenu class]]){
                CCMenu *_node = node;
                _node.isTouchEnabled = YES;
            }
        }
    }
}

-(void) removeSelf:(id)sender{
    [self removeChild:sender cleanup:YES];
    [self nextStep];
    [self enableMenuItems];
}

-(void) showFailResult
{
    [self disableMenuItems];
    [SoundManager playSound:SoundWrong];
    CCSprite *sprite = [CCSprite spriteWithFile:@"fail.png"];
    sprite.position = ccp(screenSize.width/2, screenSize.height/2);
    [self addChild:sprite];
    sprite.scale = 0.1;
    [sprite runAction:
        [CCSequence actions:
         [CCScaleTo actionWithDuration:kAnimationDuration scale:1],
         [CCCallFuncN actionWithTarget:self selector:@selector(removeSelf:)],
      nil]];
     
}

-(void) showCorrectResult{
    [self disableMenuItems];
    [SoundManager playSound:SoundCorrect];
    CCSprite *sprite = [CCSprite spriteWithFile:@"check.png"];
    sprite.position = ccp(screenSize.width/2, screenSize.height/2);
    sprite.scale = 0.1;
    [self addChild:sprite];
    [sprite runAction:
     [CCSequence actions:
      [CCScaleTo actionWithDuration:kAnimationDuration scale:1],
      [CCCallFuncN actionWithTarget:self selector:@selector(removeSelf:)],
      nil]];
}

-(NSString *)getFormattedTime:(int)_time{
    int first, second, third, fourth;
    if (_time >= 600){
        first = _time / 600;
    }
    else{
        first = 0;
    }
    _time = _time - first * 600;
    
    if (_time >= 60){
        second = _time / 60;
    }
    else{
        second = 0;
    }
    
    if (_time % 60 >= 10){
        third = (_time % 60) / 10;
    }
    else{
        third = 0;
    }
    
    fourth = _time % 10;
    return [NSString stringWithFormat:@"%i%i:%i%i", first, second, third, fourth];
    
}

-(void) initInfoData{
    title = @"title for child to override";
    info = @"need override";
}

-(void) destroyInfoBox{
    CCNode *infoBox = [self getChildByTag:kInfoLayerTag];
    [infoBox removeFromParentAndCleanup:YES];
    [self enableMenuItems];
}

-(void) onCloseInfo{
    CCNode *infoBox = [self getChildByTag:kInfoLayerTag];
    [infoBox runAction:[CCSequence actions:[CCScaleTo actionWithDuration:kAnimationDuration scale:0],
                     [CCCallFuncN actionWithTarget:self selector:@selector(destroyInfoBox)], nil]];
}

-(void) showInfo{
    [self disableMenuItems];
    CCSprite *infoSprite = [CCSprite spriteWithFile:@"info_bg.png"];
    infoSprite.position = ccp(screenSize.width/2, screenSize.height/2);
    infoSprite.scale = 0;
    [self addChild:infoSprite z:200 tag:kInfoLayerTag];
    
    CGSize size = [infoSprite contentSize];
    
    // add title and content to info, and back button
    CCLabelTTF *infoTitle = [CCLabelTTF labelWithString:title fontName:[AppConfig sharedConfig].defaultFont fontSize:30];
    infoTitle.position = ccp(size.width/2, size.height - 40);
    
    CGSize maxSize = CGSizeMake(250, 250);
    int fontSize = 15;
    // use a builtin font to calculate the size
    CGSize contentSize = [info sizeWithFont:[UIFont fontWithName:@"Courier-Bold" size:fontSize] constrainedToSize:maxSize lineBreakMode:UILineBreakModeWordWrap];
    
    CCLabelTTF *content = [CCLabelTTF labelWithString:info dimensions:contentSize alignment:UITextAlignmentLeft fontName:[AppConfig sharedConfig].defaultFont fontSize:fontSize];
    content.position = ccp(size.width/2, size.height/2);
    [infoSprite addChild:infoTitle];
    [infoSprite addChild:content];
    
    CCLabelTTF *back = [CCLabelTTF labelWithString:@"back" fontName:[AppConfig sharedConfig].defaultFont fontSize:20];
    CCMenuItemLabel *backItem = [CCMenuItemLabel itemWithLabel:back target:self selector:@selector(onCloseInfo)];
    
    CCLabelTTF *backToMain = [CCLabelTTF labelWithString:@"Game Menu" fontName:[AppConfig sharedConfig].defaultFont fontSize:20];
    CCMenuItemLabel *backToMainItem = [CCMenuItemLabel itemWithLabel:backToMain target:self selector:@selector(gotoGameMenu)];
    
    CCMenu *menu = [CCMenu menuWithItems:backItem, backToMainItem, nil];
    [menu alignItemsHorizontallyWithPadding:10];
    menu.position = ccp(size.width/2, 10);
    [infoSprite addChild:menu];
    
    [infoSprite runAction:[CCScaleTo actionWithDuration:kAnimationDuration scale:1]];
}

-(void) initHeader{
    // info button and clock
    CCMenuItemImage *infoBtn = [CCMenuItemImage itemFromNormalImage:@"info.png" selectedImage:@"info.png" target:self selector:@selector(showInfo)];
    CCMenu *menu = [CCMenu menuWithItems:infoBtn, nil];
    CGSize infoSize = infoBtn.contentSize;
    menu.position = ccp(infoSize.width / 4, screenSize.height - infoSize.height / 3);
    [self addChild:menu];
    
    // add clock
    CCSprite *clock = [CCSprite spriteWithFile:@"clock_blue.png"];
    NSString *str = [self getFormattedTime:[GameManager sharedManager].timeRemain];
    timeLabel = [CCLabelTTF labelWithString:str fontName:[AppConfig sharedConfig].defaultFont fontSize:20];
    CGSize size = clock.contentSize;
    timeLabel.position = ccp(size.width/2, size.height/2);
    [clock addChild:timeLabel];
    
    clock.position = ccp(kClockLeftPadding, screenSize.height - kClockTopPadding);
    [self addChild:clock z:2 tag:kClockTag];
    
}

-(void) updateTimer{
    remainTime --;
    [GameManager sharedManager].timeRemain = remainTime;
    if (remainTime == 10){
        CCSprite *clock = (CCSprite *)[self getChildByTag:kClockTag];
        CCTexture2D* tex = [[CCTextureCache sharedTextureCache] addImage:@"clock_red.png"];
        [clock setTexture: tex];
    }
    if (remainTime <= 10){
        [SoundManager playSound:SoundCountdown];
    }
    if (remainTime == 0){
        [self gotoScore];
    }
    [timeLabel setString:[self getFormattedTime:remainTime]];
}

-(void) initPaginator{
    NSString *page = [NSString stringWithFormat:@"%i/%i", [[GameManager sharedManager] getAnsweredQuestionsNum], 
                      [[GameManager sharedManager] getTotalQuestionsNum]];
    CCLabelTTF *label = [CCLabelTTF labelWithString:page fontName:[AppConfig sharedConfig].defaultFont fontSize:10];
    label.position = ccp(20, 10);
    [self addChild:label];
}

-(void) afterCountdown{
    [self enableMenuItems];
    [self schedule:@selector(updateTimer) interval:1];
}

-(void) showCountDown:(id)sender{
    [self disableMenuItems];
    countdown --;
    if (sender){
        [self removeChild:sender cleanup:YES];
    }
    if([[GameManager sharedManager] needShowCountdown]){
        if (countdown == -1){
            [self afterCountdown];
        }
        else{
            NSString *cd = [NSString stringWithFormat:@"%i", countdown];
            if (countdown == 0){
                cd = @"GO";
            }
            CCLabelTTF *label = [CCLabelTTF labelWithString:cd fontName:[AppConfig sharedConfig].defaultFont fontSize:100];
            label.color = ccc3(0, 0, 0);
            label.position = ccp(screenSize.width/2, screenSize.height/2);
            label.scale = 0;
            [self addChild:label z:100];
            [label runAction:[CCSequence actions:
                              [CCScaleTo actionWithDuration:kAnimationDuration scale:1],
                              [CCCallFuncN actionWithTarget:self selector:@selector(showCountDown:)], nil]];
         }
    
     }  
    else{
        [self afterCountdown];  
    }
}

-(void) initContent{
    countdown = 4;
    isMenuItemsEnabled = YES;
    remainTime = [GameManager sharedManager].timeRemain;
    
    [self initPaginator];
    [self initData];
    [self initInfoData];
    [self initHeader];
    [self initQuestionsArea];
    [self initAnswersArea];
    [self showCountDown:nil];
}

@end
