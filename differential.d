import std.stdio;

auto differential(F)(F f)
{
    auto h = float.epsilon;
    return (double x) {
        return (f(x + h) - f(x - h)) / (h * 2);
    };
}

void main()
{
    auto f = (double x) => x*x;
    auto df = differential(f);
    
    writeln(df(10));
}