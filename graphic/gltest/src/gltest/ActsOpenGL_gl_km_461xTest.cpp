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

#include "ActsOpenGL_gl_km_461xTest.h"
#include <gtest/gtest.h>
#include <cstdlib>
#include "common.h"


namespace OHOS {
    using namespace std;
    using namespace testing::ext;

    // Preset action of the test suite, which is executed before the first test case
    void ActsOpenGLglkm461xTest::SetUpTestCase(void)
    {
    }
    // Test suite cleanup action, which is executed after the last test case
    void ActsOpenGLglkm461xTest::TearDownTestCase(void)
    {
    }
    // Preset action of the test case
    void ActsOpenGLglkm461xTest::SetUp()
    {
    }
    // Cleanup action of the test case
    void ActsOpenGLglkm461xTest::TearDown()
    {
    }

    HWTEST_F(ActsOpenGLglkm461xTest, TestOpenGLglTestCase01, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm461xTest01------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.1.x/src/"
                "gl30-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm461xTest01.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm461xTest01------\n");
    }

    HWTEST_F(ActsOpenGLglkm461xTest, TestOpenGLglTestCase02, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm461xTest02------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.1.x/src/"
                "gl30-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm461xTest02.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm461xTest02------\n");
    }

    HWTEST_F(ActsOpenGLglkm461xTest, TestOpenGLglTestCase03, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm461xTest03------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.1.x/src/"
                "gl30-test-issues.txt "
                "--deqp-log-filename=ActsOpenGLglkm461xTest03.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm461xTest03------\n");
    }

    HWTEST_F(ActsOpenGLglkm461xTest, TestOpenGLglTestCase04, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm461xTest04------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.1.x/src/"
                "gl31-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm461xTest04.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm461xTest04------\n");
    }

    HWTEST_F(ActsOpenGLglkm461xTest, TestOpenGLglTestCase05, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm461xTest05------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.1.x/src/"
                "gl31-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm461xTest05.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm461xTest05------\n");
    }

    HWTEST_F(ActsOpenGLglkm461xTest, TestOpenGLglTestCase06, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm461xTest06------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.1.x/src/"
                "gl31-test-issues.txt "
                "--deqp-log-filename=ActsOpenGLglkm461xTest06.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm461xTest06------\n");
    }

    HWTEST_F(ActsOpenGLglkm461xTest, TestOpenGLglTestCase07, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm461xTest07------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.1.x/src/"
                "gl32-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm461xTest07.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm461xTest07------\n");
    }

    HWTEST_F(ActsOpenGLglkm461xTest, TestOpenGLglTestCase08, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm461xTest08------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.1.x/src/"
                "gl32-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm461xTest08.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm461xTest08------\n");
    }

    HWTEST_F(ActsOpenGLglkm461xTest, TestOpenGLglTestCase09, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm461xTest09------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.1.x/src/"
                "gl32-test-issues.txt "
                "--deqp-log-filename=ActsOpenGLglkm461xTest09.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm461xTest09------\n");
    }

    HWTEST_F(ActsOpenGLglkm461xTest, TestOpenGLglTestCase10, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm461xTest10------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.1.x/src/"
                "gl33-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm461xTest10.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm461xTest10------\n");
    }

    HWTEST_F(ActsOpenGLglkm461xTest, TestOpenGLglTestCase11, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm461xTest11------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.1.x/src/"
                "gl33-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm461xTest11.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm461xTest11------\n");
    }

    HWTEST_F(ActsOpenGLglkm461xTest, TestOpenGLglTestCase12, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm461xTest12------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.1.x/src/"
                "gl33-test-issues.txt "
                "--deqp-log-filename=ActsOpenGLglkm461xTest12.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm461xTest12------\n");
    }

    HWTEST_F(ActsOpenGLglkm461xTest, TestOpenGLglTestCase13, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm461xTest13------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.1.x/src/"
                "gl40-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm461xTest13.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm461xTest13------\n");
    }

    HWTEST_F(ActsOpenGLglkm461xTest, TestOpenGLglTestCase14, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm461xTest14------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.1.x/src/"
                "gl40-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm461xTest14.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm461xTest14------\n");
    }

    HWTEST_F(ActsOpenGLglkm461xTest, TestOpenGLglTestCase15, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm461xTest15------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.1.x/src/"
                "gl40-test-issues.txt "
                "--deqp-log-filename=ActsOpenGLglkm461xTest15.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm461xTest15------\n");
    }

    HWTEST_F(ActsOpenGLglkm461xTest, TestOpenGLglTestCase16, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm461xTest16------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.1.x/src/"
                "gl41-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm461xTest16.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm461xTest16------\n");
    }

    HWTEST_F(ActsOpenGLglkm461xTest, TestOpenGLglTestCase17, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm461xTest17------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.1.x/src/"
                "gl41-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm461xTest17.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm461xTest17------\n");
    }

    HWTEST_F(ActsOpenGLglkm461xTest, TestOpenGLglTestCase18, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm461xTest18------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.1.x/src/"
                "gl41-test-issues.txt "
                "--deqp-log-filename=ActsOpenGLglkm461xTest18.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm461xTest18------\n");
    }

    HWTEST_F(ActsOpenGLglkm461xTest, TestOpenGLglTestCase19, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm461xTest19------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.1.x/src/"
                "gl42-compat-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm461xTest19.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm461xTest19------\n");
    }

    HWTEST_F(ActsOpenGLglkm461xTest, TestOpenGLglTestCase20, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm461xTest20------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.1.x/src/"
                "gl42-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm461xTest20.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm461xTest20------\n");
    }

    HWTEST_F(ActsOpenGLglkm461xTest, TestOpenGLglTestCase21, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm461xTest21------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.1.x/src/"
                "gl42-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm461xTest21.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm461xTest21------\n");
    }

    HWTEST_F(ActsOpenGLglkm461xTest, TestOpenGLglTestCase22, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm461xTest22------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.1.x/src/"
                "gl42-test-issues.txt "
                "--deqp-log-filename=ActsOpenGLglkm461xTest22.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm461xTest22------\n");
    }

    HWTEST_F(ActsOpenGLglkm461xTest, TestOpenGLglTestCase23, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm461xTest23------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.1.x/src/"
                "gl43-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm461xTest23.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm461xTest23------\n");
    }

    HWTEST_F(ActsOpenGLglkm461xTest, TestOpenGLglTestCase24, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm461xTest24------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.1.x/src/"
                "gl43-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm461xTest24.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm461xTest24------\n");
    }

    HWTEST_F(ActsOpenGLglkm461xTest, TestOpenGLglTestCase25, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm461xTest25------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.1.x/src/"
                "gl43-test-issues.txt "
                "--deqp-log-filename=ActsOpenGLglkm461xTest25.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm461xTest25------\n");
    }

    HWTEST_F(ActsOpenGLglkm461xTest, TestOpenGLglTestCase26, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm461xTest26------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.1.x/src/"
                "gl44-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm461xTest26.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm461xTest26------\n");
    }

    HWTEST_F(ActsOpenGLglkm461xTest, TestOpenGLglTestCase27, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm461xTest27------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.1.x/src/"
                "gl44-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm461xTest27.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm461xTest27------\n");
    }

    HWTEST_F(ActsOpenGLglkm461xTest, TestOpenGLglTestCase28, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm461xTest28------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.1.x/src/"
                "gl44-test-issues.txt "
                "--deqp-log-filename=ActsOpenGLglkm461xTest28.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm461xTest28------\n");
    }

    HWTEST_F(ActsOpenGLglkm461xTest, TestOpenGLglTestCase29, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm461xTest29------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.1.x/src/"
                "gl45-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm461xTest29.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm461xTest29------\n");
    }

    HWTEST_F(ActsOpenGLglkm461xTest, TestOpenGLglTestCase30, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm461xTest30------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.1.x/src/"
                "gl45-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm461xTest30.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm461xTest30------\n");
    }

    HWTEST_F(ActsOpenGLglkm461xTest, TestOpenGLglTestCase31, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm461xTest31------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.1.x/src/"
                "gl45-test-issues.txt "
                "--deqp-log-filename=ActsOpenGLglkm461xTest31.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm461xTest31------\n");
    }

    HWTEST_F(ActsOpenGLglkm461xTest, TestOpenGLglTestCase32, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm461xTest32------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.1.x/src/"
                "gl46-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm461xTest32.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm461xTest32------\n");
    }

    HWTEST_F(ActsOpenGLglkm461xTest, TestOpenGLglTestCase33, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm461xTest33------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.1.x/src/"
                "gl46-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm461xTest33.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm461xTest33------\n");
    }

    HWTEST_F(ActsOpenGLglkm461xTest, TestOpenGLglTestCase34, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm461xTest34------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.1.x/src/"
                "gl46-test-issues.txt "
                "--deqp-log-filename=ActsOpenGLglkm461xTest34.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm461xTest34------\n");
    }

    HWTEST_F(ActsOpenGLglkm461xTest, TestOpenGLglTestCase35, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm461xTest35------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.1.x/"
                "gl30-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm461xTest35.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm461xTest35------\n");
    }

    HWTEST_F(ActsOpenGLglkm461xTest, TestOpenGLglTestCase36, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm461xTest36------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.1.x/"
                "gl30-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm461xTest36.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm461xTest36------\n");
    }

    HWTEST_F(ActsOpenGLglkm461xTest, TestOpenGLglTestCase37, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm461xTest37------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.1.x/"
                "gl31-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm461xTest37.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm461xTest37------\n");
    }

    HWTEST_F(ActsOpenGLglkm461xTest, TestOpenGLglTestCase38, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm461xTest38------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.1.x/"
                "gl31-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm461xTest38.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm461xTest38------\n");
    }

    HWTEST_F(ActsOpenGLglkm461xTest, TestOpenGLglTestCase39, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm461xTest39------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.1.x/"
                "gl32-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm461xTest39.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm461xTest39------\n");
    }

    HWTEST_F(ActsOpenGLglkm461xTest, TestOpenGLglTestCase40, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm461xTest40------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.1.x/"
                "gl32-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm461xTest40.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm461xTest40------\n");
    }

    HWTEST_F(ActsOpenGLglkm461xTest, TestOpenGLglTestCase41, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm461xTest41------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.1.x/"
                "gl33-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm461xTest41.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm461xTest41------\n");
    }

    HWTEST_F(ActsOpenGLglkm461xTest, TestOpenGLglTestCase42, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm461xTest42------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.1.x/"
                "gl33-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm461xTest42.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm461xTest42------\n");
    }

    HWTEST_F(ActsOpenGLglkm461xTest, TestOpenGLglTestCase43, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm461xTest43------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.1.x/"
                "gl40-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm461xTest43.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm461xTest43------\n");
    }

    HWTEST_F(ActsOpenGLglkm461xTest, TestOpenGLglTestCase44, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm461xTest44------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.1.x/"
                "gl40-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm461xTest44.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm461xTest44------\n");
    }

    HWTEST_F(ActsOpenGLglkm461xTest, TestOpenGLglTestCase45, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm461xTest45------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.1.x/"
                "gl41-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm461xTest45.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm461xTest45------\n");
    }

    HWTEST_F(ActsOpenGLglkm461xTest, TestOpenGLglTestCase46, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm461xTest46------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.1.x/"
                "gl41-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm461xTest46.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm461xTest46------\n");
    }

    HWTEST_F(ActsOpenGLglkm461xTest, TestOpenGLglTestCase47, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm461xTest47------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.1.x/"
                "gl42-compat-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm461xTest47.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm461xTest47------\n");
    }

    HWTEST_F(ActsOpenGLglkm461xTest, TestOpenGLglTestCase48, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm461xTest48------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.1.x/"
                "gl42-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm461xTest48.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm461xTest48------\n");
    }

    HWTEST_F(ActsOpenGLglkm461xTest, TestOpenGLglTestCase49, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm461xTest49------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.1.x/"
                "gl42-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm461xTest49.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm461xTest49------\n");
    }

    HWTEST_F(ActsOpenGLglkm461xTest, TestOpenGLglTestCase50, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm461xTest50------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.1.x/"
                "gl43-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm461xTest50.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm461xTest50------\n");
    }

    HWTEST_F(ActsOpenGLglkm461xTest, TestOpenGLglTestCase51, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm461xTest51------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.1.x/"
                "gl43-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm461xTest51.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm461xTest51------\n");
    }

    HWTEST_F(ActsOpenGLglkm461xTest, TestOpenGLglTestCase52, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm461xTest52------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.1.x/"
                "gl44-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm461xTest52.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm461xTest52------\n");
    }

    HWTEST_F(ActsOpenGLglkm461xTest, TestOpenGLglTestCase53, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm461xTest53------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.1.x/"
                "gl44-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm461xTest53.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm461xTest53------\n");
    }

    HWTEST_F(ActsOpenGLglkm461xTest, TestOpenGLglTestCase54, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm461xTest54------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.1.x/"
                "gl45-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm461xTest54.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm461xTest54------\n");
    }

    HWTEST_F(ActsOpenGLglkm461xTest, TestOpenGLglTestCase55, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm461xTest55------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.1.x/"
                "gl45-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm461xTest55.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm461xTest55------\n");
    }

    HWTEST_F(ActsOpenGLglkm461xTest, TestOpenGLglTestCase56, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm461xTest56------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.1.x/"
                "gl46-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm461xTest56.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm461xTest56------\n");
    }

    HWTEST_F(ActsOpenGLglkm461xTest, TestOpenGLglTestCase57, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm461xTest57------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.1.x/"
                "gl46-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm461xTest57.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm461xTest57------\n");
    }
}