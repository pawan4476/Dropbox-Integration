//
//  ViewController.m
//  dropBox
//
//  Created by Nagam Pawan on 12/26/16.
//  Copyright © 2016 Nagam Pawan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)dropBoxIntegration:(id)sender {
    
    [DropboxClientsManager authorizeFromController:[UIApplication sharedApplication] controller:self openURL:^(NSURL * url) {
        [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
        
    }
                                       browserAuth:YES];
    
}

- (IBAction)backUp:(id)sender {
    
    DropboxClient *client = [DropboxClientsManager authorizedClient];
    NSData *data = UIImagePNGRepresentation(_imgView.image);
    NSString *file = [NSTemporaryDirectory() stringByAppendingPathComponent:@"AAPL.png"];
    [data writeToFile:file atomically:YES];
    [client.filesRoutes delete_:@"/myphoto"];
    [client.filesRoutes uploadData:@"/myphoto1.png" inputData:data];
    
}

- (IBAction)restore:(id)sender {
    
    DropboxClient *client = [DropboxClientsManager authorizedClient];
    [[client.filesRoutes downloadData:@"/myphoto.png"] response:^(DBFILESFileMetadata * result, DBFILESDownloadError * routeError, DBError * error, NSData * restoredData) {
        
        self.restoreImage.image = [UIImage imageWithData:restoredData];
        
    }];
    
     }

@end
