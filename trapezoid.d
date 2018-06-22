import std.stdio;
import std.math;
import lib.trapezoid;

void main()
{
    // http://www.wolframalpha.com/input/?i=integral+cos(x)%5E1000+from+0+to+1
    
    auto f = (double x) => (pow(cos(x), 1000));
    writeln(trapezoid(f, 0, 1, 1000));
}
