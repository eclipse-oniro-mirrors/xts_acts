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

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022675,
        "dEQP-GLES31.functional.program_interface_query.prog",
        "ram_output.type.separable_tess_ctrl.basic_type.float");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022676,
        "dEQP-GLES31.functional.program_interface_query.pro",
        "gram_output.type.separable_tess_ctrl.basic_type.int");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022677,
        "dEQP-GLES31.functional.program_interface_query.prog",
        "ram_output.type.separable_tess_ctrl.basic_type.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022678,
        "dEQP-GLES31.functional.program_interface_query.prog",
        "ram_output.type.separable_tess_ctrl.basic_type.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022679,
        "dEQP-GLES31.functional.program_interface_query.prog",
        "ram_output.type.separable_tess_ctrl.basic_type.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022680,
        "dEQP-GLES31.functional.program_interface_query.prog",
        "ram_output.type.separable_tess_ctrl.basic_type.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022681,
        "dEQP-GLES31.functional.program_interface_query.prog",
        "ram_output.type.separable_tess_ctrl.basic_type.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022682,
        "dEQP-GLES31.functional.program_interface_query.prog",
        "ram_output.type.separable_tess_ctrl.basic_type.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022683,
        "dEQP-GLES31.functional.program_interface_query.prog",
        "ram_output.type.separable_tess_ctrl.basic_type.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022684,
        "dEQP-GLES31.functional.program_interface_query.prog",
        "ram_output.type.separable_tess_ctrl.basic_type.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022685,
        "dEQP-GLES31.functional.program_interface_query.prog",
        "ram_output.type.separable_tess_ctrl.basic_type.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022686,
        "dEQP-GLES31.functional.program_interface_query.prog",
        "ram_output.type.separable_tess_ctrl.basic_type.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022687,
        "dEQP-GLES31.functional.program_interface_query.prog",
        "ram_output.type.separable_tess_ctrl.basic_type.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022688,
        "dEQP-GLES31.functional.program_interface_query.progr",
        "am_output.type.separable_tess_ctrl.basic_type.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022689,
        "dEQP-GLES31.functional.program_interface_query.progr",
        "am_output.type.separable_tess_ctrl.basic_type.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022690,
        "dEQP-GLES31.functional.program_interface_query.progr",
        "am_output.type.separable_tess_ctrl.basic_type.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022691,
        "dEQP-GLES31.functional.program_interface_query.prog",
        "ram_output.type.separable_tess_ctrl.basic_type.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022692,
        "dEQP-GLES31.functional.program_interface_query.progr",
        "am_output.type.separable_tess_ctrl.basic_type.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022693,
        "dEQP-GLES31.functional.program_interface_query.progr",
        "am_output.type.separable_tess_ctrl.basic_type.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022694,
        "dEQP-GLES31.functional.program_interface_query.progr",
        "am_output.type.separable_tess_ctrl.basic_type.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022695,
        "dEQP-GLES31.functional.program_interface_query.prog",
        "ram_output.type.separable_tess_ctrl.basic_type.mat4");
