module lib.simpson;

double simpson(T)(T f, double from, double to, uint n)
in
{
    assert(from < to);
    assert(n != 0);
    assert(n % 2 == 0);
}
do
{
    auto h = (to - from) / n;
    double s = f(from) + f(to);
    
    for (int i = 1; i < n - 1; i++) {
        auto x = from + i * h;
        s += ((i % 2 == 0) ? 2 : 4) * f(x);
    }
    return s * h / 3;
}
