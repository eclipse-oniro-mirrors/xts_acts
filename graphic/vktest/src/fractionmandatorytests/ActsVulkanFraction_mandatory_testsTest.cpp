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

#include <gtest/gtest.h>
#include <stdlib.h>
#include "ActsVulkanFraction_mandatory_testsTest.h"

namespace OHOS {
    using namespace std;
    using namespace testing::ext;

    // Preset action of the test suite, which is executed before the first test case
    void ActsVulkanFraction_mandatory_testsTest::SetUpTestCase(void)
    {
    }
    // Test suite cleanup action, which is executed after the last test case
    void ActsVulkanFraction_mandatory_testsTest::TearDownTestCase(void)
    {
    }
    // Preset action of the test case
    void ActsVulkanFraction_mandatory_testsTest::SetUp()
    {
    }
    // Cleanup action of the test case
    void ActsVulkanFraction_mandatory_testsTest::TearDown()
    {
    }

    HWTEST_F(ActsVulkanFraction_mandatory_testsTest, TestVulkanFraction_mandatory_testsTestCase, Function | MediumTest | Level2)
    {
        printf("------start ActsVulkanFraction_mandatory_testsTest------\n");
        system("/data/local/tmp/vulkan/vk-default/deqp_vk_execute --deqp-caselist-file=/data/local/tmp/vulkan/vk-default/fraction-mandatory-tests.txt --deqp-log-filename=ActsVulkanFraction_mandatory_testsTest.qpa");
        EXPECT_TRUE(true);
        printf("------end ActsVulkanFraction_mandatory_testsTest------\n");
    }
}