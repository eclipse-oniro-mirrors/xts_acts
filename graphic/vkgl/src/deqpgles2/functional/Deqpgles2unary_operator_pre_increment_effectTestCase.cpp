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
#include "../Deqpgles2BaseFunc.h"
#include "../ActsDeqpgles20005TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004030,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.pre_increment_effect.lowp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004031,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.pre_increment_effect.lowp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004032,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.pre_increment_effect.mediump_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004033,
        "dEQP-GLES2.functional.shaders.operator.unary_ope",
        "rator.pre_increment_effect.mediump_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004034,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.pre_increment_effect.highp_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004035,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.pre_increment_effect.highp_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004036,
        "dEQP-GLES2.functional.shaders.operator.unary_",
        "operator.pre_increment_effect.lowp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004037,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.pre_increment_effect.lowp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004038,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.pre_increment_effect.mediump_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004039,
        "dEQP-GLES2.functional.shaders.operator.unary_ope",
        "rator.pre_increment_effect.mediump_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004040,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.pre_increment_effect.highp_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004041,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.pre_increment_effect.highp_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004042,
        "dEQP-GLES2.functional.shaders.operator.unary_",
        "operator.pre_increment_effect.lowp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004043,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.pre_increment_effect.lowp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004044,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.pre_increment_effect.mediump_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004045,
        "dEQP-GLES2.functional.shaders.operator.unary_ope",
        "rator.pre_increment_effect.mediump_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004046,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.pre_increment_effect.highp_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004047,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.pre_increment_effect.highp_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004048,
        "dEQP-GLES2.functional.shaders.operator.unary_",
        "operator.pre_increment_effect.lowp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004049,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.pre_increment_effect.lowp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004050,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.pre_increment_effect.mediump_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004051,
        "dEQP-GLES2.functional.shaders.operator.unary_ope",
        "rator.pre_increment_effect.mediump_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004052,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.pre_increment_effect.highp_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004053,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.pre_increment_effect.highp_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004054,
        "dEQP-GLES2.functional.shaders.operator.unary_",
        "operator.pre_increment_effect.lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004055,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.pre_increment_effect.lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004056,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.pre_increment_effect.mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004057,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.pre_increment_effect.mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004058,
        "dEQP-GLES2.functional.shaders.operator.unary_",
        "operator.pre_increment_effect.highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004059,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.pre_increment_effect.highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004060,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.pre_increment_effect.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004061,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.pre_increment_effect.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004062,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.pre_increment_effect.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004063,
        "dEQP-GLES2.functional.shaders.operator.unary_ope",
        "rator.pre_increment_effect.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004064,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.pre_increment_effect.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004065,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.pre_increment_effect.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004066,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.pre_increment_effect.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004067,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.pre_increment_effect.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004068,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.pre_increment_effect.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004069,
        "dEQP-GLES2.functional.shaders.operator.unary_ope",
        "rator.pre_increment_effect.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004070,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.pre_increment_effect.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004071,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.pre_increment_effect.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004072,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.pre_increment_effect.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004073,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.pre_increment_effect.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004074,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.pre_increment_effect.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004075,
        "dEQP-GLES2.functional.shaders.operator.unary_ope",
        "rator.pre_increment_effect.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004076,
        "dEQP-GLES2.functional.shaders.operator.unary_o",
        "perator.pre_increment_effect.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20005TestSuite, TestCase_004077,
        "dEQP-GLES2.functional.shaders.operator.unary_op",
        "erator.pre_increment_effect.highp_ivec4_fragment");
