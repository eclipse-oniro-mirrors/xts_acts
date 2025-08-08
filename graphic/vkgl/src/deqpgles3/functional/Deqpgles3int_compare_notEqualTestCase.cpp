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
#include "../Deqpgles3BaseFunc.h"
#include "../ActsDeqpgles30014TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013588,
        "dEQP-GLES3.functional.shaders.operator",
        ".int_compare.notEqual.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013589,
        "dEQP-GLES3.functional.shaders.operator.",
        "int_compare.notEqual.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013590,
        "dEQP-GLES3.functional.shaders.operator.i",
        "nt_compare.notEqual.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013591,
        "dEQP-GLES3.functional.shaders.operator.in",
        "t_compare.notEqual.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013592,
        "dEQP-GLES3.functional.shaders.operator.",
        "int_compare.notEqual.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013593,
        "dEQP-GLES3.functional.shaders.operator.i",
        "nt_compare.notEqual.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013594,
        "dEQP-GLES3.functional.shaders.operator",
        ".int_compare.notEqual.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013595,
        "dEQP-GLES3.functional.shaders.operator.",
        "int_compare.notEqual.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013596,
        "dEQP-GLES3.functional.shaders.operator.i",
        "nt_compare.notEqual.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013597,
        "dEQP-GLES3.functional.shaders.operator.in",
        "t_compare.notEqual.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013598,
        "dEQP-GLES3.functional.shaders.operator.",
        "int_compare.notEqual.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013599,
        "dEQP-GLES3.functional.shaders.operator.i",
        "nt_compare.notEqual.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013600,
        "dEQP-GLES3.functional.shaders.operator",
        ".int_compare.notEqual.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013601,
        "dEQP-GLES3.functional.shaders.operator.",
        "int_compare.notEqual.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013602,
        "dEQP-GLES3.functional.shaders.operator.i",
        "nt_compare.notEqual.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013603,
        "dEQP-GLES3.functional.shaders.operator.in",
        "t_compare.notEqual.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013604,
        "dEQP-GLES3.functional.shaders.operator.",
        "int_compare.notEqual.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30014TestSuite, TestCase_013605,
        "dEQP-GLES3.functional.shaders.operator.i",
        "nt_compare.notEqual.highp_ivec4_fragment");
