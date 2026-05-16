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
#include "../ActsKhrgles30003TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002133,
        "KHR-GLES3.shaders.uniform_block.multi_b",
        "asic_types.per_block_buffer.shared_mixed");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002134,
        "KHR-GLES3.shaders.uniform_block.multi_b",
        "asic_types.per_block_buffer.shared_both");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002135,
        "KHR-GLES3.shaders.uniform_block.multi_basic_typ",
        "es.per_block_buffer.shared_instance_array_mixed");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002136,
        "KHR-GLES3.shaders.uniform_block.multi_basic_ty",
        "pes.per_block_buffer.shared_instance_array_both");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002137,
        "KHR-GLES3.shaders.uniform_block.multi_b",
        "asic_types.per_block_buffer.packed_mixed");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002138,
        "KHR-GLES3.shaders.uniform_block.multi_basic_typ",
        "es.per_block_buffer.packed_instance_array_mixed");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002139,
        "KHR-GLES3.shaders.uniform_block.multi_b",
        "asic_types.per_block_buffer.std140_mixed");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002140,
        "KHR-GLES3.shaders.uniform_block.multi_b",
        "asic_types.per_block_buffer.std140_both");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002141,
        "KHR-GLES3.shaders.uniform_block.multi_basic_typ",
        "es.per_block_buffer.std140_instance_array_mixed");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002142,
        "KHR-GLES3.shaders.uniform_block.multi_basic_ty",
        "pes.per_block_buffer.std140_instance_array_both");
