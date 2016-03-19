//
//  ViewController.m
//  2048（ios）
//
//  Created by 李展 on 16/3/6.
//  Copyright © 2016年 李展. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.view.backgroundColor = [UIColor colorWithRed:250/255.0 green:248/255.0 blue:239/255.0 alpha:1];
    array = [[NSArray alloc]initWithObjects:image0,image1, image2,image3,image4,image5,image6,image7,image8,image9,image10,image11,image12,image13,image14,image15, nil];
    nowScore.textAlignment = NSTextAlignmentCenter;
    bestScore.layer.cornerRadius = 20;
    nowScore.layer.cornerRadius = 20;
    bestScore.clipsToBounds =YES;
    nowScore.clipsToBounds = YES;
    bestScore.textAlignment = NSTextAlignmentCenter;
    nowScore.numberOfLines = 2;
    nowScore.backgroundColor = [UIColor colorWithRed:187/255.0 green:173/255.0 blue:160/255.0 alpha:1];
    bestScore.backgroundColor = [UIColor colorWithRed:187/255.0 green:173/255.0 blue:160/255.0 alpha:1];
    bestScore.numberOfLines = 2;
    bestNumber = 0;
    [resetButton setTitle:@"重新开始" forState:UIControlStateNormal ];
    [resetButton addTarget:self action:@selector(reset) forControlEvents:UIControlEventTouchUpInside];
    [backGround setImage:[UIImage imageNamed:@"backGround.png"]];
    [backGround2 setImage:[UIImage imageNamed:@"backGround2.png"]];
    backGround2.contentMode = UIViewContentModeScaleAspectFit;
    UISwipeGestureRecognizer *up = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(up)];
    UISwipeGestureRecognizer *down = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(down)];
    UISwipeGestureRecognizer *left = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(left)];
    UISwipeGestureRecognizer *right = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(right)];
    [up setDirection:UISwipeGestureRecognizerDirectionUp];
    [down setDirection:UISwipeGestureRecognizerDirectionDown];
    [left setDirection:UISwipeGestureRecognizerDirectionLeft];
    [right setDirection:UISwipeGestureRecognizerDirectionRight];
    [self.view addGestureRecognizer:up];
    [self.view addGestureRecognizer:down];
    [self.view addGestureRecognizer:left];
    [self.view addGestureRecognizer:right];
    for (int i = 0; i<N; i++) {
        for (int j = 0; j<N; j++) {
            map[i][j]=0;
        }
    }
    for (int i = 0; i<N; i++) {
        [self continue];
    }
    [self showImage];
    [self showScore];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) up {
    for (int l = 0; l < N; l++) {
        for (int h =0; h < N; h++) {
            if (map[h][l] != 0) {
                for (int k= h+1; k < N; k++) {
                    if (map[k][l] != 0 && map[k][l] != map[h][l]) {
                        break;
                    }
                    if (map[h][l] == map[k][l]) {
                        map[h][l] = 2*map[h][l];
                        map[k][l] = 0;
                        break;
                    }
                }
            }
        }
    }
    
    for (int l = 0; l < N; l++) {
        for (int h = 0; h < N; h++) {
            if (map[h][l] == 0) {
                for (int k = h+1; k<N; k++) {
                    if (map[k][l]!=0) {
                        int temp;
                        temp = map[h][l];
                        map[h][l] = map[k][l];
                        map[k][l] = temp;
                        break;
                    }
                }
            }
        }
    }
    [self continue];
    [self showScore];
    [self showImage];
}


-(void) down {
    for (int l = 0; l < N; l++) {
        for (int h = N-1; h >= 0; h--) {
            if (map[h][l] != 0) {
                for (int k = h-1; k >= 0; k--) {
                    if (map[k][l]!=0 && map[k][l]!=map[h][l]) {
                        break;
                    }
                    if (map[h][l] == map[k][l]) {
                        map[h][l] = 2*map[h][l];
                        map[k][l] = 0;
                        break;
                    }
                }
            }
        }
    }
    
    for (int l = 0; l < N; l++) {
        for (int h = N-1; h >= 0; h--) {
            if (map[h][l] == 0) {
                for (int k = h-1; k>=0; k--) {
                    if (map[k][l]!=0) {
                        int temp;
                        temp = map[h][l];
                        map[h][l] = map[k][l];
                        map[k][l] = temp;
                        break;
                    }
                }
            }
        }
    }
    
    [self continue];
    [self showScore];
    [self showImage];
}


-(void) right {
    for (int h = 0; h < N; h++) {
        for (int l = N-1; l >= 0; l--) {
            if (map[h][l] != 0) {
                for (int k=l-1; k >= 0; k--) {
                    if (map[h][k]!=0 && map[h][l]!=map[h][k]) {
                        break;
                    }
                    if (map[h][l] == map[h][k]) {
                        map[h][l] = 2*map[h][k];
                        map[h][k] = 0;
                        break;
                    }
                }
            }
        }
    }
    
    for (int h = 0; h < N; h++) {
        for (int l = N-1; l >= 0; l--) {
            if (map[h][l] == 0) {
                for (int k =l-1; k>=0; k--) {
                    if (map[h][k]!=0) {
                        int temp;
                        temp = map[h][l];
                        map[h][l] = map[h][k];
                        map[h][k] = temp;
                        break;
                    }
                }
            }
        }
    }
    [self continue];
    [self showImage];
    [self showScore];
}


