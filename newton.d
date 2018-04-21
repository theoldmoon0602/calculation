import lib.newton : newton;
import std.stdio;


void main()
{
    auto f = (double x) => x*x - 16;
    writeln(newton(f, 100));
    
}
