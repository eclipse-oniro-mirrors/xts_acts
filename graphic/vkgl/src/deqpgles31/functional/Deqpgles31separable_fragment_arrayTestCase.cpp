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
#include "../ActsDeqpgles310023TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022019,
        "dEQP-GLES31.functional.program_interface_query.p",
        "rogram_input.type.separable_fragment.array.float");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022020,
        "dEQP-GLES31.functional.program_interface_query.",
        "program_input.type.separable_fragment.array.int");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022021,
        "dEQP-GLES31.functional.program_interface_query.",
        "program_input.type.separable_fragment.array.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022022,
        "dEQP-GLES31.functional.program_interface_query.",
        "program_input.type.separable_fragment.array.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022023,
        "dEQP-GLES31.functional.program_interface_query.",
        "program_input.type.separable_fragment.array.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022024,
        "dEQP-GLES31.functional.program_interface_query.",
        "program_input.type.separable_fragment.array.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022025,
        "dEQP-GLES31.functional.program_interface_query.p",
        "rogram_input.type.separable_fragment.array.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022026,
        "dEQP-GLES31.functional.program_interface_query.p",
        "rogram_input.type.separable_fragment.array.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022027,
        "dEQP-GLES31.functional.program_interface_query.p",
        "rogram_input.type.separable_fragment.array.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022028,
        "dEQP-GLES31.functional.program_interface_query.p",
        "rogram_input.type.separable_fragment.array.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022029,
        "dEQP-GLES31.functional.program_interface_query.p",
        "rogram_input.type.separable_fragment.array.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022030,
        "dEQP-GLES31.functional.program_interface_query.p",
        "rogram_input.type.separable_fragment.array.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022031,
        "dEQP-GLES31.functional.program_interface_query.",
        "program_input.type.separable_fragment.array.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022032,
        "dEQP-GLES31.functional.program_interface_query.p",
        "rogram_input.type.separable_fragment.array.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022033,
        "dEQP-GLES31.functional.program_interface_query.p",
        "rogram_input.type.separable_fragment.array.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022034,
        "dEQP-GLES31.functional.program_interface_query.p",
        "rogram_input.type.separable_fragment.array.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022035,
        "dEQP-GLES31.functional.program_interface_query.",
        "program_input.type.separable_fragment.array.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022036,
        "dEQP-GLES31.functional.program_interface_query.p",
        "rogram_input.type.separable_fragment.array.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022037,
        "dEQP-GLES31.functional.program_interface_query.p",
        "rogram_input.type.separable_fragment.array.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022038,
        "dEQP-GLES31.functional.program_interface_query.p",
        "rogram_input.type.separable_fragment.array.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022039,
        "dEQP-GLES31.functional.program_interface_query.",
        "program_input.type.separable_fragment.array.mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022663,
        "dEQP-GLES31.functional.program_interface_query.p",
        "rogram_output.type.separable_fragment.array.float");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022664,
        "dEQP-GLES31.functional.program_interface_query.",
        "program_output.type.separable_fragment.array.int");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022665,
        "dEQP-GLES31.functional.program_interface_query.p",
        "rogram_output.type.separable_fragment.array.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022666,
        "dEQP-GLES31.functional.program_interface_query.p",
        "rogram_output.type.separable_fragment.array.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022667,
        "dEQP-GLES31.functional.program_interface_query.p",
        "rogram_output.type.separable_fragment.array.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022668,
        "dEQP-GLES31.functional.program_interface_query.p",
        "rogram_output.type.separable_fragment.array.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022669,
        "dEQP-GLES31.functional.program_interface_query.p",
        "rogram_output.type.separable_fragment.array.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022670,
        "dEQP-GLES31.functional.program_interface_query.p",
        "rogram_output.type.separable_fragment.array.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022671,
        "dEQP-GLES31.functional.program_interface_query.p",
        "rogram_output.type.separable_fragment.array.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022672,
        "dEQP-GLES31.functional.program_interface_query.p",
        "rogram_output.type.separable_fragment.array.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022673,
        "dEQP-GLES31.functional.program_interface_query.p",
        "rogram_output.type.separable_fragment.array.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022674,
        "dEQP-GLES31.functional.program_interface_query.p",
        "rogram_output.type.separable_fragment.array.uvec4");
