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
#include "../Gl43masterBaseFunc.h"
#include "../ActsGl43master0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006340,
    "KHR-GL43.constant_expressions.basic_radians_float_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006341,
    "KHR-GL43.constant_expressions.basic_radians_float_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006342,
    "KHR-GL43.constant_expressions.basic_radians_float_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006343,
    "KHR-GL43.constant_expressions.basic_radians_float_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006344,
    "KHR-GL43.constant_expressions.basic_radians_float_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006345,
    "KHR-GL43.constant_expressions.basic_radians_float_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006346,
    "KHR-GL43.constant_expressions.basic_radians_vec2_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006347,
    "KHR-GL43.constant_expressions.basic_radians_vec2_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006348,
    "KHR-GL43.constant_expressions.basic_radians_vec2_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006349,
    "KHR-GL43.constant_expressions.basic_radians_vec2_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006350,
    "KHR-GL43.constant_expressions.basic_radians_vec2_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006351,
    "KHR-GL43.constant_expressions.basic_radians_vec2_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006352,
    "KHR-GL43.constant_expressions.basic_radians_vec3_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006353,
    "KHR-GL43.constant_expressions.basic_radians_vec3_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006354,
    "KHR-GL43.constant_expressions.basic_radians_vec3_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006355,
    "KHR-GL43.constant_expressions.basic_radians_vec3_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006356,
    "KHR-GL43.constant_expressions.basic_radians_vec3_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006357,
    "KHR-GL43.constant_expressions.basic_radians_vec3_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006358,
    "KHR-GL43.constant_expressions.basic_radians_vec4_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006359,
    "KHR-GL43.constant_expressions.basic_radians_vec4_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006360,
    "KHR-GL43.constant_expressions.basic_radians_vec4_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006361,
    "KHR-GL43.constant_expressions.basic_radians_vec4_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006362,
    "KHR-GL43.constant_expressions.basic_radians_vec4_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006363,
    "KHR-GL43.constant_expressions.basic_radians_vec4_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006364,
    "KHR-GL43.constant_expressions.basic_degrees_float_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006365,
    "KHR-GL43.constant_expressions.basic_degrees_float_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006366,
    "KHR-GL43.constant_expressions.basic_degrees_float_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006367,
    "KHR-GL43.constant_expressions.basic_degrees_float_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006368,
    "KHR-GL43.constant_expressions.basic_degrees_float_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006369,
    "KHR-GL43.constant_expressions.basic_degrees_float_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006370,
    "KHR-GL43.constant_expressions.basic_degrees_vec2_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006371,
    "KHR-GL43.constant_expressions.basic_degrees_vec2_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006372,
    "KHR-GL43.constant_expressions.basic_degrees_vec2_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006373,
    "KHR-GL43.constant_expressions.basic_degrees_vec2_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006374,
    "KHR-GL43.constant_expressions.basic_degrees_vec2_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006375,
    "KHR-GL43.constant_expressions.basic_degrees_vec2_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006376,
    "KHR-GL43.constant_expressions.basic_degrees_vec3_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006377,
    "KHR-GL43.constant_expressions.basic_degrees_vec3_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006378,
    "KHR-GL43.constant_expressions.basic_degrees_vec3_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006379,
    "KHR-GL43.constant_expressions.basic_degrees_vec3_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006380,
    "KHR-GL43.constant_expressions.basic_degrees_vec3_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006381,
    "KHR-GL43.constant_expressions.basic_degrees_vec3_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006382,
    "KHR-GL43.constant_expressions.basic_degrees_vec4_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006383,
    "KHR-GL43.constant_expressions.basic_degrees_vec4_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006384,
    "KHR-GL43.constant_expressions.basic_degrees_vec4_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006385,
    "KHR-GL43.constant_expressions.basic_degrees_vec4_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006386,
    "KHR-GL43.constant_expressions.basic_degrees_vec4_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006387,
    "KHR-GL43.constant_expressions.basic_degrees_vec4_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006388,
    "KHR-GL43.constant_expressions.basic_sin_float_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006389,
    "KHR-GL43.constant_expressions.basic_sin_float_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006390,
    "KHR-GL43.constant_expressions.basic_sin_float_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006391,
    "KHR-GL43.constant_expressions.basic_sin_float_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006392,
    "KHR-GL43.constant_expressions.basic_sin_float_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006393,
    "KHR-GL43.constant_expressions.basic_sin_float_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006394,
    "KHR-GL43.constant_expressions.basic_sin_vec2_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006395,
    "KHR-GL43.constant_expressions.basic_sin_vec2_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006396,
    "KHR-GL43.constant_expressions.basic_sin_vec2_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006397,
    "KHR-GL43.constant_expressions.basic_sin_vec2_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006398,
    "KHR-GL43.constant_expressions.basic_sin_vec2_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006399,
    "KHR-GL43.constant_expressions.basic_sin_vec2_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006400,
    "KHR-GL43.constant_expressions.basic_sin_vec3_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006401,
    "KHR-GL43.constant_expressions.basic_sin_vec3_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006402,
    "KHR-GL43.constant_expressions.basic_sin_vec3_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006403,
    "KHR-GL43.constant_expressions.basic_sin_vec3_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006404,
    "KHR-GL43.constant_expressions.basic_sin_vec3_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006405,
    "KHR-GL43.constant_expressions.basic_sin_vec3_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006406,
    "KHR-GL43.constant_expressions.basic_sin_vec4_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006407,
    "KHR-GL43.constant_expressions.basic_sin_vec4_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006408,
    "KHR-GL43.constant_expressions.basic_sin_vec4_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006409,
    "KHR-GL43.constant_expressions.basic_sin_vec4_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006410,
    "KHR-GL43.constant_expressions.basic_sin_vec4_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006411,
    "KHR-GL43.constant_expressions.basic_sin_vec4_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006412,
    "KHR-GL43.constant_expressions.basic_cos_float_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006413,
    "KHR-GL43.constant_expressions.basic_cos_float_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006414,
    "KHR-GL43.constant_expressions.basic_cos_float_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006415,
    "KHR-GL43.constant_expressions.basic_cos_float_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006416,
    "KHR-GL43.constant_expressions.basic_cos_float_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006417,
    "KHR-GL43.constant_expressions.basic_cos_float_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006418,
    "KHR-GL43.constant_expressions.basic_cos_vec2_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006419,
    "KHR-GL43.constant_expressions.basic_cos_vec2_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006420,
    "KHR-GL43.constant_expressions.basic_cos_vec2_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006421,
    "KHR-GL43.constant_expressions.basic_cos_vec2_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006422,
    "KHR-GL43.constant_expressions.basic_cos_vec2_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006423,
    "KHR-GL43.constant_expressions.basic_cos_vec2_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006424,
    "KHR-GL43.constant_expressions.basic_cos_vec3_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006425,
    "KHR-GL43.constant_expressions.basic_cos_vec3_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006426,
    "KHR-GL43.constant_expressions.basic_cos_vec3_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006427,
    "KHR-GL43.constant_expressions.basic_cos_vec3_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006428,
    "KHR-GL43.constant_expressions.basic_cos_vec3_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006429,
    "KHR-GL43.constant_expressions.basic_cos_vec3_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006430,
    "KHR-GL43.constant_expressions.basic_cos_vec4_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006431,
    "KHR-GL43.constant_expressions.basic_cos_vec4_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006432,
    "KHR-GL43.constant_expressions.basic_cos_vec4_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006433,
    "KHR-GL43.constant_expressions.basic_cos_vec4_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006434,
    "KHR-GL43.constant_expressions.basic_cos_vec4_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006435,
    "KHR-GL43.constant_expressions.basic_cos_vec4_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006436,
    "KHR-GL43.constant_expressions.basic_asin_float_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006437,
    "KHR-GL43.constant_expressions.basic_asin_float_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006438,
    "KHR-GL43.constant_expressions.basic_asin_float_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006439,
    "KHR-GL43.constant_expressions.basic_asin_float_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006440,
    "KHR-GL43.constant_expressions.basic_asin_float_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006441,
    "KHR-GL43.constant_expressions.basic_asin_float_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006442,
    "KHR-GL43.constant_expressions.basic_asin_vec2_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006443,
    "KHR-GL43.constant_expressions.basic_asin_vec2_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006444,
    "KHR-GL43.constant_expressions.basic_asin_vec2_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006445,
    "KHR-GL43.constant_expressions.basic_asin_vec2_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006446,
    "KHR-GL43.constant_expressions.basic_asin_vec2_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006447,
    "KHR-GL43.constant_expressions.basic_asin_vec2_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006448,
    "KHR-GL43.constant_expressions.basic_asin_vec3_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006449,
    "KHR-GL43.constant_expressions.basic_asin_vec3_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006450,
    "KHR-GL43.constant_expressions.basic_asin_vec3_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006451,
    "KHR-GL43.constant_expressions.basic_asin_vec3_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006452,
    "KHR-GL43.constant_expressions.basic_asin_vec3_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006453,
    "KHR-GL43.constant_expressions.basic_asin_vec3_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006454,
    "KHR-GL43.constant_expressions.basic_asin_vec4_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006455,
    "KHR-GL43.constant_expressions.basic_asin_vec4_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006456,
    "KHR-GL43.constant_expressions.basic_asin_vec4_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006457,
    "KHR-GL43.constant_expressions.basic_asin_vec4_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006458,
    "KHR-GL43.constant_expressions.basic_asin_vec4_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006459,
    "KHR-GL43.constant_expressions.basic_asin_vec4_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006460,
    "KHR-GL43.constant_expressions.basic_acos_float_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006461,
    "KHR-GL43.constant_expressions.basic_acos_float_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006462,
    "KHR-GL43.constant_expressions.basic_acos_float_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006463,
    "KHR-GL43.constant_expressions.basic_acos_float_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006464,
    "KHR-GL43.constant_expressions.basic_acos_float_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006465,
    "KHR-GL43.constant_expressions.basic_acos_float_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006466,
    "KHR-GL43.constant_expressions.basic_acos_vec2_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006467,
    "KHR-GL43.constant_expressions.basic_acos_vec2_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006468,
    "KHR-GL43.constant_expressions.basic_acos_vec2_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006469,
    "KHR-GL43.constant_expressions.basic_acos_vec2_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006470,
    "KHR-GL43.constant_expressions.basic_acos_vec2_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006471,
    "KHR-GL43.constant_expressions.basic_acos_vec2_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006472,
    "KHR-GL43.constant_expressions.basic_acos_vec3_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006473,
    "KHR-GL43.constant_expressions.basic_acos_vec3_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006474,
    "KHR-GL43.constant_expressions.basic_acos_vec3_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006475,
    "KHR-GL43.constant_expressions.basic_acos_vec3_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006476,
    "KHR-GL43.constant_expressions.basic_acos_vec3_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006477,
    "KHR-GL43.constant_expressions.basic_acos_vec3_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006478,
    "KHR-GL43.constant_expressions.basic_acos_vec4_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006479,
    "KHR-GL43.constant_expressions.basic_acos_vec4_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006480,
    "KHR-GL43.constant_expressions.basic_acos_vec4_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006481,
    "KHR-GL43.constant_expressions.basic_acos_vec4_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006482,
    "KHR-GL43.constant_expressions.basic_acos_vec4_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006483,
    "KHR-GL43.constant_expressions.basic_acos_vec4_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006484,
    "KHR-GL43.constant_expressions.basic_pow_float_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006485,
    "KHR-GL43.constant_expressions.basic_pow_float_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006486,
    "KHR-GL43.constant_expressions.basic_pow_float_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006487,
    "KHR-GL43.constant_expressions.basic_pow_float_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006488,
    "KHR-GL43.constant_expressions.basic_pow_float_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006489,
    "KHR-GL43.constant_expressions.basic_pow_float_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006490,
    "KHR-GL43.constant_expressions.basic_pow_vec2_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006491,
    "KHR-GL43.constant_expressions.basic_pow_vec2_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006492,
    "KHR-GL43.constant_expressions.basic_pow_vec2_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006493,
    "KHR-GL43.constant_expressions.basic_pow_vec2_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006494,
    "KHR-GL43.constant_expressions.basic_pow_vec2_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006495,
    "KHR-GL43.constant_expressions.basic_pow_vec2_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006496,
    "KHR-GL43.constant_expressions.basic_pow_vec3_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006497,
    "KHR-GL43.constant_expressions.basic_pow_vec3_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006498,
    "KHR-GL43.constant_expressions.basic_pow_vec3_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006499,
    "KHR-GL43.constant_expressions.basic_pow_vec3_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006500,
    "KHR-GL43.constant_expressions.basic_pow_vec3_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006501,
    "KHR-GL43.constant_expressions.basic_pow_vec3_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006502,
    "KHR-GL43.constant_expressions.basic_pow_vec4_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006503,
    "KHR-GL43.constant_expressions.basic_pow_vec4_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006504,
    "KHR-GL43.constant_expressions.basic_pow_vec4_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006505,
    "KHR-GL43.constant_expressions.basic_pow_vec4_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006506,
    "KHR-GL43.constant_expressions.basic_pow_vec4_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006507,
    "KHR-GL43.constant_expressions.basic_pow_vec4_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006508,
    "KHR-GL43.constant_expressions.basic_exp_float_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006509,
    "KHR-GL43.constant_expressions.basic_exp_float_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006510,
    "KHR-GL43.constant_expressions.basic_exp_float_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006511,
    "KHR-GL43.constant_expressions.basic_exp_float_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006512,
    "KHR-GL43.constant_expressions.basic_exp_float_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006513,
    "KHR-GL43.constant_expressions.basic_exp_float_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006514,
    "KHR-GL43.constant_expressions.basic_exp_vec2_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006515,
    "KHR-GL43.constant_expressions.basic_exp_vec2_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006516,
    "KHR-GL43.constant_expressions.basic_exp_vec2_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006517,
    "KHR-GL43.constant_expressions.basic_exp_vec2_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006518,
    "KHR-GL43.constant_expressions.basic_exp_vec2_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006519,
    "KHR-GL43.constant_expressions.basic_exp_vec2_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006520,
    "KHR-GL43.constant_expressions.basic_exp_vec3_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006521,
    "KHR-GL43.constant_expressions.basic_exp_vec3_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006522,
    "KHR-GL43.constant_expressions.basic_exp_vec3_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006523,
    "KHR-GL43.constant_expressions.basic_exp_vec3_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006524,
    "KHR-GL43.constant_expressions.basic_exp_vec3_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006525,
    "KHR-GL43.constant_expressions.basic_exp_vec3_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006526,
    "KHR-GL43.constant_expressions.basic_exp_vec4_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006527,
    "KHR-GL43.constant_expressions.basic_exp_vec4_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006528,
    "KHR-GL43.constant_expressions.basic_exp_vec4_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006529,
    "KHR-GL43.constant_expressions.basic_exp_vec4_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006530,
    "KHR-GL43.constant_expressions.basic_exp_vec4_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006531,
    "KHR-GL43.constant_expressions.basic_exp_vec4_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006532,
    "KHR-GL43.constant_expressions.basic_log_float_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006533,
    "KHR-GL43.constant_expressions.basic_log_float_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006534,
    "KHR-GL43.constant_expressions.basic_log_float_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006535,
    "KHR-GL43.constant_expressions.basic_log_float_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006536,
    "KHR-GL43.constant_expressions.basic_log_float_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006537,
    "KHR-GL43.constant_expressions.basic_log_float_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006538,
    "KHR-GL43.constant_expressions.basic_log_vec2_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006539,
    "KHR-GL43.constant_expressions.basic_log_vec2_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006540,
    "KHR-GL43.constant_expressions.basic_log_vec2_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006541,
    "KHR-GL43.constant_expressions.basic_log_vec2_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006542,
    "KHR-GL43.constant_expressions.basic_log_vec2_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006543,
    "KHR-GL43.constant_expressions.basic_log_vec2_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006544,
    "KHR-GL43.constant_expressions.basic_log_vec3_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006545,
    "KHR-GL43.constant_expressions.basic_log_vec3_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006546,
    "KHR-GL43.constant_expressions.basic_log_vec3_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006547,
    "KHR-GL43.constant_expressions.basic_log_vec3_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006548,
    "KHR-GL43.constant_expressions.basic_log_vec3_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006549,
    "KHR-GL43.constant_expressions.basic_log_vec3_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006550,
    "KHR-GL43.constant_expressions.basic_log_vec4_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006551,
    "KHR-GL43.constant_expressions.basic_log_vec4_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006552,
    "KHR-GL43.constant_expressions.basic_log_vec4_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006553,
    "KHR-GL43.constant_expressions.basic_log_vec4_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006554,
    "KHR-GL43.constant_expressions.basic_log_vec4_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006555,
    "KHR-GL43.constant_expressions.basic_log_vec4_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006556,
    "KHR-GL43.constant_expressions.basic_exp2_float_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006557,
    "KHR-GL43.constant_expressions.basic_exp2_float_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006558,
    "KHR-GL43.constant_expressions.basic_exp2_float_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006559,
    "KHR-GL43.constant_expressions.basic_exp2_float_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006560,
    "KHR-GL43.constant_expressions.basic_exp2_float_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006561,
    "KHR-GL43.constant_expressions.basic_exp2_float_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006562,
    "KHR-GL43.constant_expressions.basic_exp2_vec2_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006563,
    "KHR-GL43.constant_expressions.basic_exp2_vec2_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006564,
    "KHR-GL43.constant_expressions.basic_exp2_vec2_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006565,
    "KHR-GL43.constant_expressions.basic_exp2_vec2_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006566,
    "KHR-GL43.constant_expressions.basic_exp2_vec2_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006567,
    "KHR-GL43.constant_expressions.basic_exp2_vec2_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006568,
    "KHR-GL43.constant_expressions.basic_exp2_vec3_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006569,
    "KHR-GL43.constant_expressions.basic_exp2_vec3_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006570,
    "KHR-GL43.constant_expressions.basic_exp2_vec3_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006571,
    "KHR-GL43.constant_expressions.basic_exp2_vec3_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006572,
    "KHR-GL43.constant_expressions.basic_exp2_vec3_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006573,
    "KHR-GL43.constant_expressions.basic_exp2_vec3_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006574,
    "KHR-GL43.constant_expressions.basic_exp2_vec4_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006575,
    "KHR-GL43.constant_expressions.basic_exp2_vec4_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006576,
    "KHR-GL43.constant_expressions.basic_exp2_vec4_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006577,
    "KHR-GL43.constant_expressions.basic_exp2_vec4_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006578,
    "KHR-GL43.constant_expressions.basic_exp2_vec4_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006579,
    "KHR-GL43.constant_expressions.basic_exp2_vec4_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006580,
    "KHR-GL43.constant_expressions.basic_log2_float_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006581,
    "KHR-GL43.constant_expressions.basic_log2_float_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006582,
    "KHR-GL43.constant_expressions.basic_log2_float_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006583,
    "KHR-GL43.constant_expressions.basic_log2_float_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006584,
    "KHR-GL43.constant_expressions.basic_log2_float_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006585,
    "KHR-GL43.constant_expressions.basic_log2_float_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006586,
    "KHR-GL43.constant_expressions.basic_log2_vec2_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006587,
    "KHR-GL43.constant_expressions.basic_log2_vec2_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006588,
    "KHR-GL43.constant_expressions.basic_log2_vec2_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006589,
    "KHR-GL43.constant_expressions.basic_log2_vec2_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006590,
    "KHR-GL43.constant_expressions.basic_log2_vec2_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006591,
    "KHR-GL43.constant_expressions.basic_log2_vec2_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006592,
    "KHR-GL43.constant_expressions.basic_log2_vec3_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006593,
    "KHR-GL43.constant_expressions.basic_log2_vec3_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006594,
    "KHR-GL43.constant_expressions.basic_log2_vec3_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006595,
    "KHR-GL43.constant_expressions.basic_log2_vec3_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006596,
    "KHR-GL43.constant_expressions.basic_log2_vec3_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006597,
    "KHR-GL43.constant_expressions.basic_log2_vec3_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006598,
    "KHR-GL43.constant_expressions.basic_log2_vec4_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006599,
    "KHR-GL43.constant_expressions.basic_log2_vec4_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006600,
    "KHR-GL43.constant_expressions.basic_log2_vec4_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006601,
    "KHR-GL43.constant_expressions.basic_log2_vec4_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006602,
    "KHR-GL43.constant_expressions.basic_log2_vec4_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006603,
    "KHR-GL43.constant_expressions.basic_log2_vec4_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006604,
    "KHR-GL43.constant_expressions.basic_sqrt_float_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006605,
    "KHR-GL43.constant_expressions.basic_sqrt_float_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006606,
    "KHR-GL43.constant_expressions.basic_sqrt_float_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006607,
    "KHR-GL43.constant_expressions.basic_sqrt_float_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006608,
    "KHR-GL43.constant_expressions.basic_sqrt_float_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006609,
    "KHR-GL43.constant_expressions.basic_sqrt_float_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006610,
    "KHR-GL43.constant_expressions.basic_sqrt_vec2_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006611,
    "KHR-GL43.constant_expressions.basic_sqrt_vec2_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006612,
    "KHR-GL43.constant_expressions.basic_sqrt_vec2_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006613,
    "KHR-GL43.constant_expressions.basic_sqrt_vec2_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006614,
    "KHR-GL43.constant_expressions.basic_sqrt_vec2_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006615,
    "KHR-GL43.constant_expressions.basic_sqrt_vec2_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006616,
    "KHR-GL43.constant_expressions.basic_sqrt_vec3_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006617,
    "KHR-GL43.constant_expressions.basic_sqrt_vec3_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006618,
    "KHR-GL43.constant_expressions.basic_sqrt_vec3_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006619,
    "KHR-GL43.constant_expressions.basic_sqrt_vec3_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006620,
    "KHR-GL43.constant_expressions.basic_sqrt_vec3_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006621,
    "KHR-GL43.constant_expressions.basic_sqrt_vec3_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006622,
    "KHR-GL43.constant_expressions.basic_sqrt_vec4_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006623,
    "KHR-GL43.constant_expressions.basic_sqrt_vec4_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006624,
    "KHR-GL43.constant_expressions.basic_sqrt_vec4_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006625,
    "KHR-GL43.constant_expressions.basic_sqrt_vec4_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006626,
    "KHR-GL43.constant_expressions.basic_sqrt_vec4_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006627,
    "KHR-GL43.constant_expressions.basic_sqrt_vec4_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006628,
    "KHR-GL43.constant_expressions.basic_inversesqrt_float_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006629,
    "KHR-GL43.constant_expressions.basic_inversesqrt_float_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006630,
    "KHR-GL43.constant_expressions.basic_inversesqrt_float_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006631,
    "KHR-GL43.constant_expressions.basic_inversesqrt_float_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006632,
    "KHR-GL43.constant_expressions.basic_inversesqrt_float_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006633,
    "KHR-GL43.constant_expressions.basic_inversesqrt_float_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006634,
    "KHR-GL43.constant_expressions.basic_inversesqrt_vec2_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006635,
    "KHR-GL43.constant_expressions.basic_inversesqrt_vec2_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006636,
    "KHR-GL43.constant_expressions.basic_inversesqrt_vec2_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006637,
    "KHR-GL43.constant_expressions.basic_inversesqrt_vec2_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006638,
    "KHR-GL43.constant_expressions.basic_inversesqrt_vec2_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006639,
    "KHR-GL43.constant_expressions.basic_inversesqrt_vec2_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006640,
    "KHR-GL43.constant_expressions.basic_inversesqrt_vec3_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006641,
    "KHR-GL43.constant_expressions.basic_inversesqrt_vec3_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006642,
    "KHR-GL43.constant_expressions.basic_inversesqrt_vec3_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006643,
    "KHR-GL43.constant_expressions.basic_inversesqrt_vec3_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006644,
    "KHR-GL43.constant_expressions.basic_inversesqrt_vec3_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006645,
    "KHR-GL43.constant_expressions.basic_inversesqrt_vec3_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006646,
    "KHR-GL43.constant_expressions.basic_inversesqrt_vec4_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006647,
    "KHR-GL43.constant_expressions.basic_inversesqrt_vec4_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006648,
    "KHR-GL43.constant_expressions.basic_inversesqrt_vec4_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006649,
    "KHR-GL43.constant_expressions.basic_inversesqrt_vec4_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006650,
    "KHR-GL43.constant_expressions.basic_inversesqrt_vec4_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006651,
    "KHR-GL43.constant_expressions.basic_inversesqrt_vec4_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006652,
    "KHR-GL43.constant_expressions.basic_abs_int_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006653,
    "KHR-GL43.constant_expressions.basic_abs_int_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006654,
    "KHR-GL43.constant_expressions.basic_abs_int_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006655,
    "KHR-GL43.constant_expressions.basic_abs_int_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006656,
    "KHR-GL43.constant_expressions.basic_abs_int_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006657,
    "KHR-GL43.constant_expressions.basic_abs_int_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006658,
    "KHR-GL43.constant_expressions.basic_abs_ivec2_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006659,
    "KHR-GL43.constant_expressions.basic_abs_ivec2_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006660,
    "KHR-GL43.constant_expressions.basic_abs_ivec2_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006661,
    "KHR-GL43.constant_expressions.basic_abs_ivec2_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006662,
    "KHR-GL43.constant_expressions.basic_abs_ivec2_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006663,
    "KHR-GL43.constant_expressions.basic_abs_ivec2_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006664,
    "KHR-GL43.constant_expressions.basic_abs_ivec3_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006665,
    "KHR-GL43.constant_expressions.basic_abs_ivec3_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006666,
    "KHR-GL43.constant_expressions.basic_abs_ivec3_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006667,
    "KHR-GL43.constant_expressions.basic_abs_ivec3_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006668,
    "KHR-GL43.constant_expressions.basic_abs_ivec3_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006669,
    "KHR-GL43.constant_expressions.basic_abs_ivec3_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006670,
    "KHR-GL43.constant_expressions.basic_abs_ivec4_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006671,
    "KHR-GL43.constant_expressions.basic_abs_ivec4_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006672,
    "KHR-GL43.constant_expressions.basic_abs_ivec4_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006673,
    "KHR-GL43.constant_expressions.basic_abs_ivec4_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006674,
    "KHR-GL43.constant_expressions.basic_abs_ivec4_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006675,
    "KHR-GL43.constant_expressions.basic_abs_ivec4_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006676,
    "KHR-GL43.constant_expressions.basic_sign_float_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006677,
    "KHR-GL43.constant_expressions.basic_sign_float_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006678,
    "KHR-GL43.constant_expressions.basic_sign_float_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006679,
    "KHR-GL43.constant_expressions.basic_sign_float_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006680,
    "KHR-GL43.constant_expressions.basic_sign_float_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006681,
    "KHR-GL43.constant_expressions.basic_sign_float_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006682,
    "KHR-GL43.constant_expressions.basic_sign_vec2_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006683,
    "KHR-GL43.constant_expressions.basic_sign_vec2_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006684,
    "KHR-GL43.constant_expressions.basic_sign_vec2_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006685,
    "KHR-GL43.constant_expressions.basic_sign_vec2_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006686,
    "KHR-GL43.constant_expressions.basic_sign_vec2_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006687,
    "KHR-GL43.constant_expressions.basic_sign_vec2_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006688,
    "KHR-GL43.constant_expressions.basic_sign_vec3_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006689,
    "KHR-GL43.constant_expressions.basic_sign_vec3_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006690,
    "KHR-GL43.constant_expressions.basic_sign_vec3_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006691,
    "KHR-GL43.constant_expressions.basic_sign_vec3_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006692,
    "KHR-GL43.constant_expressions.basic_sign_vec3_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006693,
    "KHR-GL43.constant_expressions.basic_sign_vec3_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006694,
    "KHR-GL43.constant_expressions.basic_sign_vec4_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006695,
    "KHR-GL43.constant_expressions.basic_sign_vec4_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006696,
    "KHR-GL43.constant_expressions.basic_sign_vec4_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006697,
    "KHR-GL43.constant_expressions.basic_sign_vec4_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006698,
    "KHR-GL43.constant_expressions.basic_sign_vec4_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006699,
    "KHR-GL43.constant_expressions.basic_sign_vec4_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006700,
    "KHR-GL43.constant_expressions.basic_floor_float_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006701,
    "KHR-GL43.constant_expressions.basic_floor_float_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006702,
    "KHR-GL43.constant_expressions.basic_floor_float_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006703,
    "KHR-GL43.constant_expressions.basic_floor_float_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006704,
    "KHR-GL43.constant_expressions.basic_floor_float_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006705,
    "KHR-GL43.constant_expressions.basic_floor_float_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006706,
    "KHR-GL43.constant_expressions.basic_floor_vec2_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006707,
    "KHR-GL43.constant_expressions.basic_floor_vec2_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006708,
    "KHR-GL43.constant_expressions.basic_floor_vec2_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006709,
    "KHR-GL43.constant_expressions.basic_floor_vec2_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006710,
    "KHR-GL43.constant_expressions.basic_floor_vec2_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006711,
    "KHR-GL43.constant_expressions.basic_floor_vec2_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006712,
    "KHR-GL43.constant_expressions.basic_floor_vec3_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006713,
    "KHR-GL43.constant_expressions.basic_floor_vec3_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006714,
    "KHR-GL43.constant_expressions.basic_floor_vec3_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006715,
    "KHR-GL43.constant_expressions.basic_floor_vec3_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006716,
    "KHR-GL43.constant_expressions.basic_floor_vec3_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006717,
    "KHR-GL43.constant_expressions.basic_floor_vec3_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006718,
    "KHR-GL43.constant_expressions.basic_floor_vec4_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006719,
    "KHR-GL43.constant_expressions.basic_floor_vec4_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006720,
    "KHR-GL43.constant_expressions.basic_floor_vec4_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006721,
    "KHR-GL43.constant_expressions.basic_floor_vec4_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006722,
    "KHR-GL43.constant_expressions.basic_floor_vec4_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006723,
    "KHR-GL43.constant_expressions.basic_floor_vec4_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006724,
    "KHR-GL43.constant_expressions.basic_trunc_float_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006725,
    "KHR-GL43.constant_expressions.basic_trunc_float_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006726,
    "KHR-GL43.constant_expressions.basic_trunc_float_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006727,
    "KHR-GL43.constant_expressions.basic_trunc_float_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006728,
    "KHR-GL43.constant_expressions.basic_trunc_float_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006729,
    "KHR-GL43.constant_expressions.basic_trunc_float_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006730,
    "KHR-GL43.constant_expressions.basic_trunc_vec2_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006731,
    "KHR-GL43.constant_expressions.basic_trunc_vec2_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006732,
    "KHR-GL43.constant_expressions.basic_trunc_vec2_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006733,
    "KHR-GL43.constant_expressions.basic_trunc_vec2_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006734,
    "KHR-GL43.constant_expressions.basic_trunc_vec2_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006735,
    "KHR-GL43.constant_expressions.basic_trunc_vec2_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006736,
    "KHR-GL43.constant_expressions.basic_trunc_vec3_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006737,
    "KHR-GL43.constant_expressions.basic_trunc_vec3_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006738,
    "KHR-GL43.constant_expressions.basic_trunc_vec3_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006739,
    "KHR-GL43.constant_expressions.basic_trunc_vec3_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006740,
    "KHR-GL43.constant_expressions.basic_trunc_vec3_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006741,
    "KHR-GL43.constant_expressions.basic_trunc_vec3_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006742,
    "KHR-GL43.constant_expressions.basic_trunc_vec4_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006743,
    "KHR-GL43.constant_expressions.basic_trunc_vec4_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006744,
    "KHR-GL43.constant_expressions.basic_trunc_vec4_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006745,
    "KHR-GL43.constant_expressions.basic_trunc_vec4_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006746,
    "KHR-GL43.constant_expressions.basic_trunc_vec4_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006747,
    "KHR-GL43.constant_expressions.basic_trunc_vec4_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006748,
    "KHR-GL43.constant_expressions.basic_round_float_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006749,
    "KHR-GL43.constant_expressions.basic_round_float_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006750,
    "KHR-GL43.constant_expressions.basic_round_float_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006751,
    "KHR-GL43.constant_expressions.basic_round_float_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006752,
    "KHR-GL43.constant_expressions.basic_round_float_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006753,
    "KHR-GL43.constant_expressions.basic_round_float_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006754,
    "KHR-GL43.constant_expressions.basic_round_vec2_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006755,
    "KHR-GL43.constant_expressions.basic_round_vec2_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006756,
    "KHR-GL43.constant_expressions.basic_round_vec2_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006757,
    "KHR-GL43.constant_expressions.basic_round_vec2_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006758,
    "KHR-GL43.constant_expressions.basic_round_vec2_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006759,
    "KHR-GL43.constant_expressions.basic_round_vec2_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006760,
    "KHR-GL43.constant_expressions.basic_round_vec3_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006761,
    "KHR-GL43.constant_expressions.basic_round_vec3_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006762,
    "KHR-GL43.constant_expressions.basic_round_vec3_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006763,
    "KHR-GL43.constant_expressions.basic_round_vec3_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006764,
    "KHR-GL43.constant_expressions.basic_round_vec3_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006765,
    "KHR-GL43.constant_expressions.basic_round_vec3_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006766,
    "KHR-GL43.constant_expressions.basic_round_vec4_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006767,
    "KHR-GL43.constant_expressions.basic_round_vec4_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006768,
    "KHR-GL43.constant_expressions.basic_round_vec4_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006769,
    "KHR-GL43.constant_expressions.basic_round_vec4_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006770,
    "KHR-GL43.constant_expressions.basic_round_vec4_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006771,
    "KHR-GL43.constant_expressions.basic_round_vec4_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006772,
    "KHR-GL43.constant_expressions.basic_ceil_float_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006773,
    "KHR-GL43.constant_expressions.basic_ceil_float_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006774,
    "KHR-GL43.constant_expressions.basic_ceil_float_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006775,
    "KHR-GL43.constant_expressions.basic_ceil_float_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006776,
    "KHR-GL43.constant_expressions.basic_ceil_float_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006777,
    "KHR-GL43.constant_expressions.basic_ceil_float_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006778,
    "KHR-GL43.constant_expressions.basic_ceil_vec2_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006779,
    "KHR-GL43.constant_expressions.basic_ceil_vec2_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006780,
    "KHR-GL43.constant_expressions.basic_ceil_vec2_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006781,
    "KHR-GL43.constant_expressions.basic_ceil_vec2_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006782,
    "KHR-GL43.constant_expressions.basic_ceil_vec2_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006783,
    "KHR-GL43.constant_expressions.basic_ceil_vec2_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006784,
    "KHR-GL43.constant_expressions.basic_ceil_vec3_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006785,
    "KHR-GL43.constant_expressions.basic_ceil_vec3_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006786,
    "KHR-GL43.constant_expressions.basic_ceil_vec3_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006787,
    "KHR-GL43.constant_expressions.basic_ceil_vec3_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006788,
    "KHR-GL43.constant_expressions.basic_ceil_vec3_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006789,
    "KHR-GL43.constant_expressions.basic_ceil_vec3_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006790,
    "KHR-GL43.constant_expressions.basic_ceil_vec4_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006791,
    "KHR-GL43.constant_expressions.basic_ceil_vec4_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006792,
    "KHR-GL43.constant_expressions.basic_ceil_vec4_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006793,
    "KHR-GL43.constant_expressions.basic_ceil_vec4_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006794,
    "KHR-GL43.constant_expressions.basic_ceil_vec4_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006795,
    "KHR-GL43.constant_expressions.basic_ceil_vec4_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006796,
    "KHR-GL43.constant_expressions.basic_mod_float_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006797,
    "KHR-GL43.constant_expressions.basic_mod_float_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006798,
    "KHR-GL43.constant_expressions.basic_mod_float_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006799,
    "KHR-GL43.constant_expressions.basic_mod_float_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006800,
    "KHR-GL43.constant_expressions.basic_mod_float_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006801,
    "KHR-GL43.constant_expressions.basic_mod_float_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006802,
    "KHR-GL43.constant_expressions.basic_mod_vec2_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006803,
    "KHR-GL43.constant_expressions.basic_mod_vec2_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006804,
    "KHR-GL43.constant_expressions.basic_mod_vec2_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006805,
    "KHR-GL43.constant_expressions.basic_mod_vec2_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006806,
    "KHR-GL43.constant_expressions.basic_mod_vec2_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006807,
    "KHR-GL43.constant_expressions.basic_mod_vec2_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006808,
    "KHR-GL43.constant_expressions.basic_mod_vec2_float_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006809,
    "KHR-GL43.constant_expressions.basic_mod_vec2_float_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006810,
    "KHR-GL43.constant_expressions.basic_mod_vec2_float_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006811,
    "KHR-GL43.constant_expressions.basic_mod_vec2_float_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006812,
    "KHR-GL43.constant_expressions.basic_mod_vec2_float_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006813,
    "KHR-GL43.constant_expressions.basic_mod_vec2_float_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006814,
    "KHR-GL43.constant_expressions.basic_mod_vec3_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006815,
    "KHR-GL43.constant_expressions.basic_mod_vec3_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006816,
    "KHR-GL43.constant_expressions.basic_mod_vec3_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006817,
    "KHR-GL43.constant_expressions.basic_mod_vec3_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006818,
    "KHR-GL43.constant_expressions.basic_mod_vec3_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006819,
    "KHR-GL43.constant_expressions.basic_mod_vec3_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006820,
    "KHR-GL43.constant_expressions.basic_mod_vec3_float_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006821,
    "KHR-GL43.constant_expressions.basic_mod_vec3_float_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006822,
    "KHR-GL43.constant_expressions.basic_mod_vec3_float_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006823,
    "KHR-GL43.constant_expressions.basic_mod_vec3_float_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006824,
    "KHR-GL43.constant_expressions.basic_mod_vec3_float_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006825,
    "KHR-GL43.constant_expressions.basic_mod_vec3_float_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006826,
    "KHR-GL43.constant_expressions.basic_mod_vec4_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006827,
    "KHR-GL43.constant_expressions.basic_mod_vec4_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006828,
    "KHR-GL43.constant_expressions.basic_mod_vec4_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006829,
    "KHR-GL43.constant_expressions.basic_mod_vec4_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006830,
    "KHR-GL43.constant_expressions.basic_mod_vec4_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006831,
    "KHR-GL43.constant_expressions.basic_mod_vec4_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006832,
    "KHR-GL43.constant_expressions.basic_mod_vec4_float_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006833,
    "KHR-GL43.constant_expressions.basic_mod_vec4_float_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006834,
    "KHR-GL43.constant_expressions.basic_mod_vec4_float_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006835,
    "KHR-GL43.constant_expressions.basic_mod_vec4_float_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006836,
    "KHR-GL43.constant_expressions.basic_mod_vec4_float_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006837,
    "KHR-GL43.constant_expressions.basic_mod_vec4_float_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006838,
    "KHR-GL43.constant_expressions.basic_min_float_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006839,
    "KHR-GL43.constant_expressions.basic_min_float_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006840,
    "KHR-GL43.constant_expressions.basic_min_float_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006841,
    "KHR-GL43.constant_expressions.basic_min_float_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006842,
    "KHR-GL43.constant_expressions.basic_min_float_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006843,
    "KHR-GL43.constant_expressions.basic_min_float_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006844,
    "KHR-GL43.constant_expressions.basic_min_vec2_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006845,
    "KHR-GL43.constant_expressions.basic_min_vec2_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006846,
    "KHR-GL43.constant_expressions.basic_min_vec2_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006847,
    "KHR-GL43.constant_expressions.basic_min_vec2_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006848,
    "KHR-GL43.constant_expressions.basic_min_vec2_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006849,
    "KHR-GL43.constant_expressions.basic_min_vec2_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006850,
    "KHR-GL43.constant_expressions.basic_min_vec2_float_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006851,
    "KHR-GL43.constant_expressions.basic_min_vec2_float_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006852,
    "KHR-GL43.constant_expressions.basic_min_vec2_float_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006853,
    "KHR-GL43.constant_expressions.basic_min_vec2_float_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006854,
    "KHR-GL43.constant_expressions.basic_min_vec2_float_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006855,
    "KHR-GL43.constant_expressions.basic_min_vec2_float_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006856,
    "KHR-GL43.constant_expressions.basic_min_vec3_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006857,
    "KHR-GL43.constant_expressions.basic_min_vec3_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006858,
    "KHR-GL43.constant_expressions.basic_min_vec3_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006859,
    "KHR-GL43.constant_expressions.basic_min_vec3_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006860,
    "KHR-GL43.constant_expressions.basic_min_vec3_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006861,
    "KHR-GL43.constant_expressions.basic_min_vec3_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006862,
    "KHR-GL43.constant_expressions.basic_min_vec3_float_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006863,
    "KHR-GL43.constant_expressions.basic_min_vec3_float_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006864,
    "KHR-GL43.constant_expressions.basic_min_vec3_float_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006865,
    "KHR-GL43.constant_expressions.basic_min_vec3_float_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006866,
    "KHR-GL43.constant_expressions.basic_min_vec3_float_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006867,
    "KHR-GL43.constant_expressions.basic_min_vec3_float_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006868,
    "KHR-GL43.constant_expressions.basic_min_vec4_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006869,
    "KHR-GL43.constant_expressions.basic_min_vec4_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006870,
    "KHR-GL43.constant_expressions.basic_min_vec4_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006871,
    "KHR-GL43.constant_expressions.basic_min_vec4_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006872,
    "KHR-GL43.constant_expressions.basic_min_vec4_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006873,
    "KHR-GL43.constant_expressions.basic_min_vec4_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006874,
    "KHR-GL43.constant_expressions.basic_min_vec4_float_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006875,
    "KHR-GL43.constant_expressions.basic_min_vec4_float_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006876,
    "KHR-GL43.constant_expressions.basic_min_vec4_float_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006877,
    "KHR-GL43.constant_expressions.basic_min_vec4_float_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006878,
    "KHR-GL43.constant_expressions.basic_min_vec4_float_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006879,
    "KHR-GL43.constant_expressions.basic_min_vec4_float_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006880,
    "KHR-GL43.constant_expressions.basic_max_float_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006881,
    "KHR-GL43.constant_expressions.basic_max_float_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006882,
    "KHR-GL43.constant_expressions.basic_max_float_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006883,
    "KHR-GL43.constant_expressions.basic_max_float_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006884,
    "KHR-GL43.constant_expressions.basic_max_float_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006885,
    "KHR-GL43.constant_expressions.basic_max_float_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006886,
    "KHR-GL43.constant_expressions.basic_max_vec2_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006887,
    "KHR-GL43.constant_expressions.basic_max_vec2_fragment");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006888,
    "KHR-GL43.constant_expressions.basic_max_vec2_compute");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006889,
    "KHR-GL43.constant_expressions.basic_max_vec2_geometry");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006890,
    "KHR-GL43.constant_expressions.basic_max_vec2_tess_control");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006891,
    "KHR-GL43.constant_expressions.basic_max_vec2_tess_eval");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006892,
    "KHR-GL43.constant_expressions.basic_max_vec2_float_vertex");

static SHRINK_HWTEST_SF(ActsGl43master0001TestSuite, TestCase_006893,
    "KHR-GL43.constant_expressions.basic_max_vec2_float_fragment");

