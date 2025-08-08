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
#include "../ActsDeqpgles310010TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009736,
        "dEQP-GLES31.functional.ssbo.layout.2_level_",
        "unsized_struct_array.per_block_buffer.shared");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009737,
        "dEQP-GLES31.functional.ssbo.layout.2_level_unsized_",
        "struct_array.per_block_buffer.shared_instance_array");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009738,
        "dEQP-GLES31.functional.ssbo.layout.2_level_",
        "unsized_struct_array.per_block_buffer.packed");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009739,
        "dEQP-GLES31.functional.ssbo.layout.2_level_unsized_",
        "struct_array.per_block_buffer.packed_instance_array");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009740,
        "dEQP-GLES31.functional.ssbo.layout.2_level_",
        "unsized_struct_array.per_block_buffer.std140");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009741,
        "dEQP-GLES31.functional.ssbo.layout.2_level_unsized_",
        "struct_array.per_block_buffer.std140_instance_array");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009742,
        "dEQP-GLES31.functional.ssbo.layout.2_level_",
        "unsized_struct_array.per_block_buffer.std430");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009743,
        "dEQP-GLES31.functional.ssbo.layout.2_level_unsized_",
        "struct_array.per_block_buffer.std430_instance_array");
