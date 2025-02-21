#!/bin/bash

# Copyright (C) 2021 Huawei Device Co., Ltd.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -e
root_vulkan_path=$1
mkdir -p  "suites/acts/testcases/vulkandata"
cp -rf "$root_vulkan_path/third_party/vk-gl-cts/external/vulkancts/data" "suites/acts/testcases/vulkandata"
cp -rf "$root_vulkan_path/third_party/vk-gl-cts/external/vulkancts/mustpass/main/vk-default" "suites/acts/testcases/vulkandata"
cp -rf "$root_vulkan_path/third_party/vk-gl-cts/external/vulkancts/mustpass/main/src/fraction-mandatory-tests.txt" "suites/acts/testcases/vulkandata/vk-default"
cp -rf "$root_vulkan_path/third_party/vk-gl-cts/external/vulkancts/mustpass/main/src/master.txt" "suites/acts/testcases/vulkandata/vk-default"
cp -rf "$root_vulkan_path/third_party/vk-gl-cts/external/vulkancts/mustpass/main/src/test-issues.txt" "suites/acts/testcases/vulkandata/vk-default"
cp -rf "xts/acts/deqp_vk_execute" "suites/acts/testcases/vulkandata"
cp -rf "xts/acts/deqp_vk_execute" "suites/acts/testcases/vulkandata/vk-default"

tar czvf "vulkandata.tar.gz" -C "suites/acts/testcases/vulkandata" "."
mv "vulkandata.tar.gz" "suites/acts/testcases/vulkandata"

cp -rf "$root_vulkan_path/test/xts/acts/graphic/vktest/genlocal.py" "suites/acts/testcases/vulkandata"
cp -rf "graphic/graphic_2d/libdeqp_ohos_platform.z.so" "suites/acts/testcases/vulkandata"
cp -rf "graphic/graphic_2d/librosen_context.z.so" "suites/acts/testcases/vulkandata"
cp -rf "xts/acts/libdeqp_amber.z.so" "suites/acts/testcases/vulkandata"
cp -rf "graphic/graphic_2d/libdeqp_spirv.z.so" "suites/acts/testcases/vulkandata"
cp -rf "graphic/graphic_2d/libdeqp_spvremapper.z.so" "suites/acts/testcases/vulkandata"
cp -rf "thirdparty/skia/libskia_canvaskit.z.so" "suites/acts/testcases/vulkandata"