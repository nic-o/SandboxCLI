//
//  main.m
//  SandboxCLI
//
//  Created by Nicolas Georget on 2/13/13.
//  Copyright (c) 2013 Nicolas Georget. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
  @autoreleasepool {
      
    // http://stackoverflow.com/questions/7828783/cocoa-how-to-get-the-already-mounted-unmountable-disk
    
    NSArray *keys = [NSArray arrayWithObjects:NSURLVolumeNameKey, NSURLVolumeIsRemovableKey, nil];
    NSArray *urls = [[NSFileManager defaultManager]
                     mountedVolumeURLsIncludingResourceValuesForKeys:keys
                     options:NSVolumeEnumerationSkipHiddenVolumes];
    
    NSLog(@"%@", urls);
    for (NSURL *url in urls) {
      NSError *error;
      //      NSNumber *isRemovable;
      NSString *volumeName;
      //      [url getResourceValue:&isRemovable forKey:NSURLVolumeIsRemovableKey error:&error];
      //      if ([isRemovable boolValue]) {
      //[url getResourceValue:&volumeName forKey:NSURLVolumeNameKey error:&error];
      [url getResourceValue:&volumeName forKey:NSURLVolumeLocalizedFormatDescriptionKey error:&error];
      NSLog(@"%@", volumeName);
      //      }
    }

      
  }
  return 0;
}

