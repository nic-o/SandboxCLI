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
      
    // http://stackoverflow.com/questions/1331912/ip-address-cocoa
    NSUInteger  an_Integer;
    NSArray * ipItemsArray;
    NSString *externalIP;
    
    NSURL *iPURL = [NSURL URLWithString:@"http://www.dyndns.org/cgi-bin/check_ip.cgi"];
    
    if (iPURL) {
      NSError *error = nil;
      NSString *theIpHtml = [NSString stringWithContentsOfURL:iPURL encoding:NSUTF8StringEncoding error:&error];
      if (!error) {
        NSScanner *theScanner;
        NSString *text = nil;
        
        theScanner = [NSScanner scannerWithString:theIpHtml];
        
        while ([theScanner isAtEnd] == NO) {
          
          // find start of tag
          [theScanner scanUpToString:@"<" intoString:NULL] ;
          
          // find end of tag
          [theScanner scanUpToString:@">" intoString:&text] ;
          
          // replace the found tag with a space
          //(you can filter multi-spaces out later if you wish)
          theIpHtml = [theIpHtml stringByReplacingOccurrencesOfString:
                       [ NSString stringWithFormat:@"%@>", text]
                                                           withString:@" "] ;
          ipItemsArray =[theIpHtml  componentsSeparatedByString:@" "];
          an_Integer=[ipItemsArray indexOfObject:@"Address:"];
          externalIP =[ipItemsArray objectAtIndex:  ++an_Integer];
        }
        NSLog(@"%@",externalIP);
      } else {
        NSLog(@"Oops... g %ld, %@", (long)[error code], [error localizedDescription]);
      }
    }

      
  }
  return 0;
}

