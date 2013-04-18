//
//  Player.h
//  QLBongDa
//
//  Created by KIENND on 4/17/13.
//  Copyright (c) 2013 KIENND. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

@property (assign) int playerId,playerAge,ownerTeamId,squadNo;
@property (assign) float playerHeight;
@property (strong) NSString *playerName,*playerNationality,*playerPosition,*profilePicture;

            -(id) init: (NSString*) playerName
              PlayerId: (int) playerId
             PlayerAge: (int) playerAge
           OwnerTeamId: (int) ownerTeamId
               SquadNo: (int) squadNo
                Height: (float) playerHeight
     PlayerNationality: (NSString*) playerNationality
        PlayerPosition: (NSString*) playerPosition
        ProfilePicture: (NSString*) profilePicture;


@end
