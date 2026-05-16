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
#include "../Khrgles32BaseFunc.h"
#include "../ActsKhrgles320001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000325,
        "KHR-GLES32.core.constant_express",
        "ions.basic_radians_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000326,
        "KHR-GLES32.core.constant_expressio",
        "ns.basic_radians_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000327,
        "KHR-GLES32.core.constant_expressi",
        "ons.basic_radians_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000328,
        "KHR-GLES32.core.constant_express",
        "ions.basic_radians_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000329,
        "KHR-GLES32.core.constant_expressio",
        "ns.basic_radians_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000330,
        "KHR-GLES32.core.constant_express",
        "ions.basic_radians_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000331,
        "KHR-GLES32.core.constant_express",
        "ions.basic_radians_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000332,
        "KHR-GLES32.core.constant_expressio",
        "ns.basic_radians_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000333,
        "KHR-GLES32.core.constant_express",
        "ions.basic_radians_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000334,
        "KHR-GLES32.core.constant_express",
        "ions.basic_radians_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000335,
        "KHR-GLES32.core.constant_expressio",
        "ns.basic_radians_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000336,
        "KHR-GLES32.core.constant_express",
        "ions.basic_radians_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000337,
        "KHR-GLES32.core.constant_express",
        "ions.basic_degrees_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000338,
        "KHR-GLES32.core.constant_expressio",
        "ns.basic_degrees_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000339,
        "KHR-GLES32.core.constant_expressi",
        "ons.basic_degrees_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000340,
        "KHR-GLES32.core.constant_express",
        "ions.basic_degrees_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000341,
        "KHR-GLES32.core.constant_expressio",
        "ns.basic_degrees_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000342,
        "KHR-GLES32.core.constant_express",
        "ions.basic_degrees_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000343,
        "KHR-GLES32.core.constant_express",
        "ions.basic_degrees_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000344,
        "KHR-GLES32.core.constant_expressio",
        "ns.basic_degrees_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000345,
        "KHR-GLES32.core.constant_express",
        "ions.basic_degrees_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000346,
        "KHR-GLES32.core.constant_express",
        "ions.basic_degrees_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000347,
        "KHR-GLES32.core.constant_expressio",
        "ns.basic_degrees_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000348,
        "KHR-GLES32.core.constant_express",
        "ions.basic_degrees_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000349,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_sin_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000350,
        "KHR-GLES32.core.constant_express",
        "ions.basic_sin_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000351,
        "KHR-GLES32.core.constant_expres",
        "sions.basic_sin_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000352,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_sin_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000353,
        "KHR-GLES32.core.constant_express",
        "ions.basic_sin_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000354,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_sin_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000355,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_sin_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000356,
        "KHR-GLES32.core.constant_express",
        "ions.basic_sin_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000357,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_sin_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000358,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_sin_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000359,
        "KHR-GLES32.core.constant_express",
        "ions.basic_sin_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000360,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_sin_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000361,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_cos_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000362,
        "KHR-GLES32.core.constant_express",
        "ions.basic_cos_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000363,
        "KHR-GLES32.core.constant_expres",
        "sions.basic_cos_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000364,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_cos_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000365,
        "KHR-GLES32.core.constant_express",
        "ions.basic_cos_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000366,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_cos_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000367,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_cos_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000368,
        "KHR-GLES32.core.constant_express",
        "ions.basic_cos_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000369,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_cos_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000370,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_cos_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000371,
        "KHR-GLES32.core.constant_express",
        "ions.basic_cos_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000372,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_cos_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000373,
        "KHR-GLES32.core.constant_expres",
        "sions.basic_asin_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000374,
        "KHR-GLES32.core.constant_expressi",
        "ons.basic_asin_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000375,
        "KHR-GLES32.core.constant_expres",
        "sions.basic_asin_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000376,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_asin_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000377,
        "KHR-GLES32.core.constant_express",
        "ions.basic_asin_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000378,
        "KHR-GLES32.core.constant_expres",
        "sions.basic_asin_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000379,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_asin_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000380,
        "KHR-GLES32.core.constant_express",
        "ions.basic_asin_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000381,
        "KHR-GLES32.core.constant_expres",
        "sions.basic_asin_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000382,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_asin_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000383,
        "KHR-GLES32.core.constant_express",
        "ions.basic_asin_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000384,
        "KHR-GLES32.core.constant_expres",
        "sions.basic_asin_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000385,
        "KHR-GLES32.core.constant_expres",
        "sions.basic_acos_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000386,
        "KHR-GLES32.core.constant_expressi",
        "ons.basic_acos_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000387,
        "KHR-GLES32.core.constant_expres",
        "sions.basic_acos_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000388,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_acos_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000389,
        "KHR-GLES32.core.constant_express",
        "ions.basic_acos_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000390,
        "KHR-GLES32.core.constant_expres",
        "sions.basic_acos_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000391,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_acos_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000392,
        "KHR-GLES32.core.constant_express",
        "ions.basic_acos_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000393,
        "KHR-GLES32.core.constant_expres",
        "sions.basic_acos_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000394,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_acos_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000395,
        "KHR-GLES32.core.constant_express",
        "ions.basic_acos_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000396,
        "KHR-GLES32.core.constant_expres",
        "sions.basic_acos_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000397,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_pow_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000398,
        "KHR-GLES32.core.constant_express",
        "ions.basic_pow_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000399,
        "KHR-GLES32.core.constant_expres",
        "sions.basic_pow_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000400,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_pow_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000401,
        "KHR-GLES32.core.constant_express",
        "ions.basic_pow_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000402,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_pow_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000403,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_pow_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000404,
        "KHR-GLES32.core.constant_express",
        "ions.basic_pow_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000405,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_pow_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000406,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_pow_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000407,
        "KHR-GLES32.core.constant_express",
        "ions.basic_pow_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000408,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_pow_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000409,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_exp_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000410,
        "KHR-GLES32.core.constant_express",
        "ions.basic_exp_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000411,
        "KHR-GLES32.core.constant_expres",
        "sions.basic_exp_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000412,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_exp_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000413,
        "KHR-GLES32.core.constant_express",
        "ions.basic_exp_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000414,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_exp_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000415,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_exp_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000416,
        "KHR-GLES32.core.constant_express",
        "ions.basic_exp_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000417,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_exp_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000418,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_exp_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000419,
        "KHR-GLES32.core.constant_express",
        "ions.basic_exp_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000420,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_exp_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000421,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_log_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000422,
        "KHR-GLES32.core.constant_express",
        "ions.basic_log_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000423,
        "KHR-GLES32.core.constant_expres",
        "sions.basic_log_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000424,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_log_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000425,
        "KHR-GLES32.core.constant_express",
        "ions.basic_log_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000426,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_log_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000427,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_log_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000428,
        "KHR-GLES32.core.constant_express",
        "ions.basic_log_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000429,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_log_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000430,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_log_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000431,
        "KHR-GLES32.core.constant_express",
        "ions.basic_log_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000432,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_log_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000433,
        "KHR-GLES32.core.constant_expres",
        "sions.basic_exp2_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000434,
        "KHR-GLES32.core.constant_expressi",
        "ons.basic_exp2_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000435,
        "KHR-GLES32.core.constant_expres",
        "sions.basic_exp2_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000436,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_exp2_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000437,
        "KHR-GLES32.core.constant_express",
        "ions.basic_exp2_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000438,
        "KHR-GLES32.core.constant_expres",
        "sions.basic_exp2_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000439,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_exp2_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000440,
        "KHR-GLES32.core.constant_express",
        "ions.basic_exp2_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000441,
        "KHR-GLES32.core.constant_expres",
        "sions.basic_exp2_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000442,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_exp2_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000443,
        "KHR-GLES32.core.constant_express",
        "ions.basic_exp2_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000444,
        "KHR-GLES32.core.constant_expres",
        "sions.basic_exp2_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000445,
        "KHR-GLES32.core.constant_expres",
        "sions.basic_log2_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000446,
        "KHR-GLES32.core.constant_expressi",
        "ons.basic_log2_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000447,
        "KHR-GLES32.core.constant_expres",
        "sions.basic_log2_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000448,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_log2_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000449,
        "KHR-GLES32.core.constant_express",
        "ions.basic_log2_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000450,
        "KHR-GLES32.core.constant_expres",
        "sions.basic_log2_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000451,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_log2_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000452,
        "KHR-GLES32.core.constant_express",
        "ions.basic_log2_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000453,
        "KHR-GLES32.core.constant_expres",
        "sions.basic_log2_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000454,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_log2_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000455,
        "KHR-GLES32.core.constant_express",
        "ions.basic_log2_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000456,
        "KHR-GLES32.core.constant_expres",
        "sions.basic_log2_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000457,
        "KHR-GLES32.core.constant_expres",
        "sions.basic_sqrt_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000458,
        "KHR-GLES32.core.constant_expressi",
        "ons.basic_sqrt_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000459,
        "KHR-GLES32.core.constant_expres",
        "sions.basic_sqrt_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000460,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_sqrt_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000461,
        "KHR-GLES32.core.constant_express",
        "ions.basic_sqrt_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000462,
        "KHR-GLES32.core.constant_expres",
        "sions.basic_sqrt_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000463,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_sqrt_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000464,
        "KHR-GLES32.core.constant_express",
        "ions.basic_sqrt_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000465,
        "KHR-GLES32.core.constant_expres",
        "sions.basic_sqrt_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000466,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_sqrt_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000467,
        "KHR-GLES32.core.constant_express",
        "ions.basic_sqrt_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000468,
        "KHR-GLES32.core.constant_expres",
        "sions.basic_sqrt_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000469,
        "KHR-GLES32.core.constant_expressio",
        "ns.basic_inversesqrt_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000470,
        "KHR-GLES32.core.constant_expressions",
        ".basic_inversesqrt_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000471,
        "KHR-GLES32.core.constant_expression",
        "s.basic_inversesqrt_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000472,
        "KHR-GLES32.core.constant_expressio",
        "ns.basic_inversesqrt_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000473,
        "KHR-GLES32.core.constant_expressions",
        ".basic_inversesqrt_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000474,
        "KHR-GLES32.core.constant_expressio",
        "ns.basic_inversesqrt_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000475,
        "KHR-GLES32.core.constant_expressio",
        "ns.basic_inversesqrt_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000476,
        "KHR-GLES32.core.constant_expressions",
        ".basic_inversesqrt_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000477,
        "KHR-GLES32.core.constant_expressio",
        "ns.basic_inversesqrt_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000478,
        "KHR-GLES32.core.constant_expressio",
        "ns.basic_inversesqrt_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000479,
        "KHR-GLES32.core.constant_expressions",
        ".basic_inversesqrt_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000480,
        "KHR-GLES32.core.constant_expressio",
        "ns.basic_inversesqrt_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000481,
        "KHR-GLES32.core.constant_expr",
        "essions.basic_abs_int_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000482,
        "KHR-GLES32.core.constant_expres",
        "sions.basic_abs_int_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000483,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_abs_int_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000484,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_abs_ivec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000485,
        "KHR-GLES32.core.constant_express",
        "ions.basic_abs_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000486,
        "KHR-GLES32.core.constant_expres",
        "sions.basic_abs_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000487,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_abs_ivec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000488,
        "KHR-GLES32.core.constant_express",
        "ions.basic_abs_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000489,
        "KHR-GLES32.core.constant_expres",
        "sions.basic_abs_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000490,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_abs_ivec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000491,
        "KHR-GLES32.core.constant_express",
        "ions.basic_abs_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000492,
        "KHR-GLES32.core.constant_expres",
        "sions.basic_abs_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000493,
        "KHR-GLES32.core.constant_expres",
        "sions.basic_sign_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000494,
        "KHR-GLES32.core.constant_expressi",
        "ons.basic_sign_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000495,
        "KHR-GLES32.core.constant_expres",
        "sions.basic_sign_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000496,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_sign_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000497,
        "KHR-GLES32.core.constant_express",
        "ions.basic_sign_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000498,
        "KHR-GLES32.core.constant_expres",
        "sions.basic_sign_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000499,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_sign_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000500,
        "KHR-GLES32.core.constant_express",
        "ions.basic_sign_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000501,
        "KHR-GLES32.core.constant_expres",
        "sions.basic_sign_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000502,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_sign_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000503,
        "KHR-GLES32.core.constant_express",
        "ions.basic_sign_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000504,
        "KHR-GLES32.core.constant_expres",
        "sions.basic_sign_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000505,
        "KHR-GLES32.core.constant_expres",
        "sions.basic_floor_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000506,
        "KHR-GLES32.core.constant_expressi",
        "ons.basic_floor_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000507,
        "KHR-GLES32.core.constant_express",
        "ions.basic_floor_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000508,
        "KHR-GLES32.core.constant_expres",
        "sions.basic_floor_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000509,
        "KHR-GLES32.core.constant_expressi",
        "ons.basic_floor_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000510,
        "KHR-GLES32.core.constant_expres",
        "sions.basic_floor_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000511,
        "KHR-GLES32.core.constant_expres",
        "sions.basic_floor_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000512,
        "KHR-GLES32.core.constant_expressi",
        "ons.basic_floor_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000513,
        "KHR-GLES32.core.constant_expres",
        "sions.basic_floor_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000514,
        "KHR-GLES32.core.constant_expres",
        "sions.basic_floor_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000515,
        "KHR-GLES32.core.constant_expressi",
        "ons.basic_floor_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000516,
        "KHR-GLES32.core.constant_expres",
        "sions.basic_floor_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000517,
        "KHR-GLES32.core.constant_expres",
        "sions.basic_trunc_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000518,
        "KHR-GLES32.core.constant_expressi",
        "ons.basic_trunc_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000519,
        "KHR-GLES32.core.constant_express",
        "ions.basic_trunc_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000520,
        "KHR-GLES32.core.constant_expres",
        "sions.basic_trunc_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000521,
        "KHR-GLES32.core.constant_expressi",
        "ons.basic_trunc_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000522,
        "KHR-GLES32.core.constant_expres",
        "sions.basic_trunc_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000523,
        "KHR-GLES32.core.constant_expres",
        "sions.basic_trunc_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000524,
        "KHR-GLES32.core.constant_expressi",
        "ons.basic_trunc_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000525,
        "KHR-GLES32.core.constant_expres",
        "sions.basic_trunc_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000526,
        "KHR-GLES32.core.constant_expres",
        "sions.basic_trunc_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000527,
        "KHR-GLES32.core.constant_expressi",
        "ons.basic_trunc_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000528,
        "KHR-GLES32.core.constant_expres",
        "sions.basic_trunc_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000529,
        "KHR-GLES32.core.constant_expres",
        "sions.basic_round_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000530,
        "KHR-GLES32.core.constant_expressi",
        "ons.basic_round_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000531,
        "KHR-GLES32.core.constant_express",
        "ions.basic_round_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000532,
        "KHR-GLES32.core.constant_expres",
        "sions.basic_round_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000533,
        "KHR-GLES32.core.constant_expressi",
        "ons.basic_round_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000534,
        "KHR-GLES32.core.constant_expres",
        "sions.basic_round_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000535,
        "KHR-GLES32.core.constant_expres",
        "sions.basic_round_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000536,
        "KHR-GLES32.core.constant_expressi",
        "ons.basic_round_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000537,
        "KHR-GLES32.core.constant_expres",
        "sions.basic_round_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000538,
        "KHR-GLES32.core.constant_expres",
        "sions.basic_round_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000539,
        "KHR-GLES32.core.constant_expressi",
        "ons.basic_round_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000540,
        "KHR-GLES32.core.constant_expres",
        "sions.basic_round_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000541,
        "KHR-GLES32.core.constant_expres",
        "sions.basic_ceil_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000542,
        "KHR-GLES32.core.constant_expressi",
        "ons.basic_ceil_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000543,
        "KHR-GLES32.core.constant_expres",
        "sions.basic_ceil_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000544,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_ceil_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000545,
        "KHR-GLES32.core.constant_express",
        "ions.basic_ceil_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000546,
        "KHR-GLES32.core.constant_expres",
        "sions.basic_ceil_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000547,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_ceil_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000548,
        "KHR-GLES32.core.constant_express",
        "ions.basic_ceil_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000549,
        "KHR-GLES32.core.constant_expres",
        "sions.basic_ceil_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000550,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_ceil_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000551,
        "KHR-GLES32.core.constant_express",
        "ions.basic_ceil_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000552,
        "KHR-GLES32.core.constant_expres",
        "sions.basic_ceil_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000553,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_mod_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000554,
        "KHR-GLES32.core.constant_express",
        "ions.basic_mod_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000555,
        "KHR-GLES32.core.constant_expres",
        "sions.basic_mod_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000556,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_mod_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000557,
        "KHR-GLES32.core.constant_express",
        "ions.basic_mod_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000558,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_mod_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000559,
        "KHR-GLES32.core.constant_expressi",
        "ons.basic_mod_vec2_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000560,
        "KHR-GLES32.core.constant_expression",
        "s.basic_mod_vec2_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000561,
        "KHR-GLES32.core.constant_expressi",
        "ons.basic_mod_vec2_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000562,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_mod_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000563,
        "KHR-GLES32.core.constant_express",
        "ions.basic_mod_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000564,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_mod_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000565,
        "KHR-GLES32.core.constant_expressi",
        "ons.basic_mod_vec3_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000566,
        "KHR-GLES32.core.constant_expression",
        "s.basic_mod_vec3_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000567,
        "KHR-GLES32.core.constant_expressi",
        "ons.basic_mod_vec3_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000568,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_mod_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000569,
        "KHR-GLES32.core.constant_express",
        "ions.basic_mod_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000570,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_mod_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000571,
        "KHR-GLES32.core.constant_expressi",
        "ons.basic_mod_vec4_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000572,
        "KHR-GLES32.core.constant_expression",
        "s.basic_mod_vec4_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000573,
        "KHR-GLES32.core.constant_expressi",
        "ons.basic_mod_vec4_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000574,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_min_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000575,
        "KHR-GLES32.core.constant_express",
        "ions.basic_min_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000576,
        "KHR-GLES32.core.constant_expres",
        "sions.basic_min_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000577,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_min_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000578,
        "KHR-GLES32.core.constant_express",
        "ions.basic_min_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000579,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_min_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000580,
        "KHR-GLES32.core.constant_expressi",
        "ons.basic_min_vec2_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000581,
        "KHR-GLES32.core.constant_expression",
        "s.basic_min_vec2_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000582,
        "KHR-GLES32.core.constant_expressi",
        "ons.basic_min_vec2_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000583,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_min_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000584,
        "KHR-GLES32.core.constant_express",
        "ions.basic_min_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000585,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_min_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000586,
        "KHR-GLES32.core.constant_expressi",
        "ons.basic_min_vec3_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000587,
        "KHR-GLES32.core.constant_expression",
        "s.basic_min_vec3_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000588,
        "KHR-GLES32.core.constant_expressi",
        "ons.basic_min_vec3_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000589,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_min_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000590,
        "KHR-GLES32.core.constant_express",
        "ions.basic_min_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000591,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_min_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000592,
        "KHR-GLES32.core.constant_expressi",
        "ons.basic_min_vec4_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000593,
        "KHR-GLES32.core.constant_expression",
        "s.basic_min_vec4_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000594,
        "KHR-GLES32.core.constant_expressi",
        "ons.basic_min_vec4_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000595,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_max_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000596,
        "KHR-GLES32.core.constant_express",
        "ions.basic_max_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000597,
        "KHR-GLES32.core.constant_expres",
        "sions.basic_max_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000598,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_max_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000599,
        "KHR-GLES32.core.constant_express",
        "ions.basic_max_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000600,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_max_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000601,
        "KHR-GLES32.core.constant_expressi",
        "ons.basic_max_vec2_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000602,
        "KHR-GLES32.core.constant_expression",
        "s.basic_max_vec2_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000603,
        "KHR-GLES32.core.constant_expressi",
        "ons.basic_max_vec2_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000604,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_max_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000605,
        "KHR-GLES32.core.constant_express",
        "ions.basic_max_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000606,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_max_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000607,
        "KHR-GLES32.core.constant_expressi",
        "ons.basic_max_vec3_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000608,
        "KHR-GLES32.core.constant_expression",
        "s.basic_max_vec3_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000609,
        "KHR-GLES32.core.constant_expressi",
        "ons.basic_max_vec3_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000610,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_max_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000611,
        "KHR-GLES32.core.constant_express",
        "ions.basic_max_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000612,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_max_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000613,
        "KHR-GLES32.core.constant_expressi",
        "ons.basic_max_vec4_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000614,
        "KHR-GLES32.core.constant_expression",
        "s.basic_max_vec4_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000615,
        "KHR-GLES32.core.constant_expressi",
        "ons.basic_max_vec4_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000616,
        "KHR-GLES32.core.constant_expres",
        "sions.basic_clamp_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000617,
        "KHR-GLES32.core.constant_expressi",
        "ons.basic_clamp_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000618,
        "KHR-GLES32.core.constant_express",
        "ions.basic_clamp_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000619,
        "KHR-GLES32.core.constant_expres",
        "sions.basic_clamp_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000620,
        "KHR-GLES32.core.constant_expressi",
        "ons.basic_clamp_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000621,
        "KHR-GLES32.core.constant_expres",
        "sions.basic_clamp_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000622,
        "KHR-GLES32.core.constant_expressio",
        "ns.basic_clamp_vec2_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000623,
        "KHR-GLES32.core.constant_expressions",
        ".basic_clamp_vec2_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000624,
        "KHR-GLES32.core.constant_expressio",
        "ns.basic_clamp_vec2_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000625,
        "KHR-GLES32.core.constant_expres",
        "sions.basic_clamp_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000626,
        "KHR-GLES32.core.constant_expressi",
        "ons.basic_clamp_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000627,
        "KHR-GLES32.core.constant_expres",
        "sions.basic_clamp_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000628,
        "KHR-GLES32.core.constant_expressio",
        "ns.basic_clamp_vec3_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000629,
        "KHR-GLES32.core.constant_expressions",
        ".basic_clamp_vec3_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000630,
        "KHR-GLES32.core.constant_expressio",
        "ns.basic_clamp_vec3_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000631,
        "KHR-GLES32.core.constant_expres",
        "sions.basic_clamp_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000632,
        "KHR-GLES32.core.constant_expressi",
        "ons.basic_clamp_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000633,
        "KHR-GLES32.core.constant_expres",
        "sions.basic_clamp_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000634,
        "KHR-GLES32.core.constant_expressio",
        "ns.basic_clamp_vec4_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000635,
        "KHR-GLES32.core.constant_expressions",
        ".basic_clamp_vec4_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000636,
        "KHR-GLES32.core.constant_expressio",
        "ns.basic_clamp_vec4_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000637,
        "KHR-GLES32.core.constant_express",
        "ions.basic_length_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000638,
        "KHR-GLES32.core.constant_expressio",
        "ns.basic_length_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000639,
        "KHR-GLES32.core.constant_express",
        "ions.basic_length_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000640,
        "KHR-GLES32.core.constant_expres",
        "sions.basic_length_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000641,
        "KHR-GLES32.core.constant_expressi",
        "ons.basic_length_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000642,
        "KHR-GLES32.core.constant_express",
        "ions.basic_length_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000643,
        "KHR-GLES32.core.constant_expres",
        "sions.basic_length_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000644,
        "KHR-GLES32.core.constant_expressi",
        "ons.basic_length_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000645,
        "KHR-GLES32.core.constant_express",
        "ions.basic_length_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000646,
        "KHR-GLES32.core.constant_expres",
        "sions.basic_length_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000647,
        "KHR-GLES32.core.constant_expressi",
        "ons.basic_length_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000648,
        "KHR-GLES32.core.constant_express",
        "ions.basic_length_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000649,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_dot_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000650,
        "KHR-GLES32.core.constant_express",
        "ions.basic_dot_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000651,
        "KHR-GLES32.core.constant_expres",
        "sions.basic_dot_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000652,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_dot_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000653,
        "KHR-GLES32.core.constant_express",
        "ions.basic_dot_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000654,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_dot_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000655,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_dot_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000656,
        "KHR-GLES32.core.constant_express",
        "ions.basic_dot_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000657,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_dot_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000658,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_dot_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000659,
        "KHR-GLES32.core.constant_express",
        "ions.basic_dot_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000660,
        "KHR-GLES32.core.constant_expre",
        "ssions.basic_dot_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000661,
        "KHR-GLES32.core.constant_expressi",
        "ons.basic_normalize_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000662,
        "KHR-GLES32.core.constant_expression",
        "s.basic_normalize_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000663,
        "KHR-GLES32.core.constant_expressio",
        "ns.basic_normalize_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000664,
        "KHR-GLES32.core.constant_expressi",
        "ons.basic_normalize_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000665,
        "KHR-GLES32.core.constant_expression",
        "s.basic_normalize_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000666,
        "KHR-GLES32.core.constant_expressi",
        "ons.basic_normalize_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000667,
        "KHR-GLES32.core.constant_expressi",
        "ons.basic_normalize_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000668,
        "KHR-GLES32.core.constant_expression",
        "s.basic_normalize_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000669,
        "KHR-GLES32.core.constant_expressi",
        "ons.basic_normalize_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000670,
        "KHR-GLES32.core.constant_expressi",
        "ons.basic_normalize_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000671,
        "KHR-GLES32.core.constant_expression",
        "s.basic_normalize_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000672,
        "KHR-GLES32.core.constant_expressi",
        "ons.basic_normalize_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000673,
        "KHR-GLES32.core.constant_express",
        "ions.array_radians_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000674,
        "KHR-GLES32.core.constant_expressio",
        "ns.array_radians_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000675,
        "KHR-GLES32.core.constant_expressi",
        "ons.array_radians_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000676,
        "KHR-GLES32.core.constant_express",
        "ions.array_radians_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000677,
        "KHR-GLES32.core.constant_expressio",
        "ns.array_radians_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000678,
        "KHR-GLES32.core.constant_express",
        "ions.array_radians_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000679,
        "KHR-GLES32.core.constant_express",
        "ions.array_radians_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000680,
        "KHR-GLES32.core.constant_expressio",
        "ns.array_radians_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000681,
        "KHR-GLES32.core.constant_express",
        "ions.array_radians_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000682,
        "KHR-GLES32.core.constant_express",
        "ions.array_radians_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000683,
        "KHR-GLES32.core.constant_expressio",
        "ns.array_radians_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000684,
        "KHR-GLES32.core.constant_express",
        "ions.array_radians_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000685,
        "KHR-GLES32.core.constant_express",
        "ions.array_degrees_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000686,
        "KHR-GLES32.core.constant_expressio",
        "ns.array_degrees_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000687,
        "KHR-GLES32.core.constant_expressi",
        "ons.array_degrees_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000688,
        "KHR-GLES32.core.constant_express",
        "ions.array_degrees_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000689,
        "KHR-GLES32.core.constant_expressio",
        "ns.array_degrees_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000690,
        "KHR-GLES32.core.constant_express",
        "ions.array_degrees_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000691,
        "KHR-GLES32.core.constant_express",
        "ions.array_degrees_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000692,
        "KHR-GLES32.core.constant_expressio",
        "ns.array_degrees_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000693,
        "KHR-GLES32.core.constant_express",
        "ions.array_degrees_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000694,
        "KHR-GLES32.core.constant_express",
        "ions.array_degrees_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000695,
        "KHR-GLES32.core.constant_expressio",
        "ns.array_degrees_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000696,
        "KHR-GLES32.core.constant_express",
        "ions.array_degrees_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000697,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_sin_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000698,
        "KHR-GLES32.core.constant_express",
        "ions.array_sin_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000699,
        "KHR-GLES32.core.constant_expres",
        "sions.array_sin_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000700,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_sin_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000701,
        "KHR-GLES32.core.constant_express",
        "ions.array_sin_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000702,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_sin_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000703,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_sin_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000704,
        "KHR-GLES32.core.constant_express",
        "ions.array_sin_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000705,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_sin_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000706,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_sin_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000707,
        "KHR-GLES32.core.constant_express",
        "ions.array_sin_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000708,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_sin_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000709,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_cos_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000710,
        "KHR-GLES32.core.constant_express",
        "ions.array_cos_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000711,
        "KHR-GLES32.core.constant_expres",
        "sions.array_cos_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000712,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_cos_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000713,
        "KHR-GLES32.core.constant_express",
        "ions.array_cos_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000714,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_cos_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000715,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_cos_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000716,
        "KHR-GLES32.core.constant_express",
        "ions.array_cos_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000717,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_cos_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000718,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_cos_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000719,
        "KHR-GLES32.core.constant_express",
        "ions.array_cos_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000720,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_cos_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000721,
        "KHR-GLES32.core.constant_expres",
        "sions.array_asin_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000722,
        "KHR-GLES32.core.constant_expressi",
        "ons.array_asin_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000723,
        "KHR-GLES32.core.constant_expres",
        "sions.array_asin_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000724,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_asin_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000725,
        "KHR-GLES32.core.constant_express",
        "ions.array_asin_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000726,
        "KHR-GLES32.core.constant_expres",
        "sions.array_asin_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000727,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_asin_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000728,
        "KHR-GLES32.core.constant_express",
        "ions.array_asin_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000729,
        "KHR-GLES32.core.constant_expres",
        "sions.array_asin_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000730,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_asin_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000731,
        "KHR-GLES32.core.constant_express",
        "ions.array_asin_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000732,
        "KHR-GLES32.core.constant_expres",
        "sions.array_asin_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000733,
        "KHR-GLES32.core.constant_expres",
        "sions.array_acos_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000734,
        "KHR-GLES32.core.constant_expressi",
        "ons.array_acos_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000735,
        "KHR-GLES32.core.constant_expres",
        "sions.array_acos_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000736,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_acos_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000737,
        "KHR-GLES32.core.constant_express",
        "ions.array_acos_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000738,
        "KHR-GLES32.core.constant_expres",
        "sions.array_acos_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000739,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_acos_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000740,
        "KHR-GLES32.core.constant_express",
        "ions.array_acos_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000741,
        "KHR-GLES32.core.constant_expres",
        "sions.array_acos_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000742,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_acos_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000743,
        "KHR-GLES32.core.constant_express",
        "ions.array_acos_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000744,
        "KHR-GLES32.core.constant_expres",
        "sions.array_acos_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000745,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_pow_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000746,
        "KHR-GLES32.core.constant_express",
        "ions.array_pow_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000747,
        "KHR-GLES32.core.constant_expres",
        "sions.array_pow_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000748,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_pow_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000749,
        "KHR-GLES32.core.constant_express",
        "ions.array_pow_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000750,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_pow_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000751,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_pow_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000752,
        "KHR-GLES32.core.constant_express",
        "ions.array_pow_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000753,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_pow_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000754,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_pow_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000755,
        "KHR-GLES32.core.constant_express",
        "ions.array_pow_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000756,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_pow_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000757,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_exp_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000758,
        "KHR-GLES32.core.constant_express",
        "ions.array_exp_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000759,
        "KHR-GLES32.core.constant_expres",
        "sions.array_exp_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000760,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_exp_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000761,
        "KHR-GLES32.core.constant_express",
        "ions.array_exp_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000762,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_exp_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000763,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_exp_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000764,
        "KHR-GLES32.core.constant_express",
        "ions.array_exp_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000765,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_exp_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000766,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_exp_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000767,
        "KHR-GLES32.core.constant_express",
        "ions.array_exp_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000768,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_exp_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000769,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_log_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000770,
        "KHR-GLES32.core.constant_express",
        "ions.array_log_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000771,
        "KHR-GLES32.core.constant_expres",
        "sions.array_log_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000772,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_log_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000773,
        "KHR-GLES32.core.constant_express",
        "ions.array_log_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000774,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_log_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000775,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_log_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000776,
        "KHR-GLES32.core.constant_express",
        "ions.array_log_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000777,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_log_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000778,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_log_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000779,
        "KHR-GLES32.core.constant_express",
        "ions.array_log_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000780,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_log_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000781,
        "KHR-GLES32.core.constant_expres",
        "sions.array_exp2_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000782,
        "KHR-GLES32.core.constant_expressi",
        "ons.array_exp2_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000783,
        "KHR-GLES32.core.constant_expres",
        "sions.array_exp2_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000784,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_exp2_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000785,
        "KHR-GLES32.core.constant_express",
        "ions.array_exp2_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000786,
        "KHR-GLES32.core.constant_expres",
        "sions.array_exp2_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000787,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_exp2_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000788,
        "KHR-GLES32.core.constant_express",
        "ions.array_exp2_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000789,
        "KHR-GLES32.core.constant_expres",
        "sions.array_exp2_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000790,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_exp2_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000791,
        "KHR-GLES32.core.constant_express",
        "ions.array_exp2_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000792,
        "KHR-GLES32.core.constant_expres",
        "sions.array_exp2_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000793,
        "KHR-GLES32.core.constant_expres",
        "sions.array_log2_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000794,
        "KHR-GLES32.core.constant_expressi",
        "ons.array_log2_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000795,
        "KHR-GLES32.core.constant_expres",
        "sions.array_log2_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000796,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_log2_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000797,
        "KHR-GLES32.core.constant_express",
        "ions.array_log2_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000798,
        "KHR-GLES32.core.constant_expres",
        "sions.array_log2_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000799,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_log2_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000800,
        "KHR-GLES32.core.constant_express",
        "ions.array_log2_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000801,
        "KHR-GLES32.core.constant_expres",
        "sions.array_log2_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000802,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_log2_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000803,
        "KHR-GLES32.core.constant_express",
        "ions.array_log2_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000804,
        "KHR-GLES32.core.constant_expres",
        "sions.array_log2_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000805,
        "KHR-GLES32.core.constant_expres",
        "sions.array_sqrt_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000806,
        "KHR-GLES32.core.constant_expressi",
        "ons.array_sqrt_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000807,
        "KHR-GLES32.core.constant_expres",
        "sions.array_sqrt_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000808,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_sqrt_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000809,
        "KHR-GLES32.core.constant_express",
        "ions.array_sqrt_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000810,
        "KHR-GLES32.core.constant_expres",
        "sions.array_sqrt_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000811,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_sqrt_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000812,
        "KHR-GLES32.core.constant_express",
        "ions.array_sqrt_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000813,
        "KHR-GLES32.core.constant_expres",
        "sions.array_sqrt_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000814,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_sqrt_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000815,
        "KHR-GLES32.core.constant_express",
        "ions.array_sqrt_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000816,
        "KHR-GLES32.core.constant_expres",
        "sions.array_sqrt_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000817,
        "KHR-GLES32.core.constant_expressio",
        "ns.array_inversesqrt_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000818,
        "KHR-GLES32.core.constant_expressions",
        ".array_inversesqrt_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000819,
        "KHR-GLES32.core.constant_expression",
        "s.array_inversesqrt_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000820,
        "KHR-GLES32.core.constant_expressio",
        "ns.array_inversesqrt_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000821,
        "KHR-GLES32.core.constant_expressions",
        ".array_inversesqrt_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000822,
        "KHR-GLES32.core.constant_expressio",
        "ns.array_inversesqrt_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000823,
        "KHR-GLES32.core.constant_expressio",
        "ns.array_inversesqrt_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000824,
        "KHR-GLES32.core.constant_expressions",
        ".array_inversesqrt_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000825,
        "KHR-GLES32.core.constant_expressio",
        "ns.array_inversesqrt_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000826,
        "KHR-GLES32.core.constant_expressio",
        "ns.array_inversesqrt_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000827,
        "KHR-GLES32.core.constant_expressions",
        ".array_inversesqrt_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000828,
        "KHR-GLES32.core.constant_expressio",
        "ns.array_inversesqrt_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000829,
        "KHR-GLES32.core.constant_expr",
        "essions.array_abs_int_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000830,
        "KHR-GLES32.core.constant_expres",
        "sions.array_abs_int_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000831,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_abs_int_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000832,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_abs_ivec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000833,
        "KHR-GLES32.core.constant_express",
        "ions.array_abs_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000834,
        "KHR-GLES32.core.constant_expres",
        "sions.array_abs_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000835,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_abs_ivec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000836,
        "KHR-GLES32.core.constant_express",
        "ions.array_abs_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000837,
        "KHR-GLES32.core.constant_expres",
        "sions.array_abs_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000838,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_abs_ivec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000839,
        "KHR-GLES32.core.constant_express",
        "ions.array_abs_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000840,
        "KHR-GLES32.core.constant_expres",
        "sions.array_abs_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000841,
        "KHR-GLES32.core.constant_expres",
        "sions.array_sign_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000842,
        "KHR-GLES32.core.constant_expressi",
        "ons.array_sign_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000843,
        "KHR-GLES32.core.constant_expres",
        "sions.array_sign_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000844,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_sign_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000845,
        "KHR-GLES32.core.constant_express",
        "ions.array_sign_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000846,
        "KHR-GLES32.core.constant_expres",
        "sions.array_sign_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000847,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_sign_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000848,
        "KHR-GLES32.core.constant_express",
        "ions.array_sign_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000849,
        "KHR-GLES32.core.constant_expres",
        "sions.array_sign_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000850,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_sign_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000851,
        "KHR-GLES32.core.constant_express",
        "ions.array_sign_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000852,
        "KHR-GLES32.core.constant_expres",
        "sions.array_sign_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000853,
        "KHR-GLES32.core.constant_expres",
        "sions.array_floor_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000854,
        "KHR-GLES32.core.constant_expressi",
        "ons.array_floor_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000855,
        "KHR-GLES32.core.constant_express",
        "ions.array_floor_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000856,
        "KHR-GLES32.core.constant_expres",
        "sions.array_floor_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000857,
        "KHR-GLES32.core.constant_expressi",
        "ons.array_floor_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000858,
        "KHR-GLES32.core.constant_expres",
        "sions.array_floor_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000859,
        "KHR-GLES32.core.constant_expres",
        "sions.array_floor_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000860,
        "KHR-GLES32.core.constant_expressi",
        "ons.array_floor_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000861,
        "KHR-GLES32.core.constant_expres",
        "sions.array_floor_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000862,
        "KHR-GLES32.core.constant_expres",
        "sions.array_floor_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000863,
        "KHR-GLES32.core.constant_expressi",
        "ons.array_floor_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000864,
        "KHR-GLES32.core.constant_expres",
        "sions.array_floor_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000865,
        "KHR-GLES32.core.constant_expres",
        "sions.array_trunc_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000866,
        "KHR-GLES32.core.constant_expressi",
        "ons.array_trunc_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000867,
        "KHR-GLES32.core.constant_express",
        "ions.array_trunc_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000868,
        "KHR-GLES32.core.constant_expres",
        "sions.array_trunc_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000869,
        "KHR-GLES32.core.constant_expressi",
        "ons.array_trunc_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000870,
        "KHR-GLES32.core.constant_expres",
        "sions.array_trunc_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000871,
        "KHR-GLES32.core.constant_expres",
        "sions.array_trunc_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000872,
        "KHR-GLES32.core.constant_expressi",
        "ons.array_trunc_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000873,
        "KHR-GLES32.core.constant_expres",
        "sions.array_trunc_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000874,
        "KHR-GLES32.core.constant_expres",
        "sions.array_trunc_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000875,
        "KHR-GLES32.core.constant_expressi",
        "ons.array_trunc_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000876,
        "KHR-GLES32.core.constant_expres",
        "sions.array_trunc_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000877,
        "KHR-GLES32.core.constant_expres",
        "sions.array_round_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000878,
        "KHR-GLES32.core.constant_expressi",
        "ons.array_round_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000879,
        "KHR-GLES32.core.constant_express",
        "ions.array_round_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000880,
        "KHR-GLES32.core.constant_expres",
        "sions.array_round_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000881,
        "KHR-GLES32.core.constant_expressi",
        "ons.array_round_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000882,
        "KHR-GLES32.core.constant_expres",
        "sions.array_round_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000883,
        "KHR-GLES32.core.constant_expres",
        "sions.array_round_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000884,
        "KHR-GLES32.core.constant_expressi",
        "ons.array_round_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000885,
        "KHR-GLES32.core.constant_expres",
        "sions.array_round_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000886,
        "KHR-GLES32.core.constant_expres",
        "sions.array_round_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000887,
        "KHR-GLES32.core.constant_expressi",
        "ons.array_round_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000888,
        "KHR-GLES32.core.constant_expres",
        "sions.array_round_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000889,
        "KHR-GLES32.core.constant_expres",
        "sions.array_ceil_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000890,
        "KHR-GLES32.core.constant_expressi",
        "ons.array_ceil_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000891,
        "KHR-GLES32.core.constant_expres",
        "sions.array_ceil_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000892,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_ceil_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000893,
        "KHR-GLES32.core.constant_express",
        "ions.array_ceil_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000894,
        "KHR-GLES32.core.constant_expres",
        "sions.array_ceil_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000895,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_ceil_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000896,
        "KHR-GLES32.core.constant_express",
        "ions.array_ceil_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000897,
        "KHR-GLES32.core.constant_expres",
        "sions.array_ceil_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000898,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_ceil_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000899,
        "KHR-GLES32.core.constant_express",
        "ions.array_ceil_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000900,
        "KHR-GLES32.core.constant_expres",
        "sions.array_ceil_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000901,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_mod_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000902,
        "KHR-GLES32.core.constant_express",
        "ions.array_mod_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000903,
        "KHR-GLES32.core.constant_expres",
        "sions.array_mod_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000904,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_mod_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000905,
        "KHR-GLES32.core.constant_express",
        "ions.array_mod_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000906,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_mod_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000907,
        "KHR-GLES32.core.constant_expressi",
        "ons.array_mod_vec2_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000908,
        "KHR-GLES32.core.constant_expression",
        "s.array_mod_vec2_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000909,
        "KHR-GLES32.core.constant_expressi",
        "ons.array_mod_vec2_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000910,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_mod_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000911,
        "KHR-GLES32.core.constant_express",
        "ions.array_mod_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000912,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_mod_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000913,
        "KHR-GLES32.core.constant_expressi",
        "ons.array_mod_vec3_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000914,
        "KHR-GLES32.core.constant_expression",
        "s.array_mod_vec3_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000915,
        "KHR-GLES32.core.constant_expressi",
        "ons.array_mod_vec3_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000916,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_mod_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000917,
        "KHR-GLES32.core.constant_express",
        "ions.array_mod_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000918,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_mod_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000919,
        "KHR-GLES32.core.constant_expressi",
        "ons.array_mod_vec4_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000920,
        "KHR-GLES32.core.constant_expression",
        "s.array_mod_vec4_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000921,
        "KHR-GLES32.core.constant_expressi",
        "ons.array_mod_vec4_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000922,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_min_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000923,
        "KHR-GLES32.core.constant_express",
        "ions.array_min_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000924,
        "KHR-GLES32.core.constant_expres",
        "sions.array_min_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000925,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_min_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000926,
        "KHR-GLES32.core.constant_express",
        "ions.array_min_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000927,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_min_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000928,
        "KHR-GLES32.core.constant_expressi",
        "ons.array_min_vec2_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000929,
        "KHR-GLES32.core.constant_expression",
        "s.array_min_vec2_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000930,
        "KHR-GLES32.core.constant_expressi",
        "ons.array_min_vec2_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000931,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_min_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000932,
        "KHR-GLES32.core.constant_express",
        "ions.array_min_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000933,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_min_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000934,
        "KHR-GLES32.core.constant_expressi",
        "ons.array_min_vec3_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000935,
        "KHR-GLES32.core.constant_expression",
        "s.array_min_vec3_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000936,
        "KHR-GLES32.core.constant_expressi",
        "ons.array_min_vec3_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000937,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_min_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000938,
        "KHR-GLES32.core.constant_express",
        "ions.array_min_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000939,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_min_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000940,
        "KHR-GLES32.core.constant_expressi",
        "ons.array_min_vec4_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000941,
        "KHR-GLES32.core.constant_expression",
        "s.array_min_vec4_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000942,
        "KHR-GLES32.core.constant_expressi",
        "ons.array_min_vec4_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000943,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_max_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000944,
        "KHR-GLES32.core.constant_express",
        "ions.array_max_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000945,
        "KHR-GLES32.core.constant_expres",
        "sions.array_max_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000946,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_max_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000947,
        "KHR-GLES32.core.constant_express",
        "ions.array_max_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000948,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_max_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000949,
        "KHR-GLES32.core.constant_expressi",
        "ons.array_max_vec2_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000950,
        "KHR-GLES32.core.constant_expression",
        "s.array_max_vec2_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000951,
        "KHR-GLES32.core.constant_expressi",
        "ons.array_max_vec2_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000952,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_max_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000953,
        "KHR-GLES32.core.constant_express",
        "ions.array_max_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000954,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_max_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000955,
        "KHR-GLES32.core.constant_expressi",
        "ons.array_max_vec3_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000956,
        "KHR-GLES32.core.constant_expression",
        "s.array_max_vec3_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000957,
        "KHR-GLES32.core.constant_expressi",
        "ons.array_max_vec3_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000958,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_max_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000959,
        "KHR-GLES32.core.constant_express",
        "ions.array_max_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000960,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_max_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000961,
        "KHR-GLES32.core.constant_expressi",
        "ons.array_max_vec4_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000962,
        "KHR-GLES32.core.constant_expression",
        "s.array_max_vec4_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000963,
        "KHR-GLES32.core.constant_expressi",
        "ons.array_max_vec4_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000964,
        "KHR-GLES32.core.constant_expres",
        "sions.array_clamp_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000965,
        "KHR-GLES32.core.constant_expressi",
        "ons.array_clamp_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000966,
        "KHR-GLES32.core.constant_express",
        "ions.array_clamp_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000967,
        "KHR-GLES32.core.constant_expres",
        "sions.array_clamp_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000968,
        "KHR-GLES32.core.constant_expressi",
        "ons.array_clamp_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000969,
        "KHR-GLES32.core.constant_expres",
        "sions.array_clamp_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000970,
        "KHR-GLES32.core.constant_expressio",
        "ns.array_clamp_vec2_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000971,
        "KHR-GLES32.core.constant_expressions",
        ".array_clamp_vec2_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000972,
        "KHR-GLES32.core.constant_expressio",
        "ns.array_clamp_vec2_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000973,
        "KHR-GLES32.core.constant_expres",
        "sions.array_clamp_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000974,
        "KHR-GLES32.core.constant_expressi",
        "ons.array_clamp_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000975,
        "KHR-GLES32.core.constant_expres",
        "sions.array_clamp_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000976,
        "KHR-GLES32.core.constant_expressio",
        "ns.array_clamp_vec3_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000977,
        "KHR-GLES32.core.constant_expressions",
        ".array_clamp_vec3_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000978,
        "KHR-GLES32.core.constant_expressio",
        "ns.array_clamp_vec3_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000979,
        "KHR-GLES32.core.constant_expres",
        "sions.array_clamp_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000980,
        "KHR-GLES32.core.constant_expressi",
        "ons.array_clamp_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000981,
        "KHR-GLES32.core.constant_expres",
        "sions.array_clamp_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000982,
        "KHR-GLES32.core.constant_expressio",
        "ns.array_clamp_vec4_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000983,
        "KHR-GLES32.core.constant_expressions",
        ".array_clamp_vec4_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000984,
        "KHR-GLES32.core.constant_expressio",
        "ns.array_clamp_vec4_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000985,
        "KHR-GLES32.core.constant_express",
        "ions.array_length_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000986,
        "KHR-GLES32.core.constant_expressio",
        "ns.array_length_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000987,
        "KHR-GLES32.core.constant_express",
        "ions.array_length_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000988,
        "KHR-GLES32.core.constant_expres",
        "sions.array_length_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000989,
        "KHR-GLES32.core.constant_expressi",
        "ons.array_length_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000990,
        "KHR-GLES32.core.constant_express",
        "ions.array_length_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000991,
        "KHR-GLES32.core.constant_expres",
        "sions.array_length_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000992,
        "KHR-GLES32.core.constant_expressi",
        "ons.array_length_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000993,
        "KHR-GLES32.core.constant_express",
        "ions.array_length_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000994,
        "KHR-GLES32.core.constant_expres",
        "sions.array_length_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000995,
        "KHR-GLES32.core.constant_expressi",
        "ons.array_length_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000996,
        "KHR-GLES32.core.constant_express",
        "ions.array_length_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000997,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_dot_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000998,
        "KHR-GLES32.core.constant_express",
        "ions.array_dot_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000999,
        "KHR-GLES32.core.constant_expres",
        "sions.array_dot_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_001000,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_dot_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_001001,
        "KHR-GLES32.core.constant_express",
        "ions.array_dot_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_001002,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_dot_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_001003,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_dot_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_001004,
        "KHR-GLES32.core.constant_express",
        "ions.array_dot_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_001005,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_dot_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_001006,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_dot_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_001007,
        "KHR-GLES32.core.constant_express",
        "ions.array_dot_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_001008,
        "KHR-GLES32.core.constant_expre",
        "ssions.array_dot_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_001009,
        "KHR-GLES32.core.constant_expressi",
        "ons.array_normalize_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_001010,
        "KHR-GLES32.core.constant_expression",
        "s.array_normalize_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_001011,
        "KHR-GLES32.core.constant_expressio",
        "ns.array_normalize_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_001012,
        "KHR-GLES32.core.constant_expressi",
        "ons.array_normalize_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_001013,
        "KHR-GLES32.core.constant_expression",
        "s.array_normalize_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_001014,
        "KHR-GLES32.core.constant_expressi",
        "ons.array_normalize_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_001015,
        "KHR-GLES32.core.constant_expressi",
        "ons.array_normalize_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_001016,
        "KHR-GLES32.core.constant_expression",
        "s.array_normalize_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_001017,
        "KHR-GLES32.core.constant_expressi",
        "ons.array_normalize_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_001018,
        "KHR-GLES32.core.constant_expressi",
        "ons.array_normalize_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_001019,
        "KHR-GLES32.core.constant_expression",
        "s.array_normalize_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_001020,
        "KHR-GLES32.core.constant_expressi",
        "ons.array_normalize_vec4_tess_eval");
