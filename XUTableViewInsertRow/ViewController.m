//
//  ViewController.m
//  XUTableViewInsertRow
//
//  Created by 徐继垚 on 15/7/16.
//  Copyright (c) 2015年 徐继垚. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate , UITableViewDataSource>
{
    //创建一个变量，用来判断点击的是哪个sectionButton
    NSInteger _numOfSection;

}
@property (nonatomic ,retain)UIButton * sectionButton;

@property (nonatomic ,retain)NSMutableArray * array;
@property (nonatomic ,retain)NSMutableArray * array2;
@property (nonatomic ,retain)NSMutableArray * deleteOtherCellArr;
@property(nonatomic, assign) NSInteger tempNum;

@property (nonatomic , assign) NSInteger NUMBER;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.array = [[NSMutableArray alloc]initWithObjects:[NSNumber numberWithInteger:0], [NSNumber numberWithInteger:1],[NSNumber numberWithInteger:2], [NSNumber numberWithInteger:3] ,nil];
    self.array2 = [[NSMutableArray alloc]initWithObjects:[NSNumber numberWithInteger:0], [NSNumber numberWithInteger:1],[NSNumber numberWithInteger:2], [NSNumber numberWithInteger:3], nil];
    
    
    self.tableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    // Do any additional setup after loading the view, typically from a nib.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSNumber * num = [NSNumber numberWithInteger:section];
    if ([self.array containsObject:num]) {
        return 0;
    }
    else
    {
         return 1;
    }
    
   
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    //    定义一个view  用来添加各个sectionbutton
      UIView * headView  = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 50)];
    
    self.sectionButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _sectionButton.frame = CGRectMake(0, 0, self.view.bounds.size.width, 50);
    _sectionButton.tag = section;
    [_sectionButton addTarget:self action:@selector(sectionButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [_sectionButton setTitle:@"点击插入cell" forState:UIControlStateNormal];
    [_sectionButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _sectionButton.backgroundColor = [UIColor redColor];
    [headView addSubview:_sectionButton];
    
    return headView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
- (void)sectionButtonAction:(UIButton *)sender
{
           // 给numOfSection 赋值
        _numOfSection = sender.tag ;
    
        // num用于标记  检查section是否被点击
        NSNumber *num = [NSNumber numberWithInteger:sender.tag ];
    
        NSMutableArray * indexPathArray = [[NSMutableArray alloc]init];
    
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:sender.tag ];
        [indexPathArray addObject:indexPath];
        
        // 判断是展开还是关闭
        if ([_array containsObject:num]) {
            // 判断是否已经有section 有插入的row了
            if (_array.count != _array2.count) {
                // 如果有
                _deleteOtherCellArr = [NSMutableArray array];
                NSIndexPath *tempIndexPath = [NSIndexPath indexPathForItem:0 inSection:_tempNum];
                [_deleteOtherCellArr addObject:tempIndexPath];
                NSNumber *tempNum = [NSNumber numberWithInteger:_tempNum];
                [_array removeObject:num];
                [_tableView insertRowsAtIndexPaths:indexPathArray withRowAnimation:UITableViewRowAnimationAutomatic];
                [_array addObject:tempNum];
                
                [_tableView deleteRowsAtIndexPaths:_deleteOtherCellArr withRowAnimation:UITableViewRowAnimationAutomatic];
            } else {
                // 如果只是section中没有打开的  走此处  插入row
                [_array removeObject:num];
                [_tableView insertRowsAtIndexPaths:indexPathArray withRowAnimation:UITableViewRowAnimationAutomatic];
            }
        } else {
            // 删除点击的section中的row
            [_array addObject:num];
            [_tableView deleteRowsAtIndexPaths:indexPathArray withRowAnimation:UITableViewRowAnimationAutomatic];
        }
        //        将当前点击的section数存入_tempNum
        _tempNum = [num integerValue];
    


    


}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_numOfSection == 0) {
        static NSString *identifier = @"firstcell";
        FirstTableViewCell * fcell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!fcell) {
            fcell = [[FirstTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
        }
        return fcell;
    } else {
        static NSString *identifier = @"secondcell";
        SecondTableViewCell * scell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!scell) {
            scell = [[SecondTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
            
        }
        return  scell;
    }
    
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
