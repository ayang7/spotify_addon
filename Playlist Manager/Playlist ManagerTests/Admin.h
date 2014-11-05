//
//  Admin.h
//  Playlist Manager
//
//  Created by Andrew Yang on 11/4/14.
//
//

#import <Foundation/Foundation.h>
#import "Song.h"
#import "SubAdmin.h"

@interface Admin : SubAdmin

- (void)moveSong : (Playlist *) pl : (Song *) s : (NSNumber *) newPos;
- (SubAdmin *) makeSubAdmin : (User *) user;

@end


