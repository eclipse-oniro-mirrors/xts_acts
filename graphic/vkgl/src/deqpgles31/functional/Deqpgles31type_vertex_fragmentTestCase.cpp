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

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021956,
        "dEQP-GLES31.functional.program_interface_qu",
        "ery.program_input.type.vertex_fragment.float");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021957,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.program_input.type.vertex_fragment.int");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021958,
        "dEQP-GLES31.functional.program_interface_qu",
        "ery.program_input.type.vertex_fragment.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021959,
        "dEQP-GLES31.functional.program_interface_qu",
        "ery.program_input.type.vertex_fragment.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021960,
        "dEQP-GLES31.functional.program_interface_qu",
        "ery.program_input.type.vertex_fragment.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021961,
        "dEQP-GLES31.functional.program_interface_qu",
        "ery.program_input.type.vertex_fragment.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021962,
        "dEQP-GLES31.functional.program_interface_qu",
        "ery.program_input.type.vertex_fragment.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021963,
        "dEQP-GLES31.functional.program_interface_qu",
        "ery.program_input.type.vertex_fragment.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021964,
        "dEQP-GLES31.functional.program_interface_qu",
        "ery.program_input.type.vertex_fragment.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021965,
        "dEQP-GLES31.functional.program_interface_qu",
        "ery.program_input.type.vertex_fragment.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021966,
        "dEQP-GLES31.functional.program_interface_qu",
        "ery.program_input.type.vertex_fragment.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021967,
        "dEQP-GLES31.functional.program_interface_qu",
        "ery.program_input.type.vertex_fragment.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021968,
        "dEQP-GLES31.functional.program_interface_qu",
        "ery.program_input.type.vertex_fragment.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021969,
        "dEQP-GLES31.functional.program_interface_que",
        "ry.program_input.type.vertex_fragment.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021970,
        "dEQP-GLES31.functional.program_interface_que",
        "ry.program_input.type.vertex_fragment.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021971,
        "dEQP-GLES31.functional.program_interface_que",
        "ry.program_input.type.vertex_fragment.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021972,
        "dEQP-GLES31.functional.program_interface_qu",
        "ery.program_input.type.vertex_fragment.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021973,
        "dEQP-GLES31.functional.program_interface_que",
        "ry.program_input.type.vertex_fragment.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021974,
        "dEQP-GLES31.functional.program_interface_que",
        "ry.program_input.type.vertex_fragment.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021975,
        "dEQP-GLES31.functional.program_interface_que",
        "ry.program_input.type.vertex_fragment.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021976,
        "dEQP-GLES31.functional.program_interface_qu",
        "ery.program_input.type.vertex_fragment.mat4");
