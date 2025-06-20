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

#include <climits>
#include <gtest/gtest.h>
#include "../Gl42masterBaseFunc.h"
#include "../ActsGl42master0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003384,
    "KHR-GL42.shaders.uniform_block.multi_basic_types.single_buffer.shared_mixed");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003385,
    "KHR-GL42.shaders.uniform_block.multi_basic_types.single_buffer.shared_both");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003386,
    "KHR-GL42.shaders.uniform_block.multi_basic_types.single_buffer.shared_instance_array_mixed");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003387,
    "KHR-GL42.shaders.uniform_block.multi_basic_types.single_buffer.shared_instance_array_both");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003388,
    "KHR-GL42.shaders.uniform_block.multi_basic_types.single_buffer.packed_mixed");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003389,
    "KHR-GL42.shaders.uniform_block.multi_basic_types.single_buffer.packed_instance_array_mixed");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003390,
    "KHR-GL42.shaders.uniform_block.multi_basic_types.single_buffer.std140_mixed");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003391,
    "KHR-GL42.shaders.uniform_block.multi_basic_types.single_buffer.std140_both");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003392,
    "KHR-GL42.shaders.uniform_block.multi_basic_types.single_buffer.std140_instance_array_mixed");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003393,
    "KHR-GL42.shaders.uniform_block.multi_basic_types.single_buffer.std140_instance_array_both");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003404,
    "KHR-GL42.shaders.uniform_block.multi_nested_struct.single_buffer.shared_mixed");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003405,
    "KHR-GL42.shaders.uniform_block.multi_nested_struct.single_buffer.shared_both");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003406,
    "KHR-GL42.shaders.uniform_block.multi_nested_struct.single_buffer.shared_instance_array_mixed");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003407,
    "KHR-GL42.shaders.uniform_block.multi_nested_struct.single_buffer.shared_instance_array_both");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003408,
    "KHR-GL42.shaders.uniform_block.multi_nested_struct.single_buffer.packed_mixed");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003409,
    "KHR-GL42.shaders.uniform_block.multi_nested_struct.single_buffer.packed_instance_array_mixed");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003410,
    "KHR-GL42.shaders.uniform_block.multi_nested_struct.single_buffer.std140_mixed");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003411,
    "KHR-GL42.shaders.uniform_block.multi_nested_struct.single_buffer.std140_both");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003412,
    "KHR-GL42.shaders.uniform_block.multi_nested_struct.single_buffer.std140_instance_array_mixed");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_003413,
    "KHR-GL42.shaders.uniform_block.multi_nested_struct.single_buffer.std140_instance_array_both");
