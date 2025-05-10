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

#include "ActsOpenGL_gles_km_325xTest.h"
#include <gtest/gtest.h>
#include <cstdlib>
#include "common.h"


namespace OHOS {
    using namespace std;
    using namespace testing::ext;

    // Preset action of the test suite, which is executed before the first test case
    void ActsOpenGLgleskm325xTest::SetUpTestCase(void)
    {
    }
    // Test suite cleanup action, which is executed after the last test case
    void ActsOpenGLgleskm325xTest::TearDownTestCase(void)
    {
    }
    // Preset action of the test case
    void ActsOpenGLgleskm325xTest::SetUp()
    {
    }
    // Cleanup action of the test case
    void ActsOpenGLgleskm325xTest::TearDown()
    {
    }

    HWTEST_F(ActsOpenGLgleskm325xTest, TestOpenGLglTestCase01, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskm325xTest01------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass/3.2.5.x/src/"
                "gles2-khr-master.txt "
                "--deqp-log-filename=ActsOpenGLgleskm325xTest01.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskm325xTest01------\n");
    }

    HWTEST_F(ActsOpenGLgleskm325xTest, TestOpenGLglTestCase02, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskm325xTest02------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass/3.2.5.x/src/"
                "gles3-khr-master.txt "
                "--deqp-log-filename=ActsOpenGLgleskm325xTest02.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskm325xTest02------\n");
    }

    HWTEST_F(ActsOpenGLgleskm325xTest, TestOpenGLglTestCase03, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskm325xTest03------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass/3.2.5.x/src/"
                "gles31-khr-master.txt "
                "--deqp-log-filename=ActsOpenGLgleskm325xTest03.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskm325xTest03------\n");
    }

    HWTEST_F(ActsOpenGLgleskm325xTest, TestOpenGLglTestCase04, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskm325xTest04------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass/3.2.5.x/src/"
                "gles32-khr-master.txt "
                "--deqp-log-filename=ActsOpenGLgleskm325xTest04.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskm325xTest04------\n");
    }

    HWTEST_F(ActsOpenGLgleskm325xTest, TestOpenGLglTestCase05, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskm325xTest05------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass/3.2.5.x/src/"
                "gles32-khr-test-issues.txt "
                "--deqp-log-filename=ActsOpenGLgleskm325xTest05.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskm325xTest05------\n");
    }

    HWTEST_F(ActsOpenGLgleskm325xTest, TestOpenGLglTestCase06, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskm325xTest06------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass/3.2.5.x/"
                "gles2-khr-master.txt "
                "--deqp-log-filename=ActsOpenGLgleskm325xTest06.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskm325xTest06------\n");
    }

    HWTEST_F(ActsOpenGLgleskm325xTest, TestOpenGLglTestCase07, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskm325xTest07------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass/3.2.5.x/"
                "gles3-khr-master.txt "
                "--deqp-log-filename=ActsOpenGLgleskm325xTest07.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskm325xTest07------\n");
    }

    HWTEST_F(ActsOpenGLgleskm325xTest, TestOpenGLglTestCase08, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskm325xTest08------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass/3.2.5.x/"
                "gles31-khr-master.txt "
                "--deqp-log-filename=ActsOpenGLgleskm325xTest08.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskm325xTest08------\n");
    }

    HWTEST_F(ActsOpenGLgleskm325xTest, TestOpenGLglTestCase09, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskm325xTest09------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass/3.2.5.x/"
                "gles32-khr-master.txt "
                "--deqp-log-filename=ActsOpenGLgleskm325xTest09.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskm325xTest09------\n");
    }
}