#SkyWaitingView

-----
##测试环境：Xcode 6，iOS 7.0以上。
![GIF](1.gif)
##简介
一个简单的等待指示器

* 可自定义圆弧粗细、颜色、旋转速率
* 可自定义标签显示

-----
##使用方法
把头文件 `SkyWaitingView.h` 导入项目，然后设置各属性，具体使用方法请参考示例项目。

```objc
SkyCircleWatingView *v = [SkyCircleWatingView new];
v.frame = CGRectMake(50, baseY, 0, 0);
[v sizeToFit];
[self.view addSubview:v];
v.rate = 1.f;
[v start];
```

-----
##关于我
* 一枚普通的即将大三的珠海大学生
* 希望大三实习、毕业的工作地方都在珠海

-----
##联系方式
* QQ：875766917，请备注
* Mail：875766917@qq.com

-----
##开源协议（License）
The MIT License (MIT)

Copyright (c) 2015 skytoup

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
