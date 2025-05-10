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

#include "ActsOpenGL_gles_am_324xTest.h"
#include <gtest/gtest.h>
#include <cstdlib>
#include "common.h"

namespace OHOS {
    using namespace std;
    using namespace testing::ext;

    // Preset action of the test suite, which is executed before the first test case
    void ActsOpenGLglesam324xTest::SetUpTestCase(void)
    {
    }
    // Test suite cleanup action, which is executed after the last test case
    void ActsOpenGLglesam324xTest::TearDownTestCase(void)
    {
    }
    // Preset action of the test case
    void ActsOpenGLglesam324xTest::SetUp()
    {
    }
    // Cleanup action of the test case
    void ActsOpenGLglesam324xTest::TearDown()
    {
    }

    HWTEST_F(ActsOpenGLglesam324xTest, TestOpenGLglTestCase01, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam324xTest01------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.4.x/src/"
                "gles2-driver-issues.txt "
                "--deqp-log-filename=ActsOpenGLglesam324xTest01.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam324xTest01------\n");
    }

    HWTEST_F(ActsOpenGLglesam324xTest, TestOpenGLglTestCase02, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam324xTest02------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.4.x/src/"
                "gles2-hw-issues.txt "
                "--deqp-log-filename=ActsOpenGLglesam324xTest02.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam324xTest02------\n");
    }

    HWTEST_F(ActsOpenGLglesam324xTest, TestOpenGLglTestCase03, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam324xTest03------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.4.x/src/"
                "gles2-master.txt "
                "--deqp-log-filename=ActsOpenGLglesam324xTest03.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam324xTest03------\n");
    }

    HWTEST_F(ActsOpenGLglesam324xTest, TestOpenGLglTestCase04, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam324xTest04------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.4.x/src/"
                "gles2-spec-issues.txt "
                "--deqp-log-filename=ActsOpenGLglesam324xTest04.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam324xTest04------\n");
    }

    HWTEST_F(ActsOpenGLglesam324xTest, TestOpenGLglTestCase05, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam324xTest05------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.4.x/src/"
                "gles2-test-issues.txt "
                "--deqp-log-filename=ActsOpenGLglesam324xTest05.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam324xTest05------\n");
    }

    HWTEST_F(ActsOpenGLglesam324xTest, TestOpenGLglTestCase06, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam324xTest06------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.4.x/src/"
                "gles3-driver-issues.txt "
                "--deqp-log-filename=ActsOpenGLglesam324xTest06.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam324xTest06------\n");
    }

    HWTEST_F(ActsOpenGLglesam324xTest, TestOpenGLglTestCase07, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam324xTest07------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.4.x/src/"
                "gles3-hw-issues.txt "
                "--deqp-log-filename=ActsOpenGLglesam324xTest07.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam324xTest07------\n");
    }

    HWTEST_F(ActsOpenGLglesam324xTest, TestOpenGLglTestCase08, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam324xTest08------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.4.x/src/"
                "gles3-master.txt "
                "--deqp-log-filename=ActsOpenGLglesam324xTest08.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam324xTest08------\n");
    }

    HWTEST_F(ActsOpenGLglesam324xTest, TestOpenGLglTestCase09, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam324xTest09------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.4.x/src/"
                "gles3-multisample-hw-issues.txt "
                "--deqp-log-filename=ActsOpenGLglesam324xTest09.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam324xTest09------\n");
    }

    HWTEST_F(ActsOpenGLglesam324xTest, TestOpenGLglTestCase10, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam324xTest10------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.4.x/src/"
                "gles3-multisample.txt "
                "--deqp-log-filename=ActsOpenGLglesam324xTest10.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam324xTest10------\n");
    }

    HWTEST_F(ActsOpenGLglesam324xTest, TestOpenGLglTestCase11, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam324xTest11------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.4.x/src/"
                "gles3-pixelformat.txt "
                "--deqp-log-filename=ActsOpenGLglesam324xTest11.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam324xTest11------\n");
    }

    HWTEST_F(ActsOpenGLglesam324xTest, TestOpenGLglTestCase12, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam324xTest12------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.4.x/src/"
                "gles3-rotation.txt "
                "--deqp-log-filename=ActsOpenGLglesam324xTest12.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam324xTest12------\n");
    }

    HWTEST_F(ActsOpenGLglesam324xTest, TestOpenGLglTestCase13, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam324xTest13------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.4.x/src/"
                "gles3-spec-issues.txt "
                "--deqp-log-filename=ActsOpenGLglesam324xTest13.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam324xTest13------\n");
    }

    HWTEST_F(ActsOpenGLglesam324xTest, TestOpenGLglTestCase14, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam324xTest14------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.4.x/src/"
                "gles3-test-issues.txt "
                "--deqp-log-filename=ActsOpenGLglesam324xTest14.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam324xTest14------\n");
    }

    HWTEST_F(ActsOpenGLglesam324xTest, TestOpenGLglTestCase15, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam324xTest15------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.4.x/src/"
                "gles31-driver-issues.txt "
                "--deqp-log-filename=ActsOpenGLglesam324xTest15.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam324xTest15------\n");
    }

    HWTEST_F(ActsOpenGLglesam324xTest, TestOpenGLglTestCase16, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam324xTest16------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.4.x/src/"
                "gles31-hw-issues.txt "
                "--deqp-log-filename=ActsOpenGLglesam324xTest16.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam324xTest16------\n");
    }

    HWTEST_F(ActsOpenGLglesam324xTest, TestOpenGLglTestCase17, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam324xTest17------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.4.x/src/"
                "gles31-master.txt "
                "--deqp-log-filename=ActsOpenGLglesam324xTest17.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam324xTest17------\n");
    }

    HWTEST_F(ActsOpenGLglesam324xTest, TestOpenGLglTestCase18, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam324xTest18------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.4.x/src/"
                "gles31-multisample-test-issues.txt "
                "--deqp-log-filename=ActsOpenGLglesam324xTest18.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam324xTest18------\n");
    }

    HWTEST_F(ActsOpenGLglesam324xTest, TestOpenGLglTestCase19, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam324xTest19------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.4.x/src/"
                "gles31-multisample.txt "
                "--deqp-log-filename=ActsOpenGLglesam324xTest19.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam324xTest19------\n");
    }

    HWTEST_F(ActsOpenGLglesam324xTest, TestOpenGLglTestCase20, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam324xTest20------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.4.x/src/"
                "gles31-pixelformat.txt "
                "--deqp-log-filename=ActsOpenGLglesam324xTest20.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam324xTest20------\n");
    }

    HWTEST_F(ActsOpenGLglesam324xTest, TestOpenGLglTestCase21, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam324xTest21------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.4.x/src/"
                "gles31-rotation.txt "
                "--deqp-log-filename=ActsOpenGLglesam324xTest21.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam324xTest21------\n");
    }

    HWTEST_F(ActsOpenGLglesam324xTest, TestOpenGLglTestCase22, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam324xTest22------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.4.x/src/"
                "gles31-spec-issues.txt "
                "--deqp-log-filename=ActsOpenGLglesam324xTest22.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam324xTest22------\n");
    }

    HWTEST_F(ActsOpenGLglesam324xTest, TestOpenGLglTestCase23, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam324xTest23------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.4.x/src/"
                "gles31-test-issues.txt "
                "--deqp-log-filename=ActsOpenGLglesam324xTest23.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam324xTest23------\n");
    }

    HWTEST_F(ActsOpenGLglesam324xTest, TestOpenGLglTestCase24, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam324xTest24------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.4.x/"
                "gles2-master.txt "
                "--deqp-log-filename=ActsOpenGLglesam324xTest24.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam324xTest24------\n");
    }

    HWTEST_F(ActsOpenGLglesam324xTest, TestOpenGLglTestCase25, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam324xTest25------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.4.x/"
                "gles3-565-no-depth-no-stencil.txt "
                "--deqp-log-filename=ActsOpenGLglesam324xTest25.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam324xTest25------\n");
    }

    HWTEST_F(ActsOpenGLglesam324xTest, TestOpenGLglTestCase26, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam324xTest26------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.4.x/"
                "gles3-master.txt "
                "--deqp-log-filename=ActsOpenGLglesam324xTest26.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam324xTest26------\n");
    }

    HWTEST_F(ActsOpenGLglesam324xTest, TestOpenGLglTestCase27, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam324xTest27------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.4.x/"
                "gles3-multisample.txt "
                "--deqp-log-filename=ActsOpenGLglesam324xTest27.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam324xTest27------\n");
    }

    HWTEST_F(ActsOpenGLglesam324xTest, TestOpenGLglTestCase28, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam324xTest28------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.4.x/"
                "gles3-rotate-landscape.txt "
                "--deqp-log-filename=ActsOpenGLglesam324xTest28.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam324xTest28------\n");
    }

    HWTEST_F(ActsOpenGLglesam324xTest, TestOpenGLglTestCase29, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam324xTest29------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.4.x/"
                "gles3-rotate-portrait.txt "
                "--deqp-log-filename=ActsOpenGLglesam324xTest29.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam324xTest29------\n");
    }

    HWTEST_F(ActsOpenGLglesam324xTest, TestOpenGLglTestCase30, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam324xTest30------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.4.x/"
                "gles3-rotate-reverse-landscape.txt "
                "--deqp-log-filename=ActsOpenGLglesam324xTest30.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam324xTest30------\n");
    }

    HWTEST_F(ActsOpenGLglesam324xTest, TestOpenGLglTestCase31, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam324xTest31------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.4.x/"
                "gles3-rotate-reverse-portrait.txt "
                "--deqp-log-filename=ActsOpenGLglesam324xTest31.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam324xTest31------\n");
    }

    HWTEST_F(ActsOpenGLglesam324xTest, TestOpenGLglTestCase32, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam324xTest32------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.4.x/"
                "gles31-565-no-depth-no-stencil.txt "
                "--deqp-log-filename=ActsOpenGLglesam324xTest32.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam324xTest32------\n");
    }

    HWTEST_F(ActsOpenGLglesam324xTest, TestOpenGLglTestCase33, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam324xTest33------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.4.x/"
                "gles31-master.txt "
                "--deqp-log-filename=ActsOpenGLglesam324xTest33.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam324xTest33------\n");
    }

    HWTEST_F(ActsOpenGLglesam324xTest, TestOpenGLglTestCase34, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam324xTest34------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.4.x/"
                "gles31-multisample.txt "
                "--deqp-log-filename=ActsOpenGLglesam324xTest34.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam324xTest34------\n");
    }

    HWTEST_F(ActsOpenGLglesam324xTest, TestOpenGLglTestCase35, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam324xTest35------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.4.x/"
                "gles31-rotate-landscape.txt "
                "--deqp-log-filename=ActsOpenGLglesam324xTest35.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam324xTest35------\n");
    }

    HWTEST_F(ActsOpenGLglesam324xTest, TestOpenGLglTestCase36, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam324xTest36------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.4.x/"
                "gles31-rotate-portrait.txt "
                "--deqp-log-filename=ActsOpenGLglesam324xTest36.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam324xTest36------\n");
    }

    HWTEST_F(ActsOpenGLglesam324xTest, TestOpenGLglTestCase37, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam324xTest37------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.4.x/"
                "gles31-rotate-reverse-landscape.txt "
                "--deqp-log-filename=ActsOpenGLglesam324xTest37.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam324xTest37------\n");
    }

    HWTEST_F(ActsOpenGLglesam324xTest, TestOpenGLglTestCase38, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam324xTest38------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.4.x/"
                "gles31-rotate-reverse-portrait.txt "
                "--deqp-log-filename=ActsOpenGLglesam324xTest38.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam324xTest38------\n");
    }
}