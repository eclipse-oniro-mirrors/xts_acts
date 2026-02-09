/*
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

#include "ActsOpenGlMainGl42MasterTest.h"
#include <gtest/gtest.h>
#include <cstdlib>
#include "common.h"
 
 
namespace OHOS {
    using namespace std;
    using namespace testing::ext;

    // Preset action of the test suite, which is executed before the first test case
    void ActsOpenGlMainGl42MasterTest::SetUpTestCase(void)
    {
    }
    // Test suite cleanup action, which is executed after the last test case
    void ActsOpenGlMainGl42MasterTest::TearDownTestCase(void)
    {
    }
    // Preset action of the test case
    void ActsOpenGlMainGl42MasterTest::SetUp()
    {
    }
    // Cleanup action of the test case
    void ActsOpenGlMainGl42MasterTest::TearDown()
    {
    }
    
    /*
     * @tc.number: TestOpenGLmainglTestCase15
     * @tc.name: ActsOpenGlMainGl42MasterTest
     * @tc.desc: test for ActsOpenGlMainGl42MasterTest.
     * @tc.size  : MEDIUMTEST
     * @tc.type  : Function
     * @tc.level : Level 2
     */
    HWTEST_F(ActsOpenGlMainGl42MasterTest, TestOpenGLmainglTestCase03, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGlMainGl42MasterTest------\n");
        int status = 0;
        if (canIUse("SystemCapability.Graphic.Graphic2D.GL4")) {
            setenv("NEED_OPENGL", "1", 1);
            status = system("/data/local/tmp/gl_cts/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/gl_cts/mustpass/gl/khronos_mustpass/main/"
                "gl42-core-master.txt "
                "--deqp-log-filename=ActsOpenGlMainGl42MasterTest.qpa "
                "--deqp-glv4=enable");
        }
        EXPECT_GE(status, 0);
        printf("------end ActsOpenGlMainGl42MasterTest------\n");
    }
}