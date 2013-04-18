//
//  Team.m
//  QLBongDa
//
//  Created by KIENND on 4/17/13.
//  Copyright (c) 2013 KIENND. All rights reserved.
//

#import "Team.h"

@implementation Team

-(id) init: (NSString*) teamName
    TeamId: (int) teamId
  LogoName: (NSString*) logoName
 CoachName: (NSString*) coachName
  SongName: (NSString*) songName
StadiumName: (NSString*) stadiumName
 TeamImage:(NSString*) teamImage{

    if (self = [super init]) {
        _teamName = teamName;
        _logoName = logoName;
        _teamId = teamId;
        _coachName = coachName;
        _songName = songName;
        _stadiumName = stadiumName;
        _teamImage = teamImage;
       // NSLog(@"mut ar %d",[dt.mutAr count]);
        _players = [[NSMutableArray alloc] initWithObjects: nil];
        
    }

    return self;
}


@end
