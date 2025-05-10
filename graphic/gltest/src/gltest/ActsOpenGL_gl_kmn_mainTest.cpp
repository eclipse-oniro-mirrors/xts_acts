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

#include "ActsOpenGL_gl_kmn_mainTest.h"
#include <gtest/gtest.h>
#include <cstdlib>
#include "common.h"


namespace OHOS {
    using namespace std;
    using namespace testing::ext;

    // Preset action of the test suite, which is executed before the first test case
    void ActsOpenGLglkmnmainTest::SetUpTestCase(void)
    {
    }
    // Test suite cleanup action, which is executed after the last test case
    void ActsOpenGLglkmnmainTest::TearDownTestCase(void)
    {
    }
    // Preset action of the test case
    void ActsOpenGLglkmnmainTest::SetUp()
    {
    }
    // Cleanup action of the test case
    void ActsOpenGLglkmnmainTest::TearDown()
    {
    }

    HWTEST_F(ActsOpenGLglkmnmainTest, TestOpenGLglTestCase01, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkmnmainTest01------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass_noctx/main/src/"
                "gl30-khr-master.txt "
                "--deqp-log-filename=ActsOpenGLglkmnmainTest01.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkmnmainTest01------\n");
    }

    HWTEST_F(ActsOpenGLglkmnmainTest, TestOpenGLglTestCase02, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkmnmainTest02------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass_noctx/main/src/"
                "gl40-khr-master.txt "
                "--deqp-log-filename=ActsOpenGLglkmnmainTest02.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkmnmainTest02------\n");
    }

    HWTEST_F(ActsOpenGLglkmnmainTest, TestOpenGLglTestCase03, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkmnmainTest03------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass_noctx/main/src/"
                "gl43-khr-master.txt "
                "--deqp-log-filename=ActsOpenGLglkmnmainTest03.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkmnmainTest03------\n");
    }

    HWTEST_F(ActsOpenGLglkmnmainTest, TestOpenGLglTestCase04, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkmnmainTest04------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass_noctx/main/src/"
                "gl45-khr-master.txt "
                "--deqp-log-filename=ActsOpenGLglkmnmainTest04.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkmnmainTest04------\n");
    }

    HWTEST_F(ActsOpenGLglkmnmainTest, TestOpenGLglTestCase05, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkmnmainTest05------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass_noctx/main/"
                "gl30-khr-master.txt "
                "--deqp-log-filename=ActsOpenGLglkmnmainTest05.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkmnmainTest05------\n");
    }

    HWTEST_F(ActsOpenGLglkmnmainTest, TestOpenGLglTestCase06, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkmnmainTest06------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass_noctx/main/"
                "gl40-khr-master.txt "
                "--deqp-log-filename=ActsOpenGLglkmnmainTest06.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkmnmainTest06------\n");
    }

    HWTEST_F(ActsOpenGLglkmnmainTest, TestOpenGLglTestCase07, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkmnmainTest07------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass_noctx/main/"
                "gl43-khr-master.txt "
                "--deqp-log-filename=ActsOpenGLglkmnmainTest07.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkmnmainTest07------\n");
    }

    HWTEST_F(ActsOpenGLglkmnmainTest, TestOpenGLglTestCase08, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkmnmainTest08------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass_noctx/main/"
                "gl45-khr-master.txt "
                "--deqp-log-filename=ActsOpenGLglkmnmainTest08.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkmnmainTest08------\n");
    }
}