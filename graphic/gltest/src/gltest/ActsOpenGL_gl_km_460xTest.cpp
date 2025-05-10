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

#include "ActsOpenGL_gl_km_460xTest.h"
#include <gtest/gtest.h>
#include <cstdlib>
#include "common.h"


namespace OHOS {
    using namespace std;
    using namespace testing::ext;

    // Preset action of the test suite, which is executed before the first test case
    void ActsOpenGLglkm460xTest::SetUpTestCase(void)
    {
    }
    // Test suite cleanup action, which is executed after the last test case
    void ActsOpenGLglkm460xTest::TearDownTestCase(void)
    {
    }
    // Preset action of the test case
    void ActsOpenGLglkm460xTest::SetUp()
    {
    }
    // Cleanup action of the test case
    void ActsOpenGLglkm460xTest::TearDown()
    {
    }

    HWTEST_F(ActsOpenGLglkm460xTest, TestOpenGLglTestCase01, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm460xTest01------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.0.x/src/"
                "gl30-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm460xTest01.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm460xTest01------\n");
    }

    HWTEST_F(ActsOpenGLglkm460xTest, TestOpenGLglTestCase02, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm460xTest02------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.0.x/src/"
                "gl30-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm460xTest02.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm460xTest02------\n");
    }

    HWTEST_F(ActsOpenGLglkm460xTest, TestOpenGLglTestCase03, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm460xTest03------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.0.x/src/"
                "gl31-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm460xTest03.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm460xTest03------\n");
    }

    HWTEST_F(ActsOpenGLglkm460xTest, TestOpenGLglTestCase04, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm460xTest04------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.0.x/src/"
                "gl31-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm460xTest04.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm460xTest04------\n");
    }

    HWTEST_F(ActsOpenGLglkm460xTest, TestOpenGLglTestCase05, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm460xTest05------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.0.x/src/"
                "gl32-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm460xTest05.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm460xTest05------\n");
    }

    HWTEST_F(ActsOpenGLglkm460xTest, TestOpenGLglTestCase06, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm460xTest06------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.0.x/src/"
                "gl32-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm460xTest06.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm460xTest06------\n");
    }

    HWTEST_F(ActsOpenGLglkm460xTest, TestOpenGLglTestCase07, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm460xTest07------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.0.x/src/"
                "gl33-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm460xTest07.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm460xTest07------\n");
    }

    HWTEST_F(ActsOpenGLglkm460xTest, TestOpenGLglTestCase08, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm460xTest08------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.0.x/src/"
                "gl33-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm460xTest08.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm460xTest08------\n");
    }

    HWTEST_F(ActsOpenGLglkm460xTest, TestOpenGLglTestCase09, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm460xTest09------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.0.x/src/"
                "gl40-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm460xTest09.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm460xTest09------\n");
    }

    HWTEST_F(ActsOpenGLglkm460xTest, TestOpenGLglTestCase10, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm460xTest10------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.0.x/src/"
                "gl40-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm460xTest10.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm460xTest10------\n");
    }

    HWTEST_F(ActsOpenGLglkm460xTest, TestOpenGLglTestCase11, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm460xTest11------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.0.x/src/"
                "gl41-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm460xTest11.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm460xTest11------\n");
    }

    HWTEST_F(ActsOpenGLglkm460xTest, TestOpenGLglTestCase12, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm460xTest12------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.0.x/src/"
                "gl41-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm460xTest12.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm460xTest12------\n");
    }

    HWTEST_F(ActsOpenGLglkm460xTest, TestOpenGLglTestCase13, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm460xTest13------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.0.x/src/"
                "gl42-compat-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm460xTest13.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm460xTest13------\n");
    }

    HWTEST_F(ActsOpenGLglkm460xTest, TestOpenGLglTestCase14, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm460xTest14------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.0.x/src/"
                "gl42-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm460xTest14.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm460xTest14------\n");
    }

    HWTEST_F(ActsOpenGLglkm460xTest, TestOpenGLglTestCase15, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm460xTest15------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.0.x/src/"
                "gl42-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm460xTest15.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm460xTest15------\n");
    }

    HWTEST_F(ActsOpenGLglkm460xTest, TestOpenGLglTestCase16, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm460xTest16------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.0.x/src/"
                "gl42-waivers.txt "
                "--deqp-log-filename=ActsOpenGLglkm460xTest16.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm460xTest16------\n");
    }

    HWTEST_F(ActsOpenGLglkm460xTest, TestOpenGLglTestCase17, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm460xTest17------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.0.x/src/"
                "gl43-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm460xTest17.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm460xTest17------\n");
    }

    HWTEST_F(ActsOpenGLglkm460xTest, TestOpenGLglTestCase18, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm460xTest18------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.0.x/src/"
                "gl43-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm460xTest18.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm460xTest18------\n");
    }

    HWTEST_F(ActsOpenGLglkm460xTest, TestOpenGLglTestCase19, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm460xTest19------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.0.x/src/"
                "gl43-waivers.txt "
                "--deqp-log-filename=ActsOpenGLglkm460xTest19.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm460xTest19------\n");
    }

    HWTEST_F(ActsOpenGLglkm460xTest, TestOpenGLglTestCase20, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm460xTest20------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.0.x/src/"
                "gl44-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm460xTest20.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm460xTest20------\n");
    }

    HWTEST_F(ActsOpenGLglkm460xTest, TestOpenGLglTestCase21, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm460xTest21------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.0.x/src/"
                "gl44-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm460xTest21.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm460xTest21------\n");
    }

    HWTEST_F(ActsOpenGLglkm460xTest, TestOpenGLglTestCase22, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm460xTest22------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.0.x/src/"
                "gl44-waivers.txt "
                "--deqp-log-filename=ActsOpenGLglkm460xTest22.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm460xTest22------\n");
    }

    HWTEST_F(ActsOpenGLglkm460xTest, TestOpenGLglTestCase23, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm460xTest23------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.0.x/src/"
                "gl45-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm460xTest23.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm460xTest23------\n");
    }

    HWTEST_F(ActsOpenGLglkm460xTest, TestOpenGLglTestCase24, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm460xTest24------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.0.x/src/"
                "gl45-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm460xTest24.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm460xTest24------\n");
    }

    HWTEST_F(ActsOpenGLglkm460xTest, TestOpenGLglTestCase25, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm460xTest25------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.0.x/src/"
                "gl45-waivers.txt "
                "--deqp-log-filename=ActsOpenGLglkm460xTest25.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm460xTest25------\n");
    }

    HWTEST_F(ActsOpenGLglkm460xTest, TestOpenGLglTestCase26, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm460xTest26------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.0.x/src/"
                "gl46-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm460xTest26.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm460xTest26------\n");
    }

    HWTEST_F(ActsOpenGLglkm460xTest, TestOpenGLglTestCase27, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm460xTest27------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.0.x/src/"
                "gl46-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm460xTest27.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm460xTest27------\n");
    }

    HWTEST_F(ActsOpenGLglkm460xTest, TestOpenGLglTestCase28, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm460xTest28------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.0.x/src/"
                "gl46-waivers.txt "
                "--deqp-log-filename=ActsOpenGLglkm460xTest28.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm460xTest28------\n");
    }

    HWTEST_F(ActsOpenGLglkm460xTest, TestOpenGLglTestCase29, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm460xTest29------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.0.x/gl30-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm460xTest29.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm460xTest29------\n");
    }

    HWTEST_F(ActsOpenGLglkm460xTest, TestOpenGLglTestCase30, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm460xTest30------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.0.x/gl30-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm460xTest30.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm460xTest30------\n");
    }

    HWTEST_F(ActsOpenGLglkm460xTest, TestOpenGLglTestCase31, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm460xTest31------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.0.x/gl31-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm460xTest31.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm460xTest31------\n");
    }

    HWTEST_F(ActsOpenGLglkm460xTest, TestOpenGLglTestCase32, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm460xTest32------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.0.x/gl31-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm460xTest32.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm460xTest32------\n");
    }

    HWTEST_F(ActsOpenGLglkm460xTest, TestOpenGLglTestCase33, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm460xTest33------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.0.x/gl32-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm460xTest33.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm460xTest33------\n");
    }

    HWTEST_F(ActsOpenGLglkm460xTest, TestOpenGLglTestCase34, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm460xTest34------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.0.x/gl32-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm460xTest34.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm460xTest34------\n");
    }

    HWTEST_F(ActsOpenGLglkm460xTest, TestOpenGLglTestCase35, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm460xTest35------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.0.x/gl33-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm460xTest35.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm460xTest35------\n");
    }

    HWTEST_F(ActsOpenGLglkm460xTest, TestOpenGLglTestCase36, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm460xTest36------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.0.x/gl33-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm460xTest36.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm460xTest36------\n");
    }

    HWTEST_F(ActsOpenGLglkm460xTest, TestOpenGLglTestCase37, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm460xTest37------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.0.x/gl40-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm460xTest37.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm460xTest37------\n");
    }

    HWTEST_F(ActsOpenGLglkm460xTest, TestOpenGLglTestCase38, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm460xTest38------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.0.x/gl40-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm460xTest38.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm460xTest38------\n");
    }

    HWTEST_F(ActsOpenGLglkm460xTest, TestOpenGLglTestCase39, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm460xTest39------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.0.x/gl41-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm460xTest39.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm460xTest39------\n");
    }

    HWTEST_F(ActsOpenGLglkm460xTest, TestOpenGLglTestCase40, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm460xTest40------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.0.x/gl41-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm460xTest40.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm460xTest40------\n");
    }

    HWTEST_F(ActsOpenGLglkm460xTest, TestOpenGLglTestCase41, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm460xTest41------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.0.x/"
                "gl42-compat-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm460xTest41.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm460xTest41------\n");
    }

    HWTEST_F(ActsOpenGLglkm460xTest, TestOpenGLglTestCase42, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm460xTest42------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.0.x/gl42-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm460xTest42.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm460xTest42------\n");
    }

    HWTEST_F(ActsOpenGLglkm460xTest, TestOpenGLglTestCase43, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm460xTest43------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.0.x/gl42-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm460xTest43.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm460xTest43------\n");
    }

    HWTEST_F(ActsOpenGLglkm460xTest, TestOpenGLglTestCase44, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm460xTest44------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.0.x/gl43-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm460xTest44.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm460xTest44------\n");
    }

    HWTEST_F(ActsOpenGLglkm460xTest, TestOpenGLglTestCase45, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm460xTest45------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.0.x/gl43-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm460xTest45.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm460xTest45------\n");
    }

    HWTEST_F(ActsOpenGLglkm460xTest, TestOpenGLglTestCase46, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm460xTest46------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.0.x/gl44-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm460xTest46.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm460xTest46------\n");
    }

    HWTEST_F(ActsOpenGLglkm460xTest, TestOpenGLglTestCase47, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm460xTest47------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.0.x/gl44-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm460xTest47.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm460xTest47------\n");
    }

    HWTEST_F(ActsOpenGLglkm460xTest, TestOpenGLglTestCase48, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm460xTest48------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.0.x/gl45-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm460xTest48.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm460xTest48------\n");
    }

    HWTEST_F(ActsOpenGLglkm460xTest, TestOpenGLglTestCase49, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm460xTest49------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.0.x/gl45-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm460xTest49.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm460xTest49------\n");
    }

    HWTEST_F(ActsOpenGLglkm460xTest, TestOpenGLglTestCase50, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm460xTest50------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.0.x/gl46-gtf-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm460xTest50.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm460xTest50------\n");
    }

    HWTEST_F(ActsOpenGLglkm460xTest, TestOpenGLglTestCase51, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGLglkm460xTest51------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass/4.6.0.x/gl46-master.txt "
                "--deqp-log-filename=ActsOpenGLglkm460xTest51.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGLglkm460xTest51------\n");
    }
}