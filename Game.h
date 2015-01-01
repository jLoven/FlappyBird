//
//  Game.h
//  Flappy Bird
//
//  Created by Jacquelyn Loven on 12/18/14.
//  Copyright (c) 2014 Jackie Loven. All rights reserved.
//

#import <UIKit/UIKit.h>

int BirdFlight;
int RandomTopTunnelPosition;
int BottomTunnelPosition;
int ScoreNumber;
NSInteger HighScoreNumber;

@interface Game : UIViewController
{
    
    //  Need to declare the bird and button as outlets because
    //  we are affecting them with code.
    IBOutlet UIImageView *Bird;
    IBOutlet UIButton *StartGame;
    //  Need to delcare tunnels because we will be moving them and
    //  colliding with them.
    IBOutlet UIImageView *TopTunnel; //  He calls this TunnelTop in the tutorial.
    IBOutlet UIImageView *BottomTunnel;
    IBOutlet UIImageView *TopBarrier; //  He calls this Top in the tutorial.
    IBOutlet UIImageView *BottomBarrier;
    
    //  Button and label for exiting and score:
    IBOutlet UILabel *ScoreLabel;
    IBOutlet UIButton *Exit;
    
    //  Also need to initialize a timer for the flapping bird
    //  in Game.m.
    NSTimer *BirdMovement;
    //  Another timer for the movement of the tunnels:
    NSTimer *TunnelMovement;
    
}

//  Need to make an action so that when we push the button, some
//  code will run.
-(IBAction)StartGame:(id)sender;
-(void)BirdMoving;

//  Need methods for tunnels:
-(void)TunnelMoving;
-(void)PlaceTunnels; //  Use to place the tunnels and the gap randomly.

//  Need a method to change the score:
-(void)Score;
-(void)GameOver;

@end
