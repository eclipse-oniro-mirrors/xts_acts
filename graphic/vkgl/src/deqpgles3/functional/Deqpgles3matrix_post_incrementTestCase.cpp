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
#include "../ActsDeqpgles30017TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016122,
        "dEQP-GLES3.functional.shaders.matrix.",
        "post_increment.lowp_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016123,
        "dEQP-GLES3.functional.shaders.matrix.p",
        "ost_increment.lowp_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016124,
        "dEQP-GLES3.functional.shaders.matrix.p",
        "ost_increment.mediump_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016125,
        "dEQP-GLES3.functional.shaders.matrix.po",
        "st_increment.mediump_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016126,
        "dEQP-GLES3.functional.shaders.matrix.",
        "post_increment.highp_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016127,
        "dEQP-GLES3.functional.shaders.matrix.p",
        "ost_increment.highp_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016128,
        "dEQP-GLES3.functional.shaders.matrix.p",
        "ost_increment.lowp_mat2x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016129,
        "dEQP-GLES3.functional.shaders.matrix.po",
        "st_increment.lowp_mat2x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016130,
        "dEQP-GLES3.functional.shaders.matrix.po",
        "st_increment.mediump_mat2x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016131,
        "dEQP-GLES3.functional.shaders.matrix.pos",
        "t_increment.mediump_mat2x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016132,
        "dEQP-GLES3.functional.shaders.matrix.p",
        "ost_increment.highp_mat2x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016133,
        "dEQP-GLES3.functional.shaders.matrix.po",
        "st_increment.highp_mat2x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016134,
        "dEQP-GLES3.functional.shaders.matrix.p",
        "ost_increment.lowp_mat2x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016135,
        "dEQP-GLES3.functional.shaders.matrix.po",
        "st_increment.lowp_mat2x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016136,
        "dEQP-GLES3.functional.shaders.matrix.po",
        "st_increment.mediump_mat2x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016137,
        "dEQP-GLES3.functional.shaders.matrix.pos",
        "t_increment.mediump_mat2x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016138,
        "dEQP-GLES3.functional.shaders.matrix.p",
        "ost_increment.highp_mat2x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016139,
        "dEQP-GLES3.functional.shaders.matrix.po",
        "st_increment.highp_mat2x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016140,
        "dEQP-GLES3.functional.shaders.matrix.p",
        "ost_increment.lowp_mat3x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016141,
        "dEQP-GLES3.functional.shaders.matrix.po",
        "st_increment.lowp_mat3x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016142,
        "dEQP-GLES3.functional.shaders.matrix.po",
        "st_increment.mediump_mat3x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016143,
        "dEQP-GLES3.functional.shaders.matrix.pos",
        "t_increment.mediump_mat3x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016144,
        "dEQP-GLES3.functional.shaders.matrix.p",
        "ost_increment.highp_mat3x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016145,
        "dEQP-GLES3.functional.shaders.matrix.po",
        "st_increment.highp_mat3x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016146,
        "dEQP-GLES3.functional.shaders.matrix.",
        "post_increment.lowp_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016147,
        "dEQP-GLES3.functional.shaders.matrix.p",
        "ost_increment.lowp_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016148,
        "dEQP-GLES3.functional.shaders.matrix.p",
        "ost_increment.mediump_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016149,
        "dEQP-GLES3.functional.shaders.matrix.po",
        "st_increment.mediump_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016150,
        "dEQP-GLES3.functional.shaders.matrix.",
        "post_increment.highp_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016151,
        "dEQP-GLES3.functional.shaders.matrix.p",
        "ost_increment.highp_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016152,
        "dEQP-GLES3.functional.shaders.matrix.p",
        "ost_increment.lowp_mat3x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016153,
        "dEQP-GLES3.functional.shaders.matrix.po",
        "st_increment.lowp_mat3x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016154,
        "dEQP-GLES3.functional.shaders.matrix.po",
        "st_increment.mediump_mat3x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016155,
        "dEQP-GLES3.functional.shaders.matrix.pos",
        "t_increment.mediump_mat3x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016156,
        "dEQP-GLES3.functional.shaders.matrix.p",
        "ost_increment.highp_mat3x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016157,
        "dEQP-GLES3.functional.shaders.matrix.po",
        "st_increment.highp_mat3x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016158,
        "dEQP-GLES3.functional.shaders.matrix.p",
        "ost_increment.lowp_mat4x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016159,
        "dEQP-GLES3.functional.shaders.matrix.po",
        "st_increment.lowp_mat4x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016160,
        "dEQP-GLES3.functional.shaders.matrix.po",
        "st_increment.mediump_mat4x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016161,
        "dEQP-GLES3.functional.shaders.matrix.pos",
        "t_increment.mediump_mat4x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016162,
        "dEQP-GLES3.functional.shaders.matrix.p",
        "ost_increment.highp_mat4x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016163,
        "dEQP-GLES3.functional.shaders.matrix.po",
        "st_increment.highp_mat4x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016164,
        "dEQP-GLES3.functional.shaders.matrix.p",
        "ost_increment.lowp_mat4x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016165,
        "dEQP-GLES3.functional.shaders.matrix.po",
        "st_increment.lowp_mat4x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016166,
        "dEQP-GLES3.functional.shaders.matrix.po",
        "st_increment.mediump_mat4x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016167,
        "dEQP-GLES3.functional.shaders.matrix.pos",
        "t_increment.mediump_mat4x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016168,
        "dEQP-GLES3.functional.shaders.matrix.p",
        "ost_increment.highp_mat4x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016169,
        "dEQP-GLES3.functional.shaders.matrix.po",
        "st_increment.highp_mat4x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016170,
        "dEQP-GLES3.functional.shaders.matrix.",
        "post_increment.lowp_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016171,
        "dEQP-GLES3.functional.shaders.matrix.p",
        "ost_increment.lowp_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016172,
        "dEQP-GLES3.functional.shaders.matrix.p",
        "ost_increment.mediump_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016173,
        "dEQP-GLES3.functional.shaders.matrix.po",
        "st_increment.mediump_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016174,
        "dEQP-GLES3.functional.shaders.matrix.",
        "post_increment.highp_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016175,
        "dEQP-GLES3.functional.shaders.matrix.p",
        "ost_increment.highp_mat4_float_fragment");
