import std.stdio;
import lib.jacobi:jacobi;


void main()
{
    auto ans = jacobi([
        [2, -1, 0, 1],  // 2x - y = 1
        [-1, 2, -1, 0],  // -x + 2y - z = 0
        [0, -1, 2, 1],  // -y + 2z = 1
    ], 30, 0.0001, [0,0,0,0]);
    writeln(ans);
}
