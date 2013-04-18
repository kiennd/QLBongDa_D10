//
//  PlayerDetailVC.m
//  QLBongDa
//
//  Created by KIENND on 4/18/13.
//  Copyright (c) 2013 KIENND. All rights reserved.
//

#import "PlayerDetailVC.h"

@interface PlayerDetailVC ()
{
    UITextView* _playerInfo;
    Player* _player;
    Team* _team;
    UIImageView* _profilePicture;
    
}
@end

@implementation PlayerDetailVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void) initWithPlayer:(Player *)player
                   Team:(Team*) team{
    _player = player;
    _team = team;
    self.title = player.playerName;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _playerInfo  = [[UITextView alloc] initWithFrame:CGRectMake(5, 325, self.view.frame.size.width, 250)];
    UIFont* font  = [UIFont boldSystemFontOfSize:19];
    _playerInfo.font = font;
    _playerInfo.backgroundColor = [UIColor clearColor];
    _profilePicture = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, self.view.frame.size.width, 320)];
    
    _profilePicture.image = [UIImage imageNamed:_player.profilePicture];
    [self.view addSubview:_profilePicture];
    
    NSMutableString* inf = [[NSMutableString alloc] initWithFormat:@"Name: %@\nAge: %d\nNationality: %@\nHeight %f: \nPosition %@\nTeam: %@",_player.playerName,_player.playerAge, _player.playerNationality,_player.playerHeight,_player.playerPosition,_team.teamName];
    _playerInfo.text = inf;
    _playerInfo.editable = false;
    [self.view addSubview:_playerInfo];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
