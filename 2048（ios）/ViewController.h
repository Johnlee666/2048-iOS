//
//  ViewController.h
//  2048（ios）
//
//  Created by 李展 on 16/3/6.
//  Copyright © 2016年 李展. All rights reserved.
//

#import <UIKit/UIKit.h>
#define N 4
@interface ViewController : UIViewController
{
    __weak IBOutlet UIImageView *backGround2;
    __weak IBOutlet UIButton *resetButton;
    __weak IBOutlet UIImageView *image0;
    __weak IBOutlet UIImageView *image1;
    __weak IBOutlet UIImageView *image2;
    __weak IBOutlet UIImageView *image3;
    __weak IBOutlet UIImageView *image4;
    __weak IBOutlet UIImageView *image5;
    __weak IBOutlet UIImageView *image6;
    __weak IBOutlet UIImageView *image7;
    __weak IBOutlet UIImageView *image8;
    __weak IBOutlet UIImageView *image9;
    __weak IBOutlet UIImageView *image10;
    __weak IBOutlet UIImageView *image11;
    __weak IBOutlet UIImageView *image12;
    __weak IBOutlet UIImageView *image13;
    __weak IBOutlet UIImageView *image14;
    __weak IBOutlet UIImageView *image15;
    __weak IBOutlet UIImageView *backGround;
    __weak IBOutlet UILabel *nowScore;
    __weak IBOutlet UILabel *bestScore;
    NSArray *array;
    int map[4][4];
    int bestNumber;
    int nowNumber;
}


@end

