//
//  PlayerListVC.m
//  QLBongDa
//
//  Created by KIENND on 4/18/13.
//  Copyright (c) 2013 KIENND. All rights reserved.
//

#import "PlayerListVC.h"
#import "Team.h"
@interface PlayerListVC ()
{
    UITableView* _tablePlayer;
    NSArray* _dataPlayer;
    NSArray* _dataTeam;
    int* _playerChoice;
}
@property (strong) UISearchBar* sb;
@property (strong) NSMutableArray* searched;
@end

@implementation PlayerListVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        self.title = @"Player List";
        self.tabBarItem.image = [UIImage imageNamed:@"player.png"];
        DataManager* dt = [DataManager ShareData];
        _searched = [[NSMutableArray alloc]initWithArray:dt.dataPlayer];
        _dataPlayer = [[NSMutableArray alloc]initWithArray:dt.dataPlayer];
        
        _dataTeam = dt.dataTeam;
        // Custom initialization
    }
    return self;
}

- (void) loadView
{
    [super loadView];
    _tablePlayer  = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tablePlayer.dataSource = self;
    _tablePlayer.delegate = self;
    [self.view addSubview:_tablePlayer];
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"searched count %d",[_searched count]);
    _playerChoice = malloc(sizeof(int)*100);
    return [_searched count];
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = nil;
    static NSString *cellID = @"Cell";
    cell = [_tablePlayer dequeueReusableCellWithIdentifier:cellID];
    if (!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    Player* player = _searched[indexPath.row];
    cell.textLabel.text = player.playerName;
    // cell.accessoryType = UITableViewCellSelectionStyleBlue;
    
    cell.tag = player.playerId;
    cell.backgroundColor = [UIColor clearColor];
    cell.imageView.image = [UIImage imageNamed:player.profilePicture];
    _playerChoice[indexPath.row] = player.playerId;
    //  NSLog(@"tag%d", cell.tag);
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%@",[NSString stringWithFormat:@"Cell %d in Section %d is selected",indexPath.row, _playerChoice[indexPath.row]]);
    
    Player* playerView ;
    for (Player* tmp in _searched) {
        if(tmp.playerId == _playerChoice[indexPath.row]){
            playerView = tmp;
            NSLog(@"tim thay");
            break;
        }
    }
    
    PlayerDetailVC* dpvc;
    if(!dpvc){
        dpvc = [[PlayerDetailVC alloc] initWithNibName:nil bundle:nil];
    }
    
    Team* team = _dataTeam[playerView.ownerTeamId - 1];
    [dpvc initWithPlayer: playerView Team:team];
    
    [self.navigationController pushViewController:dpvc animated:YES];
    
}

- (void) viewDidAppear:(BOOL)animated{
    CGRect rct = self.navigationController.navigationBar.frame;
    rct.origin.y = 0;
    self.sb = [[UISearchBar alloc] initWithFrame:rct];
    self.sb.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    self.sb.showsCancelButton = YES;
    self.sb.delegate = self;
    [self.view addSubview:_sb];
}

#pragma mark -

- (void) search:(NSString *) matchString
{
	NSString *upString = [matchString uppercaseString];
	if (_searched)
        
        _searched = [[NSMutableArray alloc] init];
	for (Player *player in _dataPlayer)
	{
		if ([matchString length] == 0)
		{
			[_searched addObject:player];
			continue;
		}
		
		NSRange range = [[player.playerName uppercaseString] rangeOfString:upString];
		if (range.location != NSNotFound)
			[_searched addObject:player];
	}
	
	[_tablePlayer reloadData];
}

#pragma mark UISearchBarDelegate
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
	[self search:searchText];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
	[searchBar resignFirstResponder];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
	[searchBar resignFirstResponder];
}




- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

@end
