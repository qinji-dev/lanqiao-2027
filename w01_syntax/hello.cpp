// 环境自检程序：按 F5，然后在终端里输入 "3 5" 回车
// 输出 8 就说明 编译 / 运行 / 键盘输入 三件事全部正常
#include <bits/stdc++.h>
using namespace std;

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr);

    long long a, b;
    if (cin >> a >> b) {
        cout << "ok " << a + b << endl;
    } else {
        cout << "没有读到输入。请在下面的终端里敲：3 5  然后回车" << endl;
    }
    return 0;
}
