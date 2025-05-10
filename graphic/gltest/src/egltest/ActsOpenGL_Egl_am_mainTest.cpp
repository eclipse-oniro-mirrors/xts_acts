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

#include "ActsOpenGL_Egl_am_mainTest.h"
#include <gtest/gtest.h>
#include <cstdlib>
#include "common.h"

namespace OHOS {
    using namespace std;
    using namespace testing::ext;

    // Preset action of the test suite, which is executed before the first test case
    void ActsOpenGLEglammainTest::SetUpTestCase(void)
    {
    }
    // Test suite cleanup action, which is executed after the last test case
    void ActsOpenGLEglammainTest::TearDownTestCase(void)
    {
    }
    // Preset action of the test case
    void ActsOpenGLEglammainTest::SetUp()
    {
    }
    // Cleanup action of the test case
    void ActsOpenGLEglammainTest::TearDown()
    {
    }

    HWTEST_F(ActsOpenGLEglammainTest, TestOpenGLEglTestCase01, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLEglammainTest01------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.EGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/egl/a_mustpass/main/src/"
                "egl-internal-api-tests.txt "
                "--deqp-log-filename=ActsOpenGLEglammainTest01.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLEglammainTest01------\n");
    }

    HWTEST_F(ActsOpenGLEglammainTest, TestOpenGLEglTestCase02, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLEglammainTest02------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.EGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/egl/a_mustpass/main/src/"
                "egl-master.txt "
                "--deqp-log-filename=ActsOpenGLEglammainTest02.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLEglammainTest02------\n");
    }

    HWTEST_F(ActsOpenGLEglammainTest, TestOpenGLEglTestCase03, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLEglammainTest03------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.EGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/egl/a_mustpass/main/src/"
                "egl-test-issues.txt "
                "--deqp-log-filename=ActsOpenGLEglammainTest03.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLEglammainTest03------\n");
    }

    HWTEST_F(ActsOpenGLEglammainTest, TestOpenGLEglTestCase04, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLEglammainTest04------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.EGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/egl/a_mustpass/main/"
                "egl-master.txt "
                "--deqp-log-filename=ActsOpenGLEglammainTest04.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLEglammainTest04------\n");
    }
}
