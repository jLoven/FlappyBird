//
//  Game.h
//  Flappy Bird
//
//  Created by Jacquelyn Loven on 12/18/14.
//  Copyright (c) 2014 Jackie Loven. All rights reserved.
//

#import <UIKit/UIKit.h>

int BirdFlight; 

@interface Game : UIViewController
{
    
    //  Need to declare the bird and button as outlets because
    //  we are affecting them with code.
    IBOutlet UIImageView *Bird;
    IBOutlet UIButton *StartGame;
    
    //  Also need to initialize a timer for the flapping bird
    //  in Game.m.
    NSTimer *BirdMovement;
    
}

//  Need to make an action so that when we push the button, some
//  code will run.
-(IBAction)StartGame:(id)sender;
-(void)BirdMoving;

@end
