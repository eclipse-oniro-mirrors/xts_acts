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
#include "../Gl42masterBaseFunc.h"
#include "../ActsGl42master0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000195,
    "KHR-GL42.shaders30.glsl_constructors.vec2_from_mat2_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000196,
    "KHR-GL42.shaders30.glsl_constructors.vec2_from_mat2_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000197,
    "KHR-GL42.shaders30.glsl_constructors.vec2_from_mat2_mat2_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000198,
    "KHR-GL42.shaders30.glsl_constructors.vec2_from_mat2_mat2_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000199,
    "KHR-GL42.shaders30.glsl_constructors.vec2_from_mat2x3_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000200,
    "KHR-GL42.shaders30.glsl_constructors.vec2_from_mat2x3_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000201,
    "KHR-GL42.shaders30.glsl_constructors.vec2_from_mat2x3_mat2x3_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000202,
    "KHR-GL42.shaders30.glsl_constructors.vec2_from_mat2x3_mat2x3_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000203,
    "KHR-GL42.shaders30.glsl_constructors.vec2_from_mat2x4_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000204,
    "KHR-GL42.shaders30.glsl_constructors.vec2_from_mat2x4_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000205,
    "KHR-GL42.shaders30.glsl_constructors.vec2_from_mat2x4_mat2x4_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000206,
    "KHR-GL42.shaders30.glsl_constructors.vec2_from_mat2x4_mat2x4_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000207,
    "KHR-GL42.shaders30.glsl_constructors.vec2_from_mat3_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000208,
    "KHR-GL42.shaders30.glsl_constructors.vec2_from_mat3_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000209,
    "KHR-GL42.shaders30.glsl_constructors.vec2_from_mat3_mat3_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000210,
    "KHR-GL42.shaders30.glsl_constructors.vec2_from_mat3_mat3_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000211,
    "KHR-GL42.shaders30.glsl_constructors.vec2_from_mat3x2_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000212,
    "KHR-GL42.shaders30.glsl_constructors.vec2_from_mat3x2_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000213,
    "KHR-GL42.shaders30.glsl_constructors.vec2_from_mat3x2_mat3x2_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000214,
    "KHR-GL42.shaders30.glsl_constructors.vec2_from_mat3x2_mat3x2_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000215,
    "KHR-GL42.shaders30.glsl_constructors.vec2_from_mat3x4_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000216,
    "KHR-GL42.shaders30.glsl_constructors.vec2_from_mat3x4_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000217,
    "KHR-GL42.shaders30.glsl_constructors.vec2_from_mat3x4_mat3x4_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000218,
    "KHR-GL42.shaders30.glsl_constructors.vec2_from_mat3x4_mat3x4_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000219,
    "KHR-GL42.shaders30.glsl_constructors.vec2_from_mat4_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000220,
    "KHR-GL42.shaders30.glsl_constructors.vec2_from_mat4_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000221,
    "KHR-GL42.shaders30.glsl_constructors.vec2_from_mat4_mat4_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000222,
    "KHR-GL42.shaders30.glsl_constructors.vec2_from_mat4_mat4_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000223,
    "KHR-GL42.shaders30.glsl_constructors.vec2_from_mat4x2_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000224,
    "KHR-GL42.shaders30.glsl_constructors.vec2_from_mat4x2_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000225,
    "KHR-GL42.shaders30.glsl_constructors.vec2_from_mat4x2_mat4x2_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000226,
    "KHR-GL42.shaders30.glsl_constructors.vec2_from_mat4x2_mat4x2_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000227,
    "KHR-GL42.shaders30.glsl_constructors.vec2_from_mat4x3_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000228,
    "KHR-GL42.shaders30.glsl_constructors.vec2_from_mat4x3_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000229,
    "KHR-GL42.shaders30.glsl_constructors.vec2_from_mat4x3_mat4x3_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000230,
    "KHR-GL42.shaders30.glsl_constructors.vec2_from_mat4x3_mat4x3_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000231,
    "KHR-GL42.shaders30.glsl_constructors.vec2_from_float_mat2_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000232,
    "KHR-GL42.shaders30.glsl_constructors.vec2_from_float_mat2_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000233,
    "KHR-GL42.shaders30.glsl_constructors.vec2_from_float_mat2_float_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000234,
    "KHR-GL42.shaders30.glsl_constructors.vec2_from_float_mat2_float_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000235,
    "KHR-GL42.shaders30.glsl_constructors.vec2_from_float_mat2x3_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000236,
    "KHR-GL42.shaders30.glsl_constructors.vec2_from_float_mat2x3_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000237,
    "KHR-GL42.shaders30.glsl_constructors.vec2_from_float_mat2x3_float_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000238,
    "KHR-GL42.shaders30.glsl_constructors.vec2_from_float_mat2x3_float_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000239,
    "KHR-GL42.shaders30.glsl_constructors.vec2_from_float_mat2x4_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000240,
    "KHR-GL42.shaders30.glsl_constructors.vec2_from_float_mat2x4_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000241,
    "KHR-GL42.shaders30.glsl_constructors.vec2_from_float_mat2x4_float_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000242,
    "KHR-GL42.shaders30.glsl_constructors.vec2_from_float_mat2x4_float_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000243,
    "KHR-GL42.shaders30.glsl_constructors.vec2_from_float_mat3_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000244,
    "KHR-GL42.shaders30.glsl_constructors.vec2_from_float_mat3_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000245,
    "KHR-GL42.shaders30.glsl_constructors.vec2_from_float_mat3_float_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000246,
    "KHR-GL42.shaders30.glsl_constructors.vec2_from_float_mat3_float_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000247,
    "KHR-GL42.shaders30.glsl_constructors.vec2_from_float_mat3x2_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000248,
    "KHR-GL42.shaders30.glsl_constructors.vec2_from_float_mat3x2_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000249,
    "KHR-GL42.shaders30.glsl_constructors.vec2_from_float_mat3x2_float_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000250,
    "KHR-GL42.shaders30.glsl_constructors.vec2_from_float_mat3x2_float_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000251,
    "KHR-GL42.shaders30.glsl_constructors.vec2_from_float_mat3x4_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000252,
    "KHR-GL42.shaders30.glsl_constructors.vec2_from_float_mat3x4_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000253,
    "KHR-GL42.shaders30.glsl_constructors.vec2_from_float_mat3x4_float_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000254,
    "KHR-GL42.shaders30.glsl_constructors.vec2_from_float_mat3x4_float_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000255,
    "KHR-GL42.shaders30.glsl_constructors.vec2_from_float_mat4_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000256,
    "KHR-GL42.shaders30.glsl_constructors.vec2_from_float_mat4_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000257,
    "KHR-GL42.shaders30.glsl_constructors.vec2_from_float_mat4_float_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000258,
    "KHR-GL42.shaders30.glsl_constructors.vec2_from_float_mat4_float_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000259,
    "KHR-GL42.shaders30.glsl_constructors.vec2_from_float_mat4x2_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000260,
    "KHR-GL42.shaders30.glsl_constructors.vec2_from_float_mat4x2_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000261,
    "KHR-GL42.shaders30.glsl_constructors.vec2_from_float_mat4x2_float_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000262,
    "KHR-GL42.shaders30.glsl_constructors.vec2_from_float_mat4x2_float_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000263,
    "KHR-GL42.shaders30.glsl_constructors.vec2_from_float_mat4x3_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000264,
    "KHR-GL42.shaders30.glsl_constructors.vec2_from_float_mat4x3_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000265,
    "KHR-GL42.shaders30.glsl_constructors.vec2_from_float_mat4x3_float_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000266,
    "KHR-GL42.shaders30.glsl_constructors.vec2_from_float_mat4x3_float_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000267,
    "KHR-GL42.shaders30.glsl_constructors.vec3_from_mat2_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000268,
    "KHR-GL42.shaders30.glsl_constructors.vec3_from_mat2_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000269,
    "KHR-GL42.shaders30.glsl_constructors.vec3_from_mat2_mat2_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000270,
    "KHR-GL42.shaders30.glsl_constructors.vec3_from_mat2_mat2_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000271,
    "KHR-GL42.shaders30.glsl_constructors.vec3_from_mat2x3_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000272,
    "KHR-GL42.shaders30.glsl_constructors.vec3_from_mat2x3_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000273,
    "KHR-GL42.shaders30.glsl_constructors.vec3_from_mat2x3_mat2x3_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000274,
    "KHR-GL42.shaders30.glsl_constructors.vec3_from_mat2x3_mat2x3_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000275,
    "KHR-GL42.shaders30.glsl_constructors.vec3_from_mat2x4_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000276,
    "KHR-GL42.shaders30.glsl_constructors.vec3_from_mat2x4_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000277,
    "KHR-GL42.shaders30.glsl_constructors.vec3_from_mat2x4_mat2x4_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000278,
    "KHR-GL42.shaders30.glsl_constructors.vec3_from_mat2x4_mat2x4_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000279,
    "KHR-GL42.shaders30.glsl_constructors.vec3_from_mat3_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000280,
    "KHR-GL42.shaders30.glsl_constructors.vec3_from_mat3_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000281,
    "KHR-GL42.shaders30.glsl_constructors.vec3_from_mat3_mat3_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000282,
    "KHR-GL42.shaders30.glsl_constructors.vec3_from_mat3_mat3_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000283,
    "KHR-GL42.shaders30.glsl_constructors.vec3_from_mat3x2_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000284,
    "KHR-GL42.shaders30.glsl_constructors.vec3_from_mat3x2_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000285,
    "KHR-GL42.shaders30.glsl_constructors.vec3_from_mat3x2_mat3x2_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000286,
    "KHR-GL42.shaders30.glsl_constructors.vec3_from_mat3x2_mat3x2_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000287,
    "KHR-GL42.shaders30.glsl_constructors.vec3_from_mat3x4_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000288,
    "KHR-GL42.shaders30.glsl_constructors.vec3_from_mat3x4_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000289,
    "KHR-GL42.shaders30.glsl_constructors.vec3_from_mat3x4_mat3x4_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000290,
    "KHR-GL42.shaders30.glsl_constructors.vec3_from_mat3x4_mat3x4_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000291,
    "KHR-GL42.shaders30.glsl_constructors.vec3_from_mat4_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000292,
    "KHR-GL42.shaders30.glsl_constructors.vec3_from_mat4_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000293,
    "KHR-GL42.shaders30.glsl_constructors.vec3_from_mat4_mat4_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000294,
    "KHR-GL42.shaders30.glsl_constructors.vec3_from_mat4_mat4_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000295,
    "KHR-GL42.shaders30.glsl_constructors.vec3_from_mat4x2_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000296,
    "KHR-GL42.shaders30.glsl_constructors.vec3_from_mat4x2_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000297,
    "KHR-GL42.shaders30.glsl_constructors.vec3_from_mat4x2_mat4x2_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000298,
    "KHR-GL42.shaders30.glsl_constructors.vec3_from_mat4x2_mat4x2_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000299,
    "KHR-GL42.shaders30.glsl_constructors.vec3_from_mat4x3_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000300,
    "KHR-GL42.shaders30.glsl_constructors.vec3_from_mat4x3_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000301,
    "KHR-GL42.shaders30.glsl_constructors.vec3_from_mat4x3_mat4x3_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000302,
    "KHR-GL42.shaders30.glsl_constructors.vec3_from_mat4x3_mat4x3_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000303,
    "KHR-GL42.shaders30.glsl_constructors.vec3_from_float_mat2_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000304,
    "KHR-GL42.shaders30.glsl_constructors.vec3_from_float_mat2_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000305,
    "KHR-GL42.shaders30.glsl_constructors.vec3_from_float_mat2_float_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000306,
    "KHR-GL42.shaders30.glsl_constructors.vec3_from_float_mat2_float_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000307,
    "KHR-GL42.shaders30.glsl_constructors.vec3_from_float_mat2x3_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000308,
    "KHR-GL42.shaders30.glsl_constructors.vec3_from_float_mat2x3_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000309,
    "KHR-GL42.shaders30.glsl_constructors.vec3_from_float_mat2x3_float_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000310,
    "KHR-GL42.shaders30.glsl_constructors.vec3_from_float_mat2x3_float_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000311,
    "KHR-GL42.shaders30.glsl_constructors.vec3_from_float_mat2x4_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000312,
    "KHR-GL42.shaders30.glsl_constructors.vec3_from_float_mat2x4_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000313,
    "KHR-GL42.shaders30.glsl_constructors.vec3_from_float_mat2x4_float_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000314,
    "KHR-GL42.shaders30.glsl_constructors.vec3_from_float_mat2x4_float_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000315,
    "KHR-GL42.shaders30.glsl_constructors.vec3_from_float_mat3_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000316,
    "KHR-GL42.shaders30.glsl_constructors.vec3_from_float_mat3_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000317,
    "KHR-GL42.shaders30.glsl_constructors.vec3_from_float_mat3_float_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000318,
    "KHR-GL42.shaders30.glsl_constructors.vec3_from_float_mat3_float_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000319,
    "KHR-GL42.shaders30.glsl_constructors.vec3_from_float_mat3x2_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000320,
    "KHR-GL42.shaders30.glsl_constructors.vec3_from_float_mat3x2_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000321,
    "KHR-GL42.shaders30.glsl_constructors.vec3_from_float_mat3x2_float_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000322,
    "KHR-GL42.shaders30.glsl_constructors.vec3_from_float_mat3x2_float_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000323,
    "KHR-GL42.shaders30.glsl_constructors.vec3_from_float_mat3x4_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000324,
    "KHR-GL42.shaders30.glsl_constructors.vec3_from_float_mat3x4_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000325,
    "KHR-GL42.shaders30.glsl_constructors.vec3_from_float_mat3x4_float_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000326,
    "KHR-GL42.shaders30.glsl_constructors.vec3_from_float_mat3x4_float_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000327,
    "KHR-GL42.shaders30.glsl_constructors.vec3_from_float_mat4_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000328,
    "KHR-GL42.shaders30.glsl_constructors.vec3_from_float_mat4_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000329,
    "KHR-GL42.shaders30.glsl_constructors.vec3_from_float_mat4_float_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000330,
    "KHR-GL42.shaders30.glsl_constructors.vec3_from_float_mat4_float_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000331,
    "KHR-GL42.shaders30.glsl_constructors.vec3_from_float_mat4x2_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000332,
    "KHR-GL42.shaders30.glsl_constructors.vec3_from_float_mat4x2_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000333,
    "KHR-GL42.shaders30.glsl_constructors.vec3_from_float_mat4x2_float_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000334,
    "KHR-GL42.shaders30.glsl_constructors.vec3_from_float_mat4x2_float_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000335,
    "KHR-GL42.shaders30.glsl_constructors.vec3_from_float_mat4x3_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000336,
    "KHR-GL42.shaders30.glsl_constructors.vec3_from_float_mat4x3_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000337,
    "KHR-GL42.shaders30.glsl_constructors.vec3_from_float_mat4x3_float_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000338,
    "KHR-GL42.shaders30.glsl_constructors.vec3_from_float_mat4x3_float_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000339,
    "KHR-GL42.shaders30.glsl_constructors.vec4_from_mat2_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000340,
    "KHR-GL42.shaders30.glsl_constructors.vec4_from_mat2_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000341,
    "KHR-GL42.shaders30.glsl_constructors.vec4_from_mat2_mat2_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000342,
    "KHR-GL42.shaders30.glsl_constructors.vec4_from_mat2_mat2_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000343,
    "KHR-GL42.shaders30.glsl_constructors.vec4_from_mat2x3_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000344,
    "KHR-GL42.shaders30.glsl_constructors.vec4_from_mat2x3_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000345,
    "KHR-GL42.shaders30.glsl_constructors.vec4_from_mat2x3_mat2x3_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000346,
    "KHR-GL42.shaders30.glsl_constructors.vec4_from_mat2x3_mat2x3_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000347,
    "KHR-GL42.shaders30.glsl_constructors.vec4_from_mat2x4_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000348,
    "KHR-GL42.shaders30.glsl_constructors.vec4_from_mat2x4_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000349,
    "KHR-GL42.shaders30.glsl_constructors.vec4_from_mat2x4_mat2x4_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000350,
    "KHR-GL42.shaders30.glsl_constructors.vec4_from_mat2x4_mat2x4_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000351,
    "KHR-GL42.shaders30.glsl_constructors.vec4_from_mat3_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000352,
    "KHR-GL42.shaders30.glsl_constructors.vec4_from_mat3_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000353,
    "KHR-GL42.shaders30.glsl_constructors.vec4_from_mat3_mat3_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000354,
    "KHR-GL42.shaders30.glsl_constructors.vec4_from_mat3_mat3_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000355,
    "KHR-GL42.shaders30.glsl_constructors.vec4_from_mat3x2_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000356,
    "KHR-GL42.shaders30.glsl_constructors.vec4_from_mat3x2_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000357,
    "KHR-GL42.shaders30.glsl_constructors.vec4_from_mat3x2_mat3x2_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000358,
    "KHR-GL42.shaders30.glsl_constructors.vec4_from_mat3x2_mat3x2_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000359,
    "KHR-GL42.shaders30.glsl_constructors.vec4_from_mat3x4_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000360,
    "KHR-GL42.shaders30.glsl_constructors.vec4_from_mat3x4_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000361,
    "KHR-GL42.shaders30.glsl_constructors.vec4_from_mat3x4_mat3x4_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000362,
    "KHR-GL42.shaders30.glsl_constructors.vec4_from_mat3x4_mat3x4_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000363,
    "KHR-GL42.shaders30.glsl_constructors.vec4_from_mat4_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000364,
    "KHR-GL42.shaders30.glsl_constructors.vec4_from_mat4_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000365,
    "KHR-GL42.shaders30.glsl_constructors.vec4_from_mat4_mat4_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000366,
    "KHR-GL42.shaders30.glsl_constructors.vec4_from_mat4_mat4_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000367,
    "KHR-GL42.shaders30.glsl_constructors.vec4_from_mat4x2_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000368,
    "KHR-GL42.shaders30.glsl_constructors.vec4_from_mat4x2_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000369,
    "KHR-GL42.shaders30.glsl_constructors.vec4_from_mat4x2_mat4x2_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000370,
    "KHR-GL42.shaders30.glsl_constructors.vec4_from_mat4x2_mat4x2_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000371,
    "KHR-GL42.shaders30.glsl_constructors.vec4_from_mat4x3_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000372,
    "KHR-GL42.shaders30.glsl_constructors.vec4_from_mat4x3_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000373,
    "KHR-GL42.shaders30.glsl_constructors.vec4_from_mat4x3_mat4x3_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000374,
    "KHR-GL42.shaders30.glsl_constructors.vec4_from_mat4x3_mat4x3_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000375,
    "KHR-GL42.shaders30.glsl_constructors.vec4_from_float_mat2_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000376,
    "KHR-GL42.shaders30.glsl_constructors.vec4_from_float_mat2_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000377,
    "KHR-GL42.shaders30.glsl_constructors.vec4_from_float_mat2_float_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000378,
    "KHR-GL42.shaders30.glsl_constructors.vec4_from_float_mat2_float_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000379,
    "KHR-GL42.shaders30.glsl_constructors.vec4_from_float_mat2x3_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000380,
    "KHR-GL42.shaders30.glsl_constructors.vec4_from_float_mat2x3_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000381,
    "KHR-GL42.shaders30.glsl_constructors.vec4_from_float_mat2x3_float_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000382,
    "KHR-GL42.shaders30.glsl_constructors.vec4_from_float_mat2x3_float_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000383,
    "KHR-GL42.shaders30.glsl_constructors.vec4_from_float_mat2x4_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000384,
    "KHR-GL42.shaders30.glsl_constructors.vec4_from_float_mat2x4_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000385,
    "KHR-GL42.shaders30.glsl_constructors.vec4_from_float_mat2x4_float_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000386,
    "KHR-GL42.shaders30.glsl_constructors.vec4_from_float_mat2x4_float_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000387,
    "KHR-GL42.shaders30.glsl_constructors.vec4_from_float_mat3_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000388,
    "KHR-GL42.shaders30.glsl_constructors.vec4_from_float_mat3_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000389,
    "KHR-GL42.shaders30.glsl_constructors.vec4_from_float_mat3_float_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000390,
    "KHR-GL42.shaders30.glsl_constructors.vec4_from_float_mat3_float_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000391,
    "KHR-GL42.shaders30.glsl_constructors.vec4_from_float_mat3x2_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000392,
    "KHR-GL42.shaders30.glsl_constructors.vec4_from_float_mat3x2_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000393,
    "KHR-GL42.shaders30.glsl_constructors.vec4_from_float_mat3x2_float_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000394,
    "KHR-GL42.shaders30.glsl_constructors.vec4_from_float_mat3x2_float_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000395,
    "KHR-GL42.shaders30.glsl_constructors.vec4_from_float_mat3x4_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000396,
    "KHR-GL42.shaders30.glsl_constructors.vec4_from_float_mat3x4_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000397,
    "KHR-GL42.shaders30.glsl_constructors.vec4_from_float_mat3x4_float_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000398,
    "KHR-GL42.shaders30.glsl_constructors.vec4_from_float_mat3x4_float_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000399,
    "KHR-GL42.shaders30.glsl_constructors.vec4_from_float_mat4_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000400,
    "KHR-GL42.shaders30.glsl_constructors.vec4_from_float_mat4_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000401,
    "KHR-GL42.shaders30.glsl_constructors.vec4_from_float_mat4_float_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000402,
    "KHR-GL42.shaders30.glsl_constructors.vec4_from_float_mat4_float_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000403,
    "KHR-GL42.shaders30.glsl_constructors.vec4_from_float_mat4x2_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000404,
    "KHR-GL42.shaders30.glsl_constructors.vec4_from_float_mat4x2_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000405,
    "KHR-GL42.shaders30.glsl_constructors.vec4_from_float_mat4x2_float_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000406,
    "KHR-GL42.shaders30.glsl_constructors.vec4_from_float_mat4x2_float_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000407,
    "KHR-GL42.shaders30.glsl_constructors.vec4_from_float_mat4x3_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000408,
    "KHR-GL42.shaders30.glsl_constructors.vec4_from_float_mat4x3_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000409,
    "KHR-GL42.shaders30.glsl_constructors.vec4_from_float_mat4x3_float_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000410,
    "KHR-GL42.shaders30.glsl_constructors.vec4_from_float_mat4x3_float_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000411,
    "KHR-GL42.shaders30.glsl_constructors.ivec2_from_mat2_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000412,
    "KHR-GL42.shaders30.glsl_constructors.ivec2_from_mat2_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000413,
    "KHR-GL42.shaders30.glsl_constructors.ivec2_from_mat2_mat2_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000414,
    "KHR-GL42.shaders30.glsl_constructors.ivec2_from_mat2_mat2_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000415,
    "KHR-GL42.shaders30.glsl_constructors.ivec2_from_mat2x3_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000416,
    "KHR-GL42.shaders30.glsl_constructors.ivec2_from_mat2x3_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000417,
    "KHR-GL42.shaders30.glsl_constructors.ivec2_from_mat2x3_mat2x3_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000418,
    "KHR-GL42.shaders30.glsl_constructors.ivec2_from_mat2x3_mat2x3_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000419,
    "KHR-GL42.shaders30.glsl_constructors.ivec2_from_mat2x4_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000420,
    "KHR-GL42.shaders30.glsl_constructors.ivec2_from_mat2x4_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000421,
    "KHR-GL42.shaders30.glsl_constructors.ivec2_from_mat2x4_mat2x4_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000422,
    "KHR-GL42.shaders30.glsl_constructors.ivec2_from_mat2x4_mat2x4_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000423,
    "KHR-GL42.shaders30.glsl_constructors.ivec2_from_mat3_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000424,
    "KHR-GL42.shaders30.glsl_constructors.ivec2_from_mat3_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000425,
    "KHR-GL42.shaders30.glsl_constructors.ivec2_from_mat3_mat3_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000426,
    "KHR-GL42.shaders30.glsl_constructors.ivec2_from_mat3_mat3_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000427,
    "KHR-GL42.shaders30.glsl_constructors.ivec2_from_mat3x2_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000428,
    "KHR-GL42.shaders30.glsl_constructors.ivec2_from_mat3x2_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000429,
    "KHR-GL42.shaders30.glsl_constructors.ivec2_from_mat3x2_mat3x2_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000430,
    "KHR-GL42.shaders30.glsl_constructors.ivec2_from_mat3x2_mat3x2_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000431,
    "KHR-GL42.shaders30.glsl_constructors.ivec2_from_mat3x4_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000432,
    "KHR-GL42.shaders30.glsl_constructors.ivec2_from_mat3x4_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000433,
    "KHR-GL42.shaders30.glsl_constructors.ivec2_from_mat3x4_mat3x4_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000434,
    "KHR-GL42.shaders30.glsl_constructors.ivec2_from_mat3x4_mat3x4_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000435,
    "KHR-GL42.shaders30.glsl_constructors.ivec2_from_mat4_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000436,
    "KHR-GL42.shaders30.glsl_constructors.ivec2_from_mat4_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000437,
    "KHR-GL42.shaders30.glsl_constructors.ivec2_from_mat4_mat4_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000438,
    "KHR-GL42.shaders30.glsl_constructors.ivec2_from_mat4_mat4_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000439,
    "KHR-GL42.shaders30.glsl_constructors.ivec2_from_mat4x2_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000440,
    "KHR-GL42.shaders30.glsl_constructors.ivec2_from_mat4x2_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000441,
    "KHR-GL42.shaders30.glsl_constructors.ivec2_from_mat4x2_mat4x2_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000442,
    "KHR-GL42.shaders30.glsl_constructors.ivec2_from_mat4x2_mat4x2_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000443,
    "KHR-GL42.shaders30.glsl_constructors.ivec2_from_mat4x3_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000444,
    "KHR-GL42.shaders30.glsl_constructors.ivec2_from_mat4x3_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000445,
    "KHR-GL42.shaders30.glsl_constructors.ivec2_from_mat4x3_mat4x3_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000446,
    "KHR-GL42.shaders30.glsl_constructors.ivec2_from_mat4x3_mat4x3_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000447,
    "KHR-GL42.shaders30.glsl_constructors.ivec2_from_int_mat2_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000448,
    "KHR-GL42.shaders30.glsl_constructors.ivec2_from_int_mat2_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000449,
    "KHR-GL42.shaders30.glsl_constructors.ivec2_from_int_mat2_int_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000450,
    "KHR-GL42.shaders30.glsl_constructors.ivec2_from_int_mat2_int_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000451,
    "KHR-GL42.shaders30.glsl_constructors.ivec2_from_int_mat2x3_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000452,
    "KHR-GL42.shaders30.glsl_constructors.ivec2_from_int_mat2x3_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000453,
    "KHR-GL42.shaders30.glsl_constructors.ivec2_from_int_mat2x3_int_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000454,
    "KHR-GL42.shaders30.glsl_constructors.ivec2_from_int_mat2x3_int_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000455,
    "KHR-GL42.shaders30.glsl_constructors.ivec2_from_int_mat2x4_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000456,
    "KHR-GL42.shaders30.glsl_constructors.ivec2_from_int_mat2x4_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000457,
    "KHR-GL42.shaders30.glsl_constructors.ivec2_from_int_mat2x4_int_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000458,
    "KHR-GL42.shaders30.glsl_constructors.ivec2_from_int_mat2x4_int_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000459,
    "KHR-GL42.shaders30.glsl_constructors.ivec2_from_int_mat3_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000460,
    "KHR-GL42.shaders30.glsl_constructors.ivec2_from_int_mat3_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000461,
    "KHR-GL42.shaders30.glsl_constructors.ivec2_from_int_mat3_int_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000462,
    "KHR-GL42.shaders30.glsl_constructors.ivec2_from_int_mat3_int_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000463,
    "KHR-GL42.shaders30.glsl_constructors.ivec2_from_int_mat3x2_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000464,
    "KHR-GL42.shaders30.glsl_constructors.ivec2_from_int_mat3x2_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000465,
    "KHR-GL42.shaders30.glsl_constructors.ivec2_from_int_mat3x2_int_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000466,
    "KHR-GL42.shaders30.glsl_constructors.ivec2_from_int_mat3x2_int_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000467,
    "KHR-GL42.shaders30.glsl_constructors.ivec2_from_int_mat3x4_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000468,
    "KHR-GL42.shaders30.glsl_constructors.ivec2_from_int_mat3x4_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000469,
    "KHR-GL42.shaders30.glsl_constructors.ivec2_from_int_mat3x4_int_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000470,
    "KHR-GL42.shaders30.glsl_constructors.ivec2_from_int_mat3x4_int_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000471,
    "KHR-GL42.shaders30.glsl_constructors.ivec2_from_int_mat4_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000472,
    "KHR-GL42.shaders30.glsl_constructors.ivec2_from_int_mat4_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000473,
    "KHR-GL42.shaders30.glsl_constructors.ivec2_from_int_mat4_int_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000474,
    "KHR-GL42.shaders30.glsl_constructors.ivec2_from_int_mat4_int_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000475,
    "KHR-GL42.shaders30.glsl_constructors.ivec2_from_int_mat4x2_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000476,
    "KHR-GL42.shaders30.glsl_constructors.ivec2_from_int_mat4x2_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000477,
    "KHR-GL42.shaders30.glsl_constructors.ivec2_from_int_mat4x2_int_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000478,
    "KHR-GL42.shaders30.glsl_constructors.ivec2_from_int_mat4x2_int_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000479,
    "KHR-GL42.shaders30.glsl_constructors.ivec2_from_int_mat4x3_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000480,
    "KHR-GL42.shaders30.glsl_constructors.ivec2_from_int_mat4x3_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000481,
    "KHR-GL42.shaders30.glsl_constructors.ivec2_from_int_mat4x3_int_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000482,
    "KHR-GL42.shaders30.glsl_constructors.ivec2_from_int_mat4x3_int_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000483,
    "KHR-GL42.shaders30.glsl_constructors.ivec3_from_mat2_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000484,
    "KHR-GL42.shaders30.glsl_constructors.ivec3_from_mat2_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000485,
    "KHR-GL42.shaders30.glsl_constructors.ivec3_from_mat2_mat2_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000486,
    "KHR-GL42.shaders30.glsl_constructors.ivec3_from_mat2_mat2_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000487,
    "KHR-GL42.shaders30.glsl_constructors.ivec3_from_mat2x3_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000488,
    "KHR-GL42.shaders30.glsl_constructors.ivec3_from_mat2x3_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000489,
    "KHR-GL42.shaders30.glsl_constructors.ivec3_from_mat2x3_mat2x3_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000490,
    "KHR-GL42.shaders30.glsl_constructors.ivec3_from_mat2x3_mat2x3_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000491,
    "KHR-GL42.shaders30.glsl_constructors.ivec3_from_mat2x4_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000492,
    "KHR-GL42.shaders30.glsl_constructors.ivec3_from_mat2x4_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000493,
    "KHR-GL42.shaders30.glsl_constructors.ivec3_from_mat2x4_mat2x4_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000494,
    "KHR-GL42.shaders30.glsl_constructors.ivec3_from_mat2x4_mat2x4_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000495,
    "KHR-GL42.shaders30.glsl_constructors.ivec3_from_mat3_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000496,
    "KHR-GL42.shaders30.glsl_constructors.ivec3_from_mat3_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000497,
    "KHR-GL42.shaders30.glsl_constructors.ivec3_from_mat3_mat3_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000498,
    "KHR-GL42.shaders30.glsl_constructors.ivec3_from_mat3_mat3_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000499,
    "KHR-GL42.shaders30.glsl_constructors.ivec3_from_mat3x2_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000500,
    "KHR-GL42.shaders30.glsl_constructors.ivec3_from_mat3x2_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000501,
    "KHR-GL42.shaders30.glsl_constructors.ivec3_from_mat3x2_mat3x2_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000502,
    "KHR-GL42.shaders30.glsl_constructors.ivec3_from_mat3x2_mat3x2_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000503,
    "KHR-GL42.shaders30.glsl_constructors.ivec3_from_mat3x4_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000504,
    "KHR-GL42.shaders30.glsl_constructors.ivec3_from_mat3x4_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000505,
    "KHR-GL42.shaders30.glsl_constructors.ivec3_from_mat3x4_mat3x4_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000506,
    "KHR-GL42.shaders30.glsl_constructors.ivec3_from_mat3x4_mat3x4_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000507,
    "KHR-GL42.shaders30.glsl_constructors.ivec3_from_mat4_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000508,
    "KHR-GL42.shaders30.glsl_constructors.ivec3_from_mat4_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000509,
    "KHR-GL42.shaders30.glsl_constructors.ivec3_from_mat4_mat4_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000510,
    "KHR-GL42.shaders30.glsl_constructors.ivec3_from_mat4_mat4_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000511,
    "KHR-GL42.shaders30.glsl_constructors.ivec3_from_mat4x2_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000512,
    "KHR-GL42.shaders30.glsl_constructors.ivec3_from_mat4x2_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000513,
    "KHR-GL42.shaders30.glsl_constructors.ivec3_from_mat4x2_mat4x2_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000514,
    "KHR-GL42.shaders30.glsl_constructors.ivec3_from_mat4x2_mat4x2_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000515,
    "KHR-GL42.shaders30.glsl_constructors.ivec3_from_mat4x3_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000516,
    "KHR-GL42.shaders30.glsl_constructors.ivec3_from_mat4x3_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000517,
    "KHR-GL42.shaders30.glsl_constructors.ivec3_from_mat4x3_mat4x3_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000518,
    "KHR-GL42.shaders30.glsl_constructors.ivec3_from_mat4x3_mat4x3_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000519,
    "KHR-GL42.shaders30.glsl_constructors.ivec3_from_int_mat2_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000520,
    "KHR-GL42.shaders30.glsl_constructors.ivec3_from_int_mat2_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000521,
    "KHR-GL42.shaders30.glsl_constructors.ivec3_from_int_mat2_int_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000522,
    "KHR-GL42.shaders30.glsl_constructors.ivec3_from_int_mat2_int_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000523,
    "KHR-GL42.shaders30.glsl_constructors.ivec3_from_int_mat2x3_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000524,
    "KHR-GL42.shaders30.glsl_constructors.ivec3_from_int_mat2x3_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000525,
    "KHR-GL42.shaders30.glsl_constructors.ivec3_from_int_mat2x3_int_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000526,
    "KHR-GL42.shaders30.glsl_constructors.ivec3_from_int_mat2x3_int_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000527,
    "KHR-GL42.shaders30.glsl_constructors.ivec3_from_int_mat2x4_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000528,
    "KHR-GL42.shaders30.glsl_constructors.ivec3_from_int_mat2x4_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000529,
    "KHR-GL42.shaders30.glsl_constructors.ivec3_from_int_mat2x4_int_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000530,
    "KHR-GL42.shaders30.glsl_constructors.ivec3_from_int_mat2x4_int_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000531,
    "KHR-GL42.shaders30.glsl_constructors.ivec3_from_int_mat3_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000532,
    "KHR-GL42.shaders30.glsl_constructors.ivec3_from_int_mat3_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000533,
    "KHR-GL42.shaders30.glsl_constructors.ivec3_from_int_mat3_int_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000534,
    "KHR-GL42.shaders30.glsl_constructors.ivec3_from_int_mat3_int_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000535,
    "KHR-GL42.shaders30.glsl_constructors.ivec3_from_int_mat3x2_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000536,
    "KHR-GL42.shaders30.glsl_constructors.ivec3_from_int_mat3x2_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000537,
    "KHR-GL42.shaders30.glsl_constructors.ivec3_from_int_mat3x2_int_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000538,
    "KHR-GL42.shaders30.glsl_constructors.ivec3_from_int_mat3x2_int_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000539,
    "KHR-GL42.shaders30.glsl_constructors.ivec3_from_int_mat3x4_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000540,
    "KHR-GL42.shaders30.glsl_constructors.ivec3_from_int_mat3x4_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000541,
    "KHR-GL42.shaders30.glsl_constructors.ivec3_from_int_mat3x4_int_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000542,
    "KHR-GL42.shaders30.glsl_constructors.ivec3_from_int_mat3x4_int_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000543,
    "KHR-GL42.shaders30.glsl_constructors.ivec3_from_int_mat4_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000544,
    "KHR-GL42.shaders30.glsl_constructors.ivec3_from_int_mat4_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000545,
    "KHR-GL42.shaders30.glsl_constructors.ivec3_from_int_mat4_int_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000546,
    "KHR-GL42.shaders30.glsl_constructors.ivec3_from_int_mat4_int_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000547,
    "KHR-GL42.shaders30.glsl_constructors.ivec3_from_int_mat4x2_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000548,
    "KHR-GL42.shaders30.glsl_constructors.ivec3_from_int_mat4x2_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000549,
    "KHR-GL42.shaders30.glsl_constructors.ivec3_from_int_mat4x2_int_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000550,
    "KHR-GL42.shaders30.glsl_constructors.ivec3_from_int_mat4x2_int_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000551,
    "KHR-GL42.shaders30.glsl_constructors.ivec3_from_int_mat4x3_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000552,
    "KHR-GL42.shaders30.glsl_constructors.ivec3_from_int_mat4x3_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000553,
    "KHR-GL42.shaders30.glsl_constructors.ivec3_from_int_mat4x3_int_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000554,
    "KHR-GL42.shaders30.glsl_constructors.ivec3_from_int_mat4x3_int_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000555,
    "KHR-GL42.shaders30.glsl_constructors.ivec4_from_mat2_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000556,
    "KHR-GL42.shaders30.glsl_constructors.ivec4_from_mat2_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000557,
    "KHR-GL42.shaders30.glsl_constructors.ivec4_from_mat2_mat2_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000558,
    "KHR-GL42.shaders30.glsl_constructors.ivec4_from_mat2_mat2_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000559,
    "KHR-GL42.shaders30.glsl_constructors.ivec4_from_mat2x3_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000560,
    "KHR-GL42.shaders30.glsl_constructors.ivec4_from_mat2x3_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000561,
    "KHR-GL42.shaders30.glsl_constructors.ivec4_from_mat2x3_mat2x3_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000562,
    "KHR-GL42.shaders30.glsl_constructors.ivec4_from_mat2x3_mat2x3_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000563,
    "KHR-GL42.shaders30.glsl_constructors.ivec4_from_mat2x4_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000564,
    "KHR-GL42.shaders30.glsl_constructors.ivec4_from_mat2x4_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000565,
    "KHR-GL42.shaders30.glsl_constructors.ivec4_from_mat2x4_mat2x4_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000566,
    "KHR-GL42.shaders30.glsl_constructors.ivec4_from_mat2x4_mat2x4_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000567,
    "KHR-GL42.shaders30.glsl_constructors.ivec4_from_mat3_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000568,
    "KHR-GL42.shaders30.glsl_constructors.ivec4_from_mat3_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000569,
    "KHR-GL42.shaders30.glsl_constructors.ivec4_from_mat3_mat3_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000570,
    "KHR-GL42.shaders30.glsl_constructors.ivec4_from_mat3_mat3_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000571,
    "KHR-GL42.shaders30.glsl_constructors.ivec4_from_mat3x2_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000572,
    "KHR-GL42.shaders30.glsl_constructors.ivec4_from_mat3x2_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000573,
    "KHR-GL42.shaders30.glsl_constructors.ivec4_from_mat3x2_mat3x2_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000574,
    "KHR-GL42.shaders30.glsl_constructors.ivec4_from_mat3x2_mat3x2_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000575,
    "KHR-GL42.shaders30.glsl_constructors.ivec4_from_mat3x4_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000576,
    "KHR-GL42.shaders30.glsl_constructors.ivec4_from_mat3x4_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000577,
    "KHR-GL42.shaders30.glsl_constructors.ivec4_from_mat3x4_mat3x4_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000578,
    "KHR-GL42.shaders30.glsl_constructors.ivec4_from_mat3x4_mat3x4_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000579,
    "KHR-GL42.shaders30.glsl_constructors.ivec4_from_mat4_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000580,
    "KHR-GL42.shaders30.glsl_constructors.ivec4_from_mat4_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000581,
    "KHR-GL42.shaders30.glsl_constructors.ivec4_from_mat4_mat4_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000582,
    "KHR-GL42.shaders30.glsl_constructors.ivec4_from_mat4_mat4_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000583,
    "KHR-GL42.shaders30.glsl_constructors.ivec4_from_mat4x2_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000584,
    "KHR-GL42.shaders30.glsl_constructors.ivec4_from_mat4x2_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000585,
    "KHR-GL42.shaders30.glsl_constructors.ivec4_from_mat4x2_mat4x2_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000586,
    "KHR-GL42.shaders30.glsl_constructors.ivec4_from_mat4x2_mat4x2_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000587,
    "KHR-GL42.shaders30.glsl_constructors.ivec4_from_mat4x3_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000588,
    "KHR-GL42.shaders30.glsl_constructors.ivec4_from_mat4x3_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000589,
    "KHR-GL42.shaders30.glsl_constructors.ivec4_from_mat4x3_mat4x3_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000590,
    "KHR-GL42.shaders30.glsl_constructors.ivec4_from_mat4x3_mat4x3_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000591,
    "KHR-GL42.shaders30.glsl_constructors.ivec4_from_int_mat2_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000592,
    "KHR-GL42.shaders30.glsl_constructors.ivec4_from_int_mat2_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000593,
    "KHR-GL42.shaders30.glsl_constructors.ivec4_from_int_mat2_int_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000594,
    "KHR-GL42.shaders30.glsl_constructors.ivec4_from_int_mat2_int_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000595,
    "KHR-GL42.shaders30.glsl_constructors.ivec4_from_int_mat2x3_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000596,
    "KHR-GL42.shaders30.glsl_constructors.ivec4_from_int_mat2x3_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000597,
    "KHR-GL42.shaders30.glsl_constructors.ivec4_from_int_mat2x3_int_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000598,
    "KHR-GL42.shaders30.glsl_constructors.ivec4_from_int_mat2x3_int_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000599,
    "KHR-GL42.shaders30.glsl_constructors.ivec4_from_int_mat2x4_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000600,
    "KHR-GL42.shaders30.glsl_constructors.ivec4_from_int_mat2x4_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000601,
    "KHR-GL42.shaders30.glsl_constructors.ivec4_from_int_mat2x4_int_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000602,
    "KHR-GL42.shaders30.glsl_constructors.ivec4_from_int_mat2x4_int_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000603,
    "KHR-GL42.shaders30.glsl_constructors.ivec4_from_int_mat3_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000604,
    "KHR-GL42.shaders30.glsl_constructors.ivec4_from_int_mat3_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000605,
    "KHR-GL42.shaders30.glsl_constructors.ivec4_from_int_mat3_int_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000606,
    "KHR-GL42.shaders30.glsl_constructors.ivec4_from_int_mat3_int_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000607,
    "KHR-GL42.shaders30.glsl_constructors.ivec4_from_int_mat3x2_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000608,
    "KHR-GL42.shaders30.glsl_constructors.ivec4_from_int_mat3x2_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000609,
    "KHR-GL42.shaders30.glsl_constructors.ivec4_from_int_mat3x2_int_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000610,
    "KHR-GL42.shaders30.glsl_constructors.ivec4_from_int_mat3x2_int_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000611,
    "KHR-GL42.shaders30.glsl_constructors.ivec4_from_int_mat3x4_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000612,
    "KHR-GL42.shaders30.glsl_constructors.ivec4_from_int_mat3x4_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000613,
    "KHR-GL42.shaders30.glsl_constructors.ivec4_from_int_mat3x4_int_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000614,
    "KHR-GL42.shaders30.glsl_constructors.ivec4_from_int_mat3x4_int_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000615,
    "KHR-GL42.shaders30.glsl_constructors.ivec4_from_int_mat4_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000616,
    "KHR-GL42.shaders30.glsl_constructors.ivec4_from_int_mat4_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000617,
    "KHR-GL42.shaders30.glsl_constructors.ivec4_from_int_mat4_int_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000618,
    "KHR-GL42.shaders30.glsl_constructors.ivec4_from_int_mat4_int_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000619,
    "KHR-GL42.shaders30.glsl_constructors.ivec4_from_int_mat4x2_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000620,
    "KHR-GL42.shaders30.glsl_constructors.ivec4_from_int_mat4x2_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000621,
    "KHR-GL42.shaders30.glsl_constructors.ivec4_from_int_mat4x2_int_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000622,
    "KHR-GL42.shaders30.glsl_constructors.ivec4_from_int_mat4x2_int_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000623,
    "KHR-GL42.shaders30.glsl_constructors.ivec4_from_int_mat4x3_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000624,
    "KHR-GL42.shaders30.glsl_constructors.ivec4_from_int_mat4x3_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000625,
    "KHR-GL42.shaders30.glsl_constructors.ivec4_from_int_mat4x3_int_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000626,
    "KHR-GL42.shaders30.glsl_constructors.ivec4_from_int_mat4x3_int_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000627,
    "KHR-GL42.shaders30.glsl_constructors.bvec2_from_mat2_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000628,
    "KHR-GL42.shaders30.glsl_constructors.bvec2_from_mat2_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000629,
    "KHR-GL42.shaders30.glsl_constructors.bvec2_from_mat2_mat2_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000630,
    "KHR-GL42.shaders30.glsl_constructors.bvec2_from_mat2_mat2_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000631,
    "KHR-GL42.shaders30.glsl_constructors.bvec2_from_mat2x3_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000632,
    "KHR-GL42.shaders30.glsl_constructors.bvec2_from_mat2x3_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000633,
    "KHR-GL42.shaders30.glsl_constructors.bvec2_from_mat2x3_mat2x3_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000634,
    "KHR-GL42.shaders30.glsl_constructors.bvec2_from_mat2x3_mat2x3_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000635,
    "KHR-GL42.shaders30.glsl_constructors.bvec2_from_mat2x4_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000636,
    "KHR-GL42.shaders30.glsl_constructors.bvec2_from_mat2x4_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000637,
    "KHR-GL42.shaders30.glsl_constructors.bvec2_from_mat2x4_mat2x4_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000638,
    "KHR-GL42.shaders30.glsl_constructors.bvec2_from_mat2x4_mat2x4_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000639,
    "KHR-GL42.shaders30.glsl_constructors.bvec2_from_mat3_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000640,
    "KHR-GL42.shaders30.glsl_constructors.bvec2_from_mat3_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000641,
    "KHR-GL42.shaders30.glsl_constructors.bvec2_from_mat3_mat3_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000642,
    "KHR-GL42.shaders30.glsl_constructors.bvec2_from_mat3_mat3_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000643,
    "KHR-GL42.shaders30.glsl_constructors.bvec2_from_mat3x2_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000644,
    "KHR-GL42.shaders30.glsl_constructors.bvec2_from_mat3x2_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000645,
    "KHR-GL42.shaders30.glsl_constructors.bvec2_from_mat3x2_mat3x2_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000646,
    "KHR-GL42.shaders30.glsl_constructors.bvec2_from_mat3x2_mat3x2_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000647,
    "KHR-GL42.shaders30.glsl_constructors.bvec2_from_mat3x4_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000648,
    "KHR-GL42.shaders30.glsl_constructors.bvec2_from_mat3x4_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000649,
    "KHR-GL42.shaders30.glsl_constructors.bvec2_from_mat3x4_mat3x4_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000650,
    "KHR-GL42.shaders30.glsl_constructors.bvec2_from_mat3x4_mat3x4_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000651,
    "KHR-GL42.shaders30.glsl_constructors.bvec2_from_mat4_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000652,
    "KHR-GL42.shaders30.glsl_constructors.bvec2_from_mat4_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000653,
    "KHR-GL42.shaders30.glsl_constructors.bvec2_from_mat4_mat4_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000654,
    "KHR-GL42.shaders30.glsl_constructors.bvec2_from_mat4_mat4_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000655,
    "KHR-GL42.shaders30.glsl_constructors.bvec2_from_mat4x2_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000656,
    "KHR-GL42.shaders30.glsl_constructors.bvec2_from_mat4x2_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000657,
    "KHR-GL42.shaders30.glsl_constructors.bvec2_from_mat4x2_mat4x2_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000658,
    "KHR-GL42.shaders30.glsl_constructors.bvec2_from_mat4x2_mat4x2_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000659,
    "KHR-GL42.shaders30.glsl_constructors.bvec2_from_mat4x3_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000660,
    "KHR-GL42.shaders30.glsl_constructors.bvec2_from_mat4x3_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000661,
    "KHR-GL42.shaders30.glsl_constructors.bvec2_from_mat4x3_mat4x3_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000662,
    "KHR-GL42.shaders30.glsl_constructors.bvec2_from_mat4x3_mat4x3_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000663,
    "KHR-GL42.shaders30.glsl_constructors.bvec2_from_bool_mat2_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000664,
    "KHR-GL42.shaders30.glsl_constructors.bvec2_from_bool_mat2_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000665,
    "KHR-GL42.shaders30.glsl_constructors.bvec2_from_bool_mat2_bool_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000666,
    "KHR-GL42.shaders30.glsl_constructors.bvec2_from_bool_mat2_bool_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000667,
    "KHR-GL42.shaders30.glsl_constructors.bvec2_from_bool_mat2x3_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000668,
    "KHR-GL42.shaders30.glsl_constructors.bvec2_from_bool_mat2x3_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000669,
    "KHR-GL42.shaders30.glsl_constructors.bvec2_from_bool_mat2x3_bool_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000670,
    "KHR-GL42.shaders30.glsl_constructors.bvec2_from_bool_mat2x3_bool_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000671,
    "KHR-GL42.shaders30.glsl_constructors.bvec2_from_bool_mat2x4_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000672,
    "KHR-GL42.shaders30.glsl_constructors.bvec2_from_bool_mat2x4_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000673,
    "KHR-GL42.shaders30.glsl_constructors.bvec2_from_bool_mat2x4_bool_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000674,
    "KHR-GL42.shaders30.glsl_constructors.bvec2_from_bool_mat2x4_bool_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000675,
    "KHR-GL42.shaders30.glsl_constructors.bvec2_from_bool_mat3_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000676,
    "KHR-GL42.shaders30.glsl_constructors.bvec2_from_bool_mat3_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000677,
    "KHR-GL42.shaders30.glsl_constructors.bvec2_from_bool_mat3_bool_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000678,
    "KHR-GL42.shaders30.glsl_constructors.bvec2_from_bool_mat3_bool_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000679,
    "KHR-GL42.shaders30.glsl_constructors.bvec2_from_bool_mat3x2_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000680,
    "KHR-GL42.shaders30.glsl_constructors.bvec2_from_bool_mat3x2_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000681,
    "KHR-GL42.shaders30.glsl_constructors.bvec2_from_bool_mat3x2_bool_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000682,
    "KHR-GL42.shaders30.glsl_constructors.bvec2_from_bool_mat3x2_bool_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000683,
    "KHR-GL42.shaders30.glsl_constructors.bvec2_from_bool_mat3x4_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000684,
    "KHR-GL42.shaders30.glsl_constructors.bvec2_from_bool_mat3x4_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000685,
    "KHR-GL42.shaders30.glsl_constructors.bvec2_from_bool_mat3x4_bool_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000686,
    "KHR-GL42.shaders30.glsl_constructors.bvec2_from_bool_mat3x4_bool_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000687,
    "KHR-GL42.shaders30.glsl_constructors.bvec2_from_bool_mat4_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000688,
    "KHR-GL42.shaders30.glsl_constructors.bvec2_from_bool_mat4_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000689,
    "KHR-GL42.shaders30.glsl_constructors.bvec2_from_bool_mat4_bool_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000690,
    "KHR-GL42.shaders30.glsl_constructors.bvec2_from_bool_mat4_bool_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000691,
    "KHR-GL42.shaders30.glsl_constructors.bvec2_from_bool_mat4x2_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000692,
    "KHR-GL42.shaders30.glsl_constructors.bvec2_from_bool_mat4x2_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000693,
    "KHR-GL42.shaders30.glsl_constructors.bvec2_from_bool_mat4x2_bool_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000694,
    "KHR-GL42.shaders30.glsl_constructors.bvec2_from_bool_mat4x2_bool_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000695,
    "KHR-GL42.shaders30.glsl_constructors.bvec2_from_bool_mat4x3_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000696,
    "KHR-GL42.shaders30.glsl_constructors.bvec2_from_bool_mat4x3_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000697,
    "KHR-GL42.shaders30.glsl_constructors.bvec2_from_bool_mat4x3_bool_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000698,
    "KHR-GL42.shaders30.glsl_constructors.bvec2_from_bool_mat4x3_bool_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000699,
    "KHR-GL42.shaders30.glsl_constructors.bvec3_from_mat2_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000700,
    "KHR-GL42.shaders30.glsl_constructors.bvec3_from_mat2_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000701,
    "KHR-GL42.shaders30.glsl_constructors.bvec3_from_mat2_mat2_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000702,
    "KHR-GL42.shaders30.glsl_constructors.bvec3_from_mat2_mat2_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000703,
    "KHR-GL42.shaders30.glsl_constructors.bvec3_from_mat2x3_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000704,
    "KHR-GL42.shaders30.glsl_constructors.bvec3_from_mat2x3_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000705,
    "KHR-GL42.shaders30.glsl_constructors.bvec3_from_mat2x3_mat2x3_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000706,
    "KHR-GL42.shaders30.glsl_constructors.bvec3_from_mat2x3_mat2x3_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000707,
    "KHR-GL42.shaders30.glsl_constructors.bvec3_from_mat2x4_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000708,
    "KHR-GL42.shaders30.glsl_constructors.bvec3_from_mat2x4_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000709,
    "KHR-GL42.shaders30.glsl_constructors.bvec3_from_mat2x4_mat2x4_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000710,
    "KHR-GL42.shaders30.glsl_constructors.bvec3_from_mat2x4_mat2x4_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000711,
    "KHR-GL42.shaders30.glsl_constructors.bvec3_from_mat3_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000712,
    "KHR-GL42.shaders30.glsl_constructors.bvec3_from_mat3_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000713,
    "KHR-GL42.shaders30.glsl_constructors.bvec3_from_mat3_mat3_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000714,
    "KHR-GL42.shaders30.glsl_constructors.bvec3_from_mat3_mat3_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000715,
    "KHR-GL42.shaders30.glsl_constructors.bvec3_from_mat3x2_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000716,
    "KHR-GL42.shaders30.glsl_constructors.bvec3_from_mat3x2_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000717,
    "KHR-GL42.shaders30.glsl_constructors.bvec3_from_mat3x2_mat3x2_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000718,
    "KHR-GL42.shaders30.glsl_constructors.bvec3_from_mat3x2_mat3x2_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000719,
    "KHR-GL42.shaders30.glsl_constructors.bvec3_from_mat3x4_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000720,
    "KHR-GL42.shaders30.glsl_constructors.bvec3_from_mat3x4_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000721,
    "KHR-GL42.shaders30.glsl_constructors.bvec3_from_mat3x4_mat3x4_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000722,
    "KHR-GL42.shaders30.glsl_constructors.bvec3_from_mat3x4_mat3x4_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000723,
    "KHR-GL42.shaders30.glsl_constructors.bvec3_from_mat4_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000724,
    "KHR-GL42.shaders30.glsl_constructors.bvec3_from_mat4_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000725,
    "KHR-GL42.shaders30.glsl_constructors.bvec3_from_mat4_mat4_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000726,
    "KHR-GL42.shaders30.glsl_constructors.bvec3_from_mat4_mat4_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000727,
    "KHR-GL42.shaders30.glsl_constructors.bvec3_from_mat4x2_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000728,
    "KHR-GL42.shaders30.glsl_constructors.bvec3_from_mat4x2_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000729,
    "KHR-GL42.shaders30.glsl_constructors.bvec3_from_mat4x2_mat4x2_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000730,
    "KHR-GL42.shaders30.glsl_constructors.bvec3_from_mat4x2_mat4x2_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000731,
    "KHR-GL42.shaders30.glsl_constructors.bvec3_from_mat4x3_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000732,
    "KHR-GL42.shaders30.glsl_constructors.bvec3_from_mat4x3_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000733,
    "KHR-GL42.shaders30.glsl_constructors.bvec3_from_mat4x3_mat4x3_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000734,
    "KHR-GL42.shaders30.glsl_constructors.bvec3_from_mat4x3_mat4x3_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000735,
    "KHR-GL42.shaders30.glsl_constructors.bvec3_from_bool_mat2_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000736,
    "KHR-GL42.shaders30.glsl_constructors.bvec3_from_bool_mat2_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000737,
    "KHR-GL42.shaders30.glsl_constructors.bvec3_from_bool_mat2_bool_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000738,
    "KHR-GL42.shaders30.glsl_constructors.bvec3_from_bool_mat2_bool_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000739,
    "KHR-GL42.shaders30.glsl_constructors.bvec3_from_bool_mat2x3_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000740,
    "KHR-GL42.shaders30.glsl_constructors.bvec3_from_bool_mat2x3_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000741,
    "KHR-GL42.shaders30.glsl_constructors.bvec3_from_bool_mat2x3_bool_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000742,
    "KHR-GL42.shaders30.glsl_constructors.bvec3_from_bool_mat2x3_bool_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000743,
    "KHR-GL42.shaders30.glsl_constructors.bvec3_from_bool_mat2x4_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000744,
    "KHR-GL42.shaders30.glsl_constructors.bvec3_from_bool_mat2x4_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000745,
    "KHR-GL42.shaders30.glsl_constructors.bvec3_from_bool_mat2x4_bool_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000746,
    "KHR-GL42.shaders30.glsl_constructors.bvec3_from_bool_mat2x4_bool_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000747,
    "KHR-GL42.shaders30.glsl_constructors.bvec3_from_bool_mat3_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000748,
    "KHR-GL42.shaders30.glsl_constructors.bvec3_from_bool_mat3_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000749,
    "KHR-GL42.shaders30.glsl_constructors.bvec3_from_bool_mat3_bool_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000750,
    "KHR-GL42.shaders30.glsl_constructors.bvec3_from_bool_mat3_bool_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000751,
    "KHR-GL42.shaders30.glsl_constructors.bvec3_from_bool_mat3x2_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000752,
    "KHR-GL42.shaders30.glsl_constructors.bvec3_from_bool_mat3x2_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000753,
    "KHR-GL42.shaders30.glsl_constructors.bvec3_from_bool_mat3x2_bool_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000754,
    "KHR-GL42.shaders30.glsl_constructors.bvec3_from_bool_mat3x2_bool_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000755,
    "KHR-GL42.shaders30.glsl_constructors.bvec3_from_bool_mat3x4_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000756,
    "KHR-GL42.shaders30.glsl_constructors.bvec3_from_bool_mat3x4_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000757,
    "KHR-GL42.shaders30.glsl_constructors.bvec3_from_bool_mat3x4_bool_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000758,
    "KHR-GL42.shaders30.glsl_constructors.bvec3_from_bool_mat3x4_bool_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000759,
    "KHR-GL42.shaders30.glsl_constructors.bvec3_from_bool_mat4_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000760,
    "KHR-GL42.shaders30.glsl_constructors.bvec3_from_bool_mat4_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000761,
    "KHR-GL42.shaders30.glsl_constructors.bvec3_from_bool_mat4_bool_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000762,
    "KHR-GL42.shaders30.glsl_constructors.bvec3_from_bool_mat4_bool_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000763,
    "KHR-GL42.shaders30.glsl_constructors.bvec3_from_bool_mat4x2_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000764,
    "KHR-GL42.shaders30.glsl_constructors.bvec3_from_bool_mat4x2_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000765,
    "KHR-GL42.shaders30.glsl_constructors.bvec3_from_bool_mat4x2_bool_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000766,
    "KHR-GL42.shaders30.glsl_constructors.bvec3_from_bool_mat4x2_bool_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000767,
    "KHR-GL42.shaders30.glsl_constructors.bvec3_from_bool_mat4x3_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000768,
    "KHR-GL42.shaders30.glsl_constructors.bvec3_from_bool_mat4x3_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000769,
    "KHR-GL42.shaders30.glsl_constructors.bvec3_from_bool_mat4x3_bool_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000770,
    "KHR-GL42.shaders30.glsl_constructors.bvec3_from_bool_mat4x3_bool_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000771,
    "KHR-GL42.shaders30.glsl_constructors.bvec4_from_mat2_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000772,
    "KHR-GL42.shaders30.glsl_constructors.bvec4_from_mat2_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000773,
    "KHR-GL42.shaders30.glsl_constructors.bvec4_from_mat2_mat2_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000774,
    "KHR-GL42.shaders30.glsl_constructors.bvec4_from_mat2_mat2_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000775,
    "KHR-GL42.shaders30.glsl_constructors.bvec4_from_mat2x3_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000776,
    "KHR-GL42.shaders30.glsl_constructors.bvec4_from_mat2x3_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000777,
    "KHR-GL42.shaders30.glsl_constructors.bvec4_from_mat2x3_mat2x3_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000778,
    "KHR-GL42.shaders30.glsl_constructors.bvec4_from_mat2x3_mat2x3_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000779,
    "KHR-GL42.shaders30.glsl_constructors.bvec4_from_mat2x4_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000780,
    "KHR-GL42.shaders30.glsl_constructors.bvec4_from_mat2x4_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000781,
    "KHR-GL42.shaders30.glsl_constructors.bvec4_from_mat2x4_mat2x4_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000782,
    "KHR-GL42.shaders30.glsl_constructors.bvec4_from_mat2x4_mat2x4_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000783,
    "KHR-GL42.shaders30.glsl_constructors.bvec4_from_mat3_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000784,
    "KHR-GL42.shaders30.glsl_constructors.bvec4_from_mat3_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000785,
    "KHR-GL42.shaders30.glsl_constructors.bvec4_from_mat3_mat3_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000786,
    "KHR-GL42.shaders30.glsl_constructors.bvec4_from_mat3_mat3_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000787,
    "KHR-GL42.shaders30.glsl_constructors.bvec4_from_mat3x2_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000788,
    "KHR-GL42.shaders30.glsl_constructors.bvec4_from_mat3x2_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000789,
    "KHR-GL42.shaders30.glsl_constructors.bvec4_from_mat3x2_mat3x2_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000790,
    "KHR-GL42.shaders30.glsl_constructors.bvec4_from_mat3x2_mat3x2_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000791,
    "KHR-GL42.shaders30.glsl_constructors.bvec4_from_mat3x4_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000792,
    "KHR-GL42.shaders30.glsl_constructors.bvec4_from_mat3x4_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000793,
    "KHR-GL42.shaders30.glsl_constructors.bvec4_from_mat3x4_mat3x4_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000794,
    "KHR-GL42.shaders30.glsl_constructors.bvec4_from_mat3x4_mat3x4_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000795,
    "KHR-GL42.shaders30.glsl_constructors.bvec4_from_mat4_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000796,
    "KHR-GL42.shaders30.glsl_constructors.bvec4_from_mat4_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000797,
    "KHR-GL42.shaders30.glsl_constructors.bvec4_from_mat4_mat4_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000798,
    "KHR-GL42.shaders30.glsl_constructors.bvec4_from_mat4_mat4_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000799,
    "KHR-GL42.shaders30.glsl_constructors.bvec4_from_mat4x2_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000800,
    "KHR-GL42.shaders30.glsl_constructors.bvec4_from_mat4x2_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000801,
    "KHR-GL42.shaders30.glsl_constructors.bvec4_from_mat4x2_mat4x2_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000802,
    "KHR-GL42.shaders30.glsl_constructors.bvec4_from_mat4x2_mat4x2_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000803,
    "KHR-GL42.shaders30.glsl_constructors.bvec4_from_mat4x3_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000804,
    "KHR-GL42.shaders30.glsl_constructors.bvec4_from_mat4x3_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000805,
    "KHR-GL42.shaders30.glsl_constructors.bvec4_from_mat4x3_mat4x3_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000806,
    "KHR-GL42.shaders30.glsl_constructors.bvec4_from_mat4x3_mat4x3_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000807,
    "KHR-GL42.shaders30.glsl_constructors.bvec4_from_bool_mat2_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000808,
    "KHR-GL42.shaders30.glsl_constructors.bvec4_from_bool_mat2_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000809,
    "KHR-GL42.shaders30.glsl_constructors.bvec4_from_bool_mat2_bool_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000810,
    "KHR-GL42.shaders30.glsl_constructors.bvec4_from_bool_mat2_bool_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000811,
    "KHR-GL42.shaders30.glsl_constructors.bvec4_from_bool_mat2x3_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000812,
    "KHR-GL42.shaders30.glsl_constructors.bvec4_from_bool_mat2x3_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000813,
    "KHR-GL42.shaders30.glsl_constructors.bvec4_from_bool_mat2x3_bool_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000814,
    "KHR-GL42.shaders30.glsl_constructors.bvec4_from_bool_mat2x3_bool_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000815,
    "KHR-GL42.shaders30.glsl_constructors.bvec4_from_bool_mat2x4_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000816,
    "KHR-GL42.shaders30.glsl_constructors.bvec4_from_bool_mat2x4_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000817,
    "KHR-GL42.shaders30.glsl_constructors.bvec4_from_bool_mat2x4_bool_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000818,
    "KHR-GL42.shaders30.glsl_constructors.bvec4_from_bool_mat2x4_bool_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000819,
    "KHR-GL42.shaders30.glsl_constructors.bvec4_from_bool_mat3_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000820,
    "KHR-GL42.shaders30.glsl_constructors.bvec4_from_bool_mat3_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000821,
    "KHR-GL42.shaders30.glsl_constructors.bvec4_from_bool_mat3_bool_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000822,
    "KHR-GL42.shaders30.glsl_constructors.bvec4_from_bool_mat3_bool_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000823,
    "KHR-GL42.shaders30.glsl_constructors.bvec4_from_bool_mat3x2_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000824,
    "KHR-GL42.shaders30.glsl_constructors.bvec4_from_bool_mat3x2_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000825,
    "KHR-GL42.shaders30.glsl_constructors.bvec4_from_bool_mat3x2_bool_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000826,
    "KHR-GL42.shaders30.glsl_constructors.bvec4_from_bool_mat3x2_bool_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000827,
    "KHR-GL42.shaders30.glsl_constructors.bvec4_from_bool_mat3x4_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000828,
    "KHR-GL42.shaders30.glsl_constructors.bvec4_from_bool_mat3x4_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000829,
    "KHR-GL42.shaders30.glsl_constructors.bvec4_from_bool_mat3x4_bool_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000830,
    "KHR-GL42.shaders30.glsl_constructors.bvec4_from_bool_mat3x4_bool_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000831,
    "KHR-GL42.shaders30.glsl_constructors.bvec4_from_bool_mat4_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000832,
    "KHR-GL42.shaders30.glsl_constructors.bvec4_from_bool_mat4_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000833,
    "KHR-GL42.shaders30.glsl_constructors.bvec4_from_bool_mat4_bool_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000834,
    "KHR-GL42.shaders30.glsl_constructors.bvec4_from_bool_mat4_bool_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000835,
    "KHR-GL42.shaders30.glsl_constructors.bvec4_from_bool_mat4x2_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000836,
    "KHR-GL42.shaders30.glsl_constructors.bvec4_from_bool_mat4x2_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000837,
    "KHR-GL42.shaders30.glsl_constructors.bvec4_from_bool_mat4x2_bool_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000838,
    "KHR-GL42.shaders30.glsl_constructors.bvec4_from_bool_mat4x2_bool_invalid_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000839,
    "KHR-GL42.shaders30.glsl_constructors.bvec4_from_bool_mat4x3_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000840,
    "KHR-GL42.shaders30.glsl_constructors.bvec4_from_bool_mat4x3_fs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000841,
    "KHR-GL42.shaders30.glsl_constructors.bvec4_from_bool_mat4x3_bool_invalid_vs");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_000842,
    "KHR-GL42.shaders30.glsl_constructors.bvec4_from_bool_mat4x3_bool_invalid_fs");
