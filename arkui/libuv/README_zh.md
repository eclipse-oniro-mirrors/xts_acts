# Libuv测试套件说明

- [介绍](#section_Libuv_001)
- [使用说明](#section_Libuv_002)

## 介绍<a name="section_Libuv_001"></a>

Libuv测试套件使用Libuv三方库内原有的unittest，通过acts测试套件框架在运行时调用运行，具体目录结构如下：

```bash
.
├── BUILD.gn
├── comm.gni
├── cplibuv.sh
├── genlocal.py
├── src
│   ├── ActsLibuvTest.cpp
│   └── ActsLibuvTest.h
└── Test.json
```

* BUILD.gn：编译脚本，编译acts测试套件，编译Libuv三方库测试代码，执行actions事件在acts测试套件对应的testcases目录下建立libuvdata目录，然后将运行测试需要的Libuv测试进程，解析运行日志所需的Python脚本拷贝到libuvdata目录。
* comm.gni：通用编译配置。
* cplibuv.sh：编译后actions事件执行的脚本。
* genlocal.py：libuv的test程序运行后结果会保存在task_log.log文件内，分析运行日志后会存储结果在summary_report.xml文件内，然后根据xdevice流程生成summary_report。
* src：测试套件的实现，内部直接调用libuv的unittest进程。
* Test.json：运行测试需要json脚本，包括拷贝内容到开发板。


## 使用说明<a name="section_Libuv_002"></a>

* 编译运行

  ```bash
  ./build.sh --product-name rk3568 --gn-args build_xts=true --build-target "acts" --gn-args is_standard_system=true
  ```


* 测试运行：进入suites/acts目录，执行python -m xdevice，然后在命令框里输入一下命令

  ```bash
  run -l ActsLibuvTest
  ```
