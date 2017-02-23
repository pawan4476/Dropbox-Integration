//
//  ViewController.h
//  dropBox
//
//  Created by Nagam Pawan on 12/26/16.
//  Copyright © 2016 Nagam Pawan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ObjectiveDropboxOfficial/ObjectiveDropboxOfficial.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UIImageView *restoreImage;
- (IBAction)dropBoxIntegration:(id)sender;
- (IBAction)backUp:(id)sender;
- (IBAction)restore:(id)sender;

@end

