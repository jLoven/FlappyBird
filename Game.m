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
    //  Want the tunnels to appear:
    TopTunnel.hidden = NO;
    BottomTunnel.hidden = NO;
    
    //  Start the timer for moving the bird (name was BirdMovement from Game.h):
    //  Every 0.05 seconds, the bird will move a few pixels. "Naught point naught five" LOL
    
    BirdMovement = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(BirdMoving) userInfo:nil repeats:YES];
    
    [self PlaceTunnels]; //  Runs the method PlaceTunnels when the game starts.
    
    //  make a new timer for the tunnel movemebt
    TunnelMovement = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(TunnelMoving) userInfo:nil repeats:YES];
    
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

-(void)PlaceTunnels{
    
    //  Want to place the tunnels on the right of the screen, so when they are first placed, you won't see them.
    //  First set it to a random position between 0 and 349:
    RandomTopTunnelPosition = arc4random() % 350;
    //  Now set it to the same range, but between -228 and 122:
    RandomTopTunnelPosition = RandomTopTunnelPosition - 228;
    //  Now leave a gap between the tunnels:
    BottomTunnelPosition = RandomTopTunnelPosition + 655;
    
    //  340 is x-position so that it appears just off the screen.
    //  Set the TopTunnel position by changing the y-coordinate to the variables above:
    TopTunnel.center = CGPointMake(340, RandomTopTunnelPosition);
    BottomTunnel.center = CGPointMake(340, BottomTunnelPosition);
    
}

-(void)TunnelMoving{
    
    //  Tunnels need to generate on the right and disappear on the left.
    //  Take one away from the x-coordiante every time this method is called.
    //  Since it's on a timer that fires every 0.01 seconds, it will move left smoothly.
    TopTunnel.center = CGPointMake(TopTunnel.center.x - 1, TopTunnel.center.y);
    BottomTunnel.center = CGPointMake(BottomTunnel.center.x - 1, BottomTunnel.center.y);
    
    //  Now make them go back to the right side if they go off the screen:
    if (TopTunnel.center.x < -28) {
        [self PlaceTunnels];
    }
    
    if (TopTunnel.center.x == 89) {
        //  The bird has flown through the gap because the tunnels have reached past the bird.
        //  The user gets a point.
        [self Score];
    }
}

-(void)Score{
    //  Want to add one to the score and display it in the label.
    ScoreNumber = ScoreNumber + 1;
    //  The percent-i tells XCode that we want to display an integer in this label (ScoreNumber):
    ScoreLabel.text = [NSString stringWithFormat:@"%i", ScoreNumber];
    //  NSString *ScoreString = [NSString stringWithFormat:@"%d", ScoreNumber];
    //  ScoreLabel.text = ScoreString;
}


- (void)viewDidLoad {
    
    TopTunnel.hidden = YES;
    BottomTunnel.hidden = YES;
    
    [super viewDidLoad];
    
    //  Hide the exit button, because you only want it to appear at the end of the game.
    Exit.hidden = YES;
    //  Set the score to be 0 at the beginning of the game.
    ScoreNumber = 0;
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
