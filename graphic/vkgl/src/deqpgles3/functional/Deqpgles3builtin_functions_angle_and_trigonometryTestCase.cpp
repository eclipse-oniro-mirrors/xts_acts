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

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019686,
        "dEQP-GLES3.functional.shaders.constant_expressions.bui",
        "ltin_functions.angle_and_trigonometry.sin_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019687,
        "dEQP-GLES3.functional.shaders.constant_expressions.buil",
        "tin_functions.angle_and_trigonometry.sin_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019688,
        "dEQP-GLES3.functional.shaders.constant_expressions.bu",
        "iltin_functions.angle_and_trigonometry.sin_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019689,
        "dEQP-GLES3.functional.shaders.constant_expressions.bui",
        "ltin_functions.angle_and_trigonometry.sin_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019690,
        "dEQP-GLES3.functional.shaders.constant_expressions.bu",
        "iltin_functions.angle_and_trigonometry.sin_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019691,
        "dEQP-GLES3.functional.shaders.constant_expressions.bui",
        "ltin_functions.angle_and_trigonometry.sin_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019692,
        "dEQP-GLES3.functional.shaders.constant_expressions.bu",
        "iltin_functions.angle_and_trigonometry.sin_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019693,
        "dEQP-GLES3.functional.shaders.constant_expressions.bui",
        "ltin_functions.angle_and_trigonometry.sin_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019694,
        "dEQP-GLES3.functional.shaders.constant_expressions.bui",
        "ltin_functions.angle_and_trigonometry.cos_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019695,
        "dEQP-GLES3.functional.shaders.constant_expressions.buil",
        "tin_functions.angle_and_trigonometry.cos_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019696,
        "dEQP-GLES3.functional.shaders.constant_expressions.bu",
        "iltin_functions.angle_and_trigonometry.cos_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019697,
        "dEQP-GLES3.functional.shaders.constant_expressions.bui",
        "ltin_functions.angle_and_trigonometry.cos_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019698,
        "dEQP-GLES3.functional.shaders.constant_expressions.bu",
        "iltin_functions.angle_and_trigonometry.cos_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019699,
        "dEQP-GLES3.functional.shaders.constant_expressions.bui",
        "ltin_functions.angle_and_trigonometry.cos_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019700,
        "dEQP-GLES3.functional.shaders.constant_expressions.bu",
        "iltin_functions.angle_and_trigonometry.cos_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019701,
        "dEQP-GLES3.functional.shaders.constant_expressions.bui",
        "ltin_functions.angle_and_trigonometry.cos_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019702,
        "dEQP-GLES3.functional.shaders.constant_expressions.bui",
        "ltin_functions.angle_and_trigonometry.asin_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019703,
        "dEQP-GLES3.functional.shaders.constant_expressions.buil",
        "tin_functions.angle_and_trigonometry.asin_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019704,
        "dEQP-GLES3.functional.shaders.constant_expressions.bui",
        "ltin_functions.angle_and_trigonometry.asin_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019705,
        "dEQP-GLES3.functional.shaders.constant_expressions.buil",
        "tin_functions.angle_and_trigonometry.asin_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019706,
        "dEQP-GLES3.functional.shaders.constant_expressions.bui",
        "ltin_functions.angle_and_trigonometry.asin_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019707,
        "dEQP-GLES3.functional.shaders.constant_expressions.buil",
        "tin_functions.angle_and_trigonometry.asin_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019708,
        "dEQP-GLES3.functional.shaders.constant_expressions.bui",
        "ltin_functions.angle_and_trigonometry.asin_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019709,
        "dEQP-GLES3.functional.shaders.constant_expressions.buil",
        "tin_functions.angle_and_trigonometry.asin_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019710,
        "dEQP-GLES3.functional.shaders.constant_expressions.bui",
        "ltin_functions.angle_and_trigonometry.acos_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019711,
        "dEQP-GLES3.functional.shaders.constant_expressions.buil",
        "tin_functions.angle_and_trigonometry.acos_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019712,
        "dEQP-GLES3.functional.shaders.constant_expressions.bui",
        "ltin_functions.angle_and_trigonometry.acos_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019713,
        "dEQP-GLES3.functional.shaders.constant_expressions.buil",
        "tin_functions.angle_and_trigonometry.acos_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019714,
        "dEQP-GLES3.functional.shaders.constant_expressions.bui",
        "ltin_functions.angle_and_trigonometry.acos_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019715,
        "dEQP-GLES3.functional.shaders.constant_expressions.buil",
        "tin_functions.angle_and_trigonometry.acos_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019716,
        "dEQP-GLES3.functional.shaders.constant_expressions.bui",
        "ltin_functions.angle_and_trigonometry.acos_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019717,
        "dEQP-GLES3.functional.shaders.constant_expressions.buil",
        "tin_functions.angle_and_trigonometry.acos_vec4_fragment");
