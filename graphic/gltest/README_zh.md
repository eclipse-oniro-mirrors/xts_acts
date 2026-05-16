# GLTest测试套件说明

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
    ├── common.h
    ├── egltest
    │   ├── egltest_323x
    │   │   ├── ActsOpenGlEgl323xTest.cpp
    │   │   ├── ActsOpenGlEgl323xTest.h
    │   │   ├── BUILD.gn
    │   │   └── Test.json
    │   ├── egltest_324x
    │   │   ├── ActsOpenGlEgl324xTest.cpp
    │   │   ├── ActsOpenGlEgl324xTest.h
    │   │   ├── BUILD.gn
    │   │   └── Test.json
    │   ├── egltest_325x
    │   │   ├── ActsOpenGlEgl325xTest.cpp
    │   │   ├── ActsOpenGlEgl325xTest.h
    │   │   ├── BUILD.gn
    │   │   └── Test.json
    │   ├── egltest_326x
    │   │   ├── ActsOpenGlEgl326xTest.cpp
    │   │   ├── ActsOpenGlEgl326xTest.h
    │   │   ├── BUILD.gn
    │   │   └── Test.json
    │   ├── egltest_main
    │   │   ├── ActsOpenGlEglMainTest.cpp
    │   │   ├── ActsOpenGlEglMainTest.h
    │   │   ├── BUILD.gn
    │   │   └── Test.json
    │   └── egltest_mester
    │       ├── ActsOpenGlEglMesterTest.cpp
    │       ├── ActsOpenGlEglMesterTest.h
    │       ├── BUILD.gn
    │       └── Test.json
    └── gltest
        ├── gltest_am
        │   ├── gltest_461x
        │   │   ├── gl45es31Mester
        │   │   │   ├── ActsOpenGl461xGl45Es31MesterTest.cpp
        │   │   │   ├── ActsOpenGl461xGl45Es31MesterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl45es3Mester
        │   │   │   ├── ActsOpenGl461xGl45Es3MesterTest.cpp
        │   │   │   ├── ActsOpenGl461xGl45Es3MesterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   └── gl45Mester
        │   │       ├── ActsOpenGLAm461xGl45MesterTest.cpp
        │   │       ├── ActsOpenGLAm461xGl45MesterTest.h
        │   │       ├── BUILD.gn
        │   │       └── Test.json
        │   └── gltest_main
        │       ├── gl45es31Mester
        │       │   ├── ActsOpenGlMainGl45Es31MesterTest.cpp
        │       │   ├── ActsOpenGlMainGl45Es31MesterTest.h
        │       │   ├── BUILD.gn
        │       │   └── Test.json
        │       ├── gl45es3Mester
        │       │   ├── ActsOpenGlMainGl45Es3MesterTest.cpp
        │       │   ├── ActsOpenGlMainGl45Es3MesterTest.h
        │       │   ├── BUILD.gn
        │       │   └── Test.json
        │       └── gl45Mester
        │           ├── ActsOpenGlAmMainGl45MesterTest.cpp
        │           ├── ActsOpenGlAmMainGl45MesterTest.h
        │           ├── BUILD.gn
        │           └── Test.json
        ├── gltest_km
        │   ├── gltest_460x
        │   │   ├── gl30gtfMester
        │   │   │   ├── ActsOpenGl460xGl30GtfMesterTest.cpp
        │   │   │   ├── ActsOpenGl460xGl30GtfMesterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl30Mester
        │   │   │   ├── ActsOpenGl460xGl30MesterTest.cpp
        │   │   │   ├── ActsOpenGl460xGl30MesterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl31gtfMester
        │   │   │   ├── ActsOpenGl460xGl31GtfMesterTest.cpp
        │   │   │   ├── ActsOpenGl460xGl31GtfMesterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl31Mester
        │   │   │   ├── ActsOpenGl460xGl31MesterTest.cpp
        │   │   │   ├── ActsOpenGl460xGl31MesterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl32gtfMester
        │   │   │   ├── ActsOpenGl460xGl32GtfMesterTest.cpp
        │   │   │   ├── ActsOpenGl460xGl32GtfMesterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl32Mester
        │   │   │   ├── ActsOpenGl460xGl32MesterTest.cpp
        │   │   │   ├── ActsOpenGl460xGl32MesterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl33gtfMester
        │   │   │   ├── ActsOpenGl460xGl33GtfMesterTest.cpp
        │   │   │   ├── ActsOpenGl460xGl33GtfMesterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl33Mester
        │   │   │   ├── ActsOpenGl460xGl33MesterTest.cpp
        │   │   │   ├── ActsOpenGl460xGl33MesterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl40gtfMester
        │   │   │   ├── ActsOpenGl460xGl40GtfMesterTest.cpp
        │   │   │   ├── ActsOpenGl460xGl40GtfMesterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl40Mester
        │   │   │   ├── ActsOpenGl460xGl40MesterTest.cpp
        │   │   │   ├── ActsOpenGl460xGl40MesterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl41gtfMester
        │   │   │   ├── ActsOpenGl460xGl41GtfMesterTest.cpp
        │   │   │   ├── ActsOpenGl460xGl41GtfMesterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl41Mester
        │   │   │   ├── ActsOpenGl460xGl41MesterTest.cpp
        │   │   │   ├── ActsOpenGl460xGl41MesterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl42compatMester
        │   │   │   ├── ActsOpenGl460xGl42CompatMesterTest.cpp
        │   │   │   ├── ActsOpenGl460xGl42CompatMesterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl42gtfMester
        │   │   │   ├── ActsOpenGl460xGl42GtfMesterTest.cpp
        │   │   │   ├── ActsOpenGl460xGl42GtfMesterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl42Mester
        │   │   │   ├── ActsOpenGl460xGl42MesterTest.cpp
        │   │   │   ├── ActsOpenGl460xGl42MesterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl43gtfMester
        │   │   │   ├── ActsOpenGl460xGl43GtfMesterTest.cpp
        │   │   │   ├── ActsOpenGl460xGl43GtfMesterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl43Mester
        │   │   │   ├── ActsOpenGl460xGl43MesterTest.cpp
        │   │   │   ├── ActsOpenGl460xGl43MesterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl44gtfMester
        │   │   │   ├── ActsOpenGl460xGl44GtfMesterTest.cpp
        │   │   │   ├── ActsOpenGl460xGl44GtfMesterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl44Mester
        │   │   │   ├── ActsOpenGl460xGl44MesterTest.cpp
        │   │   │   ├── ActsOpenGl460xGl44MesterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl45gtfMester
        │   │   │   ├── ActsOpenGl460xGl45GtfMesterTest.cpp
        │   │   │   ├── ActsOpenGl460xGl45GtfMesterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl45Mester
        │   │   │   ├── ActsOpenGl460xGl45MesterTest.cpp
        │   │   │   ├── ActsOpenGl460xGl45MesterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl46gtfMester
        │   │   │   ├── ActsOpenGl460xGl46GtfMesterTest.cpp
        │   │   │   ├── ActsOpenGl460xGl46GtfMesterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   └── gl46Mester
        │   │       ├── ActsOpenGl460xGl46MesterTest.cpp
        │   │       ├── ActsOpenGl460xGl46MesterTest.h
        │   │       ├── BUILD.gn
        │   │       └── Test.json
        │   ├── gltest_461x
        │   │   ├── gl30gtfMester
        │   │   │   ├── ActsOpenGl461xGl30GtfMesterTest.cpp
        │   │   │   ├── ActsOpenGl461xGl30GtfMesterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl30Mester
        │   │   │   ├── ActsOpenGl461xGl30MesterTest.cpp
        │   │   │   ├── ActsOpenGl461xGl30MesterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl31gtfMester
        │   │   │   ├── ActsOpenGl461xGl31GtfMesterTest.cpp
        │   │   │   ├── ActsOpenGl461xGl31GtfMesterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl31Mester
        │   │   │   ├── ActsOpenGl461xGl31MesterTest.cpp
        │   │   │   ├── ActsOpenGl461xGl31MesterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl32gtfMester
        │   │   │   ├── ActsOpenGl461xGl32GtfMesterTest.cpp
        │   │   │   ├── ActsOpenGl461xGl32GtfMesterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl32Mester
        │   │   │   ├── ActsOpenGl461xGl32MesterTest.cpp
        │   │   │   ├── ActsOpenGl461xGl32MesterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl33gtfMester
        │   │   │   ├── ActsOpenGl461xGl33GtfMesterTest.cpp
        │   │   │   ├── ActsOpenGl461xGl33GtfMesterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl33Mester
        │   │   │   ├── ActsOpenGl461xGl33MesterTest.cpp
        │   │   │   ├── ActsOpenGl461xGl33MesterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl40gtfMester
        │   │   │   ├── ActsOpenGl461xGl40GtfMesterTest.cpp
        │   │   │   ├── ActsOpenGl461xGl40GtfMesterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl40Mester
        │   │   │   ├── ActsOpenGl461xGl40MesterTest.cpp
        │   │   │   ├── ActsOpenGl461xGl40MesterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl41gtfMester
        │   │   │   ├── ActsOpenGl461xGl41GtfMesterTest.cpp
        │   │   │   ├── ActsOpenGl461xGl41GtfMesterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl41mMester
        │   │   │   ├── ActsOpenGl461xGl41MesterTest.cpp
        │   │   │   ├── ActsOpenGl461xGl41MesterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl42compatMester
        │   │   │   ├── ActsOpenGl461xGl42CompatMesterTest.cpp
        │   │   │   ├── ActsOpenGl461xGl42CompatMesterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl42gtfMester
        │   │   │   ├── ActsOpenGl461xGl42GtfMesterTest.cpp
        │   │   │   ├── ActsOpenGl461xGl42GtfMesterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl42Mester
        │   │   │   ├── ActsOpenGl461xGl42MesterTest.cpp
        │   │   │   ├── ActsOpenGl461xGl42MesterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl43gtfMester
        │   │   │   ├── ActsOpenGl461xGl43GtfMesterTest.cpp
        │   │   │   ├── ActsOpenGl461xGl43GtfMesterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl43Mester
        │   │   │   ├── ActsOpenGl461xGl43MesterTest.cpp
        │   │   │   ├── ActsOpenGl461xGl43MesterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl44gtfMester
        │   │   │   ├── ActsOpenGl461xGl44GtfMesterTest.cpp
        │   │   │   ├── ActsOpenGl461xGl44GtfMesterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl44Mester
        │   │   │   ├── ActsOpenGl461xGl44MesterTest.cpp
        │   │   │   ├── ActsOpenGl461xGl44MesterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl45gtfMester
        │   │   │   ├── ActsOpenGl461xGl45GtfMesterTest.cpp
        │   │   │   ├── ActsOpenGl461xGl45GtfMesterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl45Mester
        │   │   │   ├── ActsOpenGl461xGl45MesterTest.cpp
        │   │   │   ├── ActsOpenGl461xGl45MesterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl46gtfMester
        │   │   │   ├── ActsOpenGl461xGl46GtfMesterTest.cpp
        │   │   │   ├── ActsOpenGl461xGl46GtfMesterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   └── gl46Mester
        │   │       ├── ActsOpenGl461xGl46MesterTest.cpp
        │   │       ├── ActsOpenGl461xGl46MesterTest.h
        │   │       ├── BUILD.gn
        │   │       └── Test.json
        │   └── gltest_main
        │       ├── gl30gtfMester
        │       │   ├── ActsOpenGlMainGl30GtfMesterTest.cpp
        │       │   ├── ActsOpenGlMainGl30GtfMesterTest.h
        │       │   ├── BUILD.gn
        │       │   └── Test.json
        │       ├── gl30mMster
        │       │   ├── ActsOpenGlMainGl30MesterTest.cpp
        │       │   ├── ActsOpenGlMainGl30MesterTest.h
        │       │   ├── BUILD.gn
        │       │   └── Test.json
        │       ├── gl31gtfMester
        │       │   ├── ActsOpenGlMainGl31GtfMesterTest.cpp
        │       │   ├── ActsOpenGlMainGl31GtfMesterTest.h
        │       │   ├── BUILD.gn
        │       │   └── Test.json
        │       ├── gl31Mester
        │       │   ├── ActsOpenGlMainGl31MesterTest.cpp
        │       │   ├── ActsOpenGlMainGl31MesterTest.h
        │       │   ├── BUILD.gn
        │       │   └── Test.json
        │       ├── gl32gtfMester
        │       │   ├── ActsOpenGlMainGl32GtfMesterTest.cpp
        │       │   ├── ActsOpenGlMainGl32GtfMesterTest.h
        │       │   ├── BUILD.gn
        │       │   └── Test.json
        │       ├── gl32Mester
        │       │   ├── ActsOpenGlMainGl32MesterTest.cpp
        │       │   ├── ActsOpenGlMainGl32MesterTest.h
        │       │   ├── BUILD.gn
        │       │   └── Test.json
        │       ├── gl33gtfMester
        │       │   ├── ActsOpenGlMainGl33GtfMesterTest.cpp
        │       │   ├── ActsOpenGlMainGl33GtfMesterTest.h
        │       │   ├── BUILD.gn
        │       │   └── Test.json
        │       ├── gl33Mester
        │       │   ├── ActsOpenGlMainGl33MesterTest.cpp
        │       │   ├── ActsOpenGlMainGl33MesterTest.h
        │       │   ├── BUILD.gn
        │       │   └── Test.json
        │       ├── gl40gtfMester
        │       │   ├── ActsOpenGlMainGl40GtfMesterTest.cpp
        │       │   ├── ActsOpenGlMainGl40GtfMesterTest.h
        │       │   ├── BUILD.gn
        │       │   └── Test.json
        │       ├── gl40Mester
        │       │   ├── ActsOpenGlMainGl40MesterTest.cpp
        │       │   ├── ActsOpenGlMainGl40MesterTest.h
        │       │   ├── BUILD.gn
        │       │   └── Test.json
        │       ├── gl41gtfMester
        │       │   ├── ActsOpenGlMainGl41GtfMesterTest.cpp
        │       │   ├── ActsOpenGlMainGl41GtfMesterTest.h
        │       │   ├── BUILD.gn
        │       │   └── Test.json
        │       ├── gl41Mester
        │       │   ├── ActsOpenGlMainGl41MesterTest.cpp
        │       │   ├── ActsOpenGlMainGl41MesterTest.h
        │       │   ├── BUILD.gn
        │       │   └── Test.json
        │       ├── gl42compatMester
        │       │   ├── ActsOpenGlMainGl42CompatMesterTest.cpp
        │       │   ├── ActsOpenGlMainGl42CompatMesterTest.h
        │       │   ├── BUILD.gn
        │       │   └── Test.json
        │       ├── gl42gtfMester
        │       │   ├── ActsOpenGlMainGl42GtfMesterTest.cpp
        │       │   ├── ActsOpenGlMainGl42GtfMesterTest.h
        │       │   ├── BUILD.gn
        │       │   └── Test.json
        │       ├── gl42Mester
        │       │   ├── ActsOpenGlMainGl42MesterTest.cpp
        │       │   ├── ActsOpenGlMainGl42MesterTest.h
        │       │   ├── BUILD.gn
        │       │   └── Test.json
        │       ├── gl43gtfMester
        │       │   ├── ActsOpenGlMainGl43GtfMesterTest.cpp
        │       │   ├── ActsOpenGlMainGl43GtfMesterTest.h
        │       │   ├── BUILD.gn
        │       │   └── Test.json
        │       ├── gl43Mester
        │       │   ├── ActsOpenGlMainGl43MesterTest.cpp
        │       │   ├── ActsOpenGlMainGl43MesterTest.h
        │       │   ├── BUILD.gn
        │       │   └── Test.json
        │       ├── gl44gtfMester
        │       │   ├── ActsOpenGlMainGl44GtfMesterTest.cpp
        │       │   ├── ActsOpenGlMainGl44GtfMesterTest.h
        │       │   ├── BUILD.gn
        │       │   └── Test.json
        │       ├── gl44Mester
        │       │   ├── ActsOpenGlMainGl44MesterTest.cpp
        │       │   ├── ActsOpenGlMainGl44MesterTest.h
        │       │   ├── BUILD.gn
        │       │   └── Test.json
        │       ├── gl45gtfMester
        │       │   ├── ActsOpenGlMainGl45GtfMesterTest.cpp
        │       │   ├── ActsOpenGlMainGl45GtfMesterTest.h
        │       │   ├── BUILD.gn
        │       │   └── Test.json
        │       ├── gl45Mester
        │       │   ├── ActsOpenGlMainGl45MesterTest.cpp
        │       │   ├── ActsOpenGlMainGl45MesterTest.h
        │       │   ├── BUILD.gn
        │       │   └── Test.json
        │       ├── gl46gtfMester
        │       │   ├── ActsOpenGlMainGl46GtfMesterTest.cpp
        │       │   ├── ActsOpenGlMainGl46GtfMesterTest.h
        │       │   ├── BUILD.gn
        │       │   └── Test.json
        │       └── gl46Mester
        │           ├── ActsOpenGlMainGl46MesterTest.cpp
        │           ├── ActsOpenGlMainGl46MesterTest.h
        │           ├── BUILD.gn
        │           └── Test.json
        ├── gltest_kmn
        │   ├── gltest_455x
        │   │   ├── ActsOpenGl455xGl40KhrMesterTest.cpp
        │   │   ├── ActsOpenGl455xGl40KhrMesterTest.h
        │   │   ├── BUILD.gn
        │   │   └── Test.json
        │   ├── gltest_460x
        │   │   ├── gl30khrMester
        │   │   │   ├── ActsOpenGl460xGl30KhrMesterTest.cpp
        │   │   │   ├── ActsOpenGl460xGl30KhrMesterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl40khrMester
        │   │   │   ├── ActsOpenGl460xGl40KhrMesterTest.cpp
        │   │   │   ├── ActsOpenGl460xGl40KhrMesterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl43khrMester
        │   │   │   ├── ActsOpenGl460xGl43KhrMesterTest.cpp
        │   │   │   ├── ActsOpenGl460xGl43KhrMesterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   └── gl45khrMester
        │   │       ├── ActsOpenGl460xGl45KhrMesterTest.cpp
        │   │       ├── ActsOpenGl460xGl45KhrMesterTest.h
        │   │       ├── BUILD.gn
        │   │       └── Test.json
        │   ├── gltest_461x
        │   │   ├── gl30khrMester
        │   │   │   ├── ActsOpenGl461xGl30KhrMesterTest.cpp
        │   │   │   ├── ActsOpenGl461xGl30KhrMesterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl40khrMester
        │   │   │   ├── ActsOpenGl461xGl40KhrMesterTest.cpp
        │   │   │   ├── ActsOpenGl461xGl40KhrMesterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl43khrMester
        │   │   │   ├── ActsOpenGl461xGl43KhrMesterTest.cpp
        │   │   │   ├── ActsOpenGl461xGl43KhrMesterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   └── gl45khrMester
        │   │       ├── ActsOpenGl461xGl45KhrMesterTest.cpp
        │   │       ├── ActsOpenGl461xGl45KhrMesterTest.h
        │   │       ├── BUILD.gn
        │   │       └── Test.json
        │   └── gltest_main
        │       ├── gl30khrMester
        │       │   ├── ActsOpenGlMainGl30KhrMesterTest.cpp
        │       │   ├── ActsOpenGlMainGl30KhrMesterTest.h
        │       │   ├── BUILD.gn
        │       │   └── Test.json
        │       ├── gl40khrMester
        │       │   ├── ActsOpenGlMainGl40KhrMesterTest.cpp
        │       │   ├── ActsOpenGlMainGl40KhrMesterTest.h
        │       │   ├── BUILD.gn
        │       │   └── Test.json
        │       ├── gl43khrmMester
        │       │   ├── ActsOpenGlMainGl43KhrMesterTest.cpp
        │       │   ├── ActsOpenGlMainGl43KhrMesterTest.h
        │       │   ├── BUILD.gn
        │       │   └── Test.json
        │       └── gl45khrMester
        │           ├── ActsOpenGlMainGl45KhrMesterTest.cpp
        │           ├── ActsOpenGlMainGl45KhrMesterTest.h
        │           ├── BUILD.gn
        │           └── Test.json
        └── gltest_kms
            ├── gltest_461x
            │   ├── gl43khrsingle
            │   │   ├── ActsOpenGl461xGl43KhrSingleTest.cpp
            │   │   ├── ActsOpenGl461xGl43KhrSingleTest.h
            │   │   ├── BUILD.gn
            │   │   └── Test.json
            │   ├── gl44khrsingle
            │   │   ├── ActsOpenGl461xGl44KhrSingleTest.cpp
            │   │   ├── ActsOpenGl461xGl44KhrSingleTest.h
            │   │   ├── BUILD.gn
            │   │   └── Test.json
            │   ├── gl45khrsingle
            │   │   ├── ActsOpenGl461xGl45KhrSingleTest.cpp
            │   │   ├── ActsOpenGl461xGl45KhrSingleTest.h
            │   │   ├── BUILD.gn
            │   │   └── Test.json
            │   └── gl46khrsingle
            │       ├── ActsOpenGl461xGl46KhrSingleTest.cpp
            │       ├── ActsOpenGl461xGl46KhrSingleTest.h
            │       ├── BUILD.gn
            │       └── Test.json
            └── gltest_main
                ├── gl43khrsingle
                │   ├── ActsOpenGlMainGl43KhrSingleTest.cpp
                │   ├── ActsOpenGlMainGl43KhrSingleTest.h
                │   ├── BUILD.gn
                │   └── Test.json
                ├── gl44khrsingle
                │   ├── ActsOpenGlMainGl44KhrSingleTest.cpp
                │   ├── ActsOpenGlMainGl44KhrSingleTest.h
                │   ├── BUILD.gn
                │   └── Test.json
                ├── gl45khrsingle
                │   ├── ActsOpenGlMainGl45KhrSingleTest.cpp
                │   ├── ActsOpenGlMainGl45KhrSingleTest.h
                │   ├── BUILD.gn
                │   └── Test.json
                └── gl46khrsingle
                    ├── ActsOpenGlMainGl46KhrSingleTest.cpp
                    ├── ActsOpenGlMainGl46KhrSingleTest.h
                    ├── BUILD.gn
                    └── Test.json
```

* BUILD.gn：编译脚本，编译acts测试套件，编译gltest三方库测试代码，执行actions事件在acts测试套件对应的testcases目录下建立opengldata目录，然后将运行测试需要的gltest测试进程，解析运行日志所需的Python脚本拷贝到opengldata目录。
* comm.gni：通用编译配置。
* cpOpenGL.sh：编译后actions事件执行的脚本。
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
  run -l ActsOpenGlEgl323xTest,
  run -l ActsOpenGlMainGl32MesterTest,
  run -l ActsOpenGlMainGl42MesterTest
  ...

* gltest测试套件运行结束会生成qpa文件方便开发人员调试，qpa文件可以通过vk-gl-cts/scripts/log内的脚本进行解析，具体命令如下：

  ```bash
  python2 log_to_xml.py TestResults.qpa TestResults.xml
  ```
