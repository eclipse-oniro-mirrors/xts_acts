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
#include "../ActsDeqpgles30020TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019964,
        "dEQP-GLES3.functional.shaders.constant_expression",
        "s.builtin_functions.geometric.length_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019965,
        "dEQP-GLES3.functional.shaders.constant_expressions",
        ".builtin_functions.geometric.length_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019966,
        "dEQP-GLES3.functional.shaders.constant_expressio",
        "ns.builtin_functions.geometric.length_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019967,
        "dEQP-GLES3.functional.shaders.constant_expression",
        "s.builtin_functions.geometric.length_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019968,
        "dEQP-GLES3.functional.shaders.constant_expressio",
        "ns.builtin_functions.geometric.length_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019969,
        "dEQP-GLES3.functional.shaders.constant_expression",
        "s.builtin_functions.geometric.length_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019970,
        "dEQP-GLES3.functional.shaders.constant_expressio",
        "ns.builtin_functions.geometric.length_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019971,
        "dEQP-GLES3.functional.shaders.constant_expression",
        "s.builtin_functions.geometric.length_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019972,
        "dEQP-GLES3.functional.shaders.constant_expressi",
        "ons.builtin_functions.geometric.dot_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019973,
        "dEQP-GLES3.functional.shaders.constant_expressio",
        "ns.builtin_functions.geometric.dot_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019974,
        "dEQP-GLES3.functional.shaders.constant_expressi",
        "ons.builtin_functions.geometric.dot_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019975,
        "dEQP-GLES3.functional.shaders.constant_expressio",
        "ns.builtin_functions.geometric.dot_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019976,
        "dEQP-GLES3.functional.shaders.constant_expressi",
        "ons.builtin_functions.geometric.dot_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019977,
        "dEQP-GLES3.functional.shaders.constant_expressio",
        "ns.builtin_functions.geometric.dot_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019978,
        "dEQP-GLES3.functional.shaders.constant_expressi",
        "ons.builtin_functions.geometric.dot_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019979,
        "dEQP-GLES3.functional.shaders.constant_expressio",
        "ns.builtin_functions.geometric.dot_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019980,
        "dEQP-GLES3.functional.shaders.constant_expressions",
        ".builtin_functions.geometric.normalize_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019981,
        "dEQP-GLES3.functional.shaders.constant_expressions.",
        "builtin_functions.geometric.normalize_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019982,
        "dEQP-GLES3.functional.shaders.constant_expressions",
        ".builtin_functions.geometric.normalize_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019983,
        "dEQP-GLES3.functional.shaders.constant_expressions.",
        "builtin_functions.geometric.normalize_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019984,
        "dEQP-GLES3.functional.shaders.constant_expressions",
        ".builtin_functions.geometric.normalize_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019985,
        "dEQP-GLES3.functional.shaders.constant_expressions.",
        "builtin_functions.geometric.normalize_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019986,
        "dEQP-GLES3.functional.shaders.constant_expressions",
        ".builtin_functions.geometric.normalize_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019987,
        "dEQP-GLES3.functional.shaders.constant_expressions.",
        "builtin_functions.geometric.normalize_vec4_fragment");
