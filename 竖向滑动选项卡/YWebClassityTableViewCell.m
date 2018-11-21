//
//  YWebClassityTableViewCell.m
//  竖向滑动选项卡
//
//  Created by 尤艺琪 on 2018/11/6.
//  Copyright © 2018年 尤艺琪. All rights reserved.
//

#import "YWebClassityTableViewCell.h"
#import "YConstMacro.h"
@interface YWebClassityTableViewCell()
@property (nonatomic, strong) UIImageView *iconImv;
@property (nonatomic, strong) UILabel *titleLbl;
@property (nonatomic, strong) UILabel *contentLbl;
@property (nonatomic, strong) UIButton *addOrRedBtn;
@end


@implementation YWebClassityTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self) {
        [self.contentView addSubview:self.iconImv];
        [self.contentView addSubview:self.titleLbl];
        [self.contentView addSubview:self.contentLbl];
        [self.contentView addSubview:self.addOrRedBtn];
    }
    return self;
}


#pragma mark - set
-(void)setIndexStr:(NSString *)indexStr {
    _indexStr = indexStr;
    self.titleLbl.text = indexStr;
}

#pragma mark - lazy
-(UIImageView *)iconImv {
    if(_iconImv == nil) {
        _iconImv = [[UIImageView alloc]initWithFrame:CGRectMake(10, 5, 45, 45)];
        _iconImv.backgroundColor = [UIColor orangeColor];
    }
    return _iconImv;
}
-(UILabel *)titleLbl {
    if(_titleLbl == nil) {
        _titleLbl = [[UILabel alloc]initWithFrame:CGRectMake(65, 10, V_W-90-130, 13)];
        _titleLbl.textColor = [UIColor colorWithRed:0.13 green:0.13 blue:0.13 alpha:1];
        _titleLbl.font = [UIFont systemFontOfSize:13];
    }
    return _titleLbl;
}
-(UILabel *)contentLbl {
    if(_contentLbl == nil) {
        _contentLbl = [[UILabel alloc]initWithFrame:CGRectMake(65, 38, V_W-90-130, 12)];
        _contentLbl.text = @"比特儿是Gate 的中文版";
        _contentLbl.textColor = [UIColor colorWithRed:0.58 green:0.58 blue:0.58 alpha:1];
        _contentLbl.font = [UIFont systemFontOfSize:12];
    }
    return _contentLbl;
}
-(UIButton *)addOrRedBtn {
    if(_addOrRedBtn == nil) {
        _addOrRedBtn = [[UIButton alloc]initWithFrame:CGRectMake(V_W-135, 12.5, 30, 30)];
        _addOrRedBtn.backgroundColor = [UIColor orangeColor];
    }
    return _addOrRedBtn;
}

@end
