module lib.gauss_seidel;

/// 各配列の最終要素が右辺、それ以外は左辺とし、それぞれx,y,z...の係数と解釈
auto gauss_seidel(double[][] exprs, uint max_loop=30, double eps=float.epsilon, double[] init = null)
{
    import std.range:repeat,take,zip;
    import std.array:array;
    import std.algorithm:map,reduce,all;
    import std.math:abs;
    
    // x = ..., y = ..., z = ..., に式変形
    foreach (i; 0..exprs.length) {
        exprs[i][$-1] = -exprs[i][$-1];
        foreach (j; 0..exprs[i].length) {
            if (i == j) { continue; }
            exprs[i][j] /= exprs[i][i];  // 各項をx, y, z,...の係数で割る
        }
        exprs[i][i] = 0;
    }

    // 初期値が決まっていなければ1とする
    if (init is null || init.length != exprs[0].length) {
        init = repeat(1.0).take(exprs[0].length).array;
    }
    init[$-1]=1;
    
    foreach (t; 0..max_loop) {
        write(t," times:");
        writeln(init);
        auto ans = init.dup;
    
        // 変数を代入して計算していく。
        foreach (i; 0..exprs.length) {
            ans[i] = -(zip(exprs[i], ans).map!"a[0]*a[1]".reduce!"a+b");
        }
        
        // すべての変数が前回との誤差 eps 以下なら収束した
        if (zip(init, ans).all!(xs => abs(xs[0]-xs[1]) <= eps)) {
            init = ans.dup;
            break;
        }
        init = ans.dup;
    }
    
    return init[0..$-1];
}
