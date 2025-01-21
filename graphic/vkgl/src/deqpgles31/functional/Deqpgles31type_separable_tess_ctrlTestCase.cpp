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

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022061,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.program_input.type.separable_tess_ctrl.float");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022062,
        "dEQP-GLES31.functional.program_interface_que",
        "ry.program_input.type.separable_tess_ctrl.int");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022063,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.program_input.type.separable_tess_ctrl.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022064,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.program_input.type.separable_tess_ctrl.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022065,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.program_input.type.separable_tess_ctrl.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022066,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.program_input.type.separable_tess_ctrl.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022067,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.program_input.type.separable_tess_ctrl.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022068,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.program_input.type.separable_tess_ctrl.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022069,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.program_input.type.separable_tess_ctrl.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022070,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.program_input.type.separable_tess_ctrl.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022071,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.program_input.type.separable_tess_ctrl.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022072,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.program_input.type.separable_tess_ctrl.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022073,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.program_input.type.separable_tess_ctrl.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022074,
        "dEQP-GLES31.functional.program_interface_query",
        ".program_input.type.separable_tess_ctrl.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022075,
        "dEQP-GLES31.functional.program_interface_query",
        ".program_input.type.separable_tess_ctrl.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022076,
        "dEQP-GLES31.functional.program_interface_query",
        ".program_input.type.separable_tess_ctrl.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022077,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.program_input.type.separable_tess_ctrl.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022078,
        "dEQP-GLES31.functional.program_interface_query",
        ".program_input.type.separable_tess_ctrl.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022079,
        "dEQP-GLES31.functional.program_interface_query",
        ".program_input.type.separable_tess_ctrl.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022080,
        "dEQP-GLES31.functional.program_interface_query",
        ".program_input.type.separable_tess_ctrl.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022081,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.program_input.type.separable_tess_ctrl.mat4");
