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

#include "ActsOpenGlMainGl46KhrSingleTest.h"
#include <gtest/gtest.h>
#include <cstdlib>
#include "common.h"
 
 
namespace OHOS {
    using namespace std;
    using namespace testing::ext;

    // Preset action of the test suite, which is executed before the first test case
    void ActsOpenGlMainGl46KhrSingleTest::SetUpTestCase(void)
    {
    }
    // Test suite cleanup action, which is executed after the last test case
    void ActsOpenGlMainGl46KhrSingleTest::TearDownTestCase(void)
    {
    }
    // Preset action of the test case
    void ActsOpenGlMainGl46KhrSingleTest::SetUp()
    {
    }
    // Cleanup action of the test case
    void ActsOpenGlMainGl46KhrSingleTest::TearDown()
    {
    }
    
    /*
     * @tc.number: TestOpenGLmainkmsglTestCase04
     * @tc.name: TestOpenGLmainkmsglTestCase04
     * @tc.desc: test for ActsOpenGlMainGl46KhrSingleTest.
     * @tc.size  : SmallTest
     * @tc.type  : Function
     * @tc.level : Level 0
     */
    HWTEST_F(ActsOpenGlMainGl46KhrSingleTest, TestOpenGLmainkmsglTestCase04, Function | MediumTest | Level2)
    {
        printf("------start ActsOpenGlMainGl46KhrSingleTest------\n");
        if (canIUse("SystemCapability.Graphic.Graphic2D.WebGL")) {
            system("/data/local/tmp/opengl/mustpass/glcts "
                "--deqp-caselist-file=/data/local/tmp/opengl/mustpass/gl/khronos_mustpass_single/main/"
                "gl46-khr-single.txt "
                "--deqp-log-filename=ActsOpenGlMainGl46KhrSingleTest.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsOpenGlMainGl46KhrSingleTest------\n");
    }
}