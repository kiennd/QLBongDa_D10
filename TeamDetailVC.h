//
//  TeamDetailVC.h
//  QLBongDa
//
//  Created by KIENND on 4/17/13.
//  Copyright (c) 2013 KIENND. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DataManager.h"
#import "Team.h"
#import "Player.h"
#import "DataManager.h"
#import "PlayerDetailVC.h"

@interface TeamDetailVC : UIViewController<UITableViewDelegate,UITableViewDataSource>
- (void) initWithTeam: (Team*) team;

@end
