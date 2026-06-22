// Pseudo Objective‑C++‑like source
@implementation FastVector : CPObject
{
    CppVector<int> _buf; // conceptual backing buffer
}

- (void)push:(int)value
{
    _buf.push_back(value); // low-level operation handled by backing engine
}

- (CPNumber)sum
{
    return _buf.reduce((acc, v) => acc + v, 0);
}
@end
