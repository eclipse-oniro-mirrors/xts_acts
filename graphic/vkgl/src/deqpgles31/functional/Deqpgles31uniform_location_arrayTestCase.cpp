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

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017978,
        "dEQP-GLES31.functional.unifor",
        "m_location.array.float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017979,
        "dEQP-GLES31.functional.uniform",
        "_location.array.float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017980,
        "dEQP-GLES31.functional.unifo",
        "rm_location.array.vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017981,
        "dEQP-GLES31.functional.unifor",
        "m_location.array.vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017982,
        "dEQP-GLES31.functional.unifo",
        "rm_location.array.vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017983,
        "dEQP-GLES31.functional.unifor",
        "m_location.array.vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017984,
        "dEQP-GLES31.functional.unifo",
        "rm_location.array.vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017985,
        "dEQP-GLES31.functional.unifor",
        "m_location.array.vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017986,
        "dEQP-GLES31.functional.unifo",
        "rm_location.array.int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017987,
        "dEQP-GLES31.functional.unifor",
        "m_location.array.int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017988,
        "dEQP-GLES31.functional.unifor",
        "m_location.array.ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017989,
        "dEQP-GLES31.functional.uniform",
        "_location.array.ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017990,
        "dEQP-GLES31.functional.unifor",
        "m_location.array.ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017991,
        "dEQP-GLES31.functional.uniform",
        "_location.array.ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017992,
        "dEQP-GLES31.functional.unifor",
        "m_location.array.ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017993,
        "dEQP-GLES31.functional.uniform",
        "_location.array.ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017994,
        "dEQP-GLES31.functional.unifo",
        "rm_location.array.uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017995,
        "dEQP-GLES31.functional.unifor",
        "m_location.array.uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017996,
        "dEQP-GLES31.functional.unifor",
        "m_location.array.uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017997,
        "dEQP-GLES31.functional.uniform",
        "_location.array.uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017998,
        "dEQP-GLES31.functional.unifor",
        "m_location.array.uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017999,
        "dEQP-GLES31.functional.uniform",
        "_location.array.uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_018000,
        "dEQP-GLES31.functional.unifor",
        "m_location.array.uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_018001,
        "dEQP-GLES31.functional.uniform",
        "_location.array.uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_018002,
        "dEQP-GLES31.functional.unifo",
        "rm_location.array.bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_018003,
        "dEQP-GLES31.functional.unifor",
        "m_location.array.bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_018004,
        "dEQP-GLES31.functional.unifor",
        "m_location.array.bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_018005,
        "dEQP-GLES31.functional.uniform",
        "_location.array.bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_018006,
        "dEQP-GLES31.functional.unifor",
        "m_location.array.bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_018007,
        "dEQP-GLES31.functional.uniform",
        "_location.array.bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_018008,
        "dEQP-GLES31.functional.unifor",
        "m_location.array.bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_018009,
        "dEQP-GLES31.functional.uniform",
        "_location.array.bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_018010,
        "dEQP-GLES31.functional.unifo",
        "rm_location.array.mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_018011,
        "dEQP-GLES31.functional.unifor",
        "m_location.array.mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_018012,
        "dEQP-GLES31.functional.unifor",
        "m_location.array.mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_018013,
        "dEQP-GLES31.functional.uniform",
        "_location.array.mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_018014,
        "dEQP-GLES31.functional.unifor",
        "m_location.array.mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_018015,
        "dEQP-GLES31.functional.uniform",
        "_location.array.mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_018016,
        "dEQP-GLES31.functional.unifor",
        "m_location.array.mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_018017,
        "dEQP-GLES31.functional.uniform",
        "_location.array.mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_018018,
        "dEQP-GLES31.functional.unifo",
        "rm_location.array.mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_018019,
        "dEQP-GLES31.functional.unifor",
        "m_location.array.mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_018020,
        "dEQP-GLES31.functional.unifor",
        "m_location.array.mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_018021,
        "dEQP-GLES31.functional.uniform",
        "_location.array.mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_018022,
        "dEQP-GLES31.functional.unifor",
        "m_location.array.mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_018023,
        "dEQP-GLES31.functional.uniform",
        "_location.array.mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_018024,
        "dEQP-GLES31.functional.unifor",
        "m_location.array.mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_018025,
        "dEQP-GLES31.functional.uniform",
        "_location.array.mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_018026,
        "dEQP-GLES31.functional.unifo",
        "rm_location.array.mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_018027,
        "dEQP-GLES31.functional.unifor",
        "m_location.array.mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_018028,
        "dEQP-GLES31.functional.uniform_",
        "location.array.sampler2D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_018029,
        "dEQP-GLES31.functional.uniform_l",
        "ocation.array.sampler2D_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_018030,
        "dEQP-GLES31.functional.uniform_",
        "location.array.isampler2D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_018031,
        "dEQP-GLES31.functional.uniform_l",
        "ocation.array.isampler2D_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_018032,
        "dEQP-GLES31.functional.uniform_",
        "location.array.usampler2D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_018033,
        "dEQP-GLES31.functional.uniform_l",
        "ocation.array.usampler2D_fragment");