-(void) left {
    for (int h = 0; h < N; h++) {
        for (int l =0; l < N; l++) {
            if (map[h][l] != 0) {
                for (int k=l+1; k < N; k++) {
                    if (map[h][k]!=0 && map[h][l]!=map[h][k]) {
                        break;
                    }
                    if (map[h][l] == map[h][k]) {
                        map[h][l] = 2*map[h][l];
                        map[h][k] = 0;
                        break;
                    }
                }
            }
        }
    }
    
    for (int h = 0; h < N; h++) {
        for (int l = 0; l < N; l++) {
            if (map[h][l] == 0) {
                for (int k = l+1; k < N; k++) {
                    if (map[h][k] !=0) {
                        int temp;
                        temp = map[h][l];
                        map[h][l] = map[h][k];
                        map[h][k] = temp;
                        break;
                    }
                }
            }
        }
    }
    [self continue];
    [self showImage];
    [self showScore];
}


-(void) showImage {
    int number;
    for (int i = 0; i<N; i++) {
        for (int j = 0; j<N; j++) {
            number = map[i][j];
            switch (map[i][j]) {
                case 0:
                [[array objectAtIndex:i*N+j]setImage:[UIImage imageNamed:@"default.png"]];
                    break;
                case 2:
                    [[array objectAtIndex:i*N+j] setImage:[UIImage imageNamed:@"2.jpg"]];
                    break;
                case 4:
                    [[array objectAtIndex:i*N+j] setImage:[UIImage imageNamed:@"4.jpg"]];
                    break;
                case 8:
                    [[array objectAtIndex:i*N+j] setImage:[UIImage imageNamed:@"8.jpg"]];
                    break;
                case 16:
                    [[array objectAtIndex:i*N+j] setImage:[UIImage imageNamed:@"16.jpg"]];
                    break;
                case 32:
                    [[array objectAtIndex:i*N+j] setImage:[UIImage imageNamed:@"32.jpg"]];
                    break;
                case 64:
                    [[array objectAtIndex:i*N+j] setImage:[UIImage imageNamed:@"64.jpg"]];
                    break;
                case 128:
                    [[array objectAtIndex:i*N+j] setImage:[UIImage imageNamed:@"128.jpg"]];
                    break;
                case 256:
                    [[array objectAtIndex:i*N+j] setImage:[UIImage imageNamed:@"256.jpg"]];
                    break;
                case 512:
                    [[array objectAtIndex:i*N+j] setImage:[UIImage imageNamed:@"512.jpg"]];
                    break;
                case 1024:
                    [[array objectAtIndex:i*N+j] setImage:[UIImage imageNamed:@"1024.jpg"]];
                    break;
                case 2048:
                    [[array objectAtIndex:i*N+j] setImage:[UIImage imageNamed:@"2048.jpg"]];
                    break;
                default:
                    break;
            }
        }
    }
}


-(void) reset {
    for (int i = 0; i<N; i++) {
        for (int j = 0; j<N; j++) {
            map[i][j]=0;
        }
    }
    for (int i = 0; i< N; i++) {
        [self continue];
    }
    [self showImage];
    [self showScore];
}


-(void) continue
{
    int x,y;
    srand((unsigned int)time(NULL));
    x = rand()%N;
    y = rand()%N;
    for (int i = 0; i<N; i++) {
        for (int j = 0; j < N; j++) {
            if (map[i][j]==2048) [self Win];
            if (map[i][j]==0) {
                while (map[x][y] != 0) {
                    x = rand()%N;
                    y = rand()%N;
                }
                int i = rand()%2;
                if (i==1) {
                    map[x][y] = 2;
                }
                else {
                    map[x][y] = 4;
                }
                return;
            }
        }
    }
    for (int i = 0; i< N-1; i++) {
        for (int j = 0; j<N-1; j++) {
            if (map[i][j] == map[i+1][j] || map[i][j] == map[i][j+1]) {
                return;
            }
        }
    }
    for (int k=0; k<N-1; k++) {
        if (map[k][N-1] == map[k+1][N-1]){
            return;
        }
    }
    [self GameOver];
}


-(void) showScore{
    nowNumber=0;
    for (int i = 0; i<N; i++) {
        for (int j = 0; j<N; j++) {
            nowNumber += map[i][j];
        }
    }
    if (nowNumber > bestNumber) {
        bestNumber = nowNumber;
    }
    NSString *best = [NSString stringWithFormat:@"%d",bestNumber];
    NSString *now = [NSString stringWithFormat:@"%d",nowNumber];
    NSString *str1=[@"NowScore:\n" stringByAppendingString: now];
    NSString *str2 = [@"BestScore:\n" stringByAppendingString:best];
    nowScore.text  = str1;
    bestScore.text = str2;
}


-(void) GameOver {
    UIAlertController *GameOverController= [UIAlertController alertControllerWithTitle:@"游戏结束" message:@"是否重新开始?" preferredStyle:UIAlertControllerStyleAlert];
    if (nowNumber == bestNumber) {
        GameOverController.message=@"恭喜你打破记录！！！是否重新开始？";
    }
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
        [self reset];
    }];
    [GameOverController addAction:cancelAction];
    [GameOverController addAction:okAction];
    [self presentViewController:GameOverController animated:YES completion:nil];
   
}

-(void) Win {
    UIAlertController *WinController = [UIAlertController alertControllerWithTitle:@"胜利" message:@"恭喜你取得胜利,是否重新开始一局游戏？" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
        [self reset];
    }];
    [WinController addAction:cancelAction];
    [WinController addAction:okAction];
    [self presentViewController:WinController animated:YES completion:nil];

}

@end



