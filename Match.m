//
//  Match.m
//  QLBongDa
//
//  Created by KIENND on 4/18/13.
//  Copyright (c) 2013 KIENND. All rights reserved.
//

#import "Match.h"

@implementation Match
- (id) init: (Team*) teamA
        TeamB:(Team*) teamB
      Stadium: (NSString*) stadium
         Time: (NSString*) time
{
    if (self = [super init]) {
        self.teamA =teamA;
        self.teamB = teamB;
        self.time = time;
        self.stadium = stadium;
    }
    return self;
}
@end
