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
#include "../ActsDeqpgles310018TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017005,
        "dEQP-GLES31.functional.program_uniform.by_poi",
        "nter.render.struct_in_array.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017006,
        "dEQP-GLES31.functional.program_uniform.by_poin",
        "ter.render.struct_in_array.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017007,
        "dEQP-GLES31.functional.program_uniform.by_po",
        "inter.render.struct_in_array.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017008,
        "dEQP-GLES31.functional.program_uniform.by_po",
        "inter.render.struct_in_array.mat4_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017009,
        "dEQP-GLES31.functional.program_uniform.by_poi",
        "nter.render.struct_in_array.mat4_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017010,
        "dEQP-GLES31.functional.program_uniform.by_p",
        "ointer.render.struct_in_array.mat4_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017011,
        "dEQP-GLES31.functional.program_uniform.by_po",
        "inter.render.struct_in_array.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017012,
        "dEQP-GLES31.functional.program_uniform.by_poi",
        "nter.render.struct_in_array.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017013,
        "dEQP-GLES31.functional.program_uniform.by_p",
        "ointer.render.struct_in_array.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017014,
        "dEQP-GLES31.functional.program_uniform.by_poi",
        "nter.render.struct_in_array.uint_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017015,
        "dEQP-GLES31.functional.program_uniform.by_poin",
        "ter.render.struct_in_array.uint_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017016,
        "dEQP-GLES31.functional.program_uniform.by_po",
        "inter.render.struct_in_array.uint_uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017017,
        "dEQP-GLES31.functional.program_uniform.by_poi",
        "nter.render.struct_in_array.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017018,
        "dEQP-GLES31.functional.program_uniform.by_poin",
        "ter.render.struct_in_array.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017019,
        "dEQP-GLES31.functional.program_uniform.by_po",
        "inter.render.struct_in_array.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017020,
        "dEQP-GLES31.functional.program_uniform.by_pointer.",
        "render.struct_in_array.sampler2D_samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017021,
        "dEQP-GLES31.functional.program_uniform.by_pointer.r",
        "ender.struct_in_array.sampler2D_samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017022,
        "dEQP-GLES31.functional.program_uniform.by_pointer",
        ".render.struct_in_array.sampler2D_samplerCube_both");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017386,
        "dEQP-GLES31.functional.program_uniform.by_va",
        "lue.render.struct_in_array.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017387,
        "dEQP-GLES31.functional.program_uniform.by_val",
        "ue.render.struct_in_array.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017388,
        "dEQP-GLES31.functional.program_uniform.by_v",
        "alue.render.struct_in_array.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017389,
        "dEQP-GLES31.functional.program_uniform.by_v",
        "alue.render.struct_in_array.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017390,
        "dEQP-GLES31.functional.program_uniform.by_va",
        "lue.render.struct_in_array.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017391,
        "dEQP-GLES31.functional.program_uniform.by_",
        "value.render.struct_in_array.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017392,
        "dEQP-GLES31.functional.program_uniform.by_va",
        "lue.render.struct_in_array.uint_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017393,
        "dEQP-GLES31.functional.program_uniform.by_val",
        "ue.render.struct_in_array.uint_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017394,
        "dEQP-GLES31.functional.program_uniform.by_v",
        "alue.render.struct_in_array.uint_uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017395,
        "dEQP-GLES31.functional.program_uniform.by_va",
        "lue.render.struct_in_array.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017396,
        "dEQP-GLES31.functional.program_uniform.by_val",
        "ue.render.struct_in_array.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017397,
        "dEQP-GLES31.functional.program_uniform.by_v",
        "alue.render.struct_in_array.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017398,
        "dEQP-GLES31.functional.program_uniform.by_value.r",
        "ender.struct_in_array.sampler2D_samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017399,
        "dEQP-GLES31.functional.program_uniform.by_value.re",
        "nder.struct_in_array.sampler2D_samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017400,
        "dEQP-GLES31.functional.program_uniform.by_value.",
        "render.struct_in_array.sampler2D_samplerCube_both");
