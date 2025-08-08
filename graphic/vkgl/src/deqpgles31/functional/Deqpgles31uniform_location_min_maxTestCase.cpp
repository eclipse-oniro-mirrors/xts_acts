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
#include "../ActsDeqpgles310019TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018122,
        "dEQP-GLES31.functional.uniform_l",
        "ocation.min_max.float_vertex_min");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018123,
        "dEQP-GLES31.functional.uniform_l",
        "ocation.min_max.float_vertex_max");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018124,
        "dEQP-GLES31.functional.uniform_lo",
        "cation.min_max.float_fragment_min");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018125,
        "dEQP-GLES31.functional.uniform_lo",
        "cation.min_max.float_fragment_max");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018126,
        "dEQP-GLES31.functional.uniform_",
        "location.min_max.vec2_vertex_min");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018127,
        "dEQP-GLES31.functional.uniform_",
        "location.min_max.vec2_vertex_max");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018128,
        "dEQP-GLES31.functional.uniform_l",
        "ocation.min_max.vec2_fragment_min");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018129,
        "dEQP-GLES31.functional.uniform_l",
        "ocation.min_max.vec2_fragment_max");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018130,
        "dEQP-GLES31.functional.uniform_",
        "location.min_max.vec3_vertex_min");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018131,
        "dEQP-GLES31.functional.uniform_",
        "location.min_max.vec3_vertex_max");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018132,
        "dEQP-GLES31.functional.uniform_l",
        "ocation.min_max.vec3_fragment_min");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018133,
        "dEQP-GLES31.functional.uniform_l",
        "ocation.min_max.vec3_fragment_max");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018134,
        "dEQP-GLES31.functional.uniform_",
        "location.min_max.vec4_vertex_min");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018135,
        "dEQP-GLES31.functional.uniform_",
        "location.min_max.vec4_vertex_max");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018136,
        "dEQP-GLES31.functional.uniform_l",
        "ocation.min_max.vec4_fragment_min");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018137,
        "dEQP-GLES31.functional.uniform_l",
        "ocation.min_max.vec4_fragment_max");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018138,
        "dEQP-GLES31.functional.uniform_",
        "location.min_max.int_vertex_min");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018139,
        "dEQP-GLES31.functional.uniform_",
        "location.min_max.int_vertex_max");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018140,
        "dEQP-GLES31.functional.uniform_l",
        "ocation.min_max.int_fragment_min");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018141,
        "dEQP-GLES31.functional.uniform_l",
        "ocation.min_max.int_fragment_max");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018142,
        "dEQP-GLES31.functional.uniform_l",
        "ocation.min_max.ivec2_vertex_min");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018143,
        "dEQP-GLES31.functional.uniform_l",
        "ocation.min_max.ivec2_vertex_max");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018144,
        "dEQP-GLES31.functional.uniform_lo",
        "cation.min_max.ivec2_fragment_min");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018145,
        "dEQP-GLES31.functional.uniform_lo",
        "cation.min_max.ivec2_fragment_max");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018146,
        "dEQP-GLES31.functional.uniform_l",
        "ocation.min_max.ivec3_vertex_min");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018147,
        "dEQP-GLES31.functional.uniform_l",
        "ocation.min_max.ivec3_vertex_max");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018148,
        "dEQP-GLES31.functional.uniform_lo",
        "cation.min_max.ivec3_fragment_min");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018149,
        "dEQP-GLES31.functional.uniform_lo",
        "cation.min_max.ivec3_fragment_max");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018150,
        "dEQP-GLES31.functional.uniform_l",
        "ocation.min_max.ivec4_vertex_min");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018151,
        "dEQP-GLES31.functional.uniform_l",
        "ocation.min_max.ivec4_vertex_max");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018152,
        "dEQP-GLES31.functional.uniform_lo",
        "cation.min_max.ivec4_fragment_min");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018153,
        "dEQP-GLES31.functional.uniform_lo",
        "cation.min_max.ivec4_fragment_max");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018154,
        "dEQP-GLES31.functional.uniform_",
        "location.min_max.uint_vertex_min");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018155,
        "dEQP-GLES31.functional.uniform_",
        "location.min_max.uint_vertex_max");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018156,
        "dEQP-GLES31.functional.uniform_l",
        "ocation.min_max.uint_fragment_min");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018157,
        "dEQP-GLES31.functional.uniform_l",
        "ocation.min_max.uint_fragment_max");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018158,
        "dEQP-GLES31.functional.uniform_l",
        "ocation.min_max.uvec2_vertex_min");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018159,
        "dEQP-GLES31.functional.uniform_l",
        "ocation.min_max.uvec2_vertex_max");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018160,
        "dEQP-GLES31.functional.uniform_lo",
        "cation.min_max.uvec2_fragment_min");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018161,
        "dEQP-GLES31.functional.uniform_lo",
        "cation.min_max.uvec2_fragment_max");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018162,
        "dEQP-GLES31.functional.uniform_l",
        "ocation.min_max.uvec3_vertex_min");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018163,
        "dEQP-GLES31.functional.uniform_l",
        "ocation.min_max.uvec3_vertex_max");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018164,
        "dEQP-GLES31.functional.uniform_lo",
        "cation.min_max.uvec3_fragment_min");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018165,
        "dEQP-GLES31.functional.uniform_lo",
        "cation.min_max.uvec3_fragment_max");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018166,
        "dEQP-GLES31.functional.uniform_l",
        "ocation.min_max.uvec4_vertex_min");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018167,
        "dEQP-GLES31.functional.uniform_l",
        "ocation.min_max.uvec4_vertex_max");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018168,
        "dEQP-GLES31.functional.uniform_lo",
        "cation.min_max.uvec4_fragment_min");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018169,
        "dEQP-GLES31.functional.uniform_lo",
        "cation.min_max.uvec4_fragment_max");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018170,
        "dEQP-GLES31.functional.uniform_",
        "location.min_max.bool_vertex_min");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018171,
        "dEQP-GLES31.functional.uniform_",
        "location.min_max.bool_vertex_max");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018172,
        "dEQP-GLES31.functional.uniform_l",
        "ocation.min_max.bool_fragment_min");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018173,
        "dEQP-GLES31.functional.uniform_l",
        "ocation.min_max.bool_fragment_max");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018174,
        "dEQP-GLES31.functional.uniform_l",
        "ocation.min_max.bvec2_vertex_min");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018175,
        "dEQP-GLES31.functional.uniform_l",
        "ocation.min_max.bvec2_vertex_max");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018176,
        "dEQP-GLES31.functional.uniform_lo",
        "cation.min_max.bvec2_fragment_min");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018177,
        "dEQP-GLES31.functional.uniform_lo",
        "cation.min_max.bvec2_fragment_max");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018178,
        "dEQP-GLES31.functional.uniform_l",
        "ocation.min_max.bvec3_vertex_min");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018179,
        "dEQP-GLES31.functional.uniform_l",
        "ocation.min_max.bvec3_vertex_max");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018180,
        "dEQP-GLES31.functional.uniform_lo",
        "cation.min_max.bvec3_fragment_min");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018181,
        "dEQP-GLES31.functional.uniform_lo",
        "cation.min_max.bvec3_fragment_max");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018182,
        "dEQP-GLES31.functional.uniform_l",
        "ocation.min_max.bvec4_vertex_min");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018183,
        "dEQP-GLES31.functional.uniform_l",
        "ocation.min_max.bvec4_vertex_max");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018184,
        "dEQP-GLES31.functional.uniform_lo",
        "cation.min_max.bvec4_fragment_min");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018185,
        "dEQP-GLES31.functional.uniform_lo",
        "cation.min_max.bvec4_fragment_max");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018186,
        "dEQP-GLES31.functional.uniform_",
        "location.min_max.mat2_vertex_min");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018187,
        "dEQP-GLES31.functional.uniform_",
        "location.min_max.mat2_vertex_max");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018188,
        "dEQP-GLES31.functional.uniform_l",
        "ocation.min_max.mat2_fragment_min");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018189,
        "dEQP-GLES31.functional.uniform_l",
        "ocation.min_max.mat2_fragment_max");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018190,
        "dEQP-GLES31.functional.uniform_l",
        "ocation.min_max.mat2x3_vertex_min");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018191,
        "dEQP-GLES31.functional.uniform_l",
        "ocation.min_max.mat2x3_vertex_max");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018192,
        "dEQP-GLES31.functional.uniform_lo",
        "cation.min_max.mat2x3_fragment_min");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018193,
        "dEQP-GLES31.functional.uniform_lo",
        "cation.min_max.mat2x3_fragment_max");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018194,
        "dEQP-GLES31.functional.uniform_l",
        "ocation.min_max.mat2x4_vertex_min");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018195,
        "dEQP-GLES31.functional.uniform_l",
        "ocation.min_max.mat2x4_vertex_max");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018196,
        "dEQP-GLES31.functional.uniform_lo",
        "cation.min_max.mat2x4_fragment_min");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018197,
        "dEQP-GLES31.functional.uniform_lo",
        "cation.min_max.mat2x4_fragment_max");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018198,
        "dEQP-GLES31.functional.uniform_l",
        "ocation.min_max.mat3x2_vertex_min");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018199,
        "dEQP-GLES31.functional.uniform_l",
        "ocation.min_max.mat3x2_vertex_max");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018200,
        "dEQP-GLES31.functional.uniform_lo",
        "cation.min_max.mat3x2_fragment_min");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018201,
        "dEQP-GLES31.functional.uniform_lo",
        "cation.min_max.mat3x2_fragment_max");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018202,
        "dEQP-GLES31.functional.uniform_",
        "location.min_max.mat3_vertex_min");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018203,
        "dEQP-GLES31.functional.uniform_",
        "location.min_max.mat3_vertex_max");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018204,
        "dEQP-GLES31.functional.uniform_l",
        "ocation.min_max.mat3_fragment_min");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018205,
        "dEQP-GLES31.functional.uniform_l",
        "ocation.min_max.mat3_fragment_max");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018206,
        "dEQP-GLES31.functional.uniform_l",
        "ocation.min_max.mat3x4_vertex_min");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018207,
        "dEQP-GLES31.functional.uniform_l",
        "ocation.min_max.mat3x4_vertex_max");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018208,
        "dEQP-GLES31.functional.uniform_lo",
        "cation.min_max.mat3x4_fragment_min");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018209,
        "dEQP-GLES31.functional.uniform_lo",
        "cation.min_max.mat3x4_fragment_max");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018210,
        "dEQP-GLES31.functional.uniform_l",
        "ocation.min_max.mat4x2_vertex_min");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018211,
        "dEQP-GLES31.functional.uniform_l",
        "ocation.min_max.mat4x2_vertex_max");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018212,
        "dEQP-GLES31.functional.uniform_lo",
        "cation.min_max.mat4x2_fragment_min");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018213,
        "dEQP-GLES31.functional.uniform_lo",
        "cation.min_max.mat4x2_fragment_max");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018214,
        "dEQP-GLES31.functional.uniform_l",
        "ocation.min_max.mat4x3_vertex_min");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018215,
        "dEQP-GLES31.functional.uniform_l",
        "ocation.min_max.mat4x3_vertex_max");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018216,
        "dEQP-GLES31.functional.uniform_lo",
        "cation.min_max.mat4x3_fragment_min");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018217,
        "dEQP-GLES31.functional.uniform_lo",
        "cation.min_max.mat4x3_fragment_max");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018218,
        "dEQP-GLES31.functional.uniform_",
        "location.min_max.mat4_vertex_min");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018219,
        "dEQP-GLES31.functional.uniform_",
        "location.min_max.mat4_vertex_max");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018220,
        "dEQP-GLES31.functional.uniform_l",
        "ocation.min_max.mat4_fragment_min");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018221,
        "dEQP-GLES31.functional.uniform_l",
        "ocation.min_max.mat4_fragment_max");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018222,
        "dEQP-GLES31.functional.uniform_loc",
        "ation.min_max.sampler2D_vertex_min");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018223,
        "dEQP-GLES31.functional.uniform_loc",
        "ation.min_max.sampler2D_vertex_max");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018224,
        "dEQP-GLES31.functional.uniform_loca",
        "tion.min_max.sampler2D_fragment_min");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018225,
        "dEQP-GLES31.functional.uniform_loca",
        "tion.min_max.sampler2D_fragment_max");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018226,
        "dEQP-GLES31.functional.uniform_loc",
        "ation.min_max.isampler2D_vertex_min");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018227,
        "dEQP-GLES31.functional.uniform_loc",
        "ation.min_max.isampler2D_vertex_max");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018228,
        "dEQP-GLES31.functional.uniform_loca",
        "tion.min_max.isampler2D_fragment_min");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018229,
        "dEQP-GLES31.functional.uniform_loca",
        "tion.min_max.isampler2D_fragment_max");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018230,
        "dEQP-GLES31.functional.uniform_loc",
        "ation.min_max.usampler2D_vertex_min");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018231,
        "dEQP-GLES31.functional.uniform_loc",
        "ation.min_max.usampler2D_vertex_max");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018232,
        "dEQP-GLES31.functional.uniform_loca",
        "tion.min_max.usampler2D_fragment_min");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018233,
        "dEQP-GLES31.functional.uniform_loca",
        "tion.min_max.usampler2D_fragment_max");
