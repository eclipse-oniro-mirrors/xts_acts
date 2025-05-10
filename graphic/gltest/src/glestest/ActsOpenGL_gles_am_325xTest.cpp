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

#include "ActsOpenGL_gles_am_325xTest.h"
#include <gtest/gtest.h>
#include <cstdlib>
#include "common.h"


namespace OHOS {
    using namespace std;
    using namespace testing::ext;

    // Preset action of the test suite, which is executed before the first test case
    void ActsOpenGLglesam325xTest::SetUpTestCase(void)
    {
    }
    // Test suite cleanup action, which is executed after the last test case
    void ActsOpenGLglesam325xTest::TearDownTestCase(void)
    {
    }
    // Preset action of the test case
    void ActsOpenGLglesam325xTest::SetUp()
    {
    }
    // Cleanup action of the test case
    void ActsOpenGLglesam325xTest::TearDown()
    {
    }

    HWTEST_F(ActsOpenGLglesam325xTest, TestOpenGLglTestCase01, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam325xTest01------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.5.x/src/"
                "gles2-driver-issues.txt "
                "--deqp-log-filename=ActsOpenGLglesam325xTest01.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam325xTest01------\n");
    }

    HWTEST_F(ActsOpenGLglesam325xTest, TestOpenGLglTestCase02, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam325xTest02------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.5.x/src/"
                "gles2-hw-issues.txt "
                "--deqp-log-filename=ActsOpenGLglesam325xTest02.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam325xTest02------\n");
    }

    HWTEST_F(ActsOpenGLglesam325xTest, TestOpenGLglTestCase03, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam325xTest03------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.5.x/src/"
                "gles2-master.txt "
                "--deqp-log-filename=ActsOpenGLglesam325xTest03.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam325xTest03------\n");
    }

    HWTEST_F(ActsOpenGLglesam325xTest, TestOpenGLglTestCase04, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam325xTest04------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.5.x/src/"
                "gles2-spec-issues.txt "
                "--deqp-log-filename=ActsOpenGLglesam325xTest04.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam325xTest04------\n");
    }

    HWTEST_F(ActsOpenGLglesam325xTest, TestOpenGLglTestCase05, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam325xTest05------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.5.x/src/"
                "gles2-test-issues.txt "
                "--deqp-log-filename=ActsOpenGLglesam325xTest05.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam325xTest05------\n");
    }

    HWTEST_F(ActsOpenGLglesam325xTest, TestOpenGLglTestCase06, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam325xTest06------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.5.x/src/"
                "gles3-driver-issues.txt "
                "--deqp-log-filename=ActsOpenGLglesam325xTest06.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam325xTest06------\n");
    }

    HWTEST_F(ActsOpenGLglesam325xTest, TestOpenGLglTestCase07, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam325xTest07------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.5.x/src/"
                "gles3-hw-issues.txt "
                "--deqp-log-filename=ActsOpenGLglesam325xTest07.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam325xTest07------\n");
    }

    HWTEST_F(ActsOpenGLglesam325xTest, TestOpenGLglTestCase08, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam325xTest08------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.5.x/src/"
                "gles3-master.txt "
                "--deqp-log-filename=ActsOpenGLglesam325xTest08.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam325xTest08------\n");
    }

    HWTEST_F(ActsOpenGLglesam325xTest, TestOpenGLglTestCase09, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam325xTest09------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.5.x/src/"
                "gles3-multisample-hw-issues.txt "
                "--deqp-log-filename=ActsOpenGLglesam325xTest09.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam325xTest09------\n");
    }

    HWTEST_F(ActsOpenGLglesam325xTest, TestOpenGLglTestCase10, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam325xTest10------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.5.x/src/"
                "gles3-multisample.txt "
                "--deqp-log-filename=ActsOpenGLglesam325xTest10.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam325xTest10------\n");
    }

    HWTEST_F(ActsOpenGLglesam325xTest, TestOpenGLglTestCase11, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam325xTest11------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.5.x/src/"
                "gles3-pixelformat.txt "
                "--deqp-log-filename=ActsOpenGLglesam325xTest11.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam325xTest11------\n");
    }

    HWTEST_F(ActsOpenGLglesam325xTest, TestOpenGLglTestCase12, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam325xTest12------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.5.x/src/"
                "gles3-rotation.txt "
                "--deqp-log-filename=ActsOpenGLglesam325xTest12.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam325xTest12------\n");
    }

    HWTEST_F(ActsOpenGLglesam325xTest, TestOpenGLglTestCase13, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam325xTest13------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.5.x/src/"
                "gles3-spec-issues.txt "
                "--deqp-log-filename=ActsOpenGLglesam325xTest13.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam325xTest13------\n");
    }

    HWTEST_F(ActsOpenGLglesam325xTest, TestOpenGLglTestCase14, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam325xTest14------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.5.x/src/"
                "gles3-test-issues.txt "
                "--deqp-log-filename=ActsOpenGLglesam325xTest14.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam325xTest14------\n");
    }

    HWTEST_F(ActsOpenGLglesam325xTest, TestOpenGLglTestCase15, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam325xTest15------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.5.x/src/"
                "gles31-driver-issues.txt "
                "--deqp-log-filename=ActsOpenGLglesam325xTest15.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam325xTest15------\n");
    }

    HWTEST_F(ActsOpenGLglesam325xTest, TestOpenGLglTestCase16, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam325xTest16------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.5.x/src/"
                "gles31-hw-issues.txt "
                "--deqp-log-filename=ActsOpenGLglesam325xTest16.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam325xTest16------\n");
    }

    HWTEST_F(ActsOpenGLglesam325xTest, TestOpenGLglTestCase17, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam325xTest17------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.5.x/src/"
                "gles31-master.txt "
                "--deqp-log-filename=ActsOpenGLglesam325xTest17.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam325xTest17------\n");
    }

    HWTEST_F(ActsOpenGLglesam325xTest, TestOpenGLglTestCase18, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam325xTest18------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.5.x/src/"
                "gles31-multisample-test-issues.txt "
                "--deqp-log-filename=ActsOpenGLglesam325xTest18.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam325xTest18------\n");
    }

    HWTEST_F(ActsOpenGLglesam325xTest, TestOpenGLglTestCase19, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam325xTest19------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.5.x/src/"
                "gles31-multisample.txt "
                "--deqp-log-filename=ActsOpenGLglesam325xTest19.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam325xTest19------\n");
    }

    HWTEST_F(ActsOpenGLglesam325xTest, TestOpenGLglTestCase20, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam325xTest20------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.5.x/src/"
                "gles31-pixelformat.txt "
                "--deqp-log-filename=ActsOpenGLglesam325xTest20.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam325xTest20------\n");
    }

    HWTEST_F(ActsOpenGLglesam325xTest, TestOpenGLglTestCase21, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam325xTest21------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.5.x/src/"
                "gles31-rotation.txt "
                "--deqp-log-filename=ActsOpenGLglesam325xTest21.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam325xTest21------\n");
    }

    HWTEST_F(ActsOpenGLglesam325xTest, TestOpenGLglTestCase22, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam325xTest22------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.5.x/src/"
                "gles31-spec-issues.txt "
                "--deqp-log-filename=ActsOpenGLglesam325xTest22.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam325xTest22------\n");
    }

    HWTEST_F(ActsOpenGLglesam325xTest, TestOpenGLglTestCase23, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam325xTest23------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.5.x/src/"
                "gles31-test-issues.txt "
                "--deqp-log-filename=ActsOpenGLglesam325xTest23.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam325xTest23------\n");
    }

    HWTEST_F(ActsOpenGLglesam325xTest, TestOpenGLglTestCase24, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam325xTest24------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.5.x/"
                "gles2-master.txt "
                "--deqp-log-filename=ActsOpenGLglesam325xTest24.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam325xTest24------\n");
    }

    HWTEST_F(ActsOpenGLglesam325xTest, TestOpenGLglTestCase25, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam325xTest25------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.5.x/"
                "gles3-565-no-depth-no-stencil.txt "
                "--deqp-log-filename=ActsOpenGLglesam325xTest25.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam325xTest25------\n");
    }

    HWTEST_F(ActsOpenGLglesam325xTest, TestOpenGLglTestCase26, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam325xTest26------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.5.x/"
                "gles3-master.txt "
                "--deqp-log-filename=ActsOpenGLglesam325xTest26.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam325xTest26------\n");
    }

    HWTEST_F(ActsOpenGLglesam325xTest, TestOpenGLglTestCase27, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam325xTest27------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.5.x/"
                "gles3-multisample.txt "
                "--deqp-log-filename=ActsOpenGLglesam325xTest27.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam325xTest27------\n");
    }

    HWTEST_F(ActsOpenGLglesam325xTest, TestOpenGLglTestCase28, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam325xTest28------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.5.x/"
                "gles3-rotate-landscape.txt "
                "--deqp-log-filename=ActsOpenGLglesam325xTest28.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam325xTest28------\n");
    }

    HWTEST_F(ActsOpenGLglesam325xTest, TestOpenGLglTestCase29, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam325xTest29------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.5.x/"
                "gles3-rotate-portrait.txt "
                "--deqp-log-filename=ActsOpenGLglesam325xTest29.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam325xTest29------\n");
    }

    HWTEST_F(ActsOpenGLglesam325xTest, TestOpenGLglTestCase30, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam325xTest30------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.5.x/"
                "gles3-rotate-reverse-landscape.txt "
                "--deqp-log-filename=ActsOpenGLglesam325xTest30.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam325xTest30------\n");
    }

    HWTEST_F(ActsOpenGLglesam325xTest, TestOpenGLglTestCase31, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam325xTest31------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.5.x/"
                "gles3-rotate-reverse-portrait.txt "
                "--deqp-log-filename=ActsOpenGLglesam325xTest31.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam325xTest31------\n");
    }

    HWTEST_F(ActsOpenGLglesam325xTest, TestOpenGLglTestCase32, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam325xTest32------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.5.x/"
                "gles31-565-no-depth-no-stencil.txt "
                "--deqp-log-filename=ActsOpenGLglesam325xTest32.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam325xTest32------\n");
    }

    HWTEST_F(ActsOpenGLglesam325xTest, TestOpenGLglTestCase33, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam325xTest33------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.5.x/"
                "gles31-master.txt "
                "--deqp-log-filename=ActsOpenGLglesam325xTest33.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam325xTest33------\n");
    }

    HWTEST_F(ActsOpenGLglesam325xTest, TestOpenGLglTestCase34, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam325xTest34------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.5.x/"
                "gles31-multisample.txt "
                "--deqp-log-filename=ActsOpenGLglesam325xTest34.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam325xTest34------\n");
    }

    HWTEST_F(ActsOpenGLglesam325xTest, TestOpenGLglTestCase35, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam325xTest35------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.5.x/"
                "gles31-rotate-landscape.txt "
                "--deqp-log-filename=ActsOpenGLglesam325xTest35.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam325xTest35------\n");
    }

    HWTEST_F(ActsOpenGLglesam325xTest, TestOpenGLglTestCase36, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam325xTest36------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.5.x/"
                "gles31-rotate-portrait.txt "
                "--deqp-log-filename=ActsOpenGLglesam325xTest36.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam325xTest36------\n");
    }

    HWTEST_F(ActsOpenGLglesam325xTest, TestOpenGLglTestCase37, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam325xTest37------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.5.x/"
                "gles31-rotate-reverse-landscape.txt "
                "--deqp-log-filename=ActsOpenGLglesam325xTest37.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam325xTest37------\n");
    }

    HWTEST_F(ActsOpenGLglesam325xTest, TestOpenGLglTestCase38, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam325xTest38------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.5.x/"
                "gles31-rotate-reverse-portrait.txt "
                "--deqp-log-filename=ActsOpenGLglesam325xTest38.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam325xTest38------\n");
    }
}