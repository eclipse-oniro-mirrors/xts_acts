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

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016068,
        "dEQP-GLES3.functional.shaders.matrix",
        ".pre_decrement.lowp_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016069,
        "dEQP-GLES3.functional.shaders.matrix.",
        "pre_decrement.lowp_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016070,
        "dEQP-GLES3.functional.shaders.matrix.p",
        "re_decrement.mediump_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016071,
        "dEQP-GLES3.functional.shaders.matrix.pr",
        "e_decrement.mediump_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016072,
        "dEQP-GLES3.functional.shaders.matrix.",
        "pre_decrement.highp_mat2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016073,
        "dEQP-GLES3.functional.shaders.matrix.p",
        "re_decrement.highp_mat2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016074,
        "dEQP-GLES3.functional.shaders.matrix.",
        "pre_decrement.lowp_mat2x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016075,
        "dEQP-GLES3.functional.shaders.matrix.p",
        "re_decrement.lowp_mat2x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016076,
        "dEQP-GLES3.functional.shaders.matrix.pr",
        "e_decrement.mediump_mat2x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016077,
        "dEQP-GLES3.functional.shaders.matrix.pre",
        "_decrement.mediump_mat2x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016078,
        "dEQP-GLES3.functional.shaders.matrix.p",
        "re_decrement.highp_mat2x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016079,
        "dEQP-GLES3.functional.shaders.matrix.pr",
        "e_decrement.highp_mat2x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016080,
        "dEQP-GLES3.functional.shaders.matrix.",
        "pre_decrement.lowp_mat2x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016081,
        "dEQP-GLES3.functional.shaders.matrix.p",
        "re_decrement.lowp_mat2x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016082,
        "dEQP-GLES3.functional.shaders.matrix.pr",
        "e_decrement.mediump_mat2x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016083,
        "dEQP-GLES3.functional.shaders.matrix.pre",
        "_decrement.mediump_mat2x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016084,
        "dEQP-GLES3.functional.shaders.matrix.p",
        "re_decrement.highp_mat2x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016085,
        "dEQP-GLES3.functional.shaders.matrix.pr",
        "e_decrement.highp_mat2x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016086,
        "dEQP-GLES3.functional.shaders.matrix.",
        "pre_decrement.lowp_mat3x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016087,
        "dEQP-GLES3.functional.shaders.matrix.p",
        "re_decrement.lowp_mat3x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016088,
        "dEQP-GLES3.functional.shaders.matrix.pr",
        "e_decrement.mediump_mat3x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016089,
        "dEQP-GLES3.functional.shaders.matrix.pre",
        "_decrement.mediump_mat3x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016090,
        "dEQP-GLES3.functional.shaders.matrix.p",
        "re_decrement.highp_mat3x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016091,
        "dEQP-GLES3.functional.shaders.matrix.pr",
        "e_decrement.highp_mat3x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016092,
        "dEQP-GLES3.functional.shaders.matrix",
        ".pre_decrement.lowp_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016093,
        "dEQP-GLES3.functional.shaders.matrix.",
        "pre_decrement.lowp_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016094,
        "dEQP-GLES3.functional.shaders.matrix.p",
        "re_decrement.mediump_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016095,
        "dEQP-GLES3.functional.shaders.matrix.pr",
        "e_decrement.mediump_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016096,
        "dEQP-GLES3.functional.shaders.matrix.",
        "pre_decrement.highp_mat3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016097,
        "dEQP-GLES3.functional.shaders.matrix.p",
        "re_decrement.highp_mat3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016098,
        "dEQP-GLES3.functional.shaders.matrix.",
        "pre_decrement.lowp_mat3x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016099,
        "dEQP-GLES3.functional.shaders.matrix.p",
        "re_decrement.lowp_mat3x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016100,
        "dEQP-GLES3.functional.shaders.matrix.pr",
        "e_decrement.mediump_mat3x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016101,
        "dEQP-GLES3.functional.shaders.matrix.pre",
        "_decrement.mediump_mat3x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016102,
        "dEQP-GLES3.functional.shaders.matrix.p",
        "re_decrement.highp_mat3x4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016103,
        "dEQP-GLES3.functional.shaders.matrix.pr",
        "e_decrement.highp_mat3x4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016104,
        "dEQP-GLES3.functional.shaders.matrix.",
        "pre_decrement.lowp_mat4x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016105,
        "dEQP-GLES3.functional.shaders.matrix.p",
        "re_decrement.lowp_mat4x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016106,
        "dEQP-GLES3.functional.shaders.matrix.pr",
        "e_decrement.mediump_mat4x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016107,
        "dEQP-GLES3.functional.shaders.matrix.pre",
        "_decrement.mediump_mat4x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016108,
        "dEQP-GLES3.functional.shaders.matrix.p",
        "re_decrement.highp_mat4x2_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016109,
        "dEQP-GLES3.functional.shaders.matrix.pr",
        "e_decrement.highp_mat4x2_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016110,
        "dEQP-GLES3.functional.shaders.matrix.",
        "pre_decrement.lowp_mat4x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016111,
        "dEQP-GLES3.functional.shaders.matrix.p",
        "re_decrement.lowp_mat4x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016112,
        "dEQP-GLES3.functional.shaders.matrix.pr",
        "e_decrement.mediump_mat4x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016113,
        "dEQP-GLES3.functional.shaders.matrix.pre",
        "_decrement.mediump_mat4x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016114,
        "dEQP-GLES3.functional.shaders.matrix.p",
        "re_decrement.highp_mat4x3_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016115,
        "dEQP-GLES3.functional.shaders.matrix.pr",
        "e_decrement.highp_mat4x3_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016116,
        "dEQP-GLES3.functional.shaders.matrix",
        ".pre_decrement.lowp_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016117,
        "dEQP-GLES3.functional.shaders.matrix.",
        "pre_decrement.lowp_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016118,
        "dEQP-GLES3.functional.shaders.matrix.p",
        "re_decrement.mediump_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016119,
        "dEQP-GLES3.functional.shaders.matrix.pr",
        "e_decrement.mediump_mat4_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016120,
        "dEQP-GLES3.functional.shaders.matrix.",
        "pre_decrement.highp_mat4_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016121,
        "dEQP-GLES3.functional.shaders.matrix.p",
        "re_decrement.highp_mat4_float_fragment");
