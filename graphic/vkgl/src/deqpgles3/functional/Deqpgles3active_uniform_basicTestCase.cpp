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
#include "../ActsDeqpgles30037TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036241,
        "dEQP-GLES3.functional.uniform_api.info_",
        "query.active_uniform.basic.float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036242,
        "dEQP-GLES3.functional.uniform_api.info_q",
        "uery.active_uniform.basic.float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036243,
        "dEQP-GLES3.functional.uniform_api.info",
        "_query.active_uniform.basic.float_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036244,
        "dEQP-GLES3.functional.uniform_api.info",
        "_query.active_uniform.basic.vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036245,
        "dEQP-GLES3.functional.uniform_api.info_",
        "query.active_uniform.basic.vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036246,
        "dEQP-GLES3.functional.uniform_api.inf",
        "o_query.active_uniform.basic.vec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036247,
        "dEQP-GLES3.functional.uniform_api.info",
        "_query.active_uniform.basic.vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036248,
        "dEQP-GLES3.functional.uniform_api.info_",
        "query.active_uniform.basic.vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036249,
        "dEQP-GLES3.functional.uniform_api.inf",
        "o_query.active_uniform.basic.vec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036250,
        "dEQP-GLES3.functional.uniform_api.info",
        "_query.active_uniform.basic.vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036251,
        "dEQP-GLES3.functional.uniform_api.info_",
        "query.active_uniform.basic.vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036252,
        "dEQP-GLES3.functional.uniform_api.inf",
        "o_query.active_uniform.basic.vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036253,
        "dEQP-GLES3.functional.uniform_api.info",
        "_query.active_uniform.basic.mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036254,
        "dEQP-GLES3.functional.uniform_api.info_",
        "query.active_uniform.basic.mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036255,
        "dEQP-GLES3.functional.uniform_api.inf",
        "o_query.active_uniform.basic.mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036256,
        "dEQP-GLES3.functional.uniform_api.info_",
        "query.active_uniform.basic.mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036257,
        "dEQP-GLES3.functional.uniform_api.info_q",
        "uery.active_uniform.basic.mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036258,
        "dEQP-GLES3.functional.uniform_api.info",
        "_query.active_uniform.basic.mat2x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036259,
        "dEQP-GLES3.functional.uniform_api.info_",
        "query.active_uniform.basic.mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036260,
        "dEQP-GLES3.functional.uniform_api.info_q",
        "uery.active_uniform.basic.mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036261,
        "dEQP-GLES3.functional.uniform_api.info",
        "_query.active_uniform.basic.mat2x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036262,
        "dEQP-GLES3.functional.uniform_api.info_",
        "query.active_uniform.basic.mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036263,
        "dEQP-GLES3.functional.uniform_api.info_q",
        "uery.active_uniform.basic.mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036264,
        "dEQP-GLES3.functional.uniform_api.info",
        "_query.active_uniform.basic.mat3x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036265,
        "dEQP-GLES3.functional.uniform_api.info",
        "_query.active_uniform.basic.mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036266,
        "dEQP-GLES3.functional.uniform_api.info_",
        "query.active_uniform.basic.mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036267,
        "dEQP-GLES3.functional.uniform_api.inf",
        "o_query.active_uniform.basic.mat3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036268,
        "dEQP-GLES3.functional.uniform_api.info_",
        "query.active_uniform.basic.mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036269,
        "dEQP-GLES3.functional.uniform_api.info_q",
        "uery.active_uniform.basic.mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036270,
        "dEQP-GLES3.functional.uniform_api.info",
        "_query.active_uniform.basic.mat3x4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036271,
        "dEQP-GLES3.functional.uniform_api.info_",
        "query.active_uniform.basic.mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036272,
        "dEQP-GLES3.functional.uniform_api.info_q",
        "uery.active_uniform.basic.mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036273,
        "dEQP-GLES3.functional.uniform_api.info",
        "_query.active_uniform.basic.mat4x2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036274,
        "dEQP-GLES3.functional.uniform_api.info_",
        "query.active_uniform.basic.mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036275,
        "dEQP-GLES3.functional.uniform_api.info_q",
        "uery.active_uniform.basic.mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036276,
        "dEQP-GLES3.functional.uniform_api.info",
        "_query.active_uniform.basic.mat4x3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036277,
        "dEQP-GLES3.functional.uniform_api.info",
        "_query.active_uniform.basic.mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036278,
        "dEQP-GLES3.functional.uniform_api.info_",
        "query.active_uniform.basic.mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036279,
        "dEQP-GLES3.functional.uniform_api.inf",
        "o_query.active_uniform.basic.mat4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036280,
        "dEQP-GLES3.functional.uniform_api.info",
        "_query.active_uniform.basic.int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036281,
        "dEQP-GLES3.functional.uniform_api.info_",
        "query.active_uniform.basic.int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036282,
        "dEQP-GLES3.functional.uniform_api.inf",
        "o_query.active_uniform.basic.int_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036283,
        "dEQP-GLES3.functional.uniform_api.info_",
        "query.active_uniform.basic.ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036284,
        "dEQP-GLES3.functional.uniform_api.info_q",
        "uery.active_uniform.basic.ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036285,
        "dEQP-GLES3.functional.uniform_api.info",
        "_query.active_uniform.basic.ivec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036286,
        "dEQP-GLES3.functional.uniform_api.info_",
        "query.active_uniform.basic.ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036287,
        "dEQP-GLES3.functional.uniform_api.info_q",
        "uery.active_uniform.basic.ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036288,
        "dEQP-GLES3.functional.uniform_api.info",
        "_query.active_uniform.basic.ivec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036289,
        "dEQP-GLES3.functional.uniform_api.info_",
        "query.active_uniform.basic.ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036290,
        "dEQP-GLES3.functional.uniform_api.info_q",
        "uery.active_uniform.basic.ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036291,
        "dEQP-GLES3.functional.uniform_api.info",
        "_query.active_uniform.basic.ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036292,
        "dEQP-GLES3.functional.uniform_api.info",
        "_query.active_uniform.basic.uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036293,
        "dEQP-GLES3.functional.uniform_api.info_",
        "query.active_uniform.basic.uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036294,
        "dEQP-GLES3.functional.uniform_api.inf",
        "o_query.active_uniform.basic.uint_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036295,
        "dEQP-GLES3.functional.uniform_api.info_",
        "query.active_uniform.basic.uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036296,
        "dEQP-GLES3.functional.uniform_api.info_q",
        "uery.active_uniform.basic.uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036297,
        "dEQP-GLES3.functional.uniform_api.info",
        "_query.active_uniform.basic.uvec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036298,
        "dEQP-GLES3.functional.uniform_api.info_",
        "query.active_uniform.basic.uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036299,
        "dEQP-GLES3.functional.uniform_api.info_q",
        "uery.active_uniform.basic.uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036300,
        "dEQP-GLES3.functional.uniform_api.info",
        "_query.active_uniform.basic.uvec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036301,
        "dEQP-GLES3.functional.uniform_api.info_",
        "query.active_uniform.basic.uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036302,
        "dEQP-GLES3.functional.uniform_api.info_q",
        "uery.active_uniform.basic.uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036303,
        "dEQP-GLES3.functional.uniform_api.info",
        "_query.active_uniform.basic.uvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036304,
        "dEQP-GLES3.functional.uniform_api.info",
        "_query.active_uniform.basic.bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036305,
        "dEQP-GLES3.functional.uniform_api.info_",
        "query.active_uniform.basic.bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036306,
        "dEQP-GLES3.functional.uniform_api.inf",
        "o_query.active_uniform.basic.bool_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036307,
        "dEQP-GLES3.functional.uniform_api.info_",
        "query.active_uniform.basic.bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036308,
        "dEQP-GLES3.functional.uniform_api.info_q",
        "uery.active_uniform.basic.bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036309,
        "dEQP-GLES3.functional.uniform_api.info",
        "_query.active_uniform.basic.bvec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036310,
        "dEQP-GLES3.functional.uniform_api.info_",
        "query.active_uniform.basic.bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036311,
        "dEQP-GLES3.functional.uniform_api.info_q",
        "uery.active_uniform.basic.bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036312,
        "dEQP-GLES3.functional.uniform_api.info",
        "_query.active_uniform.basic.bvec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036313,
        "dEQP-GLES3.functional.uniform_api.info_",
        "query.active_uniform.basic.bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036314,
        "dEQP-GLES3.functional.uniform_api.info_q",
        "uery.active_uniform.basic.bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036315,
        "dEQP-GLES3.functional.uniform_api.info",
        "_query.active_uniform.basic.bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036316,
        "dEQP-GLES3.functional.uniform_api.info_qu",
        "ery.active_uniform.basic.sampler2D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036317,
        "dEQP-GLES3.functional.uniform_api.info_que",
        "ry.active_uniform.basic.sampler2D_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036318,
        "dEQP-GLES3.functional.uniform_api.info_q",
        "uery.active_uniform.basic.sampler2D_both");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036319,
        "dEQP-GLES3.functional.uniform_api.info_que",
        "ry.active_uniform.basic.samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036320,
        "dEQP-GLES3.functional.uniform_api.info_quer",
        "y.active_uniform.basic.samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036321,
        "dEQP-GLES3.functional.uniform_api.info_qu",
        "ery.active_uniform.basic.samplerCube_both");
