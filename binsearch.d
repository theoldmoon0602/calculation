import std.stdio;
import lib.binsearch;

void main()
{
    auto f = (double x) => x*x - 3;
    writefln("%.10f", binsearch(f, double.min_normal, double.max, double.epsilon));
}
