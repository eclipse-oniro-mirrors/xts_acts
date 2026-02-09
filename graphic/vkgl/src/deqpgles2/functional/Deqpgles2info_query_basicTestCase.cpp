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
#include "../ActsDeqpgles20014TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013992,
        "dEQP-GLES2.functional.uniform_a",
        "pi.info_query.basic.float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013993,
        "dEQP-GLES2.functional.uniform_ap",
        "i.info_query.basic.float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013994,
        "dEQP-GLES2.functional.uniform_",
        "api.info_query.basic.float_both");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013995,
        "dEQP-GLES2.functional.uniform_a",
        "pi.info_query.basic.vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013996,
        "dEQP-GLES2.functional.uniform_ap",
        "i.info_query.basic.vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013997,
        "dEQP-GLES2.functional.uniform_",
        "api.info_query.basic.vec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013998,
        "dEQP-GLES2.functional.uniform_a",
        "pi.info_query.basic.vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013999,
        "dEQP-GLES2.functional.uniform_ap",
        "i.info_query.basic.vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_014000,
        "dEQP-GLES2.functional.uniform_",
        "api.info_query.basic.vec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_014001,
        "dEQP-GLES2.functional.uniform_a",
        "pi.info_query.basic.vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_014002,
        "dEQP-GLES2.functional.uniform_ap",
        "i.info_query.basic.vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_014003,
        "dEQP-GLES2.functional.uniform_",
        "api.info_query.basic.vec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_014004,
        "dEQP-GLES2.functional.uniform_a",
        "pi.info_query.basic.mat2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_014005,
        "dEQP-GLES2.functional.uniform_ap",
        "i.info_query.basic.mat2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_014006,
        "dEQP-GLES2.functional.uniform_",
        "api.info_query.basic.mat2_both");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_014007,
        "dEQP-GLES2.functional.uniform_a",
        "pi.info_query.basic.mat3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_014008,
        "dEQP-GLES2.functional.uniform_ap",
        "i.info_query.basic.mat3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_014009,
        "dEQP-GLES2.functional.uniform_",
        "api.info_query.basic.mat3_both");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_014010,
        "dEQP-GLES2.functional.uniform_a",
        "pi.info_query.basic.mat4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_014011,
        "dEQP-GLES2.functional.uniform_ap",
        "i.info_query.basic.mat4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_014012,
        "dEQP-GLES2.functional.uniform_",
        "api.info_query.basic.mat4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_014013,
        "dEQP-GLES2.functional.uniform_",
        "api.info_query.basic.int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_014014,
        "dEQP-GLES2.functional.uniform_a",
        "pi.info_query.basic.int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_014015,
        "dEQP-GLES2.functional.uniform",
        "_api.info_query.basic.int_both");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_014016,
        "dEQP-GLES2.functional.uniform_a",
        "pi.info_query.basic.ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_014017,
        "dEQP-GLES2.functional.uniform_ap",
        "i.info_query.basic.ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_014018,
        "dEQP-GLES2.functional.uniform_",
        "api.info_query.basic.ivec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_014019,
        "dEQP-GLES2.functional.uniform_a",
        "pi.info_query.basic.ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_014020,
        "dEQP-GLES2.functional.uniform_ap",
        "i.info_query.basic.ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_014021,
        "dEQP-GLES2.functional.uniform_",
        "api.info_query.basic.ivec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_014022,
        "dEQP-GLES2.functional.uniform_a",
        "pi.info_query.basic.ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_014023,
        "dEQP-GLES2.functional.uniform_ap",
        "i.info_query.basic.ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_014024,
        "dEQP-GLES2.functional.uniform_",
        "api.info_query.basic.ivec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_014025,
        "dEQP-GLES2.functional.uniform_a",
        "pi.info_query.basic.bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_014026,
        "dEQP-GLES2.functional.uniform_ap",
        "i.info_query.basic.bool_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_014027,
        "dEQP-GLES2.functional.uniform_",
        "api.info_query.basic.bool_both");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_014028,
        "dEQP-GLES2.functional.uniform_a",
        "pi.info_query.basic.bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_014029,
        "dEQP-GLES2.functional.uniform_ap",
        "i.info_query.basic.bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_014030,
        "dEQP-GLES2.functional.uniform_",
        "api.info_query.basic.bvec2_both");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_014031,
        "dEQP-GLES2.functional.uniform_a",
        "pi.info_query.basic.bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_014032,
        "dEQP-GLES2.functional.uniform_ap",
        "i.info_query.basic.bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_014033,
        "dEQP-GLES2.functional.uniform_",
        "api.info_query.basic.bvec3_both");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_014034,
        "dEQP-GLES2.functional.uniform_a",
        "pi.info_query.basic.bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_014035,
        "dEQP-GLES2.functional.uniform_ap",
        "i.info_query.basic.bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_014036,
        "dEQP-GLES2.functional.uniform_",
        "api.info_query.basic.bvec4_both");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_014037,
        "dEQP-GLES2.functional.uniform_api",
        ".info_query.basic.sampler2D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_014038,
        "dEQP-GLES2.functional.uniform_api.",
        "info_query.basic.sampler2D_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_014039,
        "dEQP-GLES2.functional.uniform_ap",
        "i.info_query.basic.sampler2D_both");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_014040,
        "dEQP-GLES2.functional.uniform_api.",
        "info_query.basic.samplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_014041,
        "dEQP-GLES2.functional.uniform_api.i",
        "nfo_query.basic.samplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_014042,
        "dEQP-GLES2.functional.uniform_api",
        ".info_query.basic.samplerCube_both");
