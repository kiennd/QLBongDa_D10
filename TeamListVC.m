//
//  TeamListVC.m
//  FootballManager
//
//  Created by KIENND on 4/17/13.
//  Copyright (c) 2013 KIENND. All rights reserved.
//

#import "TeamListVC.h"

@interface TeamListVC ()
@property (strong) UITableView* tableTeam;
@property (strong) NSMutableArray* teamList;

@property (assign) int* teamChoice;
@property (strong) UISearchBar* sb;
@property (strong) NSMutableArray* searched;
@end

@implementation TeamListVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

        
        self.tabBarItem.image = [UIImage imageNamed:@"team.png"];
        
        DataManager* dt = [DataManager ShareData];
        _searched = [[NSMutableArray alloc] initWithArray:dt.dataTeam];
        self.title = @"Team List";
        _teamList = [[NSMutableArray alloc] initWithArray:dt.dataTeam];
        NSLog(@"team count %d",[_teamList count]);
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

   // NSLog(@"%d",[t.players count]);
	// Do any additional setup after loading the view.
}

- (void)loadView
{
    [super loadView];
    
    self.view.backgroundColor =  [UIColor redColor];
    CGRect cg = self.view.bounds;
    cg.origin.y+=45;
    _tableTeam = [[UITableView alloc] initWithFrame:cg style:UITableViewStylePlain];
    _tableTeam.delegate = self;
    _tableTeam.dataSource = self;
    [self.view addSubview:_tableTeam];
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"searched count %d",[_searched count]);
 _teamChoice = malloc(sizeof(int)*100);
    return [_searched count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    static NSString *cellID = @"Cell";
    cell = [_tableTeam dequeueReusableCellWithIdentifier:cellID];
    if (!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    Team* team =_searched[indexPath.row];
    
    cell.textLabel.text = team.teamName;
    cell.imageView.image = [UIImage imageNamed:team.logoName];
    cell.accessoryType = UITableViewCellSelectionStyleBlue;
    
    _teamChoice[indexPath.row] = team.teamId;
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"selected row: %d",indexPath.row);
    TeamDetailVC* _teamDetailVC;
    Team* teamJustChoice;
    
    
    for (Team* tmp in _searched) {
        if(tmp.teamId == _teamChoice[indexPath.row]){
            teamJustChoice = tmp;
            break;
        }
    }
    if (!_teamDetailVC) {  //kiem tra neu Null thi khoi tao
        _teamDetailVC = [[TeamDetailVC alloc] initWithNibName:nil bundle:nil];
    }
    [_teamDetailVC initWithTeam:teamJustChoice];
    
    [self.navigationController pushViewController:_teamDetailVC animated:YES];
    
}

#pragma mark -

- (void) search:(NSString *) matchString
{
	NSString *upString = [matchString uppercaseString];
	if (_searched)
	
	_searched = [[NSMutableArray alloc] init];
	for (Team *team in _teamList)
	{
		if ([matchString length] == 0)
		{
			[_searched addObject:team];
			continue;
		}
		
		NSRange range = [[team.teamName uppercaseString] rangeOfString:upString];
		if (range.location != NSNotFound)
			[_searched addObject:team];
	}
	
	[_tableTeam reloadData];
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


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
