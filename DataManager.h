//
//  DataManager.h
//  FootballManager
//
//  Created by KIENND on 4/15/13.
//  Copyright (c) 2013 KIENND. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"
#import "Team.h"

@interface DataManager : NSObject
{

}
@property (strong) NSMutableArray* mutAr;
@property (strong) NSMutableArray* dataPlayer;
@property (strong) NSMutableArray* dataTeam;

+ (id) ShareData;
@end
