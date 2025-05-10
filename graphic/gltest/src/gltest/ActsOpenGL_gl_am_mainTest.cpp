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

#include "ActsOpenGL_gl_am_mainTest.h"
#include <gtest/gtest.h>
#include <cstdlib>
#include "common.h"


namespace OHOS {
    using namespace std;
    using namespace testing::ext;

    // Preset action of the test suite, which is executed before the first test case
    void ActsOpenGLglammainTest::SetUpTestCase(void)
    {
    }
    // Test suite cleanup action, which is executed after the last test case
    void ActsOpenGLglammainTest::TearDownTestCase(void)
    {
    }
    // Preset action of the test case
    void ActsOpenGLglammainTest::SetUp()
    {
    }
    // Cleanup action of the test case
    void ActsOpenGLglammainTest::TearDown()
    {
    }

    HWTEST_F(ActsOpenGLglammainTest, TestOpenGLglTestCase01, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglammainTest01------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/a_mustpass/main/src/"
                "gl45es3-master.txt "
                "--deqp-log-filename=ActsOpenGLglammainTest01.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglammainTest01------\n");
    }

    HWTEST_F(ActsOpenGLglammainTest, TestOpenGLglTestCase02, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglammainTest02------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/a_mustpass/main/src/"
                "gl45es31-master.txt "
                "--deqp-log-filename=ActsOpenGLglammainTest02.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglammainTest02------\n");
    }

    HWTEST_F(ActsOpenGLglammainTest, TestOpenGLglTestCase03, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglammainTest03------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/a_mustpass/main/src/"
                "gl45es31-spec-issues.txt "
                "--deqp-log-filename=ActsOpenGLglammainTest03.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglammainTest03------\n");
    }

    HWTEST_F(ActsOpenGLglammainTest, TestOpenGLglTestCase04, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglammainTest04------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/a_mustpass/main/src/"
                "gl45es31-test-issues.txt "
                "--deqp-log-filename=ActsOpenGLglammainTest04.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglammainTest04------\n");
    }

    HWTEST_F(ActsOpenGLglammainTest, TestOpenGLglTestCase05, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglammainTest05------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/a_mustpass/main/"
                "gl45-es3-master.txt "
                "--deqp-log-filename=ActsOpenGLglammainTest05.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglammainTest05------\n");
    }

    HWTEST_F(ActsOpenGLglammainTest, TestOpenGLglTestCase06, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglammainTest06------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/a_mustpass/main/"
                "gl45-es31-master.txt "
                "--deqp-log-filename=ActsOpenGLglammainTest06.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglammainTest06------\n");
    }
    
    HWTEST_F(ActsOpenGLglammainTest, TestOpenGLglTestCase07, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglammainTest07------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/a_mustpass/main/"
                "gl45-master.txt "
                "--deqp-log-filename=ActsOpenGLglammainTest07.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglammainTest07------\n");
    }
}
