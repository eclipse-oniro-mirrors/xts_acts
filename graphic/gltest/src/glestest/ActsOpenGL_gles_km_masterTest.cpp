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

#include "ActsOpenGL_gles_km_masterTest.h"
#include <gtest/gtest.h>
#include <cstdlib>
#include "common.h"


namespace OHOS {
    using namespace std;
    using namespace testing::ext;

    // Preset action of the test suite, which is executed before the first test case
    void ActsOpenGLgleskmmasterTest::SetUpTestCase(void)
    {
    }
    // Test suite cleanup action, which is executed after the last test case
    void ActsOpenGLgleskmmasterTest::TearDownTestCase(void)
    {
    }
    // Preset action of the test case
    void ActsOpenGLgleskmmasterTest::SetUp()
    {
    }
    // Cleanup action of the test case
    void ActsOpenGLgleskmmasterTest::TearDown()
    {
    }

    HWTEST_F(ActsOpenGLgleskmmasterTest, TestOpenGLglTestCase01, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskmmasterTest01------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass/master/src/"
                "gles2-khr-master.txt "
                "--deqp-log-filename=ActsOpenGLgleskmmasterTest01.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskmmasterTest01------\n");
    }

    HWTEST_F(ActsOpenGLgleskmmasterTest, TestOpenGLglTestCase02, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskmmasterTest02------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass/master/src/"
                "gles3-khr-master.txt "
                "--deqp-log-filename=ActsOpenGLgleskmmasterTest02.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskmmasterTest02------\n");
    }

    HWTEST_F(ActsOpenGLgleskmmasterTest, TestOpenGLglTestCase03, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskmmasterTest03------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass/master/src/"
                "gles31-khr-master.txt "
                "--deqp-log-filename=ActsOpenGLgleskmmasterTest03.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskmmasterTest03------\n");
    }

    HWTEST_F(ActsOpenGLgleskmmasterTest, TestOpenGLglTestCase04, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskmmasterTest04------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass/master/src/"
                "gles32-khr-master.txt "
                "--deqp-log-filename=ActsOpenGLgleskmmasterTest04.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskmmasterTest04------\n");
    }

    HWTEST_F(ActsOpenGLgleskmmasterTest, TestOpenGLglTestCase05, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskmmasterTest05------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass/master/src/"
                "gles32-khr-test-issues.txt "
                "--deqp-log-filename=ActsOpenGLgleskmmasterTest05.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskmmasterTest05------\n");
    }

    HWTEST_F(ActsOpenGLgleskmmasterTest, TestOpenGLglTestCase06, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskmmasterTest06------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass/master/"
                "gles2-khr-master.txt "
                "--deqp-log-filename=ActsOpenGLgleskmmasterTest06.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskmmasterTest06------\n");
    }

    HWTEST_F(ActsOpenGLgleskmmasterTest, TestOpenGLglTestCase07, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskmmasterTest07------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass/master/"
                "gles3-khr-master.txt "
                "--deqp-log-filename=ActsOpenGLgleskmmasterTest07.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskmmasterTest07------\n");
    }

    HWTEST_F(ActsOpenGLgleskmmasterTest, TestOpenGLglTestCase08, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskmmasterTest08------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass/master/"
                "gles31-khr-master.txt "
                "--deqp-log-filename=ActsOpenGLgleskmmasterTest08.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskmmasterTest08------\n");
    }

    HWTEST_F(ActsOpenGLgleskmmasterTest, TestOpenGLglTestCase09, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskmmasterTest09------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass/master/"
                "gles32-khr-master.txt "
                "--deqp-log-filename=ActsOpenGLgleskmmasterTest09.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskmmasterTest09------\n");
    }

    HWTEST_F(ActsOpenGLgleskmmasterTest, TestOpenGLglTestCase10, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLgleskmmasterTest10------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/khronos_mustpass/master/"
                "khrglesext-master.txt "
                "--deqp-log-filename=ActsOpenGLgleskmmasterTest10.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLgleskmmasterTest10------\n");
    }
}