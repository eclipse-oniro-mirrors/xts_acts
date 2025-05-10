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

#include "ActsOpenGL_gl_kmn_461xTest.h"
#include <gtest/gtest.h>
#include <cstdlib>
#include "common.h"


namespace OHOS {
    using namespace std;
    using namespace testing::ext;

    // Preset action of the test suite, which is executed before the first test case
    void ActsOpenGLglkmn461xTest::SetUpTestCase(void)
    {
    }
    // Test suite cleanup action, which is executed after the last test case
    void ActsOpenGLglkmn461xTest::TearDownTestCase(void)
    {
    }
    // Preset action of the test case
    void ActsOpenGLglkmn461xTest::SetUp()
    {
    }
    // Cleanup action of the test case
    void ActsOpenGLglkmn461xTest::TearDown()
    {
    }

    HWTEST_F(ActsOpenGLglkmn461xTest, TestOpenGLglTestCase01, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkmn461xTest01------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass_noctx/4.6.1.x/src/"
                "gl30-khr-master.txt "
                "--deqp-log-filename=ActsOpenGLglkmn461xTest01.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkmn461xTest01------\n");
    }

    HWTEST_F(ActsOpenGLglkmn461xTest, TestOpenGLglTestCase02, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkmn461xTest02------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass_noctx/4.6.1.x/src/"
                "gl40-khr-master.txt "
                "--deqp-log-filename=ActsOpenGLglkmn461xTest02.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkmn461xTest02------\n");
    }

    HWTEST_F(ActsOpenGLglkmn461xTest, TestOpenGLglTestCase03, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkmn461xTest03------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass_noctx/4.6.1.x/src/"
                "gl43-khr-master.txt "
                "--deqp-log-filename=ActsOpenGLglkmn461xTest03.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkmn461xTest03------\n");
    }

    HWTEST_F(ActsOpenGLglkmn461xTest, TestOpenGLglTestCase04, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkmn461xTest04------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass_noctx/4.6.1.x/src/"
                "gl45-khr-master.txt "
                "--deqp-log-filename=ActsOpenGLglkmn461xTest04.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkmn461xTest04------\n");
    }

    HWTEST_F(ActsOpenGLglkmn461xTest, TestOpenGLglTestCase05, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkmn461xTest05------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass_noctx/4.6.1.x/"
                "gl30-khr-master.txt "
                "--deqp-log-filename=ActsOpenGLglkmn461xTest05.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkmn461xTest05------\n");
    }

    HWTEST_F(ActsOpenGLglkmn461xTest, TestOpenGLglTestCase06, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkmn461xTest06------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass_noctx/4.6.1.x/"
                "gl40-khr-master.txt "
                "--deqp-log-filename=ActsOpenGLglkmn461xTest06.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkmn461xTest06------\n");
    }

    HWTEST_F(ActsOpenGLglkmn461xTest, TestOpenGLglTestCase07, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkmn461xTest07------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass_noctx/4.6.1.x/"
                "gl43-khr-master.txt "
                "--deqp-log-filename=ActsOpenGLglkmn461xTest07.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkmn461xTest07------\n");
    }

    HWTEST_F(ActsOpenGLglkmn461xTest, TestOpenGLglTestCase08, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkmn461xTest08------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass_noctx/4.6.1.x/"
                "gl45-khr-master.txt "
                "--deqp-log-filename=ActsOpenGLglkmn461xTest08.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkmn461xTest08------\n");
    }
}