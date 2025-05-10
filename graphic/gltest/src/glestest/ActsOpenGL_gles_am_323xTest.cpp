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

#include "ActsOpenGL_gles_am_323xTest.h"
#include <gtest/gtest.h>
#include <cstdlib>
#include "common.h"

namespace OHOS {
    using namespace std;
    using namespace testing::ext;

    // Preset action of the test suite, which is executed before the first test case
    void ActsOpenGLglesam323xTest::SetUpTestCase(void)
    {
    }
    // Test suite cleanup action, which is executed after the last test case
    void ActsOpenGLglesam323xTest::TearDownTestCase(void)
    {
    }
    // Preset action of the test case
    void ActsOpenGLglesam323xTest::SetUp()
    {
    }
    // Cleanup action of the test case
    void ActsOpenGLglesam323xTest::TearDown()
    {
    }

    HWTEST_F(ActsOpenGLglesam323xTest, TestOpenGLglTestCase01, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam323xTest01------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.3.x/src/"
                "gles2-driver-issues.txt "
                "--deqp-log-filename=ActsOpenGLglesam323xTest01.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam323xTest01------\n");
    }

    HWTEST_F(ActsOpenGLglesam323xTest, TestOpenGLglTestCase02, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam323xTest02------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.3.x/src/"
                "gles2-hw-issues.txt "
                "--deqp-log-filename=ActsOpenGLglesam323xTest02.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam323xTest02------\n");
    }

    HWTEST_F(ActsOpenGLglesam323xTest, TestOpenGLglTestCase03, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam323xTest03------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.3.x/src/"
                "gles2-master.txt "
                "--deqp-log-filename=ActsOpenGLglesam323xTest03.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam323xTest03------\n");
    }

    HWTEST_F(ActsOpenGLglesam323xTest, TestOpenGLglTestCase04, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam323xTest04------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.3.x/src/"
                "gles2-spec-issues.txt "
                "--deqp-log-filename=ActsOpenGLglesam323xTest04.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam323xTest04------\n");
    }

    HWTEST_F(ActsOpenGLglesam323xTest, TestOpenGLglTestCase05, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam323xTest05------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.3.x/src/"
                "gles2-test-issues.txt "
                "--deqp-log-filename=ActsOpenGLglesam323xTest05.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam323xTest05------\n");
    }

    HWTEST_F(ActsOpenGLglesam323xTest, TestOpenGLglTestCase06, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam323xTest06------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.3.x/src/"
                "gles3-driver-issues.txt "
                "--deqp-log-filename=ActsOpenGLglesam323xTest06.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam323xTest06------\n");
    }

    HWTEST_F(ActsOpenGLglesam323xTest, TestOpenGLglTestCase07, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam323xTest07------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.3.x/src/"
                "gles3-hw-issues.txt "
                "--deqp-log-filename=ActsOpenGLglesam323xTest07.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam323xTest07------\n");
    }

    HWTEST_F(ActsOpenGLglesam323xTest, TestOpenGLglTestCase08, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam323xTest08------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.3.x/src/"
                "gles3-master.txt "
                "--deqp-log-filename=ActsOpenGLglesam323xTest08.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam323xTest08------\n");
    }

    HWTEST_F(ActsOpenGLglesam323xTest, TestOpenGLglTestCase09, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam323xTest09------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.3.x/src/"
                "gles3-multisample-hw-issues.txt "
                "--deqp-log-filename=ActsOpenGLglesam323xTest09.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam323xTest09------\n");
    }

    HWTEST_F(ActsOpenGLglesam323xTest, TestOpenGLglTestCase10, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam323xTest10------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.3.x/src/"
                "gles3-multisample.txt "
                "--deqp-log-filename=ActsOpenGLglesam323xTest10.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam323xTest10------\n");
    }

    HWTEST_F(ActsOpenGLglesam323xTest, TestOpenGLglTestCase11, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam323xTest11------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.3.x/src/"
                "gles3-pixelformat.txt "
                "--deqp-log-filename=ActsOpenGLglesam323xTest11.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam323xTest11------\n");
    }

    HWTEST_F(ActsOpenGLglesam323xTest, TestOpenGLglTestCase12, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam323xTest12------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.3.x/src/"
                "gles3-rotation.txt "
                "--deqp-log-filename=ActsOpenGLglesam323xTest12.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam323xTest12------\n");
    }

    HWTEST_F(ActsOpenGLglesam323xTest, TestOpenGLglTestCase13, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam323xTest13------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.3.x/src/"
                "gles3-spec-issues.txt "
                "--deqp-log-filename=ActsOpenGLglesam323xTest13.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam323xTest13------\n");
    }

    HWTEST_F(ActsOpenGLglesam323xTest, TestOpenGLglTestCase14, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam323xTest14------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.3.x/src/"
                "gles3-test-issues.txt "
                "--deqp-log-filename=ActsOpenGLglesam323xTest14.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam323xTest14------\n");
    }

    HWTEST_F(ActsOpenGLglesam323xTest, TestOpenGLglTestCase15, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam323xTest15------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.3.x/src/"
                "gles31-driver-issues.txt "
                "--deqp-log-filename=ActsOpenGLglesam323xTest15.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam323xTest15------\n");
    }

    HWTEST_F(ActsOpenGLglesam323xTest, TestOpenGLglTestCase16, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam323xTest16------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.3.x/src/"
                "gles31-hw-issues.txt "
                "--deqp-log-filename=ActsOpenGLglesam323xTest16.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam323xTest16------\n");
    }

    HWTEST_F(ActsOpenGLglesam323xTest, TestOpenGLglTestCase17, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam323xTest17------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.3.x/src/"
                "gles31-master.txt "
                "--deqp-log-filename=ActsOpenGLglesam323xTest17.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam323xTest17------\n");
    }

    HWTEST_F(ActsOpenGLglesam323xTest, TestOpenGLglTestCase18, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam323xTest18------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.3.x/src/"
                "gles31-multisample-test-issues.txt "
                "--deqp-log-filename=ActsOpenGLglesam323xTest18.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam323xTest18------\n");
    }

    HWTEST_F(ActsOpenGLglesam323xTest, TestOpenGLglTestCase19, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam323xTest19------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.3.x/src/"
                "gles31-multisample.txt "
                "--deqp-log-filename=ActsOpenGLglesam323xTest19.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam323xTest19------\n");
    }

    HWTEST_F(ActsOpenGLglesam323xTest, TestOpenGLglTestCase20, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam323xTest20------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.3.x/src/"
                "gles31-pixelformat.txt "
                "--deqp-log-filename=ActsOpenGLglesam323xTest20.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam323xTest20------\n");
    }

    HWTEST_F(ActsOpenGLglesam323xTest, TestOpenGLglTestCase21, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam323xTest21------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.3.x/src/"
                "gles31-rotation.txt "
                "--deqp-log-filename=ActsOpenGLglesam323xTest21.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam323xTest21------\n");
    }

    HWTEST_F(ActsOpenGLglesam323xTest, TestOpenGLglTestCase22, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam323xTest22------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.3.x/src/"
                "gles31-spec-issues.txt "
                "--deqp-log-filename=ActsOpenGLglesam323xTest22.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam323xTest22------\n");
    }

    HWTEST_F(ActsOpenGLglesam323xTest, TestOpenGLglTestCase23, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam323xTest23------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.3.x/src/"
                "gles31-test-issues.txt "
                "--deqp-log-filename=ActsOpenGLglesam323xTest23.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam323xTest23------\n");
    }

    HWTEST_F(ActsOpenGLglesam323xTest, TestOpenGLglTestCase24, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam323xTest24------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.3.x/"
                "gles2-master.txt "
                "--deqp-log-filename=ActsOpenGLglesam323xTest24.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam323xTest24------\n");
    }

    HWTEST_F(ActsOpenGLglesam323xTest, TestOpenGLglTestCase25, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam323xTest25------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.3.x/"
                "gles3-565-no-depth-no-stencil.txt "
                "--deqp-log-filename=ActsOpenGLglesam323xTest25.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam323xTest25------\n");
    }

    HWTEST_F(ActsOpenGLglesam323xTest, TestOpenGLglTestCase26, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam323xTest26------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.3.x/"
                "gles3-master.txt "
                "--deqp-log-filename=ActsOpenGLglesam323xTest26.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam323xTest26------\n");
    }

    HWTEST_F(ActsOpenGLglesam323xTest, TestOpenGLglTestCase27, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam323xTest27------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.3.x/"
                "gles3-multisample.txt "
                "--deqp-log-filename=ActsOpenGLglesam323xTest27.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam323xTest27------\n");
    }

    HWTEST_F(ActsOpenGLglesam323xTest, TestOpenGLglTestCase28, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam323xTest28------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.3.x/"
                "gles3-rotate-landscape.txt "
                "--deqp-log-filename=ActsOpenGLglesam323xTest28.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam323xTest28------\n");
    }

    HWTEST_F(ActsOpenGLglesam323xTest, TestOpenGLglTestCase29, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam323xTest29------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.3.x/"
                "gles3-rotate-portrait.txt "
                "--deqp-log-filename=ActsOpenGLglesam323xTest29.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam323xTest29------\n");
    }

    HWTEST_F(ActsOpenGLglesam323xTest, TestOpenGLglTestCase30, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam323xTest30------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.3.x/"
                "gles3-rotate-reverse-landscape.txt "
                "--deqp-log-filename=ActsOpenGLglesam323xTest30.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam323xTest30------\n");
    }

    HWTEST_F(ActsOpenGLglesam323xTest, TestOpenGLglTestCase31, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam323xTest31------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.3.x/"
                "gles3-rotate-reverse-portrait.txt "
                "--deqp-log-filename=ActsOpenGLglesam323xTest31.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam323xTest31------\n");
    }

    HWTEST_F(ActsOpenGLglesam323xTest, TestOpenGLglTestCase32, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam323xTest32------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.3.x/"
                "gles31-565-no-depth-no-stencil.txt "
                "--deqp-log-filename=ActsOpenGLglesam323xTest32.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam323xTest32------\n");
    }

    HWTEST_F(ActsOpenGLglesam323xTest, TestOpenGLglTestCase33, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam323xTest33------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.3.x/"
                "gles31-master.txt "
                "--deqp-log-filename=ActsOpenGLglesam323xTest33.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam323xTest33------\n");
    }

    HWTEST_F(ActsOpenGLglesam323xTest, TestOpenGLglTestCase34, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam323xTest34------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.3.x/"
                "gles31-multisample.txt "
                "--deqp-log-filename=ActsOpenGLglesam323xTest34.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam323xTest34------\n");
    }

    HWTEST_F(ActsOpenGLglesam323xTest, TestOpenGLglTestCase35, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam323xTest35------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.3.x/"
                "gles31-rotate-landscape.txt "
                "--deqp-log-filename=ActsOpenGLglesam323xTest35.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam323xTest35------\n");
    }

    HWTEST_F(ActsOpenGLglesam323xTest, TestOpenGLglTestCase36, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam323xTest36------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.3.x/"
                "gles31-rotate-portrait.txt "
                "--deqp-log-filename=ActsOpenGLglesam323xTest36.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam323xTest36------\n");
    }

    HWTEST_F(ActsOpenGLglesam323xTest, TestOpenGLglTestCase37, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam323xTest37------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.3.x/"
                "gles31-rotate-reverse-landscape.txt "
                "--deqp-log-filename=ActsOpenGLglesam323xTest37.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam323xTest37------\n");
    }

    HWTEST_F(ActsOpenGLglesam323xTest, TestOpenGLglTestCase38, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam323xTest38------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.3.x/"
                "gles31-rotate-reverse-portrait.txt "
                "--deqp-log-filename=ActsOpenGLglesam323xTest38.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam323xTest38------\n");
    }
}