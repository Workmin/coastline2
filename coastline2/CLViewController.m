//
//  CLViewController.m
//  coastline2
//
//  Created by wangyuanou on 14-1-28.
//  Copyright (c) 2014年 mixbus. All rights reserved.
//

#import "CLViewController.h"

@interface CLViewController ()

@end

@implementation CLViewController {
	BackEvent _backEvent;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
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

-(void)viewWillAppear:(BOOL)animated{
	[super viewWillAppear:animated];
	
	if (_backEvent) {
		_backEvent();
		
		_backEvent = nil;
	}
}

-(void) present:(UIViewController*)controller back:(BackEvent)event {
	_backEvent = event;
	
	[self presentViewController:controller animated:YES completion:nil];
}

-(void) navigate:(UIViewController*)controller back:(BackEvent)event {
	_backEvent = event;
	
	[self.navigationController pushViewController:controller animated:YES];
}

@end
