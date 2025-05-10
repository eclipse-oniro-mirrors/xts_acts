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

#include "ActsOpenGL_gles_km_324xTest.h"
#include <gtest/gtest.h>
#include <cstdlib>
#include "common.h"


namespace OHOS {
    using namespace std;
    using namespace testing::ext;

    // Preset action of the test suite, which is executed before the first test case
    void ActsOpenGLgleskm324xTest::SetUpTestCase(void)
    {
    }
    // Test suite cleanup action, which is executed after the last test case
    void ActsOpenGLgleskm324xTest::TearDownTestCase(void)
    {
    }
    // Preset action of the test case
    void ActsOpenGLgleskm324xTest::SetUp()
    {
    }
    // Cleanup action of the test case
    void ActsOpenGLgleskm324xTest::TearDown()
    {
    }

    HWTEST_F(ActsOpenGLgleskm324xTest, TestOpenGLglTestCase01, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskm324xTest01------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass/3.2.4.x/src/"
                "gles2-gtf-egl.txt "
                "--deqp-log-filename=ActsOpenGLgleskm324xTest01.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskm324xTest01------\n");
    }

    HWTEST_F(ActsOpenGLgleskm324xTest, TestOpenGLglTestCase02, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskm324xTest02------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass/3.2.4.x/src/"
                "gles2-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLgleskm324xTest02.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskm324xTest02------\n");
    }

    HWTEST_F(ActsOpenGLgleskm324xTest, TestOpenGLglTestCase03, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskm324xTest03------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass/3.2.4.x/src/"
                "gles2-khr-master.txt "
                "--deqp-log-filename=ActsOpenGLgleskm324xTest03.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskm324xTest03------\n");
    }

    HWTEST_F(ActsOpenGLgleskm324xTest, TestOpenGLglTestCase04, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskm324xTest04------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass/3.2.4.x/src/"
                "gles3-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLgleskm324xTest04.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskm324xTest04------\n");
    }

    HWTEST_F(ActsOpenGLgleskm324xTest, TestOpenGLglTestCase05, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskm324xTest05------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass/3.2.4.x/src/"
                "gles3-khr-master.txt "
                "--deqp-log-filename=ActsOpenGLgleskm324xTest05.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskm324xTest05------\n");
    }

    HWTEST_F(ActsOpenGLgleskm324xTest, TestOpenGLglTestCase06, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskm324xTest06------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass/3.2.4.x/src/"
                "gles31-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLgleskm324xTest06.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskm324xTest06------\n");
    }

    HWTEST_F(ActsOpenGLgleskm324xTest, TestOpenGLglTestCase07, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskm324xTest07------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass/3.2.4.x/src/"
                "gles31-khr-master.txt "
                "--deqp-log-filename=ActsOpenGLgleskm324xTest07.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskm324xTest07------\n");
    }

    HWTEST_F(ActsOpenGLgleskm324xTest, TestOpenGLglTestCase08, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskm324xTest08------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass/3.2.4.x/src/"
                "gles32-khr-master.txt "
                "--deqp-log-filename=ActsOpenGLgleskm324xTest08.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskm324xTest08------\n");
    }

    HWTEST_F(ActsOpenGLgleskm324xTest, TestOpenGLglTestCase09, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskm324xTest09------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass/3.2.4.x/"
                "gles2-gtf-egl.txt "
                "--deqp-log-filename=ActsOpenGLgleskm324xTest09.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskm324xTest09------\n");
    }

    HWTEST_F(ActsOpenGLgleskm324xTest, TestOpenGLglTestCase10, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskm324xTest10------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass/3.2.4.x/"
                "gles2-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLgleskm324xTest10.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskm324xTest10------\n");
    }

    HWTEST_F(ActsOpenGLgleskm324xTest, TestOpenGLglTestCase11, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskm324xTest11------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass/3.2.4.x/"
                "gles2-khr-master.txt "
                "--deqp-log-filename=ActsOpenGLgleskm324xTest11.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskm324xTest11------\n");
    }

    HWTEST_F(ActsOpenGLgleskm324xTest, TestOpenGLglTestCase12, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskm324xTest12------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass/3.2.4.x/"
                "gles3-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLgleskm324xTest12.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskm324xTest12------\n");
    }

    HWTEST_F(ActsOpenGLgleskm324xTest, TestOpenGLglTestCase13, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskm324xTest13------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass/3.2.4.x/"
                "gles3-khr-master.txt "
                "--deqp-log-filename=ActsOpenGLgleskm324xTest13.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskm324xTest13------\n");
    }

    HWTEST_F(ActsOpenGLgleskm324xTest, TestOpenGLglTestCase14, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskm324xTest14------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass/3.2.4.x/"
                "gles31-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLgleskm324xTest14.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskm324xTest14------\n");
    }

    HWTEST_F(ActsOpenGLgleskm324xTest, TestOpenGLglTestCase15, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskm324xTest15------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass/3.2.4.x/"
                "gles31-khr-master.txt "
                "--deqp-log-filename=ActsOpenGLgleskm324xTest15.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskm324xTest15------\n");
    }

    HWTEST_F(ActsOpenGLgleskm324xTest, TestOpenGLglTestCase16, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskm324xTest16------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass/3.2.4.x/"
                "gles32-khr-master.txt "
                "--deqp-log-filename=ActsOpenGLgleskm324xTest16.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskm324xTest16------\n");
    }
}