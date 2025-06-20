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
#include "../Gl43masterBaseFunc.h"
#include "../ActsGl43master0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003374,
    "KHR-GL43.shaders.uniform_block.multi_basic_types.per_block_buffer.shared_mixed");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003375,
    "KHR-GL43.shaders.uniform_block.multi_basic_types.per_block_buffer.shared_both");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003376,
    "KHR-GL43.shaders.uniform_block.multi_basic_types.per_block_buffer.shared_instance_array_mixed");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003377,
    "KHR-GL43.shaders.uniform_block.multi_basic_types.per_block_buffer.shared_instance_array_both");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003378,
    "KHR-GL43.shaders.uniform_block.multi_basic_types.per_block_buffer.packed_mixed");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003379,
    "KHR-GL43.shaders.uniform_block.multi_basic_types.per_block_buffer.packed_instance_array_mixed");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003380,
    "KHR-GL43.shaders.uniform_block.multi_basic_types.per_block_buffer.std140_mixed");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003381,
    "KHR-GL43.shaders.uniform_block.multi_basic_types.per_block_buffer.std140_both");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003382,
    "KHR-GL43.shaders.uniform_block.multi_basic_types.per_block_buffer.std140_instance_array_mixed");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003383,
    "KHR-GL43.shaders.uniform_block.multi_basic_types.per_block_buffer.std140_instance_array_both");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003394,
    "KHR-GL43.shaders.uniform_block.multi_nested_struct.per_block_buffer.shared_mixed");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003395,
    "KHR-GL43.shaders.uniform_block.multi_nested_struct.per_block_buffer.shared_both");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003396,
    "KHR-GL43.shaders.uniform_block.multi_nested_struct.per_block_buffer.shared_instance_array_mixed");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003397,
    "KHR-GL43.shaders.uniform_block.multi_nested_struct.per_block_buffer.shared_instance_array_both");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003398,
    "KHR-GL43.shaders.uniform_block.multi_nested_struct.per_block_buffer.packed_mixed");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003399,
    "KHR-GL43.shaders.uniform_block.multi_nested_struct.per_block_buffer.packed_instance_array_mixed");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003400,
    "KHR-GL43.shaders.uniform_block.multi_nested_struct.per_block_buffer.std140_mixed");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003401,
    "KHR-GL43.shaders.uniform_block.multi_nested_struct.per_block_buffer.std140_both");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003402,
    "KHR-GL43.shaders.uniform_block.multi_nested_struct.per_block_buffer.std140_instance_array_mixed");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_003403,
    "KHR-GL43.shaders.uniform_block.multi_nested_struct.per_block_buffer.std140_instance_array_both");
