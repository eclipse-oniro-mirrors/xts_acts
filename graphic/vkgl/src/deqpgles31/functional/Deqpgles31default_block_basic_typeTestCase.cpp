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
#include "../ActsDeqpgles310021TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020391,
        "dEQP-GLES31.functional.program_interface_query.uniform.a",
        "tomic_counter_buffer_index.default_block.basic_type.float");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020392,
        "dEQP-GLES31.functional.program_interface_query.uniform.",
        "atomic_counter_buffer_index.default_block.basic_type.int");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020393,
        "dEQP-GLES31.functional.program_interface_query.uniform.a",
        "tomic_counter_buffer_index.default_block.basic_type.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020394,
        "dEQP-GLES31.functional.program_interface_query.uniform.a",
        "tomic_counter_buffer_index.default_block.basic_type.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020395,
        "dEQP-GLES31.functional.program_interface_query.uniform.a",
        "tomic_counter_buffer_index.default_block.basic_type.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020396,
        "dEQP-GLES31.functional.program_interface_query.uniform.a",
        "tomic_counter_buffer_index.default_block.basic_type.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020397,
        "dEQP-GLES31.functional.program_interface_query.uniform.a",
        "tomic_counter_buffer_index.default_block.basic_type.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020398,
        "dEQP-GLES31.functional.program_interface_query.uniform.a",
        "tomic_counter_buffer_index.default_block.basic_type.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020399,
        "dEQP-GLES31.functional.program_interface_query.uniform.a",
        "tomic_counter_buffer_index.default_block.basic_type.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020400,
        "dEQP-GLES31.functional.program_interface_query.uniform.a",
        "tomic_counter_buffer_index.default_block.basic_type.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020401,
        "dEQP-GLES31.functional.program_interface_query.uniform.a",
        "tomic_counter_buffer_index.default_block.basic_type.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020402,
        "dEQP-GLES31.functional.program_interface_query.uniform.a",
        "tomic_counter_buffer_index.default_block.basic_type.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020403,
        "dEQP-GLES31.functional.program_interface_query.uniform.a",
        "tomic_counter_buffer_index.default_block.basic_type.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020404,
        "dEQP-GLES31.functional.program_interface_query.uniform.a",
        "tomic_counter_buffer_index.default_block.basic_type.bvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020405,
        "dEQP-GLES31.functional.program_interface_query.uniform.a",
        "tomic_counter_buffer_index.default_block.basic_type.bvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020406,
        "dEQP-GLES31.functional.program_interface_query.uniform.a",
        "tomic_counter_buffer_index.default_block.basic_type.bvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020407,
        "dEQP-GLES31.functional.program_interface_query.uniform.a",
        "tomic_counter_buffer_index.default_block.basic_type.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020408,
        "dEQP-GLES31.functional.program_interface_query.uniform.at",
        "omic_counter_buffer_index.default_block.basic_type.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020409,
        "dEQP-GLES31.functional.program_interface_query.uniform.at",
        "omic_counter_buffer_index.default_block.basic_type.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020410,
        "dEQP-GLES31.functional.program_interface_query.uniform.at",
        "omic_counter_buffer_index.default_block.basic_type.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020411,
        "dEQP-GLES31.functional.program_interface_query.uniform.a",
        "tomic_counter_buffer_index.default_block.basic_type.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020412,
        "dEQP-GLES31.functional.program_interface_query.uniform.at",
        "omic_counter_buffer_index.default_block.basic_type.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020413,
        "dEQP-GLES31.functional.program_interface_query.uniform.at",
        "omic_counter_buffer_index.default_block.basic_type.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020414,
        "dEQP-GLES31.functional.program_interface_query.uniform.at",
        "omic_counter_buffer_index.default_block.basic_type.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020415,
        "dEQP-GLES31.functional.program_interface_query.uniform.a",
        "tomic_counter_buffer_index.default_block.basic_type.mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020459,
        "dEQP-GLES31.functional.program_interface_query.",
        "uniform.location.default_block.basic_type.float");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020460,
        "dEQP-GLES31.functional.program_interface_query",
        ".uniform.location.default_block.basic_type.int");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020461,
        "dEQP-GLES31.functional.program_interface_query",
        ".uniform.location.default_block.basic_type.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020462,
        "dEQP-GLES31.functional.program_interface_query",
        ".uniform.location.default_block.basic_type.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020463,
        "dEQP-GLES31.functional.program_interface_query",
        ".uniform.location.default_block.basic_type.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020464,
        "dEQP-GLES31.functional.program_interface_query",
        ".uniform.location.default_block.basic_type.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020465,
        "dEQP-GLES31.functional.program_interface_query",
        ".uniform.location.default_block.basic_type.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020466,
        "dEQP-GLES31.functional.program_interface_query.",
        "uniform.location.default_block.basic_type.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020467,
        "dEQP-GLES31.functional.program_interface_query.",
        "uniform.location.default_block.basic_type.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020468,
        "dEQP-GLES31.functional.program_interface_query.",
        "uniform.location.default_block.basic_type.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020469,
        "dEQP-GLES31.functional.program_interface_query.",
        "uniform.location.default_block.basic_type.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020470,
        "dEQP-GLES31.functional.program_interface_query.",
        "uniform.location.default_block.basic_type.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020471,
        "dEQP-GLES31.functional.program_interface_query.",
        "uniform.location.default_block.basic_type.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020472,
        "dEQP-GLES31.functional.program_interface_query.",
        "uniform.location.default_block.basic_type.bvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020473,
        "dEQP-GLES31.functional.program_interface_query.",
        "uniform.location.default_block.basic_type.bvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020474,
        "dEQP-GLES31.functional.program_interface_query.",
        "uniform.location.default_block.basic_type.bvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020475,
        "dEQP-GLES31.functional.program_interface_query",
        ".uniform.location.default_block.basic_type.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020476,
        "dEQP-GLES31.functional.program_interface_query.",
        "uniform.location.default_block.basic_type.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020477,
        "dEQP-GLES31.functional.program_interface_query.",
        "uniform.location.default_block.basic_type.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020478,
        "dEQP-GLES31.functional.program_interface_query.",
        "uniform.location.default_block.basic_type.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020479,
        "dEQP-GLES31.functional.program_interface_query",
        ".uniform.location.default_block.basic_type.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020480,
        "dEQP-GLES31.functional.program_interface_query.",
        "uniform.location.default_block.basic_type.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020481,
        "dEQP-GLES31.functional.program_interface_query.",
        "uniform.location.default_block.basic_type.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020482,
        "dEQP-GLES31.functional.program_interface_query.",
        "uniform.location.default_block.basic_type.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020483,
        "dEQP-GLES31.functional.program_interface_query",
        ".uniform.location.default_block.basic_type.mat4");
