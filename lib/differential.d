module lib.differential;


auto differential(F)(F f, double h = float.epsilon)
{
    return (double x) {
        return (f(x + h) - f(x - h)) / (h * 2);
    };
}
