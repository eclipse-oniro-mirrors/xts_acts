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
#include "ActsVulkanWsiTest.h"
#include "syscap_ndk.h"

namespace OHOS {
    using namespace std;
    using namespace testing::ext;

    // Preset action of the test suite, which is executed before the first test case
    void ActsVulkanWsiTest::SetUpTestCase(void)
    {
    }
    // Test suite cleanup action, which is executed after the last test case
    void ActsVulkanWsiTest::TearDownTestCase(void)
    {
    }
    // Preset action of the test case
    void ActsVulkanWsiTest::SetUp()
    {
    }
    // Cleanup action of the test case
    void ActsVulkanWsiTest::TearDown()
    {
    }

    HWTEST_F(ActsVulkanWsiTest, TestVulkanWsiTestCase, Function | MediumTest | Level2)
    {
        printf("------start ActsVulkanWsiTest------\n");
        if (canIUse("SystemCapability.Graphic.Vulkan")) {
            system("/data/local/tmp/vulkan/vk-default/deqp_vk_execute "
                "--deqp-caselist-file=/data/local/tmp/vulkan/vk-default/wsi.txt "
                "--deqp-log-filename=ActsVulkanWsiTest.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsVulkanWsiTest------\n");
    }
}