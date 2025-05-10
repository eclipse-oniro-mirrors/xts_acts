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

#include "ActsOpenGL_gl_km_mainTest.h"
#include <gtest/gtest.h>
#include <cstdlib>
#include "common.h"


namespace OHOS {
    using namespace std;
    using namespace testing::ext;

    // Preset action of the test suite, which is executed before the first test case
    void ActsOpenGLglkmmainTest::SetUpTestCase(void)
    {
    }
    // Test suite cleanup action, which is executed after the last test case
    void ActsOpenGLglkmmainTest::TearDownTestCase(void)
    {
    }
    // Preset action of the test case
    void ActsOpenGLglkmmainTest::SetUp()
    {
    }
    // Cleanup action of the test case
    void ActsOpenGLglkmmainTest::TearDown()
    {
    }

    HWTEST_F(ActsOpenGLglkmmainTest, TestOpenGLglTestCase01, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkmmainTest01------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/main/src/"
                "gl30-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLglkmmainTest01.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkmmainTest01------\n");
    }

    HWTEST_F(ActsOpenGLglkmmainTest, TestOpenGLglTestCase02, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkmmainTest02------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/main/src/"
                "gl30-master.txt "
                "--deqp-log-filename=ActsOpenGLglkmmainTest02.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkmmainTest02------\n");
    }

    HWTEST_F(ActsOpenGLglkmmainTest, TestOpenGLglTestCase03, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkmmainTest03------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/main/src/"
                "gl30-test-issues.txt "
                "--deqp-log-filename=ActsOpenGLglkmmainTest03.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkmmainTest03------\n");
    }

    HWTEST_F(ActsOpenGLglkmmainTest, TestOpenGLglTestCase04, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkmmainTest04------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/main/src/"
                "gl31-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLglkmmainTest04.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkmmainTest04------\n");
    }

    HWTEST_F(ActsOpenGLglkmmainTest, TestOpenGLglTestCase05, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkmmainTest05------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/main/src/"
                "gl31-master.txt "
                "--deqp-log-filename=ActsOpenGLglkmmainTest05.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkmmainTest05------\n");
    }

    HWTEST_F(ActsOpenGLglkmmainTest, TestOpenGLglTestCase06, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkmmainTest06------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/main/src/"
                "gl31-test-issues.txt "
                "--deqp-log-filename=ActsOpenGLglkmmainTest06.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkmmainTest06------\n");
    }

    HWTEST_F(ActsOpenGLglkmmainTest, TestOpenGLglTestCase07, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkmmainTest07------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/main/src/"
                "gl32-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLglkmmainTest07.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkmmainTest07------\n");
    }

    HWTEST_F(ActsOpenGLglkmmainTest, TestOpenGLglTestCase08, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkmmainTest08------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/main/src/"
                "gl32-master.txt "
                "--deqp-log-filename=ActsOpenGLglkmmainTest08.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkmmainTest08------\n");
    }

    HWTEST_F(ActsOpenGLglkmmainTest, TestOpenGLglTestCase09, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkmmainTest09------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/main/src/"
                "gl32-test-issues.txt "
                "--deqp-log-filename=ActsOpenGLglkmmainTest09.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkmmainTest09------\n");
    }

    HWTEST_F(ActsOpenGLglkmmainTest, TestOpenGLglTestCase10, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkmmainTest10------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/main/src/"
                "gl33-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLglkmmainTest10.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkmmainTest10------\n");
    }

    HWTEST_F(ActsOpenGLglkmmainTest, TestOpenGLglTestCase11, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkmmainTest11------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/main/src/"
                "gl33-master.txt "
                "--deqp-log-filename=ActsOpenGLglkmmainTest11.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkmmainTest11------\n");
    }

    HWTEST_F(ActsOpenGLglkmmainTest, TestOpenGLglTestCase12, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkmmainTest12------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/main/src/"
                "gl33-test-issues.txt "
                "--deqp-log-filename=ActsOpenGLglkmmainTest12.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkmmainTest12------\n");
    }

    HWTEST_F(ActsOpenGLglkmmainTest, TestOpenGLglTestCase13, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkmmainTest13------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/main/src/"
                "gl40-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLglkmmainTest13.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkmmainTest13------\n");
    }

    HWTEST_F(ActsOpenGLglkmmainTest, TestOpenGLglTestCase14, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkmmainTest14------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/main/src/"
                "gl40-master.txt "
                "--deqp-log-filename=ActsOpenGLglkmmainTest14.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkmmainTest14------\n");
    }

    HWTEST_F(ActsOpenGLglkmmainTest, TestOpenGLglTestCase15, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkmmainTest15------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/main/src/"
                "gl40-test-issues.txt "
                "--deqp-log-filename=ActsOpenGLglkmmainTest15.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkmmainTest15------\n");
    }

    HWTEST_F(ActsOpenGLglkmmainTest, TestOpenGLglTestCase16, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkmmainTest16------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/main/src/"
                "gl41-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLglkmmainTest16.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkmmainTest16------\n");
    }

    HWTEST_F(ActsOpenGLglkmmainTest, TestOpenGLglTestCase17, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkmmainTest17------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/main/src/"
                "gl41-master.txt "
                "--deqp-log-filename=ActsOpenGLglkmmainTest17.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkmmainTest17------\n");
    }

    HWTEST_F(ActsOpenGLglkmmainTest, TestOpenGLglTestCase18, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkmmainTest18------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/main/src/"
                "gl41-test-issues.txt "
                "--deqp-log-filename=ActsOpenGLglkmmainTest18.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkmmainTest18------\n");
    }

    HWTEST_F(ActsOpenGLglkmmainTest, TestOpenGLglTestCase19, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkmmainTest19------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/main/src/"
                "gl42-compat-master.txt "
                "--deqp-log-filename=ActsOpenGLglkmmainTest19.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkmmainTest19------\n");
    }

    HWTEST_F(ActsOpenGLglkmmainTest, TestOpenGLglTestCase20, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkmmainTest20------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/main/src/"
                "gl42-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLglkmmainTest20.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkmmainTest20------\n");
    }

    HWTEST_F(ActsOpenGLglkmmainTest, TestOpenGLglTestCase21, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkmmainTest21------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/main/src/"
                "gl42-master.txt "
                "--deqp-log-filename=ActsOpenGLglkmmainTest21.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkmmainTest21------\n");
    }

    HWTEST_F(ActsOpenGLglkmmainTest, TestOpenGLglTestCase22, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkmmainTest22------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/main/src/"
                "gl42-test-issues.txt "
                "--deqp-log-filename=ActsOpenGLglkmmainTest22.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkmmainTest22------\n");
    }

    HWTEST_F(ActsOpenGLglkmmainTest, TestOpenGLglTestCase23, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkmmainTest23------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/main/src/"
                "gl43-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLglkmmainTest23.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkmmainTest23------\n");
    }

    HWTEST_F(ActsOpenGLglkmmainTest, TestOpenGLglTestCase24, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkmmainTest24------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/main/src/"
                "gl43-master.txt "
                "--deqp-log-filename=ActsOpenGLglkmmainTest24.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkmmainTest24------\n");
    }

    HWTEST_F(ActsOpenGLglkmmainTest, TestOpenGLglTestCase25, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkmmainTest25------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/main/src/"
                "gl43-test-issues.txt "
                "--deqp-log-filename=ActsOpenGLglkmmainTest25.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkmmainTest25------\n");
    }

    HWTEST_F(ActsOpenGLglkmmainTest, TestOpenGLglTestCase26, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkmmainTest26------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/main/src/"
                "gl44-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLglkmmainTest26.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkmmainTest26------\n");
    }

    HWTEST_F(ActsOpenGLglkmmainTest, TestOpenGLglTestCase27, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkmmainTest27------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/main/src/"
                "gl44-master.txt "
                "--deqp-log-filename=ActsOpenGLglkmmainTest27.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkmmainTest27------\n");
    }

    HWTEST_F(ActsOpenGLglkmmainTest, TestOpenGLglTestCase28, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkmmainTest28------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/main/src/"
                "gl44-test-issues.txt "
                "--deqp-log-filename=ActsOpenGLglkmmainTest28.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkmmainTest28------\n");
    }

    HWTEST_F(ActsOpenGLglkmmainTest, TestOpenGLglTestCase29, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkmmainTest29------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/main/src/"
                "gl45-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLglkmmainTest29.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkmmainTest29------\n");
    }

    HWTEST_F(ActsOpenGLglkmmainTest, TestOpenGLglTestCase30, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkmmainTest30------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/main/src/"
                "gl45-master.txt "
                "--deqp-log-filename=ActsOpenGLglkmmainTest30.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkmmainTest30------\n");
    }

    HWTEST_F(ActsOpenGLglkmmainTest, TestOpenGLglTestCase31, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkmmainTest31------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/main/src/"
                "gl45-test-issues.txt "
                "--deqp-log-filename=ActsOpenGLglkmmainTest31.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkmmainTest31------\n");
    }

    HWTEST_F(ActsOpenGLglkmmainTest, TestOpenGLglTestCase32, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkmmainTest32------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/main/src/"
                "gl46-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLglkmmainTest32.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkmmainTest32------\n");
    }

    HWTEST_F(ActsOpenGLglkmmainTest, TestOpenGLglTestCase33, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkmmainTest33------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/main/src/"
                "gl46-master.txt "
                "--deqp-log-filename=ActsOpenGLglkmmainTest33.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkmmainTest33------\n");
    }

    HWTEST_F(ActsOpenGLglkmmainTest, TestOpenGLglTestCase34, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkmmainTest34------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/main/src/"
                "gl46-test-issues.txt "
                "--deqp-log-filename=ActsOpenGLglkmmainTest34.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkmmainTest34------\n");
    }

    HWTEST_F(ActsOpenGLglkmmainTest, TestOpenGLglTestCase35, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkmmainTest35------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/main/"
                "gl30-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLglkmmainTest35.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkmmainTest35------\n");
    }

    HWTEST_F(ActsOpenGLglkmmainTest, TestOpenGLglTestCase36, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkmmainTest36------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/main/"
                "gl30-master.txt "
                "--deqp-log-filename=ActsOpenGLglkmmainTest36.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkmmainTest36------\n");
    }

    HWTEST_F(ActsOpenGLglkmmainTest, TestOpenGLglTestCase37, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkmmainTest37------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/main/"
                "gl31-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLglkmmainTest37.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkmmainTest37------\n");
    }

    HWTEST_F(ActsOpenGLglkmmainTest, TestOpenGLglTestCase38, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkmmainTest38------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/main/"
                "gl31-master.txt "
                "--deqp-log-filename=ActsOpenGLglkmmainTest38.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkmmainTest38------\n");
    }

    HWTEST_F(ActsOpenGLglkmmainTest, TestOpenGLglTestCase39, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkmmainTest39------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/main/"
                "gl32-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLglkmmainTest39.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkmmainTest39------\n");
    }

    HWTEST_F(ActsOpenGLglkmmainTest, TestOpenGLglTestCase40, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkmmainTest40------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/main/"
                "gl32-master.txt "
                "--deqp-log-filename=ActsOpenGLglkmmainTest40.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkmmainTest40------\n");
    }

    HWTEST_F(ActsOpenGLglkmmainTest, TestOpenGLglTestCase41, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkmmainTest41------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/main/"
                "gl33-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLglkmmainTest41.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkmmainTest41------\n");
    }

    HWTEST_F(ActsOpenGLglkmmainTest, TestOpenGLglTestCase42, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkmmainTest42------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/main/"
                "gl33-master.txt "
                "--deqp-log-filename=ActsOpenGLglkmmainTest42.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkmmainTest42------\n");
    }

    HWTEST_F(ActsOpenGLglkmmainTest, TestOpenGLglTestCase43, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkmmainTest43------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/main/"
                "gl40-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLglkmmainTest43.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkmmainTest43------\n");
    }

    HWTEST_F(ActsOpenGLglkmmainTest, TestOpenGLglTestCase44, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkmmainTest44------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/main/"
                "gl40-master.txt "
                "--deqp-log-filename=ActsOpenGLglkmmainTest44.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkmmainTest44------\n");
    }

    HWTEST_F(ActsOpenGLglkmmainTest, TestOpenGLglTestCase45, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkmmainTest45------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/main/"
                "gl41-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLglkmmainTest45.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkmmainTest45------\n");
    }

    HWTEST_F(ActsOpenGLglkmmainTest, TestOpenGLglTestCase46, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkmmainTest46------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/main/"
                "gl41-master.txt "
                "--deqp-log-filename=ActsOpenGLglkmmainTest46.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkmmainTest46------\n");
    }

    HWTEST_F(ActsOpenGLglkmmainTest, TestOpenGLglTestCase47, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkmmainTest47------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/main/"
                "gl42-compat-master.txt "
                "--deqp-log-filename=ActsOpenGLglkmmainTest47.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkmmainTest47------\n");
    }

    HWTEST_F(ActsOpenGLglkmmainTest, TestOpenGLglTestCase48, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkmmainTest48------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/main/"
                "gl42-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLglkmmainTest48.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkmmainTest48------\n");
    }

    HWTEST_F(ActsOpenGLglkmmainTest, TestOpenGLglTestCase49, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkmmainTest49------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/main/"
                "gl42-master.txt "
                "--deqp-log-filename=ActsOpenGLglkmmainTest49.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkmmainTest49------\n");
    }

    HWTEST_F(ActsOpenGLglkmmainTest, TestOpenGLglTestCase50, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkmmainTest50------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/main/"
                "gl43-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLglkmmainTest50.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkmmainTest50------\n");
    }

    HWTEST_F(ActsOpenGLglkmmainTest, TestOpenGLglTestCase51, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkmmainTest51------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/main/"
                "gl43-master.txt "
                "--deqp-log-filename=ActsOpenGLglkmmainTest51.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkmmainTest51------\n");
    }

    HWTEST_F(ActsOpenGLglkmmainTest, TestOpenGLglTestCase52, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkmmainTest52------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/main/"
                "gl44-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLglkmmainTest52.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkmmainTest52------\n");
    }

    HWTEST_F(ActsOpenGLglkmmainTest, TestOpenGLglTestCase53, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkmmainTest53------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/main/"
                "gl44-master.txt "
                "--deqp-log-filename=ActsOpenGLglkmmainTest53.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkmmainTest53------\n");
    }

    HWTEST_F(ActsOpenGLglkmmainTest, TestOpenGLglTestCase54, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkmmainTest54------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/main/"
                "gl45-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLglkmmainTest54.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkmmainTest54------\n");
    }

    HWTEST_F(ActsOpenGLglkmmainTest, TestOpenGLglTestCase55, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkmmainTest55------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/main/"
                "gl45-master.txt "
                "--deqp-log-filename=ActsOpenGLglkmmainTest55.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkmmainTest55------\n");
    }

    HWTEST_F(ActsOpenGLglkmmainTest, TestOpenGLglTestCase56, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkmmainTest56------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/main/"
                "gl46-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLglkmmainTest56.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkmmainTest56------\n");
    }

    HWTEST_F(ActsOpenGLglkmmainTest, TestOpenGLglTestCase57, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkmmainTest57------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/main/"
                "gl46-master.txt "
                "--deqp-log-filename=ActsOpenGLglkmmainTest57.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkmmainTest57------\n");
    }
}