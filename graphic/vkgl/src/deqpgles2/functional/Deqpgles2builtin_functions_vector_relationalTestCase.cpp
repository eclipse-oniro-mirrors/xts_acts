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
#include "../ActsDeqpgles20009TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008230,
        "dEQP-GLES2.functional.shaders.constant_expressions.bu",
        "iltin_functions.vector_relational.lessThan_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008231,
        "dEQP-GLES2.functional.shaders.constant_expressions.bui",
        "ltin_functions.vector_relational.lessThan_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008232,
        "dEQP-GLES2.functional.shaders.constant_expressions.bu",
        "iltin_functions.vector_relational.lessThan_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008233,
        "dEQP-GLES2.functional.shaders.constant_expressions.bui",
        "ltin_functions.vector_relational.lessThan_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008234,
        "dEQP-GLES2.functional.shaders.constant_expressions.bu",
        "iltin_functions.vector_relational.lessThan_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008235,
        "dEQP-GLES2.functional.shaders.constant_expressions.bui",
        "ltin_functions.vector_relational.lessThan_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008236,
        "dEQP-GLES2.functional.shaders.constant_expressions.bui",
        "ltin_functions.vector_relational.lessThan_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008237,
        "dEQP-GLES2.functional.shaders.constant_expressions.buil",
        "tin_functions.vector_relational.lessThan_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008238,
        "dEQP-GLES2.functional.shaders.constant_expressions.bui",
        "ltin_functions.vector_relational.lessThan_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008239,
        "dEQP-GLES2.functional.shaders.constant_expressions.buil",
        "tin_functions.vector_relational.lessThan_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008240,
        "dEQP-GLES2.functional.shaders.constant_expressions.bui",
        "ltin_functions.vector_relational.lessThan_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008241,
        "dEQP-GLES2.functional.shaders.constant_expressions.buil",
        "tin_functions.vector_relational.lessThan_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008242,
        "dEQP-GLES2.functional.shaders.constant_expressions.built",
        "in_functions.vector_relational.lessThanEqual_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008243,
        "dEQP-GLES2.functional.shaders.constant_expressions.builti",
        "n_functions.vector_relational.lessThanEqual_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008244,
        "dEQP-GLES2.functional.shaders.constant_expressions.built",
        "in_functions.vector_relational.lessThanEqual_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008245,
        "dEQP-GLES2.functional.shaders.constant_expressions.builti",
        "n_functions.vector_relational.lessThanEqual_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008246,
        "dEQP-GLES2.functional.shaders.constant_expressions.built",
        "in_functions.vector_relational.lessThanEqual_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008247,
        "dEQP-GLES2.functional.shaders.constant_expressions.builti",
        "n_functions.vector_relational.lessThanEqual_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008248,
        "dEQP-GLES2.functional.shaders.constant_expressions.built",
        "in_functions.vector_relational.lessThanEqual_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008249,
        "dEQP-GLES2.functional.shaders.constant_expressions.builti",
        "n_functions.vector_relational.lessThanEqual_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008250,
        "dEQP-GLES2.functional.shaders.constant_expressions.built",
        "in_functions.vector_relational.lessThanEqual_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008251,
        "dEQP-GLES2.functional.shaders.constant_expressions.builti",
        "n_functions.vector_relational.lessThanEqual_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008252,
        "dEQP-GLES2.functional.shaders.constant_expressions.built",
        "in_functions.vector_relational.lessThanEqual_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008253,
        "dEQP-GLES2.functional.shaders.constant_expressions.builti",
        "n_functions.vector_relational.lessThanEqual_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008254,
        "dEQP-GLES2.functional.shaders.constant_expressions.buil",
        "tin_functions.vector_relational.greaterThan_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008255,
        "dEQP-GLES2.functional.shaders.constant_expressions.built",
        "in_functions.vector_relational.greaterThan_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008256,
        "dEQP-GLES2.functional.shaders.constant_expressions.buil",
        "tin_functions.vector_relational.greaterThan_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008257,
        "dEQP-GLES2.functional.shaders.constant_expressions.built",
        "in_functions.vector_relational.greaterThan_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008258,
        "dEQP-GLES2.functional.shaders.constant_expressions.buil",
        "tin_functions.vector_relational.greaterThan_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008259,
        "dEQP-GLES2.functional.shaders.constant_expressions.built",
        "in_functions.vector_relational.greaterThan_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008260,
        "dEQP-GLES2.functional.shaders.constant_expressions.buil",
        "tin_functions.vector_relational.greaterThan_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008261,
        "dEQP-GLES2.functional.shaders.constant_expressions.built",
        "in_functions.vector_relational.greaterThan_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008262,
        "dEQP-GLES2.functional.shaders.constant_expressions.buil",
        "tin_functions.vector_relational.greaterThan_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008263,
        "dEQP-GLES2.functional.shaders.constant_expressions.built",
        "in_functions.vector_relational.greaterThan_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008264,
        "dEQP-GLES2.functional.shaders.constant_expressions.buil",
        "tin_functions.vector_relational.greaterThan_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008265,
        "dEQP-GLES2.functional.shaders.constant_expressions.built",
        "in_functions.vector_relational.greaterThan_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008266,
        "dEQP-GLES2.functional.shaders.constant_expressions.builti",
        "n_functions.vector_relational.greaterThanEqual_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008267,
        "dEQP-GLES2.functional.shaders.constant_expressions.builtin",
        "_functions.vector_relational.greaterThanEqual_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008268,
        "dEQP-GLES2.functional.shaders.constant_expressions.builti",
        "n_functions.vector_relational.greaterThanEqual_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008269,
        "dEQP-GLES2.functional.shaders.constant_expressions.builtin",
        "_functions.vector_relational.greaterThanEqual_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008270,
        "dEQP-GLES2.functional.shaders.constant_expressions.builti",
        "n_functions.vector_relational.greaterThanEqual_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008271,
        "dEQP-GLES2.functional.shaders.constant_expressions.builtin",
        "_functions.vector_relational.greaterThanEqual_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008272,
        "dEQP-GLES2.functional.shaders.constant_expressions.builtin",
        "_functions.vector_relational.greaterThanEqual_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008273,
        "dEQP-GLES2.functional.shaders.constant_expressions.builtin_",
        "functions.vector_relational.greaterThanEqual_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008274,
        "dEQP-GLES2.functional.shaders.constant_expressions.builtin",
        "_functions.vector_relational.greaterThanEqual_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008275,
        "dEQP-GLES2.functional.shaders.constant_expressions.builtin_",
        "functions.vector_relational.greaterThanEqual_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008276,
        "dEQP-GLES2.functional.shaders.constant_expressions.builtin",
        "_functions.vector_relational.greaterThanEqual_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008277,
        "dEQP-GLES2.functional.shaders.constant_expressions.builtin_",
        "functions.vector_relational.greaterThanEqual_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008278,
        "dEQP-GLES2.functional.shaders.constant_expressions.b",
        "uiltin_functions.vector_relational.equal_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008279,
        "dEQP-GLES2.functional.shaders.constant_expressions.bu",
        "iltin_functions.vector_relational.equal_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008280,
        "dEQP-GLES2.functional.shaders.constant_expressions.b",
        "uiltin_functions.vector_relational.equal_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008281,
        "dEQP-GLES2.functional.shaders.constant_expressions.bu",
        "iltin_functions.vector_relational.equal_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008282,
        "dEQP-GLES2.functional.shaders.constant_expressions.b",
        "uiltin_functions.vector_relational.equal_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008283,
        "dEQP-GLES2.functional.shaders.constant_expressions.bu",
        "iltin_functions.vector_relational.equal_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008284,
        "dEQP-GLES2.functional.shaders.constant_expressions.b",
        "uiltin_functions.vector_relational.equal_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008285,
        "dEQP-GLES2.functional.shaders.constant_expressions.bu",
        "iltin_functions.vector_relational.equal_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008286,
        "dEQP-GLES2.functional.shaders.constant_expressions.b",
        "uiltin_functions.vector_relational.equal_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008287,
        "dEQP-GLES2.functional.shaders.constant_expressions.bu",
        "iltin_functions.vector_relational.equal_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008288,
        "dEQP-GLES2.functional.shaders.constant_expressions.b",
        "uiltin_functions.vector_relational.equal_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008289,
        "dEQP-GLES2.functional.shaders.constant_expressions.bu",
        "iltin_functions.vector_relational.equal_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008290,
        "dEQP-GLES2.functional.shaders.constant_expressions.b",
        "uiltin_functions.vector_relational.equal_bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008291,
        "dEQP-GLES2.functional.shaders.constant_expressions.bu",
        "iltin_functions.vector_relational.equal_bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008292,
        "dEQP-GLES2.functional.shaders.constant_expressions.b",
        "uiltin_functions.vector_relational.equal_bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008293,
        "dEQP-GLES2.functional.shaders.constant_expressions.bu",
        "iltin_functions.vector_relational.equal_bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008294,
        "dEQP-GLES2.functional.shaders.constant_expressions.b",
        "uiltin_functions.vector_relational.equal_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008295,
        "dEQP-GLES2.functional.shaders.constant_expressions.bu",
        "iltin_functions.vector_relational.equal_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008296,
        "dEQP-GLES2.functional.shaders.constant_expressions.bu",
        "iltin_functions.vector_relational.notEqual_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008297,
        "dEQP-GLES2.functional.shaders.constant_expressions.bui",
        "ltin_functions.vector_relational.notEqual_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008298,
        "dEQP-GLES2.functional.shaders.constant_expressions.bu",
        "iltin_functions.vector_relational.notEqual_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008299,
        "dEQP-GLES2.functional.shaders.constant_expressions.bui",
        "ltin_functions.vector_relational.notEqual_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008300,
        "dEQP-GLES2.functional.shaders.constant_expressions.bu",
        "iltin_functions.vector_relational.notEqual_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008301,
        "dEQP-GLES2.functional.shaders.constant_expressions.bui",
        "ltin_functions.vector_relational.notEqual_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008302,
        "dEQP-GLES2.functional.shaders.constant_expressions.bui",
        "ltin_functions.vector_relational.notEqual_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008303,
        "dEQP-GLES2.functional.shaders.constant_expressions.buil",
        "tin_functions.vector_relational.notEqual_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008304,
        "dEQP-GLES2.functional.shaders.constant_expressions.bui",
        "ltin_functions.vector_relational.notEqual_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008305,
        "dEQP-GLES2.functional.shaders.constant_expressions.buil",
        "tin_functions.vector_relational.notEqual_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008306,
        "dEQP-GLES2.functional.shaders.constant_expressions.bui",
        "ltin_functions.vector_relational.notEqual_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008307,
        "dEQP-GLES2.functional.shaders.constant_expressions.buil",
        "tin_functions.vector_relational.notEqual_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008308,
        "dEQP-GLES2.functional.shaders.constant_expressions.bui",
        "ltin_functions.vector_relational.notEqual_bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008309,
        "dEQP-GLES2.functional.shaders.constant_expressions.buil",
        "tin_functions.vector_relational.notEqual_bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008310,
        "dEQP-GLES2.functional.shaders.constant_expressions.bui",
        "ltin_functions.vector_relational.notEqual_bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008311,
        "dEQP-GLES2.functional.shaders.constant_expressions.buil",
        "tin_functions.vector_relational.notEqual_bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008312,
        "dEQP-GLES2.functional.shaders.constant_expressions.bui",
        "ltin_functions.vector_relational.notEqual_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008313,
        "dEQP-GLES2.functional.shaders.constant_expressions.buil",
        "tin_functions.vector_relational.notEqual_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008314,
        "dEQP-GLES2.functional.shaders.constant_expressions.",
        "builtin_functions.vector_relational.any_bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008315,
        "dEQP-GLES2.functional.shaders.constant_expressions.b",
        "uiltin_functions.vector_relational.any_bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008316,
        "dEQP-GLES2.functional.shaders.constant_expressions.",
        "builtin_functions.vector_relational.any_bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008317,
        "dEQP-GLES2.functional.shaders.constant_expressions.b",
        "uiltin_functions.vector_relational.any_bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008318,
        "dEQP-GLES2.functional.shaders.constant_expressions.",
        "builtin_functions.vector_relational.any_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008319,
        "dEQP-GLES2.functional.shaders.constant_expressions.b",
        "uiltin_functions.vector_relational.any_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008320,
        "dEQP-GLES2.functional.shaders.constant_expressions.",
        "builtin_functions.vector_relational.all_bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008321,
        "dEQP-GLES2.functional.shaders.constant_expressions.b",
        "uiltin_functions.vector_relational.all_bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008322,
        "dEQP-GLES2.functional.shaders.constant_expressions.",
        "builtin_functions.vector_relational.all_bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008323,
        "dEQP-GLES2.functional.shaders.constant_expressions.b",
        "uiltin_functions.vector_relational.all_bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008324,
        "dEQP-GLES2.functional.shaders.constant_expressions.",
        "builtin_functions.vector_relational.all_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008325,
        "dEQP-GLES2.functional.shaders.constant_expressions.b",
        "uiltin_functions.vector_relational.all_bvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008326,
        "dEQP-GLES2.functional.shaders.constant_expressions.",
        "builtin_functions.vector_relational.not_bvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008327,
        "dEQP-GLES2.functional.shaders.constant_expressions.b",
        "uiltin_functions.vector_relational.not_bvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008328,
        "dEQP-GLES2.functional.shaders.constant_expressions.",
        "builtin_functions.vector_relational.not_bvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008329,
        "dEQP-GLES2.functional.shaders.constant_expressions.b",
        "uiltin_functions.vector_relational.not_bvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008330,
        "dEQP-GLES2.functional.shaders.constant_expressions.",
        "builtin_functions.vector_relational.not_bvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20009TestSuite, TestCase_008331,
        "dEQP-GLES2.functional.shaders.constant_expressions.b",
        "uiltin_functions.vector_relational.not_bvec4_fragment");
