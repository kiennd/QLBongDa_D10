//
//  SchedulerMatch.m
//  QLBongDa
//
//  Created by KIENND on 4/18/13.
//  Copyright (c) 2013 KIENND. All rights reserved.
//

#import "SchedulerMatch.h"

@interface SchedulerMatch ()
@property (strong) UITableView* tableMatch;
@property (strong) NSArray* matchList;
@property (strong) UIImageView* background;
@end

@implementation SchedulerMatch

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) loadView
{
    [super loadView];
    _background.image = [UIImage imageNamed:@"Etihad.jpg"];
    [self.view addSubview:_background];
    _tableMatch = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview:_tableMatch];
    _background = [[UIImageView alloc] initWithFrame:self.view.bounds];
    _background.image = [UIImage imageNamed:@"Etihad.jpg"];
    [self.view addSubview:_background];
    
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

@end
