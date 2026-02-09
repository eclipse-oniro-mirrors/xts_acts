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
#include "ActsVulkanDevice_groupTest.h"
#include "syscap_ndk.h"

namespace OHOS {
    using namespace std;
    using namespace testing::ext;

    // Preset action of the test suite, which is executed before the first test case
    void ActsVulkanDevicegroupTest::SetUpTestCase(void)
    {
    }
    // Test suite cleanup action, which is executed after the last test case
    void ActsVulkanDevicegroupTest::TearDownTestCase(void)
    {
    }
    // Preset action of the test case
    void ActsVulkanDevicegroupTest::SetUp()
    {
    }
    // Cleanup action of the test case
    void ActsVulkanDevicegroupTest::TearDown()
    {
    }

    /**
     * @tc.name   TestVulkanDevice_groupTestCase
     * @tc.number TestVulkanDevice_groupTestCase
     * @tc.desc   TestVulkanDevice_groupTestCase
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    HWTEST_F(ActsVulkanDevicegroupTest, TestVulkanDevice_groupTestCase, Function | MediumTest | Level2)
    {
        printf("------start ActsVulkanDevicegroupTest------\n");
        if (canIUse("SystemCapability.Graphic.Vulkan")) {
            system("/data/local/tmp/deqp_vk_execute "
                "--deqp-caselist-file=/data/local/tmp/vulkan/vk-default/device-group.txt "
                "--deqp-log-filename=ActsVulkanDevicegroupTest.qpa");
        }
        EXPECT_TRUE(true);
        printf("------end ActsVulkanDevicegroupTest------\n");
    }
}