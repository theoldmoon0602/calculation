module lib.differential;

auto forward_differential(F)(F f, double h = float.epsilon)
{
    return (double x) {
        return (f(x + h) - f(x)) / h;
    };
}

auto backward_differential(F)(F f, double h = float.epsilon)
{
    return (double x) {
        return (f(x) - f(x - h)) / h;
    };
}

auto central_differential(F)(F f, double h = float.epsilon)
{
    return (double x) {
        return (f(x + h) - f(x - h)) / (h * 2);
    };
}

alias differential = central_differential;
