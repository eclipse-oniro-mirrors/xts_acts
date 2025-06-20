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

#include "ActsOpenGlEgl325xTest.h"
#include <gtest/gtest.h>
#include <cstdlib>
#include "common.h"


namespace OHOS {
    using namespace std;
    using namespace testing::ext;

    // Preset action of the test suite, which is executed before the first test case
    void ActsOpenGlEgl325xTest::SetUpTestCase(void)
    {
    }
    // Test suite cleanup action, which is executed after the last test case
    void ActsOpenGlEgl325xTest::TearDownTestCase(void)
    {
    }
    // Preset action of the test case
    void ActsOpenGlEgl325xTest::SetUp()
    {
    }
    // Cleanup action of the test case
    void ActsOpenGlEgl325xTest::TearDown()
    {
    }

    /*
     * @tc.number: TestOpenGLegl325xTestCase01
     * @tc.name: TestOpenGLegl325xTestCase01
     * @tc.desc: test for ActsOpenGlEgl325xTest.
     * @tc.size  : SmallTest
     * @tc.type  : Function
     * @tc.level : Level 0
     */
    HWTEST_F(ActsOpenGlEgl325xTest, TestOpenGLegl325xTestCase01, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGlEgl325xTest------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.EGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/egl/a_mustpass/3.2.5.x/"
                "egl-master.txt "
                "--deqp-log-filename=ActsOpenGlEgl325xTest.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGlEgl325xTest------\n");
    }
}