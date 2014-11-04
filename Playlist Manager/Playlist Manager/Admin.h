//
//  Admin.h
//  Playlist Manager
//
//  Created by Andrew Yang on 11/4/14.
//
//

#ifndef Playlist_Manager_Admin_h
#define Playlist_Manager_Admin_h


#endif

#import <Foundation/Foundation.h>
#import "Song.h"
#import "SubAdmin.h"

@interface Admin : SubAdmin

- (void)moveSong : (Playlist *) pl : (Song *) s : (NSNumber *) newPos;
- (SubAdmin *) makeSubAdmin : (User *) user;

@end


