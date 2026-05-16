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

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023491,
        "dEQP-GLES31.functional.program_interface_query.buff",
        "er_variable.array_size.named_block.sized.types.float");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023492,
        "dEQP-GLES31.functional.program_interface_query.buf",
        "fer_variable.array_size.named_block.sized.types.int");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023493,
        "dEQP-GLES31.functional.program_interface_query.buff",
        "er_variable.array_size.named_block.sized.types.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023494,
        "dEQP-GLES31.functional.program_interface_query.buff",
        "er_variable.array_size.named_block.sized.types.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023495,
        "dEQP-GLES31.functional.program_interface_query.buff",
        "er_variable.array_size.named_block.sized.types.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023496,
        "dEQP-GLES31.functional.program_interface_query.buff",
        "er_variable.array_size.named_block.sized.types.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023497,
        "dEQP-GLES31.functional.program_interface_query.buff",
        "er_variable.array_size.named_block.sized.types.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023498,
        "dEQP-GLES31.functional.program_interface_query.buff",
        "er_variable.array_size.named_block.sized.types.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023499,
        "dEQP-GLES31.functional.program_interface_query.buff",
        "er_variable.array_size.named_block.sized.types.bvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023500,
        "dEQP-GLES31.functional.program_interface_query.buff",
        "er_variable.array_size.named_block.sized.types.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023501,
        "dEQP-GLES31.functional.program_interface_query.buffe",
        "r_variable.array_size.named_block.sized.types.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023502,
        "dEQP-GLES31.functional.program_interface_query.buff",
        "er_variable.array_size.named_block.sized.types.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023503,
        "dEQP-GLES31.functional.program_interface_query.buffe",
        "r_variable.array_size.named_block.sized.types.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023504,
        "dEQP-GLES31.functional.program_interface_query.buff",
        "er_variable.array_size.named_block.sized.types.mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023604,
        "dEQP-GLES31.functional.program_interface_query.buffe",
        "r_variable.array_stride.named_block.sized.types.float");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023605,
        "dEQP-GLES31.functional.program_interface_query.buff",
        "er_variable.array_stride.named_block.sized.types.int");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023606,
        "dEQP-GLES31.functional.program_interface_query.buffe",
        "r_variable.array_stride.named_block.sized.types.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023607,
        "dEQP-GLES31.functional.program_interface_query.buffe",
        "r_variable.array_stride.named_block.sized.types.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023608,
        "dEQP-GLES31.functional.program_interface_query.buffe",
        "r_variable.array_stride.named_block.sized.types.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023609,
        "dEQP-GLES31.functional.program_interface_query.buffe",
        "r_variable.array_stride.named_block.sized.types.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023610,
        "dEQP-GLES31.functional.program_interface_query.buffe",
        "r_variable.array_stride.named_block.sized.types.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023611,
        "dEQP-GLES31.functional.program_interface_query.buffe",
        "r_variable.array_stride.named_block.sized.types.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023612,
        "dEQP-GLES31.functional.program_interface_query.buffe",
        "r_variable.array_stride.named_block.sized.types.bvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023613,
        "dEQP-GLES31.functional.program_interface_query.buffe",
        "r_variable.array_stride.named_block.sized.types.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023614,
        "dEQP-GLES31.functional.program_interface_query.buffer",
        "_variable.array_stride.named_block.sized.types.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023615,
        "dEQP-GLES31.functional.program_interface_query.buffe",
        "r_variable.array_stride.named_block.sized.types.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023616,
        "dEQP-GLES31.functional.program_interface_query.buffer",
        "_variable.array_stride.named_block.sized.types.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023617,
        "dEQP-GLES31.functional.program_interface_query.buffe",
        "r_variable.array_stride.named_block.sized.types.mat4");
