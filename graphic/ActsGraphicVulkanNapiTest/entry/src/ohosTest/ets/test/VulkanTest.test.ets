/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, TestType, Size, Level, it } from "@ohos/hypium"
import { hilog } from "@kit.PerformanceAnalysisKit"
import graphic_vulkan_napi_test from 'libgraphic_vulkan_napi_test.so'

export default function VulkanLoaderUnitTest() {
  describe('VulkanLoaderUnitTest', () => {
    beforeAll(() => {
      hilog.info(0x0000, 'testTag', 'VulkanLoaderUnitTest beforeAll');
    })
    beforeEach(() => {
      hilog.info(0x0000, 'testTag', 'VulkanLoaderUnitTest beforeEach');
    })
    afterEach(() => {
      hilog.info(0x0000, 'testTag', 'VulkanLoaderUnitTest afterEach');
    })
    afterAll(() => {
      hilog.info(0x0000, 'testTag', 'VulkanLoaderUnitTest afterAll');
    })

    /**
     * @tc.name   LoadBaseFuncPtr
     * @tc.number LoadBaseFuncPtr
     * @tc.desc   测试加载Vulkan基础函数指针，验证基础功能是否正常工作
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.Level  LEVEL1
     */
    it('LoadBaseFuncPtr', Level.LEVEL1, () => {
      hilog.info(0x0000, 'testTag', 'LoadBaseFuncPtr begin');
      const result = graphic_vulkan_napi_test.vulkanTest(0);
      hilog.info(0x0000, 'testTag', 'LoadBaseFuncPtr result: %{public}d', result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   LoadInstanceFuncPtr
     * @tc.number LoadInstanceFuncPtr
     * @tc.desc   测试加载Vulkan实例函数指针，验证实例相关功能是否正常工作
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.Level  LEVEL1
     */
    it('LoadInstanceFuncPtr', Level.LEVEL1, () => {
      hilog.info(0x0000, 'testTag', 'LoadInstanceFuncPtr begin');
      const result = graphic_vulkan_napi_test.vulkanTest(1);
      hilog.info(0x0000, 'testTag', 'LoadInstanceFuncPtr result: %{public}d', result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   vkEnumeratePhysicalDevices_Test
     * @tc.number vkEnumeratePhysicalDevices_Test
     * @tc.desc   测试vkEnumeratePhysicalDevices接口，验证物理设备枚举功能是否正常工作
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.Level  LEVEL1
     */
    it('vkEnumeratePhysicalDevices_Test', Level.LEVEL1, () => {
      hilog.info(0x0000, 'testTag', 'vkEnumeratePhysicalDevices_Test begin');
      const result = graphic_vulkan_napi_test.vulkanTest(2);
      hilog.info(0x0000, 'testTag', 'vkEnumeratePhysicalDevices_Test result: %{public}d', result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   vkCreateDevice_Test
     * @tc.number vkCreateDevice_Test
     * @tc.desc   测试vkCreateDevice接口，验证Vulkan设备创建功能是否正常工作
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.Level  LEVEL1
     */
    it('vkCreateDevice_Test', Level.LEVEL1, () => {
      hilog.info(0x0000, 'testTag', 'vkCreateDevice_Test begin');
      const result = graphic_vulkan_napi_test.vulkanTest(3);
      hilog.info(0x0000, 'testTag', 'vkCreateDevice_Test result: %{public}d', result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   getNativeBufferPropertiesOHOS_Test
     * @tc.number getNativeBufferPropertiesOHOS_Test
     * @tc.desc   测试getNativeBufferPropertiesOHOS接口，验证获取本地缓冲区属性功能是否正常工作
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.Level  LEVEL1
     */
    it('getNativeBufferPropertiesOHOS_Test', Level.LEVEL1, () => {
      hilog.info(0x0000, 'testTag', 'getNativeBufferPropertiesOHOS_Test begin');
      const result = graphic_vulkan_napi_test.vulkanTest(4);
      hilog.info(0x0000, 'testTag', 'getNativeBufferPropertiesOHOS_Test result: %{public}d', result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   getMemoryNativeBufferOHOS_Test
     * @tc.number getMemoryNativeBufferOHOS_Test
     * @tc.desc   测试getMemoryNativeBufferOHOS接口，验证获取本地缓冲区内存功能是否正常工作
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.Level  LEVEL1
     */
    it('getMemoryNativeBufferOHOS_Test', Level.LEVEL1, () => {
      hilog.info(0x0000, 'testTag', 'getMemoryNativeBufferOHOS_Test begin');
      const result = graphic_vulkan_napi_test.vulkanTest(5);
      hilog.info(0x0000, 'testTag', 'getMemoryNativeBufferOHOS_Test result: %{public}d', result);
      expect(result).assertEqual(0);
    })
  })
}

