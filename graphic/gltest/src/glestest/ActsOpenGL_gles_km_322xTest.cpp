/*
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "ActsOpenGL_gles_km_322xTest.h"
#include <gtest/gtest.h>
#include <cstdlib>
#include "common.h"


namespace OHOS {
    using namespace std;
    using namespace testing::ext;

    // Preset action of the test suite, which is executed before the first test case
    void ActsOpenGLgleskm322xTest::SetUpTestCase(void)
    {
    }
    // Test suite cleanup action, which is executed after the last test case
    void ActsOpenGLgleskm322xTest::TearDownTestCase(void)
    {
    }
    // Preset action of the test case
    void ActsOpenGLgleskm322xTest::SetUp()
    {
    }
    // Cleanup action of the test case
    void ActsOpenGLgleskm322xTest::TearDown()
    {
    }

    HWTEST_F(ActsOpenGLgleskm322xTest, TestOpenGLglTestCase01, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskm322xTest01------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass/3.2.2.x/src/"
                "gles2-deqp-master.txt "
                "--deqp-log-filename=ActsOpenGLgleskm322xTest01.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskm322xTest01------\n");
    }

    HWTEST_F(ActsOpenGLgleskm322xTest, TestOpenGLglTestCase02, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskm322xTest02------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass/3.2.2.x/src/"
                "gles2-gtf-egl.txt "
                "--deqp-log-filename=ActsOpenGLgleskm322xTest02.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskm322xTest02------\n");
    }

    HWTEST_F(ActsOpenGLgleskm322xTest, TestOpenGLglTestCase03, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskm322xTest03------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass/3.2.2.x/src/"
                "gles2-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLgleskm322xTest03.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskm322xTest03------\n");
    }

    HWTEST_F(ActsOpenGLgleskm322xTest, TestOpenGLglTestCase04, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskm322xTest04------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass/3.2.2.x/src/"
                "gles2-khr-master.txt "
                "--deqp-log-filename=ActsOpenGLgleskm322xTest04.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskm322xTest04------\n");
    }

    HWTEST_F(ActsOpenGLgleskm322xTest, TestOpenGLglTestCase05, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskm322xTest05------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass/3.2.2.x/src/"
                "gles3-deqp-master.txt "
                "--deqp-log-filename=ActsOpenGLgleskm322xTest05.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskm322xTest05------\n");
    }

    HWTEST_F(ActsOpenGLgleskm322xTest, TestOpenGLglTestCase06, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskm322xTest06------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass/3.2.2.x/src/"
                "gles3-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLgleskm322xTest06.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskm322xTest06------\n");
    }

    HWTEST_F(ActsOpenGLgleskm322xTest, TestOpenGLglTestCase07, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskm322xTest07------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass/3.2.2.x/src/"
                "gles3-khr-master.txt "
                "--deqp-log-filename=ActsOpenGLgleskm322xTest07.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskm322xTest07------\n");
    }

    HWTEST_F(ActsOpenGLgleskm322xTest, TestOpenGLglTestCase08, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskm322xTest08------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass/3.2.2.x/src/"
                "gles31-deqp-master.txt "
                "--deqp-log-filename=ActsOpenGLgleskm322xTest08.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskm322xTest08------\n");
    }

    HWTEST_F(ActsOpenGLgleskm322xTest, TestOpenGLglTestCase09, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskm322xTest09------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass/3.2.2.x/src/"
                "gles31-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLgleskm322xTest09.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskm322xTest09------\n");
    }

    HWTEST_F(ActsOpenGLgleskm322xTest, TestOpenGLglTestCase10, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskm322xTest10------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass/3.2.2.x/src/"
                "gles31-khr-master.txt "
                "--deqp-log-filename=ActsOpenGLgleskm322xTest10.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskm322xTest10------\n");
    }

    HWTEST_F(ActsOpenGLgleskm322xTest, TestOpenGLglTestCase11, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskm322xTest11------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass/3.2.2.x/src/"
                "gles32-khr-master.txt "
                "--deqp-log-filename=ActsOpenGLgleskm322xTest11.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskm322xTest11------\n");
    }

    HWTEST_F(ActsOpenGLgleskm322xTest, TestOpenGLglTestCase12, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskm322xTest12------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass/3.2.2.x/"
                "gles2-deqp-master.txt "
                "--deqp-log-filename=ActsOpenGLgleskm322xTest12.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskm322xTest12------\n");
    }

    HWTEST_F(ActsOpenGLgleskm322xTest, TestOpenGLglTestCase13, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskm322xTest13------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass/3.2.2.x/"
                "gles2-gtf-egl.txt "
                "--deqp-log-filename=ActsOpenGLgleskm322xTest13.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskm322xTest13------\n");
    }

    HWTEST_F(ActsOpenGLgleskm322xTest, TestOpenGLglTestCase14, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskm322xTest14------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass/3.2.2.x/"
                "gles2-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLgleskm322xTest14.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskm322xTest14------\n");
    }

    HWTEST_F(ActsOpenGLgleskm322xTest, TestOpenGLglTestCase15, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskm322xTest15------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass/3.2.2.x/"
                "gles2-khr-master.txt "
                "--deqp-log-filename=ActsOpenGLgleskm322xTest15.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskm322xTest15------\n");
    }

    HWTEST_F(ActsOpenGLgleskm322xTest, TestOpenGLglTestCase16, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskm322xTest16------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass/3.2.2.x/"
                "gles3-deqp-master.txt "
                "--deqp-log-filename=ActsOpenGLgleskm322xTest16.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskm322xTest16------\n");
    }

    HWTEST_F(ActsOpenGLgleskm322xTest, TestOpenGLglTestCase17, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskm322xTest17------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass/3.2.2.x/"
                "gles3-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLgleskm322xTest17.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskm322xTest17------\n");
    }

    HWTEST_F(ActsOpenGLgleskm322xTest, TestOpenGLglTestCase18, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskm322xTest18------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass/3.2.2.x/"
                "gles3-khr-master.txt "
                "--deqp-log-filename=ActsOpenGLgleskm322xTest18.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskm322xTest18------\n");
    }

    HWTEST_F(ActsOpenGLgleskm322xTest, TestOpenGLglTestCase19, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskm322xTest19------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass/3.2.2.x/"
                "gles31-deqp-master.txt "
                "--deqp-log-filename=ActsOpenGLgleskm322xTest19.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskm322xTest19------\n");
    }

    HWTEST_F(ActsOpenGLgleskm322xTest, TestOpenGLglTestCase20, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskm322xTest20------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass/3.2.2.x/"
                "gles31-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLgleskm322xTest20.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskm322xTest20------\n");
    }

    HWTEST_F(ActsOpenGLgleskm322xTest, TestOpenGLglTestCase21, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskm322xTest21------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass/3.2.2.x/"
                "gles31-khr-master.txt "
                "--deqp-log-filename=ActsOpenGLgleskm322xTest21.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskm322xTest21------\n");
    }

    HWTEST_F(ActsOpenGLgleskm322xTest, TestOpenGLglTestCase22, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskm322xTest22------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass/3.2.2.x/"
                "gles32-khr-master.txt "
                "--deqp-log-filename=ActsOpenGLgleskm322xTest22.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskm322xTest22------\n");
    }
}