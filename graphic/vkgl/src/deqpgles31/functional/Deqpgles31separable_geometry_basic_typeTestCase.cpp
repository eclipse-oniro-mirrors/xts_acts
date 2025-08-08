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

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022752,
        "dEQP-GLES31.functional.program_interface_query.prog",
        "ram_output.type.separable_geometry.basic_type.float");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022753,
        "dEQP-GLES31.functional.program_interface_query.pro",
        "gram_output.type.separable_geometry.basic_type.int");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022754,
        "dEQP-GLES31.functional.program_interface_query.pro",
        "gram_output.type.separable_geometry.basic_type.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022755,
        "dEQP-GLES31.functional.program_interface_query.pro",
        "gram_output.type.separable_geometry.basic_type.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022756,
        "dEQP-GLES31.functional.program_interface_query.pro",
        "gram_output.type.separable_geometry.basic_type.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022757,
        "dEQP-GLES31.functional.program_interface_query.pro",
        "gram_output.type.separable_geometry.basic_type.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022758,
        "dEQP-GLES31.functional.program_interface_query.prog",
        "ram_output.type.separable_geometry.basic_type.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022759,
        "dEQP-GLES31.functional.program_interface_query.prog",
        "ram_output.type.separable_geometry.basic_type.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022760,
        "dEQP-GLES31.functional.program_interface_query.prog",
        "ram_output.type.separable_geometry.basic_type.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022761,
        "dEQP-GLES31.functional.program_interface_query.prog",
        "ram_output.type.separable_geometry.basic_type.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022762,
        "dEQP-GLES31.functional.program_interface_query.prog",
        "ram_output.type.separable_geometry.basic_type.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022763,
        "dEQP-GLES31.functional.program_interface_query.prog",
        "ram_output.type.separable_geometry.basic_type.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022764,
        "dEQP-GLES31.functional.program_interface_query.pro",
        "gram_output.type.separable_geometry.basic_type.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022765,
        "dEQP-GLES31.functional.program_interface_query.prog",
        "ram_output.type.separable_geometry.basic_type.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022766,
        "dEQP-GLES31.functional.program_interface_query.prog",
        "ram_output.type.separable_geometry.basic_type.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022767,
        "dEQP-GLES31.functional.program_interface_query.prog",
        "ram_output.type.separable_geometry.basic_type.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022768,
        "dEQP-GLES31.functional.program_interface_query.pro",
        "gram_output.type.separable_geometry.basic_type.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022769,
        "dEQP-GLES31.functional.program_interface_query.prog",
        "ram_output.type.separable_geometry.basic_type.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022770,
        "dEQP-GLES31.functional.program_interface_query.prog",
        "ram_output.type.separable_geometry.basic_type.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022771,
        "dEQP-GLES31.functional.program_interface_query.prog",
        "ram_output.type.separable_geometry.basic_type.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022772,
        "dEQP-GLES31.functional.program_interface_query.pro",
        "gram_output.type.separable_geometry.basic_type.mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023364,
        "dEQP-GLES31.functional.program_interface_query.transform_",
        "feedback_varying.type.separable_geometry.basic_type.float");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023365,
        "dEQP-GLES31.functional.program_interface_query.transform",
        "_feedback_varying.type.separable_geometry.basic_type.int");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023366,
        "dEQP-GLES31.functional.program_interface_query.transform",
        "_feedback_varying.type.separable_geometry.basic_type.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023367,
        "dEQP-GLES31.functional.program_interface_query.transform",
        "_feedback_varying.type.separable_geometry.basic_type.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023368,
        "dEQP-GLES31.functional.program_interface_query.transform_",
        "feedback_varying.type.separable_geometry.basic_type.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023369,
        "dEQP-GLES31.functional.program_interface_query.transform_",
        "feedback_varying.type.separable_geometry.basic_type.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_023370,
        "dEQP-GLES31.functional.program_interface_query.transform_",
        "feedback_varying.type.separable_geometry.basic_type.mat3x4");
