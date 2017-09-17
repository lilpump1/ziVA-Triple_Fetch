#import "ViewController.h"
#include "log.h"
#include "sploit.h"
#include "drop_payload.h"

#include <CoreFoundation/CoreFoundation.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <dirent.h>
#include <string.h>

@interface ViewController ()

@end

id vc;

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  

  dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^(void){
    do_exploit();
    dispatch_async(dispatch_get_main_queue(), ^{
      _getPSButton.enabled = true;
      _execButton.enabled = true;
    });    
  });

}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that }

- (void)logMsg:(NSString*)msg {
  NSLog(@"%@", msg);
}

@end

// c method to log string
void logMsg(char* msg) {
  NSString* str = [NSString stringWithCString:msg encoding:NSASCIISftringEncoding];
  [vc logMsg:str];
}
