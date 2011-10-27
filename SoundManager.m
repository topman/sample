//
//  SoundManager.m
//  Match3GameTutorial
//
//  Created by tower on 11-7-28.
//  Copyright 2011年 IPhoneGameTutorials. All rights reserved.
//

#import "SoundManager.h"
#import "SimpleAudioEngine.h"
#import "AppConfig.h"


@implementation SoundManager
static BOOL isBGMusicPlaying = NO;

+(void) preloadSounds{
    NSArray *sounds = [NSArray arrayWithObjects:@"count_down.wav", @"correct.wav", @"wrong.wav", nil];
    for(NSString *s in sounds){
        [[SimpleAudioEngine sharedEngine] preloadEffect:s];
    }
}

+(void)playSound:(SoundIndex)sound{
    NSString *soundName;
    switch (sound) {
        case SoundCorrect:
            soundName = @"correct.wav";
            break;
        case SoundWrong:
            soundName = @"wrong.wav";
            break;
        case SoundCountdown:
            soundName = @"count_down.wav";
            break;
            
        default:
            break;
    }
    if (soundName){
        [[SimpleAudioEngine sharedEngine] playEffect:soundName];
    }
}

+(void)playBGMusic{
    if ([AppConfig sharedConfig].soundEnabled && !isBGMusicPlaying){
        [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"bg.mp3"];
        isBGMusicPlaying = YES;
    }
}

+(void)stopBGMusic{
    [[SimpleAudioEngine sharedEngine] stopBackgroundMusic];
    isBGMusicPlaying = NO;
}

+(void)stopAllSounds{
    
}



@end
