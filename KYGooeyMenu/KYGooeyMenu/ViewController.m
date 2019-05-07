//
//  ViewController.m
//  KYGooeyMenu
//
//  Created by Kitten Yang on 4/23/15.
//  Copyright (c) 2015 Kitten Yang. All rights reserved.
//

#import "ViewController.h"
#import "KYGooeyMenu.h"


@interface ViewController ()<menuDidSelectedDelegate>

@property (strong, nonatomic) IBOutlet UILabel *min;
@property (strong, nonatomic) IBOutlet UILabel *current;
@property (strong, nonatomic) IBOutlet UISlider *slider;
@end

@implementation ViewController{
    KYGooeyMenu *gooeyMenu;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.min.text = [NSString stringWithFormat:@"%d",(int)self.slider.minimumValue] ;
    [self.slider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];

    gooeyMenu = [[KYGooeyMenu alloc]initWithOrigin:CGPointMake(CGRectGetMidX(self.view.frame)-50, 500) andDiameter:100.0f andDelegate:self themeColor:[UIColor redColor] crossColor:[UIColor clearColor] andCrossLength:100.0f];
    gooeyMenu.menuDelegate = self;
    gooeyMenu.radius = 100/4;//大圆的1/4
    gooeyMenu.extraDistance = 20;
    gooeyMenu.MenuCount = 5;
    gooeyMenu.menuImagesArray = [NSMutableArray arrayWithObjects:[UIImage imageNamed:@"tabbarItem_discover highlighted"],[UIImage imageNamed:@"tabbarItem_group highlighted"],[UIImage imageNamed:@"tabbarItem_home highlighted"],[UIImage imageNamed:@"tabbarItem_message highlighted"],[UIImage imageNamed:@"tabbarItem_user_man_highlighted"], nil];
    
}


#pragma mark -- 彩单选中的代理方法
-(void)menuDidSelected:(int)index{
    NSLog(@"选中第%d",index);
}


- (void)sliderValueChanged:(UISlider *)sender {
    self.current.text = [NSString stringWithFormat:@"%d",(int)sender.value];

    gooeyMenu.MenuCount = (int)sender.value;

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
