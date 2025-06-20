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

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016176,
        "dEQP-GLES3.functional.shaders.matrix.",
        "post_decrement.lowp_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016177,
        "dEQP-GLES3.functional.shaders.matrix.p",
        "ost_decrement.lowp_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016178,
        "dEQP-GLES3.functional.shaders.matrix.p",
        "ost_decrement.mediump_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016179,
        "dEQP-GLES3.functional.shaders.matrix.po",
        "st_decrement.mediump_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016180,
        "dEQP-GLES3.functional.shaders.matrix.",
        "post_decrement.highp_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016181,
        "dEQP-GLES3.functional.shaders.matrix.p",
        "ost_decrement.highp_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016182,
        "dEQP-GLES3.functional.shaders.matrix.p",
        "ost_decrement.lowp_mat2x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016183,
        "dEQP-GLES3.functional.shaders.matrix.po",
        "st_decrement.lowp_mat2x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016184,
        "dEQP-GLES3.functional.shaders.matrix.po",
        "st_decrement.mediump_mat2x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016185,
        "dEQP-GLES3.functional.shaders.matrix.pos",
        "t_decrement.mediump_mat2x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016186,
        "dEQP-GLES3.functional.shaders.matrix.p",
        "ost_decrement.highp_mat2x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016187,
        "dEQP-GLES3.functional.shaders.matrix.po",
        "st_decrement.highp_mat2x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016188,
        "dEQP-GLES3.functional.shaders.matrix.p",
        "ost_decrement.lowp_mat2x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016189,
        "dEQP-GLES3.functional.shaders.matrix.po",
        "st_decrement.lowp_mat2x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016190,
        "dEQP-GLES3.functional.shaders.matrix.po",
        "st_decrement.mediump_mat2x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016191,
        "dEQP-GLES3.functional.shaders.matrix.pos",
        "t_decrement.mediump_mat2x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016192,
        "dEQP-GLES3.functional.shaders.matrix.p",
        "ost_decrement.highp_mat2x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016193,
        "dEQP-GLES3.functional.shaders.matrix.po",
        "st_decrement.highp_mat2x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016194,
        "dEQP-GLES3.functional.shaders.matrix.p",
        "ost_decrement.lowp_mat3x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016195,
        "dEQP-GLES3.functional.shaders.matrix.po",
        "st_decrement.lowp_mat3x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016196,
        "dEQP-GLES3.functional.shaders.matrix.po",
        "st_decrement.mediump_mat3x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016197,
        "dEQP-GLES3.functional.shaders.matrix.pos",
        "t_decrement.mediump_mat3x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016198,
        "dEQP-GLES3.functional.shaders.matrix.p",
        "ost_decrement.highp_mat3x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016199,
        "dEQP-GLES3.functional.shaders.matrix.po",
        "st_decrement.highp_mat3x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016200,
        "dEQP-GLES3.functional.shaders.matrix.",
        "post_decrement.lowp_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016201,
        "dEQP-GLES3.functional.shaders.matrix.p",
        "ost_decrement.lowp_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016202,
        "dEQP-GLES3.functional.shaders.matrix.p",
        "ost_decrement.mediump_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016203,
        "dEQP-GLES3.functional.shaders.matrix.po",
        "st_decrement.mediump_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016204,
        "dEQP-GLES3.functional.shaders.matrix.",
        "post_decrement.highp_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016205,
        "dEQP-GLES3.functional.shaders.matrix.p",
        "ost_decrement.highp_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016206,
        "dEQP-GLES3.functional.shaders.matrix.p",
        "ost_decrement.lowp_mat3x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016207,
        "dEQP-GLES3.functional.shaders.matrix.po",
        "st_decrement.lowp_mat3x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016208,
        "dEQP-GLES3.functional.shaders.matrix.po",
        "st_decrement.mediump_mat3x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016209,
        "dEQP-GLES3.functional.shaders.matrix.pos",
        "t_decrement.mediump_mat3x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016210,
        "dEQP-GLES3.functional.shaders.matrix.p",
        "ost_decrement.highp_mat3x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016211,
        "dEQP-GLES3.functional.shaders.matrix.po",
        "st_decrement.highp_mat3x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016212,
        "dEQP-GLES3.functional.shaders.matrix.p",
        "ost_decrement.lowp_mat4x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016213,
        "dEQP-GLES3.functional.shaders.matrix.po",
        "st_decrement.lowp_mat4x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016214,
        "dEQP-GLES3.functional.shaders.matrix.po",
        "st_decrement.mediump_mat4x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016215,
        "dEQP-GLES3.functional.shaders.matrix.pos",
        "t_decrement.mediump_mat4x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016216,
        "dEQP-GLES3.functional.shaders.matrix.p",
        "ost_decrement.highp_mat4x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016217,
        "dEQP-GLES3.functional.shaders.matrix.po",
        "st_decrement.highp_mat4x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016218,
        "dEQP-GLES3.functional.shaders.matrix.p",
        "ost_decrement.lowp_mat4x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016219,
        "dEQP-GLES3.functional.shaders.matrix.po",
        "st_decrement.lowp_mat4x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016220,
        "dEQP-GLES3.functional.shaders.matrix.po",
        "st_decrement.mediump_mat4x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016221,
        "dEQP-GLES3.functional.shaders.matrix.pos",
        "t_decrement.mediump_mat4x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016222,
        "dEQP-GLES3.functional.shaders.matrix.p",
        "ost_decrement.highp_mat4x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016223,
        "dEQP-GLES3.functional.shaders.matrix.po",
        "st_decrement.highp_mat4x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016224,
        "dEQP-GLES3.functional.shaders.matrix.",
        "post_decrement.lowp_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016225,
        "dEQP-GLES3.functional.shaders.matrix.p",
        "ost_decrement.lowp_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016226,
        "dEQP-GLES3.functional.shaders.matrix.p",
        "ost_decrement.mediump_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016227,
        "dEQP-GLES3.functional.shaders.matrix.po",
        "st_decrement.mediump_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016228,
        "dEQP-GLES3.functional.shaders.matrix.",
        "post_decrement.highp_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016229,
        "dEQP-GLES3.functional.shaders.matrix.p",
        "ost_decrement.highp_mat4_float_fragment");
