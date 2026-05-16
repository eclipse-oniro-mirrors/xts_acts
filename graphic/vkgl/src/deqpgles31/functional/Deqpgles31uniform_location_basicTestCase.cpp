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

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017922,
        "dEQP-GLES31.functional.unifor",
        "m_location.basic.float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017923,
        "dEQP-GLES31.functional.uniform",
        "_location.basic.float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017924,
        "dEQP-GLES31.functional.unifo",
        "rm_location.basic.vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017925,
        "dEQP-GLES31.functional.unifor",
        "m_location.basic.vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017926,
        "dEQP-GLES31.functional.unifo",
        "rm_location.basic.vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017927,
        "dEQP-GLES31.functional.unifor",
        "m_location.basic.vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017928,
        "dEQP-GLES31.functional.unifo",
        "rm_location.basic.vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017929,
        "dEQP-GLES31.functional.unifor",
        "m_location.basic.vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017930,
        "dEQP-GLES31.functional.unifo",
        "rm_location.basic.int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017931,
        "dEQP-GLES31.functional.unifor",
        "m_location.basic.int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017932,
        "dEQP-GLES31.functional.unifor",
        "m_location.basic.ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017933,
        "dEQP-GLES31.functional.uniform",
        "_location.basic.ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017934,
        "dEQP-GLES31.functional.unifor",
        "m_location.basic.ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017935,
        "dEQP-GLES31.functional.uniform",
        "_location.basic.ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017936,
        "dEQP-GLES31.functional.unifor",
        "m_location.basic.ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017937,
        "dEQP-GLES31.functional.uniform",
        "_location.basic.ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017938,
        "dEQP-GLES31.functional.unifo",
        "rm_location.basic.uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017939,
        "dEQP-GLES31.functional.unifor",
        "m_location.basic.uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017940,
        "dEQP-GLES31.functional.unifor",
        "m_location.basic.uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017941,
        "dEQP-GLES31.functional.uniform",
        "_location.basic.uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017942,
        "dEQP-GLES31.functional.unifor",
        "m_location.basic.uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017943,
        "dEQP-GLES31.functional.uniform",
        "_location.basic.uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017944,
        "dEQP-GLES31.functional.unifor",
        "m_location.basic.uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017945,
        "dEQP-GLES31.functional.uniform",
        "_location.basic.uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017946,
        "dEQP-GLES31.functional.unifo",
        "rm_location.basic.bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017947,
        "dEQP-GLES31.functional.unifor",
        "m_location.basic.bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017948,
        "dEQP-GLES31.functional.unifor",
        "m_location.basic.bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017949,
        "dEQP-GLES31.functional.uniform",
        "_location.basic.bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017950,
        "dEQP-GLES31.functional.unifor",
        "m_location.basic.bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017951,
        "dEQP-GLES31.functional.uniform",
        "_location.basic.bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017952,
        "dEQP-GLES31.functional.unifor",
        "m_location.basic.bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017953,
        "dEQP-GLES31.functional.uniform",
        "_location.basic.bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017954,
        "dEQP-GLES31.functional.unifo",
        "rm_location.basic.mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017955,
        "dEQP-GLES31.functional.unifor",
        "m_location.basic.mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017956,
        "dEQP-GLES31.functional.unifor",
        "m_location.basic.mat2x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017957,
        "dEQP-GLES31.functional.uniform",
        "_location.basic.mat2x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017958,
        "dEQP-GLES31.functional.unifor",
        "m_location.basic.mat2x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017959,
        "dEQP-GLES31.functional.uniform",
        "_location.basic.mat2x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017960,
        "dEQP-GLES31.functional.unifor",
        "m_location.basic.mat3x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017961,
        "dEQP-GLES31.functional.uniform",
        "_location.basic.mat3x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017962,
        "dEQP-GLES31.functional.unifo",
        "rm_location.basic.mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017963,
        "dEQP-GLES31.functional.unifor",
        "m_location.basic.mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017964,
        "dEQP-GLES31.functional.unifor",
        "m_location.basic.mat3x4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017965,
        "dEQP-GLES31.functional.uniform",
        "_location.basic.mat3x4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017966,
        "dEQP-GLES31.functional.unifor",
        "m_location.basic.mat4x2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017967,
        "dEQP-GLES31.functional.uniform",
        "_location.basic.mat4x2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017968,
        "dEQP-GLES31.functional.unifor",
        "m_location.basic.mat4x3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017969,
        "dEQP-GLES31.functional.uniform",
        "_location.basic.mat4x3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017970,
        "dEQP-GLES31.functional.unifo",
        "rm_location.basic.mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017971,
        "dEQP-GLES31.functional.unifor",
        "m_location.basic.mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017972,
        "dEQP-GLES31.functional.uniform_",
        "location.basic.sampler2D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017973,
        "dEQP-GLES31.functional.uniform_l",
        "ocation.basic.sampler2D_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017974,
        "dEQP-GLES31.functional.uniform_",
        "location.basic.isampler2D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017975,
        "dEQP-GLES31.functional.uniform_l",
        "ocation.basic.isampler2D_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017976,
        "dEQP-GLES31.functional.uniform_",
        "location.basic.usampler2D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017977,
        "dEQP-GLES31.functional.uniform_l",
        "ocation.basic.usampler2D_fragment");
