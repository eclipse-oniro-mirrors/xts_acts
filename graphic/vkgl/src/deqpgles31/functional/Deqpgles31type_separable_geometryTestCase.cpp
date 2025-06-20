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

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022124,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.program_input.type.separable_geometry.float");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022125,
        "dEQP-GLES31.functional.program_interface_que",
        "ry.program_input.type.separable_geometry.int");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022126,
        "dEQP-GLES31.functional.program_interface_que",
        "ry.program_input.type.separable_geometry.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022127,
        "dEQP-GLES31.functional.program_interface_que",
        "ry.program_input.type.separable_geometry.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022128,
        "dEQP-GLES31.functional.program_interface_que",
        "ry.program_input.type.separable_geometry.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022129,
        "dEQP-GLES31.functional.program_interface_que",
        "ry.program_input.type.separable_geometry.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022130,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.program_input.type.separable_geometry.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022131,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.program_input.type.separable_geometry.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022132,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.program_input.type.separable_geometry.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022133,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.program_input.type.separable_geometry.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022134,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.program_input.type.separable_geometry.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022135,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.program_input.type.separable_geometry.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022136,
        "dEQP-GLES31.functional.program_interface_que",
        "ry.program_input.type.separable_geometry.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022137,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.program_input.type.separable_geometry.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022138,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.program_input.type.separable_geometry.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022139,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.program_input.type.separable_geometry.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022140,
        "dEQP-GLES31.functional.program_interface_que",
        "ry.program_input.type.separable_geometry.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022141,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.program_input.type.separable_geometry.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022142,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.program_input.type.separable_geometry.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022143,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.program_input.type.separable_geometry.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022144,
        "dEQP-GLES31.functional.program_interface_que",
        "ry.program_input.type.separable_geometry.mat4");
