//
//  ViewController.m
//  UITableView-单组数据
//
//  Created by apple on 16/5/14.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ViewController.h"
#import "ZPHero.h"

@interface ViewController () <UITableViewDataSource>

@property (nonatomic, strong) NSArray *heroes;

@end

@implementation ViewController

#pragma mark ————— 懒加载 —————
-(NSArray *)heroes
{
    if (_heroes == nil)
    {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"heroes" ofType:@"plist"];
        NSArray *dicArray = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *heroArray = [NSMutableArray array];
        
        for (NSDictionary *dic in dicArray)
        {
            ZPHero *hero = [ZPHero heroWithDict:dic];
            [heroArray addObject:hero];
        }
        
        _heroes = heroArray;
    }
    
    return _heroes;
}

#pragma mark ————— 生命周期 —————
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark ————— UITableViewDataSource —————
/**
 调用顺序：1
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

/**
 调用顺序：2
 */
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.heroes.count;
}

/**
 调用顺序：3
 */
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    
    ZPHero *hero = [self.heroes objectAtIndex:indexPath.row];
    
    cell.textLabel.text = hero.name;
    cell.imageView.image = [UIImage imageNamed:hero.icon];
    cell.detailTextLabel.text = hero.intro;
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
