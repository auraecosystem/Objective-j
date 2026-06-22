@implementation FastVector : CPObject
{
    CppVector<int> _buf;
}

- (void)push:(int)value
{
    _buf.push_back(value);
}

- (CPNumber)sum
{
    return _buf.reduce((acc, v) => acc + v, 0);
}
@end
