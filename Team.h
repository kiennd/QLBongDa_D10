//
//  Team.h
//  QLBongDa
//
//  Created by KIENND on 4/17/13.
//  Copyright (c) 2013 KIENND. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataManager.h"

@interface Team : NSObject
@property (assign) int teamId;
@property (strong) NSString* teamName, *logoName,*coachName,*songName,*stadiumName,*teamImage;
@property (strong) NSMutableArray* players;
-(id) init: (NSString*) teamName
    TeamId: (int) teamId
  LogoName: (NSString*) logoName
 CoachName: (NSString*) coachName
  SongName: (NSString*) songName
StadiumName: (NSString*) stadiumName
TeamImage:(NSString*) teamImage;


@end
