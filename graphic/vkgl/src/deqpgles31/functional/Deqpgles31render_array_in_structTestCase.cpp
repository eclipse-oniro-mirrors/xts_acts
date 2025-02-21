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

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017023,
        "dEQP-GLES31.functional.program_uniform.by_poi",
        "nter.render.array_in_struct.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017024,
        "dEQP-GLES31.functional.program_uniform.by_poin",
        "ter.render.array_in_struct.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017025,
        "dEQP-GLES31.functional.program_uniform.by_po",
        "inter.render.array_in_struct.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017026,
        "dEQP-GLES31.functional.program_uniform.by_po",
        "inter.render.array_in_struct.mat4_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017027,
        "dEQP-GLES31.functional.program_uniform.by_poi",
        "nter.render.array_in_struct.mat4_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017028,
        "dEQP-GLES31.functional.program_uniform.by_p",
        "ointer.render.array_in_struct.mat4_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017029,
        "dEQP-GLES31.functional.program_uniform.by_po",
        "inter.render.array_in_struct.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017030,
        "dEQP-GLES31.functional.program_uniform.by_poi",
        "nter.render.array_in_struct.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017031,
        "dEQP-GLES31.functional.program_uniform.by_p",
        "ointer.render.array_in_struct.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017032,
        "dEQP-GLES31.functional.program_uniform.by_poi",
        "nter.render.array_in_struct.uint_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017033,
        "dEQP-GLES31.functional.program_uniform.by_poin",
        "ter.render.array_in_struct.uint_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017034,
        "dEQP-GLES31.functional.program_uniform.by_po",
        "inter.render.array_in_struct.uint_uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017035,
        "dEQP-GLES31.functional.program_uniform.by_poi",
        "nter.render.array_in_struct.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017036,
        "dEQP-GLES31.functional.program_uniform.by_poin",
        "ter.render.array_in_struct.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017037,
        "dEQP-GLES31.functional.program_uniform.by_po",
        "inter.render.array_in_struct.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017038,
        "dEQP-GLES31.functional.program_uniform.by_pointer.",
        "render.array_in_struct.sampler2D_samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017039,
        "dEQP-GLES31.functional.program_uniform.by_pointer.r",
        "ender.array_in_struct.sampler2D_samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017040,
        "dEQP-GLES31.functional.program_uniform.by_pointer",
        ".render.array_in_struct.sampler2D_samplerCube_both");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017401,
        "dEQP-GLES31.functional.program_uniform.by_va",
        "lue.render.array_in_struct.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017402,
        "dEQP-GLES31.functional.program_uniform.by_val",
        "ue.render.array_in_struct.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017403,
        "dEQP-GLES31.functional.program_uniform.by_v",
        "alue.render.array_in_struct.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017404,
        "dEQP-GLES31.functional.program_uniform.by_v",
        "alue.render.array_in_struct.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017405,
        "dEQP-GLES31.functional.program_uniform.by_va",
        "lue.render.array_in_struct.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017406,
        "dEQP-GLES31.functional.program_uniform.by_",
        "value.render.array_in_struct.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017407,
        "dEQP-GLES31.functional.program_uniform.by_va",
        "lue.render.array_in_struct.uint_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017408,
        "dEQP-GLES31.functional.program_uniform.by_val",
        "ue.render.array_in_struct.uint_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017409,
        "dEQP-GLES31.functional.program_uniform.by_v",
        "alue.render.array_in_struct.uint_uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017410,
        "dEQP-GLES31.functional.program_uniform.by_va",
        "lue.render.array_in_struct.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017411,
        "dEQP-GLES31.functional.program_uniform.by_val",
        "ue.render.array_in_struct.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017412,
        "dEQP-GLES31.functional.program_uniform.by_v",
        "alue.render.array_in_struct.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017413,
        "dEQP-GLES31.functional.program_uniform.by_value.r",
        "ender.array_in_struct.sampler2D_samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017414,
        "dEQP-GLES31.functional.program_uniform.by_value.re",
        "nder.array_in_struct.sampler2D_samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017415,
        "dEQP-GLES31.functional.program_uniform.by_value.",
        "render.array_in_struct.sampler2D_samplerCube_both");
