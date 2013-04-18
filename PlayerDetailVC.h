//
//  PlayerDetailVC.h
//  QLBongDa
//
//  Created by KIENND on 4/18/13.
//  Copyright (c) 2013 KIENND. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Player.h"
#import "Team.h"
@interface PlayerDetailVC : UIViewController
- (void) initWithPlayer:(Player *)player
                   Team:(Team*) team;
@end
