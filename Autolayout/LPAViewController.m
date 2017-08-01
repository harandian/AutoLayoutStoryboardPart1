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
    
    //NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:new1 attribute:NSLayoutAttributeTop relatedBy: NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:(20)];
    
    NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:purpleBox attribute:NSLayoutAttributeRight relatedBy: NSLayoutRelationEqual toItem:self.framingView attribute:NSLayoutAttributeRight multiplier:1 constant:(-20)];
    
    NSLayoutConstraint *bottomConstraint = [NSLayoutConstraint constraintWithItem:purpleBox attribute:NSLayoutAttributeBottom relatedBy: NSLayoutRelationEqual toItem:self.framingView attribute:NSLayoutAttributeBottom multiplier:1 constant:(-20)];
    
   // NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:new1 attribute:NSLayoutAttributeLeft relatedBy: NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1 constant:(20)];
    
    NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:purpleBox attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.framingView attribute:NSLayoutAttributeWidth multiplier: 0.6 constant: 1];
    
     NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:purpleBox attribute:NSLayoutAttributeHeight relatedBy: NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier: 1 constant: 50];
    
    
//    One constraint will set the height of purple box to a fixed size of 50 points. Since this constraint is not in relation to another our View, set toItem to nil and toItem's attribute to NSLayoutAttributeNotAnAttribute.
    
    
   // topConstraint.active =YES;
    rightConstraint.active = YES;
    bottomConstraint.active = YES;
  //  leftConstraint.active = YES;
    widthConstraint.active = YES;
    heightConstraint.active = YES;
    
    
//    Add a 150 point tall yellow view to the green view, and make it be always as wide as the green view. Add a constraint so that the bottom edge of the yellow view always aligns with the bottom edge of the green view. Add a button that shows or hides the yellow view (by setting the ‘hidden’ property on the yellow view). When the yellow view is hidden, the the other views should align as shown above. When the yellow view is shown, the views that have constraints that involve the bottom edge of the green view should refer to the top edge of the yellow view instead. This will mean that the three blue views will not fit all above the yellow box in every size; if they do not, they should be evenly spaced between the top and bottom edges of the green box instead. Refer to the idea of priority in layout constraints in order to figure this out.
    
    UIView  *yellowBox = [[UIView alloc] init];
    
    [self.framingView addSubview: yellowBox];
    
    yellowBox.frame = CGRectZero;
    
    yellowBox.translatesAutoresizingMaskIntoConstraints = NO;
    
    yellowBox.backgroundColor = [UIColor yellowColor];
    

    NSLayoutConstraint *heightConstraintYellow = [NSLayoutConstraint constraintWithItem:yellowBox attribute:NSLayoutAttributeHeight relatedBy: NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier: 1 constant: 150];
//
    NSLayoutConstraint *widthConstraintYellow = [NSLayoutConstraint constraintWithItem:yellowBox attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.framingView attribute:NSLayoutAttributeWidth multiplier:1 constant:1];
    
    NSLayoutConstraint *bottomConstraintYellow = [NSLayoutConstraint constraintWithItem:yellowBox attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.framingView attribute:NSLayoutAttributeBottom multiplier:1 constant:1];
    
    heightConstraintYellow.active = YES;
    widthConstraintYellow.active = YES;
    bottomConstraintYellow.active = YES;
    
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
