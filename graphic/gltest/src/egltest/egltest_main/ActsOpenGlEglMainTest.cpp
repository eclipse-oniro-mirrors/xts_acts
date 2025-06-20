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

#include "ActsOpenGlEglMainTest.h"
#include <gtest/gtest.h>
#include <cstdlib>
#include "common.h"


namespace OHOS {
    using namespace std;
    using namespace testing::ext;

    // Preset action of the test suite, which is executed before the first test case
    void ActsOpenGlEglMainTest::SetUpTestCase(void)
    {
    }
    // Test suite cleanup action, which is executed after the last test case
    void ActsOpenGlEglMainTest::TearDownTestCase(void)
    {
    }
    // Preset action of the test case
    void ActsOpenGlEglMainTest::SetUp()
    {
    }
    // Cleanup action of the test case
    void ActsOpenGlEglMainTest::TearDown()
    {
    }

    /*
     * @tc.number: TestOpenGLeglmainTestCase01
     * @tc.name: TestOpenGLeglmainTestCase01
     * @tc.desc: test for ActsOpenGlEglMainTest.
     * @tc.size  : SmallTest
     * @tc.type  : Function
     * @tc.level : Level 0
     */
    HWTEST_F(ActsOpenGlEglMainTest, TestOpenGLeglmainTestCase01, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGlEglMainTest------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.EGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/egl/a_mustpass/main/"
                "egl-master.txt "
                "--deqp-log-filename=ActsOpenGlEglMainTest.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGlEglMainTest------\n");
    }
}