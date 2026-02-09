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

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022040,
        "dEQP-GLES31.functional.program_interface_query.p",
        "rogram_input.type.separable_fragment.struct.float");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022041,
        "dEQP-GLES31.functional.program_interface_query.",
        "program_input.type.separable_fragment.struct.int");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022042,
        "dEQP-GLES31.functional.program_interface_query.p",
        "rogram_input.type.separable_fragment.struct.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022043,
        "dEQP-GLES31.functional.program_interface_query.p",
        "rogram_input.type.separable_fragment.struct.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022044,
        "dEQP-GLES31.functional.program_interface_query.p",
        "rogram_input.type.separable_fragment.struct.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022045,
        "dEQP-GLES31.functional.program_interface_query.p",
        "rogram_input.type.separable_fragment.struct.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022046,
        "dEQP-GLES31.functional.program_interface_query.p",
        "rogram_input.type.separable_fragment.struct.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022047,
        "dEQP-GLES31.functional.program_interface_query.p",
        "rogram_input.type.separable_fragment.struct.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022048,
        "dEQP-GLES31.functional.program_interface_query.p",
        "rogram_input.type.separable_fragment.struct.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022049,
        "dEQP-GLES31.functional.program_interface_query.p",
        "rogram_input.type.separable_fragment.struct.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022050,
        "dEQP-GLES31.functional.program_interface_query.p",
        "rogram_input.type.separable_fragment.struct.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022051,
        "dEQP-GLES31.functional.program_interface_query.p",
        "rogram_input.type.separable_fragment.struct.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022052,
        "dEQP-GLES31.functional.program_interface_query.p",
        "rogram_input.type.separable_fragment.struct.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022053,
        "dEQP-GLES31.functional.program_interface_query.pr",
        "ogram_input.type.separable_fragment.struct.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022054,
        "dEQP-GLES31.functional.program_interface_query.pr",
        "ogram_input.type.separable_fragment.struct.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022055,
        "dEQP-GLES31.functional.program_interface_query.pr",
        "ogram_input.type.separable_fragment.struct.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022056,
        "dEQP-GLES31.functional.program_interface_query.p",
        "rogram_input.type.separable_fragment.struct.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022057,
        "dEQP-GLES31.functional.program_interface_query.pr",
        "ogram_input.type.separable_fragment.struct.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022058,
        "dEQP-GLES31.functional.program_interface_query.pr",
        "ogram_input.type.separable_fragment.struct.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022059,
        "dEQP-GLES31.functional.program_interface_query.pr",
        "ogram_input.type.separable_fragment.struct.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022060,
        "dEQP-GLES31.functional.program_interface_query.p",
        "rogram_input.type.separable_fragment.struct.mat4");
