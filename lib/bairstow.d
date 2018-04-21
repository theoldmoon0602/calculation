module lib.bairstow;

import std.complex;

Complex!double[] bairstow(double[] as, double epsilon = float.epsilon)
  in {
    assert(as.length > 1);
  }
do
{
  import lib.newton : newton2;
  import lib.solve : solve2d;
  import std.range;
  import std.typecons : tuple, Tuple;
  import std.meta : AliasSeq;

  auto n = as.length;
  if (n == 2) {
    return [complex(-as[0]/ as[1])];
  }
  if (n == 3) {
    return solve2d(as[2], as[1], as[0]);
  }


  alias memo_key = Tuple!(ulong, double, double);
  double[memo_key] memo;

  double b_i(ulong i, double p, double q) {
    auto key = tuple(i, p, q);
    if (key in memo) { return memo[key]; }
    if (i >= n - 2) { return 0; }
    auto r = as[i+2] - b_i(i+1, p, q) * p - b_i(i+2, p, q) * q;
    memo[key] = r;
    return r;
  }

  auto alpha = (double p, double q) {
    return as[1] - b_i(0, p, q) * p - b_i(1, p, q) * q;
  };
  auto beta = (double p, double q) {
    return as[0] - b_i(0, p, q) * q;
  };

  double p = 1.0, q = 1.0;
  AliasSeq!(p, q) = newton2(alpha, beta, p, q);

  double[] bs = new double[](n-2);
  foreach (i; 0..n-2) {
    bs[i] = b_i(i, p, q);
  } 

  return solve2d(1, p, q) ~ bairstow(bs, epsilon);
}
