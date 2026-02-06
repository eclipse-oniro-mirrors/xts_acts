/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, Hardware
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef VULKAN_TEST_H
#define VULKAN_TEST_H

namespace vulkan {
namespace loader {

int LoadBaseFuncPtrTest();
int LoadInstanceFuncPtrTest();
int VkEnumeratePhysicalDevicesTest();
int VkCreateDeviceTest();
int GetNativeBufferPropertiesOhosTest();
int GetMemoryNativeBufferOhosTest();

} // namespace loader
} // namespace vulkan

#endif
