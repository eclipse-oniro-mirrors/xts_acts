# Vulkan测试套件说明

- [介绍](#section_gltest_001)
- [使用说明](#section_gltest_002)

## 介绍<a name="section_gltest_001"></a>

gltest测试套件使用VK-GL-CTS三方库内原有的openglcts，通过acts测试套件框架在运行时调用运行，具体目录结构如下：

```bash
.
├── BUILD.gn
├── README_zh.md
├── Test.json
├── comm.gni
├── cpOpenGL.sh
├── genlocal.py
└── src
    ├── ActsOpenGLTest.cpp
    ├── ActsOpenGLTest.h
    ├── egltest
    │   ├── ActsOpenGL_Egl_am_323xTest.cpp
    │   ├── ActsOpenGL_Egl_am_323xTest.h
    │   ├── ActsOpenGL_Egl_am_324xTest.cpp
    │   ├── ActsOpenGL_Egl_am_324xTest.h
    │   ├── ActsOpenGL_Egl_am_325xTest.cpp
    │   ├── ActsOpenGL_Egl_am_325xTest.h
    │   ├── ActsOpenGL_Egl_am_326xTest.cpp
    │   ├── ActsOpenGL_Egl_am_326xTest.h
    │   ├── ActsOpenGL_Egl_am_mainTest.cpp
    │   ├── ActsOpenGL_Egl_am_mainTest.h
    │   ├── ActsOpenGL_Egl_am_masterTest.cpp
    │   ├── ActsOpenGL_Egl_am_masterTest.h
    │   ├── BUILD.gn
    │   └── Test.json
    ├── glestest
    │   ├── ActsOpenGL_gles_am_322xTest.cpp
    │   ├── ActsOpenGL_gles_am_322xTest.h
    │   ├── ActsOpenGL_gles_am_323xTest.cpp
    │   ├── ActsOpenGL_gles_am_323xTest.h
    │   ├── ActsOpenGL_gles_am_324xTest.cpp
    │   ├── ActsOpenGL_gles_am_324xTest.h
    │   ├── ActsOpenGL_gles_am_325xTest.cpp
    │   ├── ActsOpenGL_gles_am_325xTest.h
    │   ├── ActsOpenGL_gles_am_326xTest.cpp
    │   ├── ActsOpenGL_gles_am_326xTest.h
    │   ├── ActsOpenGL_gles_am_mainTest.cpp
    │   ├── ActsOpenGL_gles_am_mainTest.h
    │   ├── ActsOpenGL_gles_am_masterTest.cpp
    │   ├── ActsOpenGL_gles_am_masterTest.h
    │   ├── ActsOpenGL_gles_km_322xTest.cpp
    │   ├── ActsOpenGL_gles_km_322xTest.h
    │   ├── ActsOpenGL_gles_km_323xTest.cpp
    │   ├── ActsOpenGL_gles_km_323xTest.h
    │   ├── ActsOpenGL_gles_km_324xTest.cpp
    │   ├── ActsOpenGL_gles_km_324xTest.h
    │   ├── ActsOpenGL_gles_km_325xTest.cpp
    │   ├── ActsOpenGL_gles_km_325xTest.h
    │   ├── ActsOpenGL_gles_km_326xTest.cpp
    │   ├── ActsOpenGL_gles_km_326xTest.h
    │   ├── ActsOpenGL_gles_km_mainTest.cpp
    │   ├── ActsOpenGL_gles_km_mainTest.h
    │   ├── ActsOpenGL_gles_km_masterTest.cpp
    │   ├── ActsOpenGL_gles_km_masterTest.h
    │   ├── ActsOpenGL_gles_kmn_324xTest.cpp
    │   ├── ActsOpenGL_gles_kmn_324xTest.h
    │   ├── ActsOpenGL_gles_kmn_325xTest.cpp
    │   ├── ActsOpenGL_gles_kmn_325xTest.h
    │   ├── ActsOpenGL_gles_kmn_326xTest.cpp
    │   ├── ActsOpenGL_gles_kmn_326xTest.h
    │   ├── ActsOpenGL_gles_kmn_mainTest.cpp
    │   ├── ActsOpenGL_gles_kmn_mainTest.h
    │   ├── ActsOpenGL_gles_kmn_masterTest.cpp
    │   ├── ActsOpenGL_gles_kmn_masterTest.h
    │   ├── ActsOpenGL_gles_kms_326xTest.cpp
    │   ├── ActsOpenGL_gles_kms_326xTest.h
    │   ├── ActsOpenGL_gles_kms_mainTest.cpp
    │   ├── ActsOpenGL_gles_kms_mainTest.h
    │   ├── ActsOpenGL_gles_kms_masterTest.cpp
    │   ├── ActsOpenGL_gles_kms_masterTest.h
    │   ├── BUILD.gn
    │   └── Test.json
    └── gltest
        ├── ActsOpenGL_gl_am_461xTest.cpp
        ├── ActsOpenGL_gl_am_461xTest.h
        ├── ActsOpenGL_gl_am_mainTest.cpp
        ├── ActsOpenGL_gl_am_mainTest.h
        ├── ActsOpenGL_gl_km_460xTest.cpp
        ├── ActsOpenGL_gl_km_460xTest.h
        ├── ActsOpenGL_gl_km_461xTest.cpp
        ├── ActsOpenGL_gl_km_461xTest.h
        ├── ActsOpenGL_gl_km_mainTest.cpp
        ├── ActsOpenGL_gl_km_mainTest.h
        ├── ActsOpenGL_gl_kmn_455xTest.cpp
        ├── ActsOpenGL_gl_kmn_455xTest.h
        ├── ActsOpenGL_gl_kmn_460xTest.cpp
        ├── ActsOpenGL_gl_kmn_460xTest.h
        ├── ActsOpenGL_gl_kmn_461xTest.cpp
        ├── ActsOpenGL_gl_kmn_461xTest.h
        ├── ActsOpenGL_gl_kmn_mainTest.cpp
        ├── ActsOpenGL_gl_kmn_mainTest.h
        ├── ActsOpenGL_gl_kms_461xTest.cpp
        ├── ActsOpenGL_gl_kms_461xTest.h
        ├── ActsOpenGL_gl_kms_mainTest.cpp
        ├── ActsOpenGL_gl_kms_mainTest.h
        ├── BUILD.gn
        └── Test.json
```

* BUILD.gn：编译脚本，编译acts测试套件，编译gltest三方库测试代码，执行actions事件在acts测试套件对应的testcases目录下建立Vulkandata目录，然后将运行测试需要的Vulkan测试进程，解析运行日志所需的Python脚本拷贝到Vulkandata目录。
* comm.gni：通用编译配置。
* cpVulkan.sh：编译后actions事件执行的脚本。
* genlocal.py：gltest的test程序运行后结果会保存在task_log.log文件内，分析运行日志后会存储结果在summary_report.xml文件内，然后根据xdevice流程生成summary_report。
* src：测试套件的实现，内部直接调用gltest的unittest进程。
* Test.json：运行测试需要json脚本，包括拷贝内容到开发板。


## 使用说明<a name="section_gltest_002"></a>

* 编译运行

  ```bash
  ./build.sh --product-name rk3568 --gn-args build_xts=true --build-target "acts" --gn-args is_standard_system=true
  ```

* 测试运行：进入suites/acts目录，执行python -m xdevice，然后在命令框里输入一下命令

  ```bash
  run -l ActsOpenGLEglTest,
  run -l ActsOpenGLglesTest,
  run -l ActsOpenGLglTest


* gltest测试套件运行结束会生成qpa文件方便开发人员调试，qpa文件可以通过vk-gl-cts/scripts/log内的脚本进行解析，具体命令如下：

  ```bash
  python2 log_to_xml.py TestResults.qpa TestResults.xml
  ```
