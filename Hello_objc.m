// gcc -framework Foundation -lobjc Hello_objc.m -o Hello_objc
// ./Hello_objc
// rm ./Hello_objc

#import <Foundation/Foundation.h>

int main(int argc, const char* argv[]) {
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	NSLog (@"Hello world!");
	[pool drain];
	return 0;
}
