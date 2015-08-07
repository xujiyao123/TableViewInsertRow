//
//  FirstTableViewCell.m
//  XUTableViewInsertRow
//
//  Created by 徐继垚 on 15/7/16.
//  Copyright (c) 2015年 徐继垚. All rights reserved.
//

#import "FirstTableViewCell.h"

@implementation FirstTableViewCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.button = [UIButton buttonWithType:UIButtonTypeCustom];
        self.button.frame = self.contentView.frame;
        self.button.backgroundColor = [UIColor cyanColor];
        [self.button setTitle:@"第一种" forState:UIControlStateNormal];
        [self.contentView addSubview:_button];
                
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
