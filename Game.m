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
    
    //  Bird should start falling after it rises a bit.
    //  Every 0.05 seconds, we take 5 away from BirdFlight.
    //  When it becomes negative, it will start to fall.
    BirdFlight = BirdFlight - 5;
    
    if (BirdFlight < -15) {
        //  Limit how fast it goes down to -15.
        BirdFlight = -15;
    }
    
    //  Want to change the bird image depending on negative or positive BirdFlight.
    //  Moving up (positive number):
    if (BirdFlight > 0) {
        Bird.image = [UIImage imageNamed: @"bird_up.png"];
    }
    
    //  Moving down (negative number):
    if (BirdFlight < 0) {
        Bird.image = [UIImage imageNamed: @"bird_down.png"];
    }
    
}


//  When we tap on the screen, use this XCode function:
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    //  When we tap the screen, the y-coordinate goes down by 30, making the bird move up.
    BirdFlight = 30;
    
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
