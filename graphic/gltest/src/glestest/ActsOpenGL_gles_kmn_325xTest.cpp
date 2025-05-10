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

#include "ActsOpenGL_gles_kmn_325xTest.h"
#include <gtest/gtest.h>
#include <cstdlib>
#include "common.h"


namespace OHOS {
    using namespace std;
    using namespace testing::ext;

    // Preset action of the test suite, which is executed before the first test case
    void ActsOpenGLgleskmn325xTest::SetUpTestCase(void)
    {
    }
    // Test suite cleanup action, which is executed after the last test case
    void ActsOpenGLgleskmn325xTest::TearDownTestCase(void)
    {
    }
    // Preset action of the test case
    void ActsOpenGLgleskmn325xTest::SetUp()
    {
    }
    // Cleanup action of the test case
    void ActsOpenGLgleskmn325xTest::TearDown()
    {
    }

    HWTEST_F(ActsOpenGLgleskmn325xTest, TestOpenGLglTestCase01, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskmn325xTest01------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass_noctx/3.2.5.x/src/"
                "gles2-khr-master.txt "
                "--deqp-log-filename=ActsOpenGLgleskmn325xTest01.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskmn325xTest01------\n");
    }

    HWTEST_F(ActsOpenGLgleskmn325xTest, TestOpenGLglTestCase02, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskmn325xTest02------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass_noctx/3.2.5.x/src/"
                "gles32-khr-master.txt "
                "--deqp-log-filename=ActsOpenGLgleskmn325xTest02.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskmn325xTest02------\n");
    }

    HWTEST_F(ActsOpenGLgleskmn325xTest, TestOpenGLglTestCase03, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskmn325xTest03------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass_noctx/3.2.5.x/"
                "gles2-khr-noctx-master.txt "
                "--deqp-log-filename=ActsOpenGLgleskmn325xTest03.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskmn325xTest03------\n");
    }

    HWTEST_F(ActsOpenGLgleskmn325xTest, TestOpenGLglTestCase04, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskmn325xTest04------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass_noctx/3.2.5.x/"
                "gles32-khr-noctx-master.txt "
                "--deqp-log-filename=ActsOpenGLgleskmn325xTest04.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskmn325xTest04------\n");
    }
}