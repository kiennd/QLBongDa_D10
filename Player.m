//
//  Player.m
//  QLBongDa
//
//  Created by KIENND on 4/17/13.
//  Copyright (c) 2013 KIENND. All rights reserved.
//

#import "Player.h"

@implementation Player

-(id) init: (NSString*) playerName
  PlayerId: (int) playerId
 PlayerAge: (int) playerAge
OwnerTeamId: (int) ownerTeamId
   SquadNo: (int) squadNo
    Height: (float) playerHeight
PlayerNationality: (NSString*) playerNationality
PlayerPosition: (NSString*) playerPosition
ProfilePicture: (NSString*) profilePicture
{
    if(self = [super init]){
        self.playerName =playerName;
        self.playerId= playerId;
        self.playerAge = playerAge;
        self.ownerTeamId = ownerTeamId;
        self.squadNo = squadNo;
        self.playerNationality = playerNationality;
        self.profilePicture = profilePicture;
        self.playerPosition = playerPosition;
        self.playerHeight = playerHeight;
    }
    return self;
}


@end
