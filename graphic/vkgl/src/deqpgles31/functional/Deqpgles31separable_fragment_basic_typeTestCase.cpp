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
#include "../ActsDeqpgles310022TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021998,
        "dEQP-GLES31.functional.program_interface_query.pro",
        "gram_input.type.separable_fragment.basic_type.float");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021999,
        "dEQP-GLES31.functional.program_interface_query.pr",
        "ogram_input.type.separable_fragment.basic_type.int");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022000,
        "dEQP-GLES31.functional.program_interface_query.pro",
        "gram_input.type.separable_fragment.basic_type.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022001,
        "dEQP-GLES31.functional.program_interface_query.pro",
        "gram_input.type.separable_fragment.basic_type.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022002,
        "dEQP-GLES31.functional.program_interface_query.pro",
        "gram_input.type.separable_fragment.basic_type.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022003,
        "dEQP-GLES31.functional.program_interface_query.pro",
        "gram_input.type.separable_fragment.basic_type.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022004,
        "dEQP-GLES31.functional.program_interface_query.pro",
        "gram_input.type.separable_fragment.basic_type.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022005,
        "dEQP-GLES31.functional.program_interface_query.pro",
        "gram_input.type.separable_fragment.basic_type.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022006,
        "dEQP-GLES31.functional.program_interface_query.pro",
        "gram_input.type.separable_fragment.basic_type.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022007,
        "dEQP-GLES31.functional.program_interface_query.pro",
        "gram_input.type.separable_fragment.basic_type.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022008,
        "dEQP-GLES31.functional.program_interface_query.pro",
        "gram_input.type.separable_fragment.basic_type.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022009,
        "dEQP-GLES31.functional.program_interface_query.pro",
        "gram_input.type.separable_fragment.basic_type.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022010,
        "dEQP-GLES31.functional.program_interface_query.pro",
        "gram_input.type.separable_fragment.basic_type.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022011,
        "dEQP-GLES31.functional.program_interface_query.prog",
        "ram_input.type.separable_fragment.basic_type.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022012,
        "dEQP-GLES31.functional.program_interface_query.prog",
        "ram_input.type.separable_fragment.basic_type.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022013,
        "dEQP-GLES31.functional.program_interface_query.prog",
        "ram_input.type.separable_fragment.basic_type.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022014,
        "dEQP-GLES31.functional.program_interface_query.pro",
        "gram_input.type.separable_fragment.basic_type.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022015,
        "dEQP-GLES31.functional.program_interface_query.prog",
        "ram_input.type.separable_fragment.basic_type.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022016,
        "dEQP-GLES31.functional.program_interface_query.prog",
        "ram_input.type.separable_fragment.basic_type.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022017,
        "dEQP-GLES31.functional.program_interface_query.prog",
        "ram_input.type.separable_fragment.basic_type.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022018,
        "dEQP-GLES31.functional.program_interface_query.pro",
        "gram_input.type.separable_fragment.basic_type.mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022651,
        "dEQP-GLES31.functional.program_interface_query.prog",
        "ram_output.type.separable_fragment.basic_type.float");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022652,
        "dEQP-GLES31.functional.program_interface_query.pro",
        "gram_output.type.separable_fragment.basic_type.int");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022653,
        "dEQP-GLES31.functional.program_interface_query.pro",
        "gram_output.type.separable_fragment.basic_type.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022654,
        "dEQP-GLES31.functional.program_interface_query.pro",
        "gram_output.type.separable_fragment.basic_type.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022655,
        "dEQP-GLES31.functional.program_interface_query.pro",
        "gram_output.type.separable_fragment.basic_type.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022656,
        "dEQP-GLES31.functional.program_interface_query.pro",
        "gram_output.type.separable_fragment.basic_type.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022657,
        "dEQP-GLES31.functional.program_interface_query.prog",
        "ram_output.type.separable_fragment.basic_type.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022658,
        "dEQP-GLES31.functional.program_interface_query.prog",
        "ram_output.type.separable_fragment.basic_type.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022659,
        "dEQP-GLES31.functional.program_interface_query.prog",
        "ram_output.type.separable_fragment.basic_type.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022660,
        "dEQP-GLES31.functional.program_interface_query.prog",
        "ram_output.type.separable_fragment.basic_type.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022661,
        "dEQP-GLES31.functional.program_interface_query.prog",
        "ram_output.type.separable_fragment.basic_type.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022662,
        "dEQP-GLES31.functional.program_interface_query.prog",
        "ram_output.type.separable_fragment.basic_type.uvec4");
