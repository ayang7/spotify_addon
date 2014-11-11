//
//  ViewController.h
//  Playlist Manager
//
//  Created by Mark Landgrebe on 11/2/14.
//
//

#import <UIKit/UIKit.h>
#import <Spotify/Spotify.h>

@interface ViewController : UIViewController<SPTAudioStreamingDelegate, SPTAudioStreamingPlaybackDelegate>

-(void)handleNewSession:(SPTSession *)session;

@end
