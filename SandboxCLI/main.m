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
      
    // http://stackoverflow.com/questions/2580253/how-do-i-get-the-server-hostname-from-a-mounted-directory-with-cocoa-obj-c
    FILE *fp = popen("df", "r"); // see man page for df
    if (fp) {
      char line[4096];
      while (line == fgets(line, 4096, fp)) {
        if (strstr(line, "/Volumes/Phototheque")) { // You need the mount point
          char host[256];
          sscanf(line, "%s", host);
          // printf("Connected: %s\n", host);
          NSLog(@"Connected: %s\n", host);
        }
      }
      pclose(fp);
    }

      
  }
  return 0;
}

