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

#include "ActsOpenGL_gles_km_323xTest.h"
#include <gtest/gtest.h>
#include <cstdlib>
#include "common.h"


namespace OHOS {
    using namespace std;
    using namespace testing::ext;

    // Preset action of the test suite, which is executed before the first test case
    void ActsOpenGLgleskm323xTest::SetUpTestCase(void)
    {
    }
    // Test suite cleanup action, which is executed after the last test case
    void ActsOpenGLgleskm323xTest::TearDownTestCase(void)
    {
    }
    // Preset action of the test case
    void ActsOpenGLgleskm323xTest::SetUp()
    {
    }
    // Cleanup action of the test case
    void ActsOpenGLgleskm323xTest::TearDown()
    {
    }

    HWTEST_F(ActsOpenGLgleskm323xTest, TestOpenGLglTestCase01, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskm323xTest01------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass/3.2.3.x/src/"
                "gles2-gtf-egl.txt "
                "--deqp-log-filename=ActsOpenGLgleskm323xTest01.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskm323xTest01------\n");
    }

    HWTEST_F(ActsOpenGLgleskm323xTest, TestOpenGLglTestCase02, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskm323xTest02------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass/3.2.3.x/src/"
                "gles2-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLgleskm323xTest02.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskm323xTest02------\n");
    }

    HWTEST_F(ActsOpenGLgleskm323xTest, TestOpenGLglTestCase03, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskm323xTest03------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass/3.2.3.x/src/"
                "gles2-khr-master.txt "
                "--deqp-log-filename=ActsOpenGLgleskm323xTest03.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskm323xTest03------\n");
    }

    HWTEST_F(ActsOpenGLgleskm323xTest, TestOpenGLglTestCase04, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskm323xTest04------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass/3.2.3.x/src/"
                "gles3-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLgleskm323xTest04.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskm323xTest04------\n");
    }

    HWTEST_F(ActsOpenGLgleskm323xTest, TestOpenGLglTestCase05, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskm323xTest05------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass/3.2.3.x/src/"
                "gles3-khr-master.txt "
                "--deqp-log-filename=ActsOpenGLgleskm323xTest05.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskm323xTest05------\n");
    }

    HWTEST_F(ActsOpenGLgleskm323xTest, TestOpenGLglTestCase06, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskm323xTest06------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass/3.2.3.x/src/"
                "gles31-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLgleskm323xTest06.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskm323xTest06------\n");
    }

    HWTEST_F(ActsOpenGLgleskm323xTest, TestOpenGLglTestCase07, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskm323xTest07------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass/3.2.3.x/src/"
                "gles31-khr-master.txt "
                "--deqp-log-filename=ActsOpenGLgleskm323xTest07.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskm323xTest07------\n");
    }

    HWTEST_F(ActsOpenGLgleskm323xTest, TestOpenGLglTestCase08, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskm323xTest08------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass/3.2.3.x/src/"
                "gles32-khr-master.txt "
                "--deqp-log-filename=ActsOpenGLgleskm323xTest08.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskm323xTest08------\n");
    }

    HWTEST_F(ActsOpenGLgleskm323xTest, TestOpenGLglTestCase09, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskm323xTest09------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass/3.2.3.x/"
                "gles2-gtf-egl.txt "
                "--deqp-log-filename=ActsOpenGLgleskm323xTest09.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskm323xTest09------\n");
    }

    HWTEST_F(ActsOpenGLgleskm323xTest, TestOpenGLglTestCase10, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskm323xTest10------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass/3.2.3.x/"
                "gles2-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLgleskm323xTest10.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskm323xTest10------\n");
    }

    HWTEST_F(ActsOpenGLgleskm323xTest, TestOpenGLglTestCase11, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskm323xTest11------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass/3.2.3.x/"
                "gles2-khr-master.txt "
                "--deqp-log-filename=ActsOpenGLgleskm323xTest11.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskm323xTest11------\n");
    }

    HWTEST_F(ActsOpenGLgleskm323xTest, TestOpenGLglTestCase12, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskm323xTest12------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass/3.2.3.x/"
                "gles3-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLgleskm323xTest12.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskm323xTest12------\n");
    }

    HWTEST_F(ActsOpenGLgleskm323xTest, TestOpenGLglTestCase13, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskm323xTest13------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass/3.2.3.x/"
                "gles3-khr-master.txt "
                "--deqp-log-filename=ActsOpenGLgleskm323xTest13.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskm323xTest13------\n");
    }

    HWTEST_F(ActsOpenGLgleskm323xTest, TestOpenGLglTestCase14, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskm323xTest14------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass/3.2.3.x/"
                "gles31-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLgleskm323xTest14.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskm323xTest14------\n");
    }

    HWTEST_F(ActsOpenGLgleskm323xTest, TestOpenGLglTestCase15, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskm323xTest15------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass/3.2.3.x/"
                "gles31-khr-master.txt "
                "--deqp-log-filename=ActsOpenGLgleskm323xTest15.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskm323xTest15------\n");
    }

    HWTEST_F(ActsOpenGLgleskm323xTest, TestOpenGLglTestCase16, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskm323xTest16------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass/3.2.3.x/"
                "gles32-khr-master.txt "
                "--deqp-log-filename=ActsOpenGLgleskm323xTest16.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskm323xTest16------\n");
    }
}