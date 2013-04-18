//
//  Match.h
//  QLBongDa
//
//  Created by KIENND on 4/18/13.
//  Copyright (c) 2013 KIENND. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Team.h"
#import "Player.h"
@interface Match : NSObject

@property (strong) Team* teamA,*teamB;
@property (strong) NSString* stadium;
@property (strong) NSString* time;

- (id) init: (Team*) teamA
        TeamB:(Team*) teamB
      Stadium: (NSString*) stadium
         Time: (NSString*) time;
@end
