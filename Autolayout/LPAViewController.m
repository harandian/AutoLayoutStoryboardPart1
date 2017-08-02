//
//  LPAViewController.m
//  Autolayout
//
//  Created by Steven Masuch on 2014-07-20.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "LPAViewController.h"

@interface LPAViewController ()

@property (nonatomic, weak) UIButton *squareButton;
@property (nonatomic, weak) UIButton *portraitButton;
@property (nonatomic, weak) UIButton *landscapeButton;

@property (nonatomic, weak) UIView *framingView;
@property (nonatomic, weak) NSLayoutConstraint *framingViewHeightConstraint;
@property (nonatomic, weak) NSLayoutConstraint *framingViewWidthConstraint;
//@property (nonatomic, weak) UIView *View1;



@end


@implementation LPAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *squareButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [squareButton setTitle:@"Square" forState:UIControlStateNormal];
    [squareButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:squareButton];
    squareButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.squareButton = squareButton;
    
    UIButton *portraitButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [portraitButton setTitle:@"Portrait" forState:UIControlStateNormal];
    [portraitButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:portraitButton];
    portraitButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.portraitButton = portraitButton;
    
    UIButton *landscapeButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [landscapeButton setTitle:@"Landscape" forState:UIControlStateNormal];
    [landscapeButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:landscapeButton];
    landscapeButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.landscapeButton = landscapeButton;
    
    UIView *framingView = [[UIView alloc] initWithFrame:CGRectZero];
    framingView.translatesAutoresizingMaskIntoConstraints = NO;
    framingView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:framingView];
    self.framingView = framingView;
    
    NSString *buttonsHorizontalConstraintsFormat = @"|[squareButton(==portraitButton)][portraitButton(==landscapeButton)][landscapeButton]|";
    NSArray *buttonsHorizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:buttonsHorizontalConstraintsFormat
                                                                                    options:NSLayoutFormatAlignAllCenterY
                                                                                    metrics:nil
                                                                                      views:NSDictionaryOfVariableBindings(squareButton, portraitButton, landscapeButton)];
    [NSLayoutConstraint activateConstraints:buttonsHorizontalConstraints];
    
    NSLayoutConstraint *squareButtonBottomConstraint = [NSLayoutConstraint constraintWithItem:squareButton
                                                                                    attribute:NSLayoutAttributeBottom
                                                                                    relatedBy:NSLayoutRelationEqual
                                                                                       toItem:self.view
                                                                                    attribute:NSLayoutAttributeBottom
                                                                                   multiplier:1.0
                                                                                     constant:-50.0];
    squareButtonBottomConstraint.active = YES;
    
    NSLayoutConstraint *framingViewCenterXConstraint = [NSLayoutConstraint constraintWithItem:framingView
                                                                                    attribute:NSLayoutAttributeCenterX
                                                                                    relatedBy:NSLayoutRelationEqual
                                                                                       toItem:self.view
                                                                                    attribute:NSLayoutAttributeCenterX
                                                                                   multiplier:1.0
                                                                                     constant:0.0];
    framingViewCenterXConstraint.active = YES;
    
    NSLayoutConstraint *framingViewCenterY = [NSLayoutConstraint constraintWithItem:framingView
                                                                          attribute:NSLayoutAttributeCenterY
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:self.view
                                                                          attribute:NSLayoutAttributeCenterY
                                                                         multiplier:1.0
                                                                           constant:-50.0];
    framingViewCenterY.active = YES;
    
    self.framingViewHeightConstraint = [NSLayoutConstraint constraintWithItem:framingView
                                                                    attribute:NSLayoutAttributeHeight
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:nil
                                                                    attribute:NSLayoutAttributeNotAnAttribute
                                                                   multiplier:1.0
                                                                     constant:500.0];
    self.framingViewHeightConstraint.active = YES;
    
    self.framingViewWidthConstraint = [NSLayoutConstraint constraintWithItem:framingView
                                                                   attribute:NSLayoutAttributeWidth
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:nil
                                                                   attribute:NSLayoutAttributeNotAnAttribute
                                                                  multiplier:1.0
                                                                    constant:500.0];
    self.framingViewWidthConstraint.active = YES;
    
    
    // Set up your views and constraints here
    
    UIView *purpleBox = [[UIView alloc] init];
    
    
    [self.framingView addSubview:purpleBox];
    
    purpleBox.frame = CGRectZero;
    
    purpleBox.translatesAutoresizingMaskIntoConstraints = NO;
    
    purpleBox.backgroundColor = [UIColor purpleColor];
    
    
    
    NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:purpleBox
                                                                    attribute:NSLayoutAttributeRight relatedBy: NSLayoutRelationEqual toItem:self.framingView attribute:NSLayoutAttributeRight multiplier:1 constant:(-20)];
    
    rightConstraint.active = YES;

    NSLayoutConstraint *bottomConstraint = [NSLayoutConstraint constraintWithItem:purpleBox
                                                                    attribute:NSLayoutAttributeBottom relatedBy: NSLayoutRelationEqual toItem:self.framingView attribute:NSLayoutAttributeBottom multiplier:1 constant:(-20)];
    
    bottomConstraint.active = YES;

    NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:purpleBox
                                                                    attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.framingView attribute:NSLayoutAttributeWidth multiplier: 0.6 constant: 1];
    widthConstraint.active = YES;

    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:purpleBox
                                                                    attribute:NSLayoutAttributeHeight relatedBy: NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier: 1 constant: 50];
    heightConstraint.active = YES;

    

    
