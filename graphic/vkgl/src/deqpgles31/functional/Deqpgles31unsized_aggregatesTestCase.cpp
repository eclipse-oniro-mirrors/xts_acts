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
#include "../Deqpgles31BaseFunc.h"
#include "../ActsDeqpgles310024TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023537,
        "dEQP-GLES31.functional.program_interface_query.buffer_vari",
        "able.array_size.named_block.unsized.aggregates.float_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023538,
        "dEQP-GLES31.functional.program_interface_query.buffer_vari",
        "able.array_size.named_block.unsized.aggregates.float_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023539,
        "dEQP-GLES31.functional.program_interface_query.buffer_",
        "variable.array_size.named_block.unsized.aggregates.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023540,
        "dEQP-GLES31.functional.program_interface_query.buffer_vari",
        "able.array_size.named_block.unsized.aggregates.bvec3_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023541,
        "dEQP-GLES31.functional.program_interface_query.buffer_vari",
        "able.array_size.named_block.unsized.aggregates.bvec3_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023542,
        "dEQP-GLES31.functional.program_interface_query.buffer_vari",
        "able.array_size.named_block.unsized.aggregates.vec4_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023543,
        "dEQP-GLES31.functional.program_interface_query.buffer_var",
        "iable.array_size.named_block.unsized.aggregates.vec4_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023544,
        "dEQP-GLES31.functional.program_interface_query.buffer_vari",
        "able.array_size.named_block.unsized.aggregates.ivec2_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023545,
        "dEQP-GLES31.functional.program_interface_query.buffer_vari",
        "able.array_size.named_block.unsized.aggregates.ivec2_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023650,
        "dEQP-GLES31.functional.program_interface_query.buffer_varia",
        "ble.array_stride.named_block.unsized.aggregates.float_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023651,
        "dEQP-GLES31.functional.program_interface_query.buffer_varia",
        "ble.array_stride.named_block.unsized.aggregates.float_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023652,
        "dEQP-GLES31.functional.program_interface_query.buffer_v",
        "ariable.array_stride.named_block.unsized.aggregates.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023653,
        "dEQP-GLES31.functional.program_interface_query.buffer_varia",
        "ble.array_stride.named_block.unsized.aggregates.bvec3_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023654,
        "dEQP-GLES31.functional.program_interface_query.buffer_varia",
        "ble.array_stride.named_block.unsized.aggregates.bvec3_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023655,
        "dEQP-GLES31.functional.program_interface_query.buffer_varia",
        "ble.array_stride.named_block.unsized.aggregates.vec4_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023656,
        "dEQP-GLES31.functional.program_interface_query.buffer_vari",
        "able.array_stride.named_block.unsized.aggregates.vec4_array");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023657,
        "dEQP-GLES31.functional.program_interface_query.buffer_varia",
        "ble.array_stride.named_block.unsized.aggregates.ivec2_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023658,
        "dEQP-GLES31.functional.program_interface_query.buffer_varia",
        "ble.array_stride.named_block.unsized.aggregates.ivec2_array");
