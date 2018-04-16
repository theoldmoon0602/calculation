module lib.binsearch;

auto binsearch(F)(F f, double s, double e, double eps)
{
    if (s > e) {
        import std.algorithm : swap;
        swap(s, e);
    }
    
    while (true) {
        auto m = s + (e - s) / 2;
        if (e - s <= eps) {
            return m;
        }
        auto r = f(m);
        if (r == 0) {
            return m;
        }
        else if (r < 0) {
            s = m;
        }
        else {
            e = m;
        }
    }
}