//    UIView  *yellowBox = [[UIView alloc] init];
//    
//    [self.framingView addSubview: yellowBox];
//    
//    yellowBox.frame = CGRectZero;
//    
//    yellowBox.translatesAutoresizingMaskIntoConstraints = NO;
//    
//    yellowBox.backgroundColor = [UIColor yellowColor];
//    
//    
//    NSLayoutConstraint *heightConstraintYellow = [NSLayoutConstraint constraintWithItem:yellowBox attribute:NSLayoutAttributeHeight relatedBy: NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier: 1 constant: 150];
//    
//    NSLayoutConstraint *widthConstraintYellow = [NSLayoutConstraint constraintWithItem:yellowBox attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.framingView attribute:NSLayoutAttributeWidth multiplier:1 constant:1];
//    
//    NSLayoutConstraint *bottomConstraintYellow = [NSLayoutConstraint constraintWithItem:yellowBox attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.framingView attribute:NSLayoutAttributeBottom multiplier:1 constant:1];
//    
//    heightConstraintYellow.active = YES;
//    widthConstraintYellow.active = YES;
//    bottomConstraintYellow.active = YES;
    
    
    UIView  *blueBox1 = [[UIView alloc] init];
    
    [self.framingView addSubview: blueBox1];
    
    blueBox1.frame = CGRectZero;
    
    blueBox1.translatesAutoresizingMaskIntoConstraints = NO;
    
    blueBox1.backgroundColor = [UIColor blueColor];
    
    

   NSLayoutConstraint *xConstraintBlueBox1 = [NSLayoutConstraint constraintWithItem:blueBox1
                                                                          attribute:NSLayoutAttributeCenterX
                                                                          relatedBy: NSLayoutRelationEqual
                                                                             toItem:self.framingView
                                                                          attribute:NSLayoutAttributeCenterX
                                                                         multiplier: 1
                                                                           constant: 0];
    xConstraintBlueBox1.active = YES;

    NSLayoutConstraint *yConstraintBlueBox1 = [NSLayoutConstraint constraintWithItem:blueBox1
                                                                    attribute:NSLayoutAttributeCenterY
                                                                           relatedBy: NSLayoutRelationEqual
                                                                              toItem:self.framingView
                                                                           attribute:NSLayoutAttributeCenterY
                                                                          multiplier: 1
                                                                            constant: 0];
    yConstraintBlueBox1.active = YES;

    
    NSLayoutConstraint *widthConstraintBlueBox1 = [NSLayoutConstraint constraintWithItem:blueBox1
                                                                           attribute:NSLayoutAttributeWidth
                                                                           relatedBy: NSLayoutRelationEqual
                                                                              toItem:nil                                                                            attribute:NSLayoutAttributeNotAnAttribute
                                                                          multiplier: 1
                                                                            constant: 50];
    widthConstraintBlueBox1.active = YES;
    
    NSLayoutConstraint *heightConstraintBlueBox1 = [NSLayoutConstraint constraintWithItem:blueBox1
                                                                               attribute:NSLayoutAttributeHeight
                                                                               relatedBy: NSLayoutRelationEqual
                                                                                  toItem:nil                                                                            attribute:NSLayoutAttributeNotAnAttribute
                                                                              multiplier: 1
                                                                                constant: 50];
    heightConstraintBlueBox1.active = YES;
    

    UIView  *blueBox2 = [[UIView alloc] init];
    
    [self.framingView addSubview: blueBox2];
    
    blueBox2.frame = CGRectZero;
    
    blueBox2.translatesAutoresizingMaskIntoConstraints = NO;
    
    blueBox2.backgroundColor = [UIColor blueColor];
    
    NSLayoutConstraint *widthConstraintBlueBox2 = [NSLayoutConstraint constraintWithItem:blueBox2
                                                                               attribute:NSLayoutAttributeWidth
                                                                               relatedBy: NSLayoutRelationEqual
                                                                                  toItem:nil                                                                            attribute:NSLayoutAttributeNotAnAttribute
                                                                              multiplier: 1
                                                                                constant: 50];
    widthConstraintBlueBox2.active = YES;
    
    NSLayoutConstraint *heightConstraintBlueBox2 = [NSLayoutConstraint constraintWithItem:blueBox2
                                                                                attribute:NSLayoutAttributeHeight
                                                                                relatedBy:NSLayoutRelationEqual
                                                                                   toItem:nil                                                                            attribute:NSLayoutAttributeNotAnAttribute
                                                                               multiplier: 1
                                                                                 constant: 50];
    heightConstraintBlueBox2.active = YES;

    
    
    NSLayoutConstraint *xConstraintBlueBox2 = [NSLayoutConstraint constraintWithItem:blueBox2
                                                                           attribute:NSLayoutAttributeCenterX
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:self.framingView
                                                                           attribute:NSLayoutAttributeCenterX
                                                                          multiplier: 1
                                                                            constant: 0];
    xConstraintBlueBox2.active = YES;
    
    NSLayoutConstraint *yConstraintBlueBox2 = [NSLayoutConstraint constraintWithItem:blueBox2
                                                                           attribute:NSLayoutAttributeCenterY
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:self.framingView
                                                                           attribute:NSLayoutAttributeCenterY
                                                                          multiplier: 0.5
                                                                            constant: 0];
    yConstraintBlueBox2.active = YES;
    
    
    UIView  *blueBox3 = [[UIView alloc] init];
    
    [self.framingView addSubview: blueBox3];
    
    blueBox3.frame = CGRectZero;
    
    blueBox3.translatesAutoresizingMaskIntoConstraints = NO;
    
    blueBox3.backgroundColor = [UIColor blueColor];
    
    NSLayoutConstraint *widthConstraintBlueBox3 = [NSLayoutConstraint constraintWithItem:blueBox3
                                                                               attribute:NSLayoutAttributeWidth
                                                                               relatedBy: NSLayoutRelationEqual
                                                                                  toItem:nil                                                                            attribute:NSLayoutAttributeNotAnAttribute
                                                                              multiplier: 1
                                                                                constant: 50];
    widthConstraintBlueBox3.active = YES;
    
    NSLayoutConstraint *heightConstraintBlueBox3 = [NSLayoutConstraint constraintWithItem:blueBox3
                                                                                attribute:NSLayoutAttributeHeight
                                                                                relatedBy:NSLayoutRelationEqual
                                                                                   toItem:nil                                                                            attribute:NSLayoutAttributeNotAnAttribute
                                                                               multiplier: 1
                                                                                 constant: 50];
    heightConstraintBlueBox3.active = YES;
    
    
    
    NSLayoutConstraint *xConstraintBlueBox3 = [NSLayoutConstraint constraintWithItem:blueBox3
                                                                           attribute:NSLayoutAttributeCenterX
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:self.framingView
                                                                           attribute:NSLayoutAttributeCenterX
                                                                          multiplier: 1
                                                                            constant: 0];
    xConstraintBlueBox3.active = YES;
    
    NSLayoutConstraint *yConstraintBlueBox3 = [NSLayoutConstraint constraintWithItem:blueBox3
                                                                           attribute:NSLayoutAttributeCenterY
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:self.framingView
                                                                           attribute:NSLayoutAttributeCenterY
                                               
                                                                          multiplier: 1.5
                                               
                                                                            constant: 0];
    yConstraintBlueBox3.active = YES;
    
    
    UIView  *redBox = [[UIView alloc] init];
    
    [self.framingView addSubview: redBox];
    
    redBox.frame = CGRectZero;
    
    redBox.translatesAutoresizingMaskIntoConstraints = NO;
    
    redBox.backgroundColor = [UIColor redColor];
    
    NSLayoutConstraint *widthConstraintRedBox = [NSLayoutConstraint constraintWithItem:redBox
                                                                               attribute:NSLayoutAttributeWidth
                                                                               relatedBy: NSLayoutRelationEqual
                                                                                  toItem:nil                                                                            attribute:NSLayoutAttributeNotAnAttribute
                                                                              multiplier: 1
                                                                                constant: 150];
    widthConstraintRedBox.active = YES;
    
    NSLayoutConstraint *heightConstraintRedBox = [NSLayoutConstraint constraintWithItem:redBox
                                                                                attribute:NSLayoutAttributeHeight
                                                                                relatedBy:NSLayoutRelationEqual
                                                                                   toItem:nil                                                                            attribute:NSLayoutAttributeNotAnAttribute
                                                                               multiplier: 1
                                                                                 constant: 50];
    heightConstraintRedBox.active = YES;
    
    
    
    NSLayoutConstraint *topConstraintRedBox = [NSLayoutConstraint constraintWithItem:redBox
                                                                           attribute:NSLayoutAttributeTop
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:self.framingView
                                                                           attribute:NSLayoutAttributeTop
                                                                          multiplier: 1
                                                                            constant: 20];
    topConstraintRedBox.active = YES;
    
    NSLayoutConstraint *bottomConstraintRedBox = [NSLayoutConstraint constraintWithItem:redBox
                                                                           attribute:NSLayoutAttributeRight
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:self.framingView
                                                                           attribute:NSLayoutAttributeRight
                                                                          multiplier: 1
                                                                            constant: -20];
    bottomConstraintRedBox.active = YES;


    
    UIView  *orangeBox1 = [[UIView alloc] init];
    
    [redBox addSubview: orangeBox1];
    
    orangeBox1.frame = CGRectZero;
    
    orangeBox1.translatesAutoresizingMaskIntoConstraints = NO;
    
    orangeBox1.backgroundColor = [UIColor orangeColor];
    
    NSLayoutConstraint *widthConstraintOrangeBox1 = [NSLayoutConstraint constraintWithItem:orangeBox1
                                                                             attribute:NSLayoutAttributeWidth
                                                                             relatedBy: NSLayoutRelationEqual
                                                                                toItem:nil                                                                            attribute:NSLayoutAttributeNotAnAttribute
                                                                            multiplier: 1
                                                                              constant: 70];
    widthConstraintOrangeBox1.active = YES;
    
    NSLayoutConstraint *heightConstraintOrangeBox1 = [NSLayoutConstraint constraintWithItem:orangeBox1
                                                                              attribute:NSLayoutAttributeHeight
                                                                              relatedBy:NSLayoutRelationEqual
                                                                                 toItem:nil                                                                            attribute:NSLayoutAttributeNotAnAttribute
                                                                             multiplier: 1
                                                                               constant: 30];
    heightConstraintOrangeBox1.active = YES;
    
    
    
    NSLayoutConstraint *yConstraintOrangeBox1 = [NSLayoutConstraint constraintWithItem:orangeBox1
                                                                           attribute:NSLayoutAttributeCenterY
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:redBox
                                                                           attribute:NSLayoutAttributeCenterY
                                                                          multiplier: 1
                                                                            constant: 1];
    yConstraintOrangeBox1.active = YES;
    
    NSLayoutConstraint *rightConstraintOrangeBox1 = [NSLayoutConstraint constraintWithItem:orangeBox1
                                                                              attribute:NSLayoutAttributeLeft
                                                                              relatedBy:NSLayoutRelationEqual
                                                                                 toItem:redBox
                                                                              attribute:NSLayoutAttributeLeft
                                                                             multiplier: 1
                                                                               constant: 10];
    rightConstraintOrangeBox1.active = YES;


    UIView  *orangeBox2 = [[UIView alloc] init];
    
    [redBox addSubview: orangeBox2];
    
    orangeBox2.frame = CGRectZero;
    
    orangeBox2.translatesAutoresizingMaskIntoConstraints = NO;
    
    orangeBox2.backgroundColor = [UIColor orangeColor];
    
    NSLayoutConstraint *widthConstraintOrangeBox2 = [NSLayoutConstraint constraintWithItem:orangeBox2
                                                                                 attribute:NSLayoutAttributeWidth
                                                                                 relatedBy: NSLayoutRelationEqual
                                                                                    toItem:nil                                                                            attribute:NSLayoutAttributeNotAnAttribute
                                                                                multiplier: 1
                                                                                  constant: 50];
    widthConstraintOrangeBox2.active = YES;
    
    NSLayoutConstraint *heightConstraintOrangeBox2 = [NSLayoutConstraint constraintWithItem:orangeBox2
                                                                                  attribute:NSLayoutAttributeHeight
                                                                                  relatedBy:NSLayoutRelationEqual
                                                                                     toItem:nil                                                                            attribute:NSLayoutAttributeNotAnAttribute
                                                                                 multiplier: 1
                                                                                   constant: 30];
    heightConstraintOrangeBox2.active = YES;
    
    
    
    NSLayoutConstraint *yConstraintOrangeBox2 = [NSLayoutConstraint constraintWithItem:orangeBox2
                                                                             attribute:NSLayoutAttributeCenterY
                                                                             relatedBy:NSLayoutRelationEqual
                                                                                toItem:redBox
                                                                             attribute:NSLayoutAttributeCenterY
                                                                            multiplier: 1
                                                                              constant: 0];
    yConstraintOrangeBox2.active = YES;
    
    NSLayoutConstraint *rightConstraintOrangeBox2 = [NSLayoutConstraint constraintWithItem:orangeBox2
                                                                                 attribute:NSLayoutAttributeRight
                                                                                 relatedBy:NSLayoutRelationEqual
                                                                                    toItem:redBox
                                                                                 attribute:NSLayoutAttributeRight
                                                                                multiplier: 1
                                                                                  constant: -10];
    rightConstraintOrangeBox2.active = YES;
}

/**
 Resize the frame of the framing view depending on which button was pressed.
 */
- (void)resizeFramingView:(id)sender
{
    CGFloat newWidth = 0.0;
    CGFloat newHeight = 0.0;
    
    if (sender == self.squareButton) {
        newWidth = 500.0;
        newHeight = 500.0;
    } else if (sender == self.portraitButton) {
        newWidth = 350.0;
        newHeight = 550.0;
    } else if (sender == self.landscapeButton) {
        newWidth = 900.0;
        newHeight = 300.0;
    }
    
    [UIView animateWithDuration:2.0 animations:^(){
        self.framingViewHeightConstraint.constant = newHeight;
        self.framingViewWidthConstraint.constant = newWidth;
        [self.view layoutIfNeeded];
    }];
}

@end
