//
//  TeamDetailVC.m
//  QLBongDa
//
//  Created by KIENND on 4/17/13.
//  Copyright (c) 2013 KIENND. All rights reserved.
//

#import "TeamDetailVC.h"
@interface TeamDetailVC ()
{
    Team* _team;
    int* _playerChoice;
    NSMutableArray* _dataPlayer;
    UITableView* _tablePlayer;
    UITextView* _teamInfo;
    UIImageView* _teamLogo;
    int _teamId;
}
@end

@implementation TeamDetailVC

- (id)initWithNibName:(NSString *)nibNameOrNil
               bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        // Custom initialization
        _playerChoice=malloc(sizeof(int)*100);
        DataManager* dt = [DataManager ShareData];
        _dataPlayer = [[NSMutableArray alloc] initWithArray:dt.dataPlayer];

        NSLog(@"Number player %d",[_dataPlayer count]);
    }
    return self;
}

- (void) initWithTeam: (Team*) team
{
    _team = team;
    self.title = team.teamName;
}

- (void) loadView
{
    [super loadView];
    self.view.backgroundColor = [UIColor whiteColor];
    
    _teamLogo = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10 , 300, 130)];
    _teamLogo.image = [UIImage imageNamed:_team.teamImage];
    [self.view addSubview:_teamLogo];
    
    
    _teamInfo  = [[UITextView alloc] initWithFrame:CGRectMake(5, 130, self.view.frame.size.width, 250)];
    UIFont* font  = [UIFont boldSystemFontOfSize:19];
    _teamInfo.font = font;
    _teamInfo.backgroundColor = [UIColor clearColor];
    
    NSMutableString* inf = [[NSMutableString alloc] initWithFormat:@"Name: %@\nStadium: %@\nCoach: %@\nPlayer List:",_team.teamName,_team.stadiumName, _team.coachName];
    _teamInfo.text = inf;
    _teamInfo.editable = false;

    
    [self.view addSubview:_teamInfo];
    _tablePlayer  = [[UITableView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y+220, self.view.frame.size.width, self.view.frame.size.height-300) style:UITableViewStylePlain];
    _tablePlayer.dataSource = self;
    _tablePlayer.delegate = self;
    [self.view addSubview:_tablePlayer];
    
    UIImageView* tableImage = [[UIImageView alloc] initWithFrame:_tablePlayer.frame];
    tableImage.image = [UIImage imageNamed:_team.logoName];
    _tablePlayer.backgroundView = tableImage;
    
}


- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_team.players count];
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = nil;
    static NSString *cellID = @"Cell";
    cell = [_tablePlayer dequeueReusableCellWithIdentifier:cellID];
    if (!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    Player* player = _team.players[indexPath.row];
    cell.textLabel.text = player.playerName;
   // cell.accessoryType = UITableViewCellSelectionStyleBlue;
    cell.imageView.image = [UIImage imageNamed:player.profilePicture];
    cell.backgroundColor = [UIColor clearColor];
    
    _playerChoice[indexPath.row] = player.playerId;
  //  NSLog(@"tag%d", cell.tag);
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%@",[NSString stringWithFormat:@"Cell %d in Section %d is selected",indexPath.row, _playerChoice[indexPath.row]]);
    
    Player* playerView = _dataPlayer[_playerChoice[indexPath.row]-1];
    
    PlayerDetailVC* dpvc;
    if(!dpvc){
        dpvc = [[PlayerDetailVC alloc] initWithNibName:nil bundle:nil];
    }
    
    [dpvc initWithPlayer: playerView Team:_team];
    
    [self.navigationController pushViewController:dpvc animated:YES];
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
