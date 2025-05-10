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

#include "ActsOpenGL_gl_kms_mainTest.h"
#include <gtest/gtest.h>
#include <cstdlib>
#include "common.h"


namespace OHOS {
    using namespace std;
    using namespace testing::ext;

    // Preset action of the test suite, which is executed before the first test case
    void ActsOpenGLglkmsmainTest::SetUpTestCase(void)
    {
    }
    // Test suite cleanup action, which is executed after the last test case
    void ActsOpenGLglkmsmainTest::TearDownTestCase(void)
    {
    }
    // Preset action of the test case
    void ActsOpenGLglkmsmainTest::SetUp()
    {
    }
    // Cleanup action of the test case
    void ActsOpenGLglkmsmainTest::TearDown()
    {
    }

    HWTEST_F(ActsOpenGLglkmsmainTest, TestOpenGLglTestCase01, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkmsmainTest01------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass_single/main/src/"
                "gl43-khr-single.txt "
                "--deqp-log-filename=ActsOpenGLglkmsmainTest01.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkmsmainTest01------\n");
    }

    HWTEST_F(ActsOpenGLglkmsmainTest, TestOpenGLglTestCase02, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkmsmainTest02------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass_single/main/src/"
                "gl44-khr-single.txt "
                "--deqp-log-filename=ActsOpenGLglkmsmainTest02.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkmsmainTest02------\n");
    }

    HWTEST_F(ActsOpenGLglkmsmainTest, TestOpenGLglTestCase03, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkmsmainTest03------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass_single/main/src/"
                "gl45-khr-single.txt "
                "--deqp-log-filename=ActsOpenGLglkmsmainTest03.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkmsmainTest03------\n");
    }

    HWTEST_F(ActsOpenGLglkmsmainTest, TestOpenGLglTestCase04, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkmsmainTest04------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass_single/main/src/"
                "gl46-khr-single.txt "
                "--deqp-log-filename=ActsOpenGLglkmsmainTest04.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkmsmainTest04------\n");
    }

    HWTEST_F(ActsOpenGLglkmsmainTest, TestOpenGLglTestCase05, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkmsmainTest05------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass_single/main/"
                "gl43-khr-single.txt "
                "--deqp-log-filename=ActsOpenGLglkmsmainTest05.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkmsmainTest05------\n");
    }

    HWTEST_F(ActsOpenGLglkmsmainTest, TestOpenGLglTestCase06, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkmsmainTest06------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass_single/main/"
                "gl44-khr-single.txt "
                "--deqp-log-filename=ActsOpenGLglkmsmainTest06.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkmsmainTest06------\n");
    }

    HWTEST_F(ActsOpenGLglkmsmainTest, TestOpenGLglTestCase07, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkmsmainTest07------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass_single/main/"
                "gl45-khr-single.txt "
                "--deqp-log-filename=ActsOpenGLglkmsmainTest07.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkmsmainTest07------\n");
    }

    HWTEST_F(ActsOpenGLglkmsmainTest, TestOpenGLglTestCase08, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkmsmainTest08------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass_single/main/"
                "gl46-khr-single.txt "
                "--deqp-log-filename=ActsOpenGLglkmsmainTest08.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkmsmainTest08------\n");
    }
}