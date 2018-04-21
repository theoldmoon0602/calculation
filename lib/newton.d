module lib.newton;
import lib.differential;

double newton(F)(F f, double init, double epsilon=float.epsilon)
{
  import std.math;
  auto df = differential(f);
  while (true) {
    auto d = f(init)/df(init);
    init = init - d;
    if (abs(d) <= epsilon) {
      break;
    }
  }
  return init;
}

import std.typecons;
Tuple!(double, double) newton2(F)(F f, F g, double x, double y, double epsilon=float.epsilon)
{
  import std.math;

  while (true) {
    auto f_x = differential((double x) => f(x, y));
    auto f_y = differential((double y) => f(x, y));
    auto g_x = differential((double x) => g(x, y));
    auto g_y = differential((double y) => g(x, y));

    auto d = f_x(x) * g_y(y) - f_y(y) * g_x(x);
    auto dx = (f(x, y) * g_y(y) - f_y(y) * g(x, y)) / d;
    auto dy = (f_x(x) * g(x, y) - f(x, y) * g_x(x)) / d;

    x = x - dx;
    y = y - dy;
    if (abs(dx) <= epsilon && abs(dy) <= epsilon) {
      break;
    }
  }

  return tuple(x, y);
}
