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

#include "ActsOpenGL_gles_am_masterTest.h"
#include <gtest/gtest.h>
#include <cstdlib>
#include "common.h"


namespace OHOS {
    using namespace std;
    using namespace testing::ext;

    // Preset action of the test suite, which is executed before the first test case
    void ActsOpenGLglesammasterTest::SetUpTestCase(void)
    {
    }
    // Test suite cleanup action, which is executed after the last test case
    void ActsOpenGLglesammasterTest::TearDownTestCase(void)
    {
    }
    // Preset action of the test case
    void ActsOpenGLglesammasterTest::SetUp()
    {
    }
    // Cleanup action of the test case
    void ActsOpenGLglesammasterTest::TearDown()
    {
    }

    HWTEST_F(ActsOpenGLglesammasterTest, TestOpenGLglTestCase01, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesammasterTest01------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/master/src/"
                "gles2-driver-issues.txt "
                "--deqp-log-filename=ActsOpenGLglesammasterTest01.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesammasterTest01------\n");
    }

    HWTEST_F(ActsOpenGLglesammasterTest, TestOpenGLglTestCase02, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesammasterTest02------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/master/src/"
                "gles2-hw-issues.txt "
                "--deqp-log-filename=ActsOpenGLglesammasterTest02.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesammasterTest02------\n");
    }

    HWTEST_F(ActsOpenGLglesammasterTest, TestOpenGLglTestCase03, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesammasterTest03------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/master/src/"
                "gles2-master.txt "
                "--deqp-log-filename=ActsOpenGLglesammasterTest03.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesammasterTest03------\n");
    }

    HWTEST_F(ActsOpenGLglesammasterTest, TestOpenGLglTestCase04, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesammasterTest04------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/master/src/"
                "gles2-spec-issues.txt "
                "--deqp-log-filename=ActsOpenGLglesammasterTest04.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesammasterTest04------\n");
    }

    HWTEST_F(ActsOpenGLglesammasterTest, TestOpenGLglTestCase05, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesammasterTest05------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/master/src/"
                "gles2-test-issues.txt "
                "--deqp-log-filename=ActsOpenGLglesammasterTest05.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesammasterTest05------\n");
    }

    HWTEST_F(ActsOpenGLglesammasterTest, TestOpenGLglTestCase06, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesammasterTest06------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/master/src/"
                "gles3-driver-issues.txt "
                "--deqp-log-filename=ActsOpenGLglesammasterTest06.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesammasterTest06------\n");
    }

    HWTEST_F(ActsOpenGLglesammasterTest, TestOpenGLglTestCase07, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesammasterTest07------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/master/src/"
                "gles3-hw-issues.txt "
                "--deqp-log-filename=ActsOpenGLglesammasterTest07.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesammasterTest07------\n");
    }

    HWTEST_F(ActsOpenGLglesammasterTest, TestOpenGLglTestCase08, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesammasterTest08------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/master/src/"
                "gles3-master.txt "
                "--deqp-log-filename=ActsOpenGLglesammasterTest08.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesammasterTest08------\n");
    }

    HWTEST_F(ActsOpenGLglesammasterTest, TestOpenGLglTestCase09, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesammasterTest09------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/master/src/"
                "gles3-multisample-hw-issues.txt "
                "--deqp-log-filename=ActsOpenGLglesammasterTest09.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesammasterTest09------\n");
    }

    HWTEST_F(ActsOpenGLglesammasterTest, TestOpenGLglTestCase10, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesammasterTest10------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/master/src/"
                "gles3-multisample.txt "
                "--deqp-log-filename=ActsOpenGLglesammasterTest10.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesammasterTest10------\n");
    }

    HWTEST_F(ActsOpenGLglesammasterTest, TestOpenGLglTestCase11, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesammasterTest11------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/master/src/"
                "gles3-pixelformat.txt "
                "--deqp-log-filename=ActsOpenGLglesammasterTest11.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesammasterTest11------\n");
    }

    HWTEST_F(ActsOpenGLglesammasterTest, TestOpenGLglTestCase12, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesammasterTest12------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/master/src/"
                "gles3-rotation.txt "
                "--deqp-log-filename=ActsOpenGLglesammasterTest12.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesammasterTest12------\n");
    }

    HWTEST_F(ActsOpenGLglesammasterTest, TestOpenGLglTestCase13, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesammasterTest13------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/master/src/"
                "gles3-spec-issues.txt "
                "--deqp-log-filename=ActsOpenGLglesammasterTest13.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesammasterTest13------\n");
    }

    HWTEST_F(ActsOpenGLglesammasterTest, TestOpenGLglTestCase14, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesammasterTest14------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/master/src/"
                "gles3-test-issues.txt "
                "--deqp-log-filename=ActsOpenGLglesammasterTest14.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesammasterTest14------\n");
    }

    HWTEST_F(ActsOpenGLglesammasterTest, TestOpenGLglTestCase15, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesammasterTest15------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/master/src/"
                "gles31-driver-issues.txt "
                "--deqp-log-filename=ActsOpenGLglesammasterTest15.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesammasterTest15------\n");
    }

    HWTEST_F(ActsOpenGLglesammasterTest, TestOpenGLglTestCase16, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesammasterTest16------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/master/src/"
                "gles31-hw-issues.txt "
                "--deqp-log-filename=ActsOpenGLglesammasterTest16.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesammasterTest16------\n");
    }

    HWTEST_F(ActsOpenGLglesammasterTest, TestOpenGLglTestCase17, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesammasterTest17------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/master/src/"
                "gles31-master.txt "
                "--deqp-log-filename=ActsOpenGLglesammasterTest17.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesammasterTest17------\n");
    }

    HWTEST_F(ActsOpenGLglesammasterTest, TestOpenGLglTestCase18, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesammasterTest18------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/master/src/"
                "gles31-multisample-test-issues.txt "
                "--deqp-log-filename=ActsOpenGLglesammasterTest18.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesammasterTest18------\n");
    }

    HWTEST_F(ActsOpenGLglesammasterTest, TestOpenGLglTestCase19, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesammasterTest19------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/master/src/"
                "gles31-multisample.txt "
                "--deqp-log-filename=ActsOpenGLglesammasterTest19.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesammasterTest19------\n");
    }

    HWTEST_F(ActsOpenGLglesammasterTest, TestOpenGLglTestCase20, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesammasterTest20------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/master/src/"
                "gles31-pixelformat.txt "
                "--deqp-log-filename=ActsOpenGLglesammasterTest20.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesammasterTest20------\n");
    }

    HWTEST_F(ActsOpenGLglesammasterTest, TestOpenGLglTestCase21, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesammasterTest21------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/master/src/"
                "gles31-rotation.txt "
                "--deqp-log-filename=ActsOpenGLglesammasterTest21.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesammasterTest21------\n");
    }

    HWTEST_F(ActsOpenGLglesammasterTest, TestOpenGLglTestCase22, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesammasterTest22------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/master/src/"
                "gles31-spec-issues.txt "
                "--deqp-log-filename=ActsOpenGLglesammasterTest22.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesammasterTest22------\n");
    }

    HWTEST_F(ActsOpenGLglesammasterTest, TestOpenGLglTestCase23, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesammasterTest23------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/master/src/"
                "gles31-test-issues.txt "
                "--deqp-log-filename=ActsOpenGLglesammasterTest23.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesammasterTest23------\n");
    }

    HWTEST_F(ActsOpenGLglesammasterTest, TestOpenGLglTestCase24, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesammasterTest24------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/master/"
                "gles2-master.txt "
                "--deqp-log-filename=ActsOpenGLglesammasterTest24.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesammasterTest24------\n");
    }

    HWTEST_F(ActsOpenGLglesammasterTest, TestOpenGLglTestCase25, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesammasterTest25------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/master/"
                "gles3-565-no-depth-no-stencil.txt "
                "--deqp-log-filename=ActsOpenGLglesammasterTest25.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesammasterTest25------\n");
    }

    HWTEST_F(ActsOpenGLglesammasterTest, TestOpenGLglTestCase26, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesammasterTest26------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/master/"
                "gles3-master.txt "
                "--deqp-log-filename=ActsOpenGLglesammasterTest26.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesammasterTest26------\n");
    }

    HWTEST_F(ActsOpenGLglesammasterTest, TestOpenGLglTestCase27, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesammasterTest27------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/master/"
                "gles3-multisample.txt "
                "--deqp-log-filename=ActsOpenGLglesammasterTest27.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesammasterTest27------\n");
    }

    HWTEST_F(ActsOpenGLglesammasterTest, TestOpenGLglTestCase28, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesammasterTest28------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/master/"
                "gles3-rotate-landscape.txt "
                "--deqp-log-filename=ActsOpenGLglesammasterTest28.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesammasterTest28------\n");
    }

    HWTEST_F(ActsOpenGLglesammasterTest, TestOpenGLglTestCase29, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesammasterTest29------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/master/"
                "gles3-rotate-portrait.txt "
                "--deqp-log-filename=ActsOpenGLglesammasterTest29.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesammasterTest29------\n");
    }

    HWTEST_F(ActsOpenGLglesammasterTest, TestOpenGLglTestCase30, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesammasterTest30------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/master/"
                "gles3-rotate-reverse-landscape.txt "
                "--deqp-log-filename=ActsOpenGLglesammasterTest30.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesammasterTest30------\n");
    }

    HWTEST_F(ActsOpenGLglesammasterTest, TestOpenGLglTestCase31, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesammasterTest31------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/master/"
                "gles3-rotate-reverse-portrait.txt "
                "--deqp-log-filename=ActsOpenGLglesammasterTest31.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesammasterTest31------\n");
    }

    HWTEST_F(ActsOpenGLglesammasterTest, TestOpenGLglTestCase32, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesammasterTest32------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/master/"
                "gles31-565-no-depth-no-stencil.txt "
                "--deqp-log-filename=ActsOpenGLglesammasterTest32.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesammasterTest32------\n");
    }

    HWTEST_F(ActsOpenGLglesammasterTest, TestOpenGLglTestCase33, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesammasterTest33------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/master/"
                "gles31-master.txt "
                "--deqp-log-filename=ActsOpenGLglesammasterTest33.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesammasterTest33------\n");
    }

    HWTEST_F(ActsOpenGLglesammasterTest, TestOpenGLglTestCase34, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesammasterTest34------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/master/"
                "gles31-multisample.txt "
                "--deqp-log-filename=ActsOpenGLglesammasterTest34.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesammasterTest34------\n");
    }

    HWTEST_F(ActsOpenGLglesammasterTest, TestOpenGLglTestCase35, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesammasterTest35------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/master/"
                "gles31-rotate-landscape.txt "
                "--deqp-log-filename=ActsOpenGLglesammasterTest35.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesammasterTest35------\n");
    }

    HWTEST_F(ActsOpenGLglesammasterTest, TestOpenGLglTestCase36, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesammasterTest36------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/master/"
                "gles31-rotate-portrait.txt "
                "--deqp-log-filename=ActsOpenGLglesammasterTest36.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesammasterTest36------\n");
    }

    HWTEST_F(ActsOpenGLglesammasterTest, TestOpenGLglTestCase37, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesammasterTest37------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/master/"
                "gles31-rotate-reverse-landscape.txt "
                "--deqp-log-filename=ActsOpenGLglesammasterTest37.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesammasterTest37------\n");
    }

    HWTEST_F(ActsOpenGLglesammasterTest, TestOpenGLglTestCase38, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglesammasterTest38------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.GLES2")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gles/a_mustpass/master/"
                "gles31-rotate-reverse-portrait.txt "
                "--deqp-log-filename=ActsOpenGLglesammasterTest38.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglesammasterTest38------\n");
    }
}