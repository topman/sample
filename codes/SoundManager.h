//
//  SoundManager.h
//  Match3GameTutorial
//
//  Created by tower on 11-7-28.
//  Copyright 2011年 IPhoneGameTutorials. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef enum {
    SoundHomeBackground,
    SoundCountdown,
    SoundCorrect,
    SoundWrong
} SoundIndex;


@interface SoundManager : NSObject {
    
    
}


+(void)playSound:(SoundIndex)sound;
+(void)stopAllSounds;
+(void)playBGMusic;
+(void)stopBGMusic;
+(void) preloadSounds;

@end
