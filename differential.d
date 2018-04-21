import std.stdio;
import lib.differential : differential;

void main()
{
    auto f = (double x) => x*x;
    auto df = differential(f);
    writeln(df(10));

    auto g = (double x, double y) => x*x + y*y;
    auto dg = differential((double x) => g(x, 3));
    writeln(dg(3));
}
