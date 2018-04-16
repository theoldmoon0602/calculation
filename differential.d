import std.stdio;
import lib.differential;

void main()
{
    auto f = (double x) => x*x;
    auto df = differential(f);
    
    writeln(df(10));
}
