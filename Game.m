//
//  Game.m
//  Flappy Bird
//
//  Created by Jacquelyn Loven on 12/18/14.
//  Copyright (c) 2014 Jackie Loven. All rights reserved.
//

#import "Game.h"

@interface Game ()

@end

@implementation Game

-(IBAction)StartGame:(id)sender{
    
    //  This code will run when you push the button.
    
    //  Want the button to disappear upon pressing:
    StartGame.hidden = YES;
    
    //  Start the timer for moving the bird (name was BirdMovement from Game.h):
    //  Every 0.05 seconds, the bird will move a few pixels. "Naught point naught five" LOL
    
    BirdMovement = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(BirdMoving) userInfo:nil repeats:YES];
    
}

-(void)BirdMoving{
    
    //  Want to change the Bird's y-coordinate upon the call of this method.
    //  BirdFlight was the int from Game.h.
    Bird.center = CGPointMake(Bird.center.x, Bird.center.y - BirdFlight);
    
}







- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
