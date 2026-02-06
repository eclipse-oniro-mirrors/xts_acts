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

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023485,
        "dEQP-GLES31.functional.program_interface_query.buf",
        "fer_variable.array_size.named_block.non_array.float");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023486,
        "dEQP-GLES31.functional.program_interface_query.bu",
        "ffer_variable.array_size.named_block.non_array.int");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023487,
        "dEQP-GLES31.functional.program_interface_query.buf",
        "fer_variable.array_size.named_block.non_array.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023488,
        "dEQP-GLES31.functional.program_interface_query.buf",
        "fer_variable.array_size.named_block.non_array.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023489,
        "dEQP-GLES31.functional.program_interface_query.buf",
        "fer_variable.array_size.named_block.non_array.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023490,
        "dEQP-GLES31.functional.program_interface_query.buf",
        "fer_variable.array_size.named_block.non_array.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023598,
        "dEQP-GLES31.functional.program_interface_query.buff",
        "er_variable.array_stride.named_block.non_array.float");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023599,
        "dEQP-GLES31.functional.program_interface_query.buf",
        "fer_variable.array_stride.named_block.non_array.int");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023600,
        "dEQP-GLES31.functional.program_interface_query.buff",
        "er_variable.array_stride.named_block.non_array.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023601,
        "dEQP-GLES31.functional.program_interface_query.buff",
        "er_variable.array_stride.named_block.non_array.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023602,
        "dEQP-GLES31.functional.program_interface_query.buff",
        "er_variable.array_stride.named_block.non_array.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023603,
        "dEQP-GLES31.functional.program_interface_query.buff",
        "er_variable.array_stride.named_block.non_array.vec4");
