module lib.newton;

import lib.differential;

double newton(F)(F f, uint times = 1000, double init = 100)
{
    auto df = differential(f);
    foreach(i; 0..times) {
        init = init - f(init)/df(init);
    }
    return init;
}
