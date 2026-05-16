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

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017539,
        "dEQP-GLES31.functional.program_unifo",
        "rm.unused_uniforms.float_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017540,
        "dEQP-GLES31.functional.program_unifor",
        "m.unused_uniforms.float_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017541,
        "dEQP-GLES31.functional.program_unif",
        "orm.unused_uniforms.float_vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017542,
        "dEQP-GLES31.functional.program_unif",
        "orm.unused_uniforms.mat4_mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017543,
        "dEQP-GLES31.functional.program_unifo",
        "rm.unused_uniforms.mat4_mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017544,
        "dEQP-GLES31.functional.program_uni",
        "form.unused_uniforms.mat4_mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017545,
        "dEQP-GLES31.functional.program_unif",
        "orm.unused_uniforms.int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017546,
        "dEQP-GLES31.functional.program_unifo",
        "rm.unused_uniforms.int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017547,
        "dEQP-GLES31.functional.program_uni",
        "form.unused_uniforms.int_ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017548,
        "dEQP-GLES31.functional.program_unifo",
        "rm.unused_uniforms.uint_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017549,
        "dEQP-GLES31.functional.program_unifor",
        "m.unused_uniforms.uint_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017550,
        "dEQP-GLES31.functional.program_unif",
        "orm.unused_uniforms.uint_uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017551,
        "dEQP-GLES31.functional.program_unifo",
        "rm.unused_uniforms.bool_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017552,
        "dEQP-GLES31.functional.program_unifor",
        "m.unused_uniforms.bool_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017553,
        "dEQP-GLES31.functional.program_unif",
        "orm.unused_uniforms.bool_bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017554,
        "dEQP-GLES31.functional.program_uniform.un",
        "used_uniforms.sampler2D_samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017555,
        "dEQP-GLES31.functional.program_uniform.unu",
        "sed_uniforms.sampler2D_samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017556,
        "dEQP-GLES31.functional.program_uniform.u",
        "nused_uniforms.sampler2D_samplerCube_both");
