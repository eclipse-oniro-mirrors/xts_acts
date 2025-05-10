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

#include "ActsOpenGL_gles_am_322xTest.h"
#include <gtest/gtest.h>
#include <cstdlib>
#include "common.h"

namespace OHOS {
    using namespace std;
    using namespace testing::ext;

    // Preset action of the test suite, which is executed before the first test case
    void ActsOpenGLglesam322xTest::SetUpTestCase(void)
    {
    }
    // Test suite cleanup action, which is executed after the last test case
    void ActsOpenGLglesam322xTest::TearDownTestCase(void)
    {
    }
    // Preset action of the test case
    void ActsOpenGLglesam322xTest::SetUp()
    {
    }
    // Cleanup action of the test case
    void ActsOpenGLglesam322xTest::TearDown()
    {
    }

    HWTEST_F(ActsOpenGLglesam322xTest, TestOpenGLglTestCase01, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam322xTest01------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.2.x/src/"
                "gles2-master.txt "
                "--deqp-log-filename=ActsOpenGLglesam322xTest01.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam322xTest01------\n");
    }

    HWTEST_F(ActsOpenGLglesam322xTest, TestOpenGLglTestCase02, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam322xTest02------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.2.x/src/"
                "gles3-master.txt "
                "--deqp-log-filename=ActsOpenGLglesam322xTest02.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam322xTest02------\n");
    }

    HWTEST_F(ActsOpenGLglesam322xTest, TestOpenGLglTestCase03, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam322xTest03------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.2.x/src/"
                "gles3-multisample-issues.txt "
                "--deqp-log-filename=ActsOpenGLglesam322xTest03.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam322xTest03------\n");
    }

    HWTEST_F(ActsOpenGLglesam322xTest, TestOpenGLglTestCase04, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam322xTest04------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.2.x/src/"
                "gles3-multisample.txt "
                "--deqp-log-filename=ActsOpenGLglesam322xTest04.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam322xTest04------\n");
    }

    HWTEST_F(ActsOpenGLglesam322xTest, TestOpenGLglTestCase05, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam322xTest05------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.2.x/src/"
                "gles3-pixelformat-issues.txt "
                "--deqp-log-filename=ActsOpenGLglesam322xTest05.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam322xTest05------\n");
    }

    HWTEST_F(ActsOpenGLglesam322xTest, TestOpenGLglTestCase06, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam322xTest06------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.2.x/src/"
                "gles3-pixelformat.txt "
                "--deqp-log-filename=ActsOpenGLglesam322xTest06.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam322xTest06------\n");
    }

    HWTEST_F(ActsOpenGLglesam322xTest, TestOpenGLglTestCase07, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam322xTest07------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.2.x/src/"
                "gles3-rotation.txt "
                "--deqp-log-filename=ActsOpenGLglesam322xTest07.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam322xTest07------\n");
    }

    HWTEST_F(ActsOpenGLglesam322xTest, TestOpenGLglTestCase08, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam322xTest08------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.2.x/src/"
                "gles31-master.txt "
                "--deqp-log-filename=ActsOpenGLglesam322xTest08.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam322xTest08------\n");
    }

    HWTEST_F(ActsOpenGLglesam322xTest, TestOpenGLglTestCase09, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam322xTest09------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.2.x/src/"
                "gles31-multisample.txt "
                "--deqp-log-filename=ActsOpenGLglesam322xTest09.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam322xTest09------\n");
    }

    HWTEST_F(ActsOpenGLglesam322xTest, TestOpenGLglTestCase10, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam322xTest10------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.2.x/src/"
                "gles31-pixelformat.txt "
                "--deqp-log-filename=ActsOpenGLglesam322xTest10.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam322xTest10------\n");
    }

    HWTEST_F(ActsOpenGLglesam322xTest, TestOpenGLglTestCase11, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam322xTest11------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.2.x/src/"
                "gles31-rotation.txt "
                "--deqp-log-filename=ActsOpenGLglesam322xTest11.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam322xTest11------\n");
    }

    HWTEST_F(ActsOpenGLglesam322xTest, TestOpenGLglTestCase12, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam322xTest12------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.2.x/"
                "gles2-master.txt "
                "--deqp-log-filename=ActsOpenGLglesam322xTest12.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam322xTest12------\n");
    }

    HWTEST_F(ActsOpenGLglesam322xTest, TestOpenGLglTestCase13, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam322xTest13------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.2.x/"
                "gles3-565-no-depth-no-stencil.txt "
                "--deqp-log-filename=ActsOpenGLglesam322xTest13.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam322xTest13------\n");
    }

    HWTEST_F(ActsOpenGLglesam322xTest, TestOpenGLglTestCase14, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam322xTest14------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.2.x/"
                "gles3-master.txt "
                "--deqp-log-filename=ActsOpenGLglesam322xTest14.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam322xTest14------\n");
    }

    HWTEST_F(ActsOpenGLglesam322xTest, TestOpenGLglTestCase15, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam322xTest15------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.2.x/"
                "gles3-multisample.txt "
                "--deqp-log-filename=ActsOpenGLglesam322xTest15.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam322xTest15------\n");
    }

    HWTEST_F(ActsOpenGLglesam322xTest, TestOpenGLglTestCase16, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam322xTest16------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.2.x/"
                "gles3-rotate-landscape.txt "
                "--deqp-log-filename=ActsOpenGLglesam322xTest16.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam322xTest16------\n");
    }

    HWTEST_F(ActsOpenGLglesam322xTest, TestOpenGLglTestCase17, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam322xTest17------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.2.x/"
                "gles3-rotate-portrait.txt "
                "--deqp-log-filename=ActsOpenGLglesam322xTest17.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam322xTest17------\n");
    }

    HWTEST_F(ActsOpenGLglesam322xTest, TestOpenGLglTestCase18, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam322xTest18------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.2.x/"
                "gles3-rotate-reverse-landscape.txt "
                "--deqp-log-filename=ActsOpenGLglesam322xTest18.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam322xTest18------\n");
    }

    HWTEST_F(ActsOpenGLglesam322xTest, TestOpenGLglTestCase19, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam322xTest19------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.2.x/"
                "gles3-rotate-reverse-portrait.txt "
                "--deqp-log-filename=ActsOpenGLglesam322xTest19.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam322xTest19------\n");
    }

    HWTEST_F(ActsOpenGLglesam322xTest, TestOpenGLglTestCase20, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam322xTest20------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.2.x/"
                "gles31-565-no-depth-no-stencil.txt "
                "--deqp-log-filename=ActsOpenGLglesam322xTest20.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam322xTest20------\n");
    }

    HWTEST_F(ActsOpenGLglesam322xTest, TestOpenGLglTestCase21, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam322xTest21------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.2.x/"
                "gles31-master.txt "
                "--deqp-log-filename=ActsOpenGLglesam322xTest21.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam322xTest21------\n");
    }

    HWTEST_F(ActsOpenGLglesam322xTest, TestOpenGLglTestCase22, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam322xTest22------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.2.x/"
                "gles31-multisample.txt "
                "--deqp-log-filename=ActsOpenGLglesam322xTest22.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam322xTest22------\n");
    }

    HWTEST_F(ActsOpenGLglesam322xTest, TestOpenGLglTestCase23, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam322xTest23------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.2.x/"
                "gles31-rotate-landscape.txt "
                "--deqp-log-filename=ActsOpenGLglesam322xTest23.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam322xTest23------\n");
    }

    HWTEST_F(ActsOpenGLglesam322xTest, TestOpenGLglTestCase24, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam322xTest24------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.2.x/"
                "gles31-rotate-portrait.txt "
                "--deqp-log-filename=ActsOpenGLglesam322xTest24.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam322xTest24------\n");
    }

    HWTEST_F(ActsOpenGLglesam322xTest, TestOpenGLglTestCase25, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam322xTest25------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.2.x/"
                "gles31-rotate-reverse-landscape.txt "
                "--deqp-log-filename=ActsOpenGLglesam322xTest25.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam322xTest25------\n");
    }

    HWTEST_F(ActsOpenGLglesam322xTest, TestOpenGLglTestCase26, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam322xTest26------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.2.x/"
                "gles31-rotate-reverse-portrait.txt "
                "--deqp-log-filename=ActsOpenGLglesam322xTest26.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam322xTest26------\n");
    }

    HWTEST_F(ActsOpenGLglesam322xTest, TestOpenGLglTestCase27, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam322xTest27------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.2.x/"
                "gles32-565-no-depth-no-stencil.txt "
                "--deqp-log-filename=ActsOpenGLglesam322xTest27.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam322xTest27------\n");
    }

    HWTEST_F(ActsOpenGLglesam322xTest, TestOpenGLglTestCase28, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam322xTest28------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.2.x/"
                "gles32-copy-image.txt "
                "--deqp-log-filename=ActsOpenGLglesam322xTest28.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam322xTest28------\n");
    }

    HWTEST_F(ActsOpenGLglesam322xTest, TestOpenGLglTestCase29, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam322xTest29------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.2.x/"
                "gles32-master.txt "
                "--deqp-log-filename=ActsOpenGLglesam322xTest29.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam322xTest29------\n");
    }

    HWTEST_F(ActsOpenGLglesam322xTest, TestOpenGLglTestCase30, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam322xTest30------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.2.x/"
                "gles32-multisample.txt "
                "--deqp-log-filename=ActsOpenGLglesam322xTest30.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam322xTest30------\n");
    }

    HWTEST_F(ActsOpenGLglesam322xTest, TestOpenGLglTestCase31, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam322xTest31------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.2.x/"
                "gles32-rotate-landscape.txt "
                "--deqp-log-filename=ActsOpenGLglesam322xTest31.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam322xTest31------\n");
    }

    HWTEST_F(ActsOpenGLglesam322xTest, TestOpenGLglTestCase32, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam322xTest32------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.2.x/"
                "gles32-rotate-portrait.txt "
                "--deqp-log-filename=ActsOpenGLglesam322xTest32.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam322xTest32------\n");
    }

    HWTEST_F(ActsOpenGLglesam322xTest, TestOpenGLglTestCase33, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam322xTest33------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.2.x/"
                "gles32-rotate-reverse-landscape.txt "
                "--deqp-log-filename=ActsOpenGLglesam322xTest33.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam322xTest33------\n");
    }

    HWTEST_F(ActsOpenGLglesam322xTest, TestOpenGLglTestCase34, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesam322xTest34------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/3.2.2.x/"
                "gles32-rotate-reverse-portrait.txt "
                "--deqp-log-filename=ActsOpenGLglesam322xTest34.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesam322xTest34------\n");
    }
}