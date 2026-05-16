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
#include "../Khrgles3BaseFunc.h"
#include "../ActsKhrgles30002TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001968,
        "KHR-GLES3.shaders.uniform_block.si",
        "ngle_struct.per_block_buffer_shared");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001969,
        "KHR-GLES3.shaders.uniform_block.single_str",
        "uct.per_block_buffer_shared_instance_array");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001970,
        "KHR-GLES3.shaders.uniform_block.si",
        "ngle_struct.per_block_buffer_packed");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001971,
        "KHR-GLES3.shaders.uniform_block.single_str",
        "uct.per_block_buffer_packed_instance_array");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001972,
        "KHR-GLES3.shaders.uniform_block.si",
        "ngle_struct.per_block_buffer_std140");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001973,
        "KHR-GLES3.shaders.uniform_block.single_str",
        "uct.per_block_buffer_std140_instance_array");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001974,
        "KHR-GLES3.shaders.uniform_block.single_s",
        "truct.single_buffer_shared_instance_array");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001975,
        "KHR-GLES3.shaders.uniform_block.single_s",
        "truct.single_buffer_packed_instance_array");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001976,
        "KHR-GLES3.shaders.uniform_block.single_s",
        "truct.single_buffer_std140_instance_array");
