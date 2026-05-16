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

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009688,
        "dEQP-GLES31.functional.ssbo.layout.sing",
        "le_struct_array.per_block_buffer.shared");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009689,
        "dEQP-GLES31.functional.ssbo.layout.single_stru",
        "ct_array.per_block_buffer.shared_instance_array");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009690,
        "dEQP-GLES31.functional.ssbo.layout.sing",
        "le_struct_array.per_block_buffer.packed");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009691,
        "dEQP-GLES31.functional.ssbo.layout.single_stru",
        "ct_array.per_block_buffer.packed_instance_array");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009692,
        "dEQP-GLES31.functional.ssbo.layout.sing",
        "le_struct_array.per_block_buffer.std140");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009693,
        "dEQP-GLES31.functional.ssbo.layout.single_stru",
        "ct_array.per_block_buffer.std140_instance_array");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009694,
        "dEQP-GLES31.functional.ssbo.layout.sing",
        "le_struct_array.per_block_buffer.std430");

static SHRINK_HWTEST_F(ActsDeqpgles310010TestSuite, TestCase_009695,
        "dEQP-GLES31.functional.ssbo.layout.single_stru",
        "ct_array.per_block_buffer.std430_instance_array");
