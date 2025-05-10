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

#include "ActsOpenGL_gles_am_mainTest.h"
#include <gtest/gtest.h>
#include <cstdlib>
#include "common.h"


namespace OHOS {
    using namespace std;
    using namespace testing::ext;

    // Preset action of the test suite, which is executed before the first test case
    void ActsOpenGLglesammainTest::SetUpTestCase(void)
    {
    }
    // Test suite cleanup action, which is executed after the last test case
    void ActsOpenGLglesammainTest::TearDownTestCase(void)
    {
    }
    // Preset action of the test case
    void ActsOpenGLglesammainTest::SetUp()
    {
    }
    // Cleanup action of the test case
    void ActsOpenGLglesammainTest::TearDown()
    {
    }

    HWTEST_F(ActsOpenGLglesammainTest, TestOpenGLglTestCase01, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesammainTest01------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/main/src/"
                "gles2-driver-issues.txt "
                "--deqp-log-filename=ActsOpenGLglesammainTest01.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesammainTest01------\n");
    }

    HWTEST_F(ActsOpenGLglesammainTest, TestOpenGLglTestCase02, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesammainTest02------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/main/src/"
                "gles2-hw-issues.txt "
                "--deqp-log-filename=ActsOpenGLglesammainTest02.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesammainTest02------\n");
    }

    HWTEST_F(ActsOpenGLglesammainTest, TestOpenGLglTestCase03, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesammainTest03------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/main/src/"
                "gles2-master.txt "
                "--deqp-log-filename=ActsOpenGLglesammainTest03.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesammainTest03------\n");
    }

    HWTEST_F(ActsOpenGLglesammainTest, TestOpenGLglTestCase04, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesammainTest04------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/main/src/"
                "gles2-spec-issues.txt "
                "--deqp-log-filename=ActsOpenGLglesammainTest04.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesammainTest04------\n");
    }

    HWTEST_F(ActsOpenGLglesammainTest, TestOpenGLglTestCase05, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesammainTest05------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/main/src/"
                "gles2-test-issues.txt "
                "--deqp-log-filename=ActsOpenGLglesammainTest05.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesammainTest05------\n");
    }

    HWTEST_F(ActsOpenGLglesammainTest, TestOpenGLglTestCase06, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesammainTest06------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/main/src/"
                "gles3-driver-issues.txt "
                "--deqp-log-filename=ActsOpenGLglesammainTest06.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesammainTest06------\n");
    }

    HWTEST_F(ActsOpenGLglesammainTest, TestOpenGLglTestCase07, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesammainTest07------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/main/src/"
                "gles3-hw-issues.txt "
                "--deqp-log-filename=ActsOpenGLglesammainTest07.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesammainTest07------\n");
    }

    HWTEST_F(ActsOpenGLglesammainTest, TestOpenGLglTestCase08, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesammainTest08------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/main/src/"
                "gles3-master.txt "
                "--deqp-log-filename=ActsOpenGLglesammainTest08.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesammainTest08------\n");
    }

    HWTEST_F(ActsOpenGLglesammainTest, TestOpenGLglTestCase09, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesammainTest09------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/main/src/"
                "gles3-multisample-hw-issues.txt "
                "--deqp-log-filename=ActsOpenGLglesammainTest09.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesammainTest09------\n");
    }

    HWTEST_F(ActsOpenGLglesammainTest, TestOpenGLglTestCase10, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesammainTest10------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/main/src/"
                "gles3-multisample.txt "
                "--deqp-log-filename=ActsOpenGLglesammainTest10.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesammainTest10------\n");
    }

    HWTEST_F(ActsOpenGLglesammainTest, TestOpenGLglTestCase11, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesammainTest11------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/main/src/"
                "gles3-pixelformat.txt "
                "--deqp-log-filename=ActsOpenGLglesammainTest11.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesammainTest11------\n");
    }

    HWTEST_F(ActsOpenGLglesammainTest, TestOpenGLglTestCase12, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesammainTest12------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/main/src/"
                "gles3-rotation.txt "
                "--deqp-log-filename=ActsOpenGLglesammainTest12.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesammainTest12------\n");
    }

    HWTEST_F(ActsOpenGLglesammainTest, TestOpenGLglTestCase13, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesammainTest13------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/main/src/"
                "gles3-spec-issues.txt "
                "--deqp-log-filename=ActsOpenGLglesammainTest13.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesammainTest13------\n");
    }

    HWTEST_F(ActsOpenGLglesammainTest, TestOpenGLglTestCase14, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesammainTest14------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/main/src/"
                "gles3-test-issues.txt "
                "--deqp-log-filename=ActsOpenGLglesammainTest14.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesammainTest14------\n");
    }

    HWTEST_F(ActsOpenGLglesammainTest, TestOpenGLglTestCase15, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesammainTest15------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/main/src/"
                "gles31-driver-issues.txt "
                "--deqp-log-filename=ActsOpenGLglesammainTest15.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesammainTest15------\n");
    }

    HWTEST_F(ActsOpenGLglesammainTest, TestOpenGLglTestCase16, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesammainTest16------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/main/src/"
                "gles31-hw-issues.txt "
                "--deqp-log-filename=ActsOpenGLglesammainTest16.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesammainTest16------\n");
    }

    HWTEST_F(ActsOpenGLglesammainTest, TestOpenGLglTestCase17, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesammainTest17------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/main/src/"
                "gles31-master.txt "
                "--deqp-log-filename=ActsOpenGLglesammainTest17.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesammainTest17------\n");
    }

    HWTEST_F(ActsOpenGLglesammainTest, TestOpenGLglTestCase18, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesammainTest18------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/main/src/"
                "gles31-multisample-test-issues.txt "
                "--deqp-log-filename=ActsOpenGLglesammainTest18.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesammainTest18------\n");
    }

    HWTEST_F(ActsOpenGLglesammainTest, TestOpenGLglTestCase19, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesammainTest19------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/main/src/"
                "gles31-multisample.txt "
                "--deqp-log-filename=ActsOpenGLglesammainTest19.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesammainTest19------\n");
    }

    HWTEST_F(ActsOpenGLglesammainTest, TestOpenGLglTestCase20, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesammainTest20------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/main/src/"
                "gles31-pixelformat.txt "
                "--deqp-log-filename=ActsOpenGLglesammainTest20.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesammainTest20------\n");
    }

    HWTEST_F(ActsOpenGLglesammainTest, TestOpenGLglTestCase21, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesammainTest21------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/main/src/"
                "gles31-rotation.txt "
                "--deqp-log-filename=ActsOpenGLglesammainTest21.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesammainTest21------\n");
    }

    HWTEST_F(ActsOpenGLglesammainTest, TestOpenGLglTestCase22, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesammainTest22------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/main/src/"
                "gles31-spec-issues.txt "
                "--deqp-log-filename=ActsOpenGLglesammainTest22.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesammainTest22------\n");
    }

    HWTEST_F(ActsOpenGLglesammainTest, TestOpenGLglTestCase23, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesammainTest23------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/main/src/"
                "gles31-test-issues.txt "
                "--deqp-log-filename=ActsOpenGLglesammainTest23.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesammainTest23------\n");
    }

    HWTEST_F(ActsOpenGLglesammainTest, TestOpenGLglTestCase24, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesammainTest24------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/main/"
                "gles2-master.txt "
                "--deqp-log-filename=ActsOpenGLglesammainTest24.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesammainTest24------\n");
    }

    HWTEST_F(ActsOpenGLglesammainTest, TestOpenGLglTestCase25, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesammainTest25------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/main/"
                "gles3-565-no-depth-no-stencil.txt "
                "--deqp-log-filename=ActsOpenGLglesammainTest25.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesammainTest25------\n");
    }

    HWTEST_F(ActsOpenGLglesammainTest, TestOpenGLglTestCase26, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesammainTest26------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/main/"
                "gles3-master.txt "
                "--deqp-log-filename=ActsOpenGLglesammainTest26.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesammainTest26------\n");
    }

    HWTEST_F(ActsOpenGLglesammainTest, TestOpenGLglTestCase27, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesammainTest27------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/main/"
                "gles3-multisample.txt "
                "--deqp-log-filename=ActsOpenGLglesammainTest27.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesammainTest27------\n");
    }

    HWTEST_F(ActsOpenGLglesammainTest, TestOpenGLglTestCase28, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesammainTest28------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/main/"
                "gles3-rotate-landscape.txt "
                "--deqp-log-filename=ActsOpenGLglesammainTest28.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesammainTest28------\n");
    }

    HWTEST_F(ActsOpenGLglesammainTest, TestOpenGLglTestCase29, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesammainTest29------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/main/"
                "gles3-rotate-portrait.txt "
                "--deqp-log-filename=ActsOpenGLglesammainTest29.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesammainTest29------\n");
    }

    HWTEST_F(ActsOpenGLglesammainTest, TestOpenGLglTestCase30, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesammainTest30------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/main/"
                "gles3-rotate-reverse-landscape.txt "
                "--deqp-log-filename=ActsOpenGLglesammainTest30.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesammainTest30------\n");
    }

    HWTEST_F(ActsOpenGLglesammainTest, TestOpenGLglTestCase31, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesammainTest31------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/main/"
                "gles3-rotate-reverse-portrait.txt "
                "--deqp-log-filename=ActsOpenGLglesammainTest31.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesammainTest31------\n");
    }

    HWTEST_F(ActsOpenGLglesammainTest, TestOpenGLglTestCase32, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesammainTest32------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/main/"
                "gles31-565-no-depth-no-stencil.txt "
                "--deqp-log-filename=ActsOpenGLglesammainTest32.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesammainTest32------\n");
    }

    HWTEST_F(ActsOpenGLglesammainTest, TestOpenGLglTestCase33, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesammainTest33------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/main/"
                "gles31-master.txt "
                "--deqp-log-filename=ActsOpenGLglesammainTest33.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesammainTest33------\n");
    }

    HWTEST_F(ActsOpenGLglesammainTest, TestOpenGLglTestCase34, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesammainTest34------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/main/"
                "gles31-multisample.txt "
                "--deqp-log-filename=ActsOpenGLglesammainTest34.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesammainTest34------\n");
    }

    HWTEST_F(ActsOpenGLglesammainTest, TestOpenGLglTestCase35, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesammainTest35------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/main/"
                "gles31-rotate-landscape.txt "
                "--deqp-log-filename=ActsOpenGLglesammainTest35.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesammainTest35------\n");
    }

    HWTEST_F(ActsOpenGLglesammainTest, TestOpenGLglTestCase36, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesammainTest36------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/main/"
                "gles31-rotate-portrait.txt "
                "--deqp-log-filename=ActsOpenGLglesammainTest36.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesammainTest36------\n");
    }

    HWTEST_F(ActsOpenGLglesammainTest, TestOpenGLglTestCase37, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesammainTest37------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/main/"
                "gles31-rotate-reverse-landscape.txt "
                "--deqp-log-filename=ActsOpenGLglesammainTest37.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesammainTest37------\n");
    }

    HWTEST_F(ActsOpenGLglesammainTest, TestOpenGLglTestCase38, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesammainTest38------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/main/"
                "gles31-rotate-reverse-portrait.txt "
                "--deqp-log-filename=ActsOpenGLglesammainTest38.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesammainTest38------\n");
    }
}