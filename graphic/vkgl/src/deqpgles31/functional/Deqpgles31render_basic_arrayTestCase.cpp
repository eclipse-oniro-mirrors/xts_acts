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
#include "../ActsDeqpgles310017TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016954,
        "dEQP-GLES31.functional.program_uniform.b",
        "y_pointer.render.basic_array.float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016955,
        "dEQP-GLES31.functional.program_uniform.by",
        "_pointer.render.basic_array.float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016956,
        "dEQP-GLES31.functional.program_uniform.",
        "by_pointer.render.basic_array.float_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016957,
        "dEQP-GLES31.functional.program_uniform.b",
        "y_pointer.render.basic_array.vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016958,
        "dEQP-GLES31.functional.program_uniform.by",
        "_pointer.render.basic_array.vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016959,
        "dEQP-GLES31.functional.program_uniform.",
        "by_pointer.render.basic_array.vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016960,
        "dEQP-GLES31.functional.program_uniform.b",
        "y_pointer.render.basic_array.mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016961,
        "dEQP-GLES31.functional.program_uniform.by",
        "_pointer.render.basic_array.mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016962,
        "dEQP-GLES31.functional.program_uniform.",
        "by_pointer.render.basic_array.mat4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016963,
        "dEQP-GLES31.functional.program_uniform.by_poi",
        "nter.render.basic_array.mat4_row_major_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016964,
        "dEQP-GLES31.functional.program_uniform.by_poin",
        "ter.render.basic_array.mat4_row_major_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016965,
        "dEQP-GLES31.functional.program_uniform.by_po",
        "inter.render.basic_array.mat4_row_major_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016966,
        "dEQP-GLES31.functional.program_uniform.",
        "by_pointer.render.basic_array.int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016967,
        "dEQP-GLES31.functional.program_uniform.b",
        "y_pointer.render.basic_array.int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016968,
        "dEQP-GLES31.functional.program_uniform",
        ".by_pointer.render.basic_array.int_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016969,
        "dEQP-GLES31.functional.program_uniform.b",
        "y_pointer.render.basic_array.ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016970,
        "dEQP-GLES31.functional.program_uniform.by",
        "_pointer.render.basic_array.ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016971,
        "dEQP-GLES31.functional.program_uniform.",
        "by_pointer.render.basic_array.ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016972,
        "dEQP-GLES31.functional.program_uniform.b",
        "y_pointer.render.basic_array.uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016973,
        "dEQP-GLES31.functional.program_uniform.by",
        "_pointer.render.basic_array.uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016974,
        "dEQP-GLES31.functional.program_uniform.",
        "by_pointer.render.basic_array.uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016975,
        "dEQP-GLES31.functional.program_uniform.b",
        "y_pointer.render.basic_array.uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016976,
        "dEQP-GLES31.functional.program_uniform.by",
        "_pointer.render.basic_array.uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016977,
        "dEQP-GLES31.functional.program_uniform.",
        "by_pointer.render.basic_array.uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016978,
        "dEQP-GLES31.functional.program_uniform.b",
        "y_pointer.render.basic_array.bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016979,
        "dEQP-GLES31.functional.program_uniform.by",
        "_pointer.render.basic_array.bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016980,
        "dEQP-GLES31.functional.program_uniform.",
        "by_pointer.render.basic_array.bool_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016981,
        "dEQP-GLES31.functional.program_uniform.b",
        "y_pointer.render.basic_array.bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016982,
        "dEQP-GLES31.functional.program_uniform.by",
        "_pointer.render.basic_array.bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016983,
        "dEQP-GLES31.functional.program_uniform.",
        "by_pointer.render.basic_array.bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016984,
        "dEQP-GLES31.functional.program_uniform.by_",
        "pointer.render.basic_array.sampler2D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016985,
        "dEQP-GLES31.functional.program_uniform.by_p",
        "ointer.render.basic_array.sampler2D_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016986,
        "dEQP-GLES31.functional.program_uniform.by",
        "_pointer.render.basic_array.sampler2D_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017344,
        "dEQP-GLES31.functional.program_uniform.",
        "by_value.render.basic_array.float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017345,
        "dEQP-GLES31.functional.program_uniform.b",
        "y_value.render.basic_array.float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017346,
        "dEQP-GLES31.functional.program_uniform",
        ".by_value.render.basic_array.float_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017347,
        "dEQP-GLES31.functional.program_uniform.",
        "by_value.render.basic_array.vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017348,
        "dEQP-GLES31.functional.program_uniform.b",
        "y_value.render.basic_array.vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017349,
        "dEQP-GLES31.functional.program_uniform",
        ".by_value.render.basic_array.vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017350,
        "dEQP-GLES31.functional.program_uniform",
        ".by_value.render.basic_array.int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017351,
        "dEQP-GLES31.functional.program_uniform.",
        "by_value.render.basic_array.int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017352,
        "dEQP-GLES31.functional.program_unifor",
        "m.by_value.render.basic_array.int_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017353,
        "dEQP-GLES31.functional.program_uniform.",
        "by_value.render.basic_array.ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017354,
        "dEQP-GLES31.functional.program_uniform.b",
        "y_value.render.basic_array.ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017355,
        "dEQP-GLES31.functional.program_uniform",
        ".by_value.render.basic_array.ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017356,
        "dEQP-GLES31.functional.program_uniform.",
        "by_value.render.basic_array.uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017357,
        "dEQP-GLES31.functional.program_uniform.b",
        "y_value.render.basic_array.uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017358,
        "dEQP-GLES31.functional.program_uniform",
        ".by_value.render.basic_array.uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017359,
        "dEQP-GLES31.functional.program_uniform.",
        "by_value.render.basic_array.uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017360,
        "dEQP-GLES31.functional.program_uniform.b",
        "y_value.render.basic_array.uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017361,
        "dEQP-GLES31.functional.program_uniform",
        ".by_value.render.basic_array.uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017362,
        "dEQP-GLES31.functional.program_uniform.",
        "by_value.render.basic_array.bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017363,
        "dEQP-GLES31.functional.program_uniform.b",
        "y_value.render.basic_array.bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017364,
        "dEQP-GLES31.functional.program_uniform",
        ".by_value.render.basic_array.bool_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017365,
        "dEQP-GLES31.functional.program_uniform.",
        "by_value.render.basic_array.bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017366,
        "dEQP-GLES31.functional.program_uniform.b",
        "y_value.render.basic_array.bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017367,
        "dEQP-GLES31.functional.program_uniform",
        ".by_value.render.basic_array.bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017368,
        "dEQP-GLES31.functional.program_uniform.by",
        "_value.render.basic_array.sampler2D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017369,
        "dEQP-GLES31.functional.program_uniform.by_",
        "value.render.basic_array.sampler2D_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017370,
        "dEQP-GLES31.functional.program_uniform.b",
        "y_value.render.basic_array.sampler2D_both");
