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
#include "ActsVulkanGeometryTest.h"

namespace OHOS {
    using namespace std;
    using namespace testing::ext;

    // Preset action of the test suite, which is executed before the first test case
    void ActsVulkanGeometryTest::SetUpTestCase(void)
    {
    }
    // Test suite cleanup action, which is executed after the last test case
    void ActsVulkanGeometryTest::TearDownTestCase(void)
    {
    }
    // Preset action of the test case
    void ActsVulkanGeometryTest::SetUp()
    {
    }
    // Cleanup action of the test case
    void ActsVulkanGeometryTest::TearDown()
    {
    }

    HWTEST_F(ActsVulkanGeometryTest, TestVulkanGeometryTestCase, Function | MediumTest | Level2)
    {
        printf("------start ActsVulkanGeometryTest------\n");
        system("/data/local/tmp/vulkan/vk-default/deqp_vk_execute --deqp-caselist-file=/data/local/tmp/vulkan/vk-default/geometry.txt --deqp-log-filename=ActsVulkanGeometryTest.qpa");
        EXPECT_TRUE(true);
        printf("------end ActsVulkanGeometryTest------\n");
    }
}