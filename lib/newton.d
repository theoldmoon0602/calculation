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
