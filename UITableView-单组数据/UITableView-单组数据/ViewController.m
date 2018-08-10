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
@property (weak, nonatomic) IBOutlet UITableView *tableView;

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
    
    self.tableView.tableHeaderView = [UIButton buttonWithType:UIButtonTypeContactAdd];
    self.tableView.tableFooterView = [UIButton buttonWithType:UIButtonTypeInfoDark];
}

#pragma mark ————— UITableViewDataSource —————
/**
 调用顺序：1
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
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

/**
 每个分区的头部标题
 */
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *headerTitle = @"头部标题";
    
    return headerTitle;
}

/**
 每个分区的尾部标题
 */
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    NSString *footerTitle = @"尾部标题";
    
    return footerTitle;
}

#pragma mark ————— UITableViewDelegate —————
/**
 每个分区的头部视图
 */
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    UIImageView *sectionHeaderImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"scenery"]];
//
//    return sectionHeaderImageView;
//}

/**
 每个分区的尾部视图
 */
//- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
//{
//    UIImageView *sectionFooterImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"timg"]];
//    
//    return sectionFooterImageView;
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
