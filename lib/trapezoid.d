module lib.trapezoid;


/// 台形公式
/// 関数 f を from から to の範囲で n 分割して求める
double trapezoid(T)(T f, double from, double to, uint n)
in
{
    assert(from < to);
    assert(n != 0);
}
do
{
    double r = 0.0;
    double x = (to-from) / n;
    for (auto i = 0; i < n; i++) {
        auto a = x * i, b = x * (i + 1);
        r += (b-a) * (f(a) + f(b)) / 2;
    }
    return r;
}
