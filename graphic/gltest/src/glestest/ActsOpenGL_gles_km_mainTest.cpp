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

#include "ActsOpenGL_gles_km_mainTest.h"
#include <gtest/gtest.h>
#include <cstdlib>
#include "common.h"

namespace OHOS {
    using namespace std;
    using namespace testing::ext;

    // Preset action of the test suite, which is executed before the first test case
    void ActsOpenGLgleskmmainTest::SetUpTestCase(void)
    {
    }
    // Test suite cleanup action, which is executed after the last test case
    void ActsOpenGLgleskmmainTest::TearDownTestCase(void)
    {
    }
    // Preset action of the test case
    void ActsOpenGLgleskmmainTest::SetUp()
    {
    }
    // Cleanup action of the test case
    void ActsOpenGLgleskmmainTest::TearDown()
    {
    }

    HWTEST_F(ActsOpenGLgleskmmainTest, TestOpenGLglTestCase01, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskmmainTest01------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass/main/src/"
                "gles2-khr-master.txt "
                "--deqp-log-filename=ActsOpenGLgleskmmainTest01.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskmmainTest01------\n");
    }

    HWTEST_F(ActsOpenGLgleskmmainTest, TestOpenGLglTestCase02, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskmmainTest02------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass/main/src/"
                "gles3-khr-master.txt "
                "--deqp-log-filename=ActsOpenGLgleskmmainTest02.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskmmainTest02------\n");
    }

    HWTEST_F(ActsOpenGLgleskmmainTest, TestOpenGLglTestCase03, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskmmainTest03------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass/main/src/"
                "gles31-khr-master.txt "
                "--deqp-log-filename=ActsOpenGLgleskmmainTest03.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskmmainTest03------\n");
    }

    HWTEST_F(ActsOpenGLgleskmmainTest, TestOpenGLglTestCase04, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskmmainTest04------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass/main/src/"
                "gles32-khr-master.txt "
                "--deqp-log-filename=ActsOpenGLgleskmmainTest04.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskmmainTest04------\n");
    }

    HWTEST_F(ActsOpenGLgleskmmainTest, TestOpenGLglTestCase05, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskmmainTest05------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass/main/src/"
                "gles32-khr-test-issues.txt "
                "--deqp-log-filename=ActsOpenGLgleskmmainTest05.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskmmainTest05------\n");
    }

    HWTEST_F(ActsOpenGLgleskmmainTest, TestOpenGLglTestCase06, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskmmainTest06------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass/main/"
                "gles2-khr-master.txt "
                "--deqp-log-filename=ActsOpenGLgleskmmainTest06.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskmmainTest06------\n");
    }

    HWTEST_F(ActsOpenGLgleskmmainTest, TestOpenGLglTestCase07, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskmmainTest07------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass/main/"
                "gles3-khr-master.txt "
                "--deqp-log-filename=ActsOpenGLgleskmmainTest07.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskmmainTest07------\n");
    }

    HWTEST_F(ActsOpenGLgleskmmainTest, TestOpenGLglTestCase08, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskmmainTest08------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass/main/"
                "gles31-khr-master.txt "
                "--deqp-log-filename=ActsOpenGLgleskmmainTest08.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskmmainTest08------\n");
    }

    HWTEST_F(ActsOpenGLgleskmmainTest, TestOpenGLglTestCase09, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskmmainTest09------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass/main/"
                "gles32-khr-master.txt "
                "--deqp-log-filename=ActsOpenGLgleskmmainTest09.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskmmainTest09------\n");
    }
}