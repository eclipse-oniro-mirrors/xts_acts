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

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016987,
        "dEQP-GLES31.functional.program_uniform.by_p",
        "ointer.render.basic_struct.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016988,
        "dEQP-GLES31.functional.program_uniform.by_po",
        "inter.render.basic_struct.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016989,
        "dEQP-GLES31.functional.program_uniform.by_",
        "pointer.render.basic_struct.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016990,
        "dEQP-GLES31.functional.program_uniform.by_p",
        "ointer.render.basic_struct.mat4_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016991,
        "dEQP-GLES31.functional.program_uniform.by_po",
        "inter.render.basic_struct.mat4_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016992,
        "dEQP-GLES31.functional.program_uniform.by_",
        "pointer.render.basic_struct.mat4_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016993,
        "dEQP-GLES31.functional.program_uniform.by_p",
        "ointer.render.basic_struct.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016994,
        "dEQP-GLES31.functional.program_uniform.by_po",
        "inter.render.basic_struct.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016995,
        "dEQP-GLES31.functional.program_uniform.by_",
        "pointer.render.basic_struct.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016996,
        "dEQP-GLES31.functional.program_uniform.by_p",
        "ointer.render.basic_struct.uint_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016997,
        "dEQP-GLES31.functional.program_uniform.by_po",
        "inter.render.basic_struct.uint_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016998,
        "dEQP-GLES31.functional.program_uniform.by_",
        "pointer.render.basic_struct.uint_uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016999,
        "dEQP-GLES31.functional.program_uniform.by_p",
        "ointer.render.basic_struct.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017000,
        "dEQP-GLES31.functional.program_uniform.by_po",
        "inter.render.basic_struct.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017001,
        "dEQP-GLES31.functional.program_uniform.by_",
        "pointer.render.basic_struct.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017002,
        "dEQP-GLES31.functional.program_uniform.by_pointer",
        ".render.basic_struct.sampler2D_samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017003,
        "dEQP-GLES31.functional.program_uniform.by_pointer.",
        "render.basic_struct.sampler2D_samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017004,
        "dEQP-GLES31.functional.program_uniform.by_pointe",
        "r.render.basic_struct.sampler2D_samplerCube_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017371,
        "dEQP-GLES31.functional.program_uniform.by_",
        "value.render.basic_struct.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017372,
        "dEQP-GLES31.functional.program_uniform.by_v",
        "alue.render.basic_struct.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017373,
        "dEQP-GLES31.functional.program_uniform.by",
        "_value.render.basic_struct.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017374,
        "dEQP-GLES31.functional.program_uniform.by_",
        "value.render.basic_struct.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017375,
        "dEQP-GLES31.functional.program_uniform.by_v",
        "alue.render.basic_struct.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017376,
        "dEQP-GLES31.functional.program_uniform.by",
        "_value.render.basic_struct.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017377,
        "dEQP-GLES31.functional.program_uniform.by_",
        "value.render.basic_struct.uint_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017378,
        "dEQP-GLES31.functional.program_uniform.by_v",
        "alue.render.basic_struct.uint_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017379,
        "dEQP-GLES31.functional.program_uniform.by",
        "_value.render.basic_struct.uint_uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017380,
        "dEQP-GLES31.functional.program_uniform.by_",
        "value.render.basic_struct.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017381,
        "dEQP-GLES31.functional.program_uniform.by_v",
        "alue.render.basic_struct.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017382,
        "dEQP-GLES31.functional.program_uniform.by",
        "_value.render.basic_struct.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017383,
        "dEQP-GLES31.functional.program_uniform.by_value.",
        "render.basic_struct.sampler2D_samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017384,
        "dEQP-GLES31.functional.program_uniform.by_value.r",
        "ender.basic_struct.sampler2D_samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_017385,
        "dEQP-GLES31.functional.program_uniform.by_value",
        ".render.basic_struct.sampler2D_samplerCube_both");
