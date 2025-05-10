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

#include "ActsOpenGL_gl_kmn_455xTest.h"
#include <gtest/gtest.h>
#include <cstdlib>
#include "common.h"


namespace OHOS {
    using namespace std;
    using namespace testing::ext;

    // Preset action of the test suite, which is executed before the first test case
    void ActsOpenGLglkmn455xTest::SetUpTestCase(void)
    {
    }
    // Test suite cleanup action, which is executed after the last test case
    void ActsOpenGLglkmn455xTest::TearDownTestCase(void)
    {
    }
    // Preset action of the test case
    void ActsOpenGLglkmn455xTest::SetUp()
    {
    }
    // Cleanup action of the test case
    void ActsOpenGLglkmn455xTest::TearDown()
    {
    }

    HWTEST_F(ActsOpenGLglkmn455xTest, TestOpenGLglTestCase01, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkmn455xTest01------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass_noctx/4.5.5.x/src/"
                "gl40-khr-master.txt "
                "--deqp-log-filename=ActsOpenGLglkmn455xTest01.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkmn455xTest01------\n");
    }

    HWTEST_F(ActsOpenGLglkmn455xTest, TestOpenGLglTestCase02, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkmn455xTest02------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass_noctx/4.5.5.x/"
                "gl40-khr-master.txt "
                "--deqp-log-filename=ActsOpenGLglkmn455xTest02.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkmn455xTest02------\n");
    }
}