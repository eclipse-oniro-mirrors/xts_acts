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
#include "../Deqpgles2BaseFunc.h"
#include "../ActsDeqpgles20001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000903,
        "dEQP-GLES2.functional.shaders.conversi",
        "ons.vector_illegal.vec2_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000904,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.vector_illegal.vec2_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000905,
        "dEQP-GLES2.functional.shaders.conversi",
        "ons.vector_illegal.vec2_to_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000906,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.vector_illegal.vec2_to_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000907,
        "dEQP-GLES2.functional.shaders.conversi",
        "ons.vector_illegal.vec2_to_bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000908,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.vector_illegal.vec2_to_bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000909,
        "dEQP-GLES2.functional.shaders.conversi",
        "ons.vector_illegal.vec2_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000910,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.vector_illegal.vec2_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000911,
        "dEQP-GLES2.functional.shaders.conversi",
        "ons.vector_illegal.vec2_to_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000912,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.vector_illegal.vec2_to_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000913,
        "dEQP-GLES2.functional.shaders.conversi",
        "ons.vector_illegal.vec2_to_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000914,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.vector_illegal.vec2_to_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000915,
        "dEQP-GLES2.functional.shaders.conversi",
        "ons.vector_illegal.ivec2_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000916,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.vector_illegal.ivec2_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000917,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.vector_illegal.ivec2_to_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000918,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_illegal.ivec2_to_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000919,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.vector_illegal.ivec2_to_bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000920,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_illegal.ivec2_to_bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000921,
        "dEQP-GLES2.functional.shaders.conversi",
        "ons.vector_illegal.ivec2_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000922,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.vector_illegal.ivec2_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000923,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.vector_illegal.ivec2_to_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000924,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_illegal.ivec2_to_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000925,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.vector_illegal.ivec2_to_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000926,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_illegal.ivec2_to_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000927,
        "dEQP-GLES2.functional.shaders.conversi",
        "ons.vector_illegal.bvec2_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000928,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.vector_illegal.bvec2_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000929,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.vector_illegal.bvec2_to_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000930,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_illegal.bvec2_to_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000931,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.vector_illegal.bvec2_to_bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000932,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_illegal.bvec2_to_bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000933,
        "dEQP-GLES2.functional.shaders.conversi",
        "ons.vector_illegal.bvec2_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000934,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.vector_illegal.bvec2_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000935,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.vector_illegal.bvec2_to_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000936,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_illegal.bvec2_to_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000937,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.vector_illegal.bvec2_to_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000938,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_illegal.bvec2_to_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000939,
        "dEQP-GLES2.functional.shaders.conversi",
        "ons.vector_illegal.vec3_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000940,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.vector_illegal.vec3_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000941,
        "dEQP-GLES2.functional.shaders.conversi",
        "ons.vector_illegal.vec3_to_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000942,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.vector_illegal.vec3_to_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000943,
        "dEQP-GLES2.functional.shaders.conversi",
        "ons.vector_illegal.vec3_to_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000944,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.vector_illegal.vec3_to_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000945,
        "dEQP-GLES2.functional.shaders.conversi",
        "ons.vector_illegal.ivec3_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000946,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.vector_illegal.ivec3_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000947,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.vector_illegal.ivec3_to_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000948,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_illegal.ivec3_to_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000949,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.vector_illegal.ivec3_to_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000950,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_illegal.ivec3_to_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000951,
        "dEQP-GLES2.functional.shaders.conversi",
        "ons.vector_illegal.bvec3_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000952,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.vector_illegal.bvec3_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000953,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.vector_illegal.bvec3_to_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000954,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_illegal.bvec3_to_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000955,
        "dEQP-GLES2.functional.shaders.conversio",
        "ns.vector_illegal.bvec3_to_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000956,
        "dEQP-GLES2.functional.shaders.conversion",
        "s.vector_illegal.bvec3_to_bvec4_fragment");
