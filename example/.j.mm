#import <Foundation/Foundation.h>
#include <vector>
#include <numeric>

@interface FastVector : NSObject
{
    std::vector<int> _buf;
}

- (void)push:(int)value;
- (NSNumber *)sum;

@end

@implementation FastVector

- (void)push:(int)value
{
    _buf.push_back(value);
}

- (NSNumber *)sum
{
    int total = std::accumulate(
        _buf.begin(),
        _buf.end(),
        0
    );

    return @(total);
}

@end
