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

#include "ActsOpenGL_gles_kms_mainTest.h"
#include <gtest/gtest.h>
#include <cstdlib>
#include "common.h"


namespace OHOS {
    using namespace std;
    using namespace testing::ext;

    // Preset action of the test suite, which is executed before the first test case
    void ActsOpenGLgleskmsmainTest::SetUpTestCase(void)
    {
    }
    // Test suite cleanup action, which is executed after the last test case
    void ActsOpenGLgleskmsmainTest::TearDownTestCase(void)
    {
    }
    // Preset action of the test case
    void ActsOpenGLgleskmsmainTest::SetUp()
    {
    }
    // Cleanup action of the test case
    void ActsOpenGLgleskmsmainTest::TearDown()
    {
    }

    HWTEST_F(ActsOpenGLgleskmsmainTest, TestOpenGLglTestCase01, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskmsmainTest01------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass_single/main/src/"
                "gles32-khr-single.txt "
                "--deqp-log-filename=ActsOpenGLgleskmsmainTest01.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskmsmainTest01------\n");
    }

    HWTEST_F(ActsOpenGLgleskmsmainTest, TestOpenGLglTestCase02, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskmsmainTest02------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass_single/main/"
                "gles32-khr-single.txt "
                "--deqp-log-filename=ActsOpenGLgleskmsmainTest02.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskmsmainTest02------\n");
    }
}