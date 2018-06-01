import std.stdio;

double[] jordan(double[][] exprs, double eps = float.epsilon)
{
    import std.math : abs;
    
    double pivot, delta;
    for (int i = 0; i < exprs.length; i++) {
        pivot = exprs[i][i];
        if (pivot.abs < eps) {
            return [];
        }
        
        for (auto j = 0; j < exprs[0].length; j++) {
            exprs[i][j] /= pivot;
        }
        
        for (auto k = 0; k < exprs.length ; k++) {
            delta = exprs[k][i];
            for (auto j = 0; j < exprs[0].length; j++) {
                if (k != i) {
                    exprs[k][j] -= delta * exprs[i][j];
                }
            }
        }
    }
    
    double[] ans;
    for (auto i = 0; i < exprs.length; i++) {
        ans ~= exprs[i][$-1];
    }
    return ans;
}

// 最小二乗法
auto linear_least_square(double[] xs, double[] ys, uint m = 1)
{
    import std.math:pow;
    
    auto n = xs.length;
    double[][] a = new double[][](m+1, m+2);  // 連立方程式（m+1次、m個の式）

    // 初期化しないとnanになる
    for (auto i = 0; i <= m; i++) {
        for (auto j = 0; j <= m+1; j++) {
            a[i][j] = 0;
        }
    }

    
    // 連立方程式の左辺
    for (auto i = 0; i <= m; i++) {
        for (auto j = 0; j <= m; j++) {
            for (auto k = 0; k < n; k++) {
                a[j][i] += pow(xs[k], i+j);
            }
        }
    }
    
    // 連立方程式の右辺
    for (auto j = 0; j <= m; j++) {
        for (auto k = 0; k < n; k++) {
            a[j][m+1] += ys[k] * pow(xs[k], j);
        }
    }

    
    return jordan(a);
}

void main()
{
    double[] xs = [ -4, -2, -1, 0, 1, 3, 4, 5 ];
   double[] ys = [ -35.1, 15.1, 15.9, 8.9, 0.1, 0.1, 21.1, 135.0 ];
    
    auto result = linear_least_square(xs, ys, 3);
    writeln(result);
}
