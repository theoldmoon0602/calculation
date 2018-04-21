module lib.solve;

import std.complex;

/// solve ax^2 + bx + c = 0
Complex!double[] solve2d(double a, double b, double c)
{
  import std.math;

  auto d = b * b - 4 * a * c; 
  if (d > 0) {
    auto ans1 = (-b + sqrt(d)) / (2*a);
    auto ans2 = (-b - sqrt(d)) / (2*a);
    return [complex(ans1), complex(ans2)];
  }
  else if (d == 0) {
    auto ans = (-b + sqrt(d)) / (2 * a);
    return [complex(ans)];
  }
  else {
    auto ans1 = complex(-b, sqrt(-d)) / (2 * a); 
    auto ans2 = ans1;
    ans2.im = -ans2.im;
    return [ans1, ans2];
  }
}

