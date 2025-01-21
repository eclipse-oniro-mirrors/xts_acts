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
#include "../Khrgles31BaseFunc.h"
#include "../ActsKhrgles310001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000797,
        "KHR-GLES31.core.constant_express",
        "ions.basic_radians_float_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000798,
        "KHR-GLES31.core.constant_express",
        "ions.basic_radians_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000799,
        "KHR-GLES31.core.constant_expressio",
        "ns.basic_radians_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000800,
        "KHR-GLES31.core.constant_expressi",
        "ons.basic_radians_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000801,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_radians_vec2_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000802,
        "KHR-GLES31.core.constant_express",
        "ions.basic_radians_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000803,
        "KHR-GLES31.core.constant_expressio",
        "ns.basic_radians_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000804,
        "KHR-GLES31.core.constant_express",
        "ions.basic_radians_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000805,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_radians_vec3_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000806,
        "KHR-GLES31.core.constant_express",
        "ions.basic_radians_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000807,
        "KHR-GLES31.core.constant_expressio",
        "ns.basic_radians_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000808,
        "KHR-GLES31.core.constant_express",
        "ions.basic_radians_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000809,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_radians_vec4_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000810,
        "KHR-GLES31.core.constant_express",
        "ions.basic_radians_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000811,
        "KHR-GLES31.core.constant_expressio",
        "ns.basic_radians_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000812,
        "KHR-GLES31.core.constant_express",
        "ions.basic_radians_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000813,
        "KHR-GLES31.core.constant_express",
        "ions.basic_degrees_float_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000814,
        "KHR-GLES31.core.constant_express",
        "ions.basic_degrees_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000815,
        "KHR-GLES31.core.constant_expressio",
        "ns.basic_degrees_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000816,
        "KHR-GLES31.core.constant_expressi",
        "ons.basic_degrees_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000817,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_degrees_vec2_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000818,
        "KHR-GLES31.core.constant_express",
        "ions.basic_degrees_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000819,
        "KHR-GLES31.core.constant_expressio",
        "ns.basic_degrees_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000820,
        "KHR-GLES31.core.constant_express",
        "ions.basic_degrees_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000821,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_degrees_vec3_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000822,
        "KHR-GLES31.core.constant_express",
        "ions.basic_degrees_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000823,
        "KHR-GLES31.core.constant_expressio",
        "ns.basic_degrees_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000824,
        "KHR-GLES31.core.constant_express",
        "ions.basic_degrees_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000825,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_degrees_vec4_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000826,
        "KHR-GLES31.core.constant_express",
        "ions.basic_degrees_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000827,
        "KHR-GLES31.core.constant_expressio",
        "ns.basic_degrees_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000828,
        "KHR-GLES31.core.constant_express",
        "ions.basic_degrees_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000829,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_sin_float_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000830,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_sin_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000831,
        "KHR-GLES31.core.constant_express",
        "ions.basic_sin_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000832,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_sin_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000833,
        "KHR-GLES31.core.constant_expr",
        "essions.basic_sin_vec2_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000834,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_sin_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000835,
        "KHR-GLES31.core.constant_express",
        "ions.basic_sin_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000836,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_sin_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000837,
        "KHR-GLES31.core.constant_expr",
        "essions.basic_sin_vec3_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000838,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_sin_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000839,
        "KHR-GLES31.core.constant_express",
        "ions.basic_sin_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000840,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_sin_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000841,
        "KHR-GLES31.core.constant_expr",
        "essions.basic_sin_vec4_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000842,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_sin_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000843,
        "KHR-GLES31.core.constant_express",
        "ions.basic_sin_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000844,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_sin_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000845,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_cos_float_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000846,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_cos_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000847,
        "KHR-GLES31.core.constant_express",
        "ions.basic_cos_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000848,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_cos_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000849,
        "KHR-GLES31.core.constant_expr",
        "essions.basic_cos_vec2_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000850,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_cos_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000851,
        "KHR-GLES31.core.constant_express",
        "ions.basic_cos_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000852,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_cos_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000853,
        "KHR-GLES31.core.constant_expr",
        "essions.basic_cos_vec3_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000854,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_cos_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000855,
        "KHR-GLES31.core.constant_express",
        "ions.basic_cos_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000856,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_cos_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000857,
        "KHR-GLES31.core.constant_expr",
        "essions.basic_cos_vec4_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000858,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_cos_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000859,
        "KHR-GLES31.core.constant_express",
        "ions.basic_cos_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000860,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_cos_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000861,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_asin_float_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000862,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_asin_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000863,
        "KHR-GLES31.core.constant_expressi",
        "ons.basic_asin_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000864,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_asin_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000865,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_asin_vec2_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000866,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_asin_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000867,
        "KHR-GLES31.core.constant_express",
        "ions.basic_asin_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000868,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_asin_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000869,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_asin_vec3_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000870,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_asin_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000871,
        "KHR-GLES31.core.constant_express",
        "ions.basic_asin_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000872,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_asin_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000873,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_asin_vec4_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000874,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_asin_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000875,
        "KHR-GLES31.core.constant_express",
        "ions.basic_asin_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000876,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_asin_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000877,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_acos_float_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000878,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_acos_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000879,
        "KHR-GLES31.core.constant_expressi",
        "ons.basic_acos_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000880,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_acos_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000881,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_acos_vec2_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000882,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_acos_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000883,
        "KHR-GLES31.core.constant_express",
        "ions.basic_acos_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000884,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_acos_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000885,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_acos_vec3_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000886,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_acos_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000887,
        "KHR-GLES31.core.constant_express",
        "ions.basic_acos_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000888,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_acos_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000889,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_acos_vec4_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000890,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_acos_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000891,
        "KHR-GLES31.core.constant_express",
        "ions.basic_acos_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000892,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_acos_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000893,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_pow_float_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000894,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_pow_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000895,
        "KHR-GLES31.core.constant_express",
        "ions.basic_pow_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000896,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_pow_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000897,
        "KHR-GLES31.core.constant_expr",
        "essions.basic_pow_vec2_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000898,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_pow_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000899,
        "KHR-GLES31.core.constant_express",
        "ions.basic_pow_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000900,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_pow_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000901,
        "KHR-GLES31.core.constant_expr",
        "essions.basic_pow_vec3_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000902,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_pow_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000903,
        "KHR-GLES31.core.constant_express",
        "ions.basic_pow_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000904,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_pow_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000905,
        "KHR-GLES31.core.constant_expr",
        "essions.basic_pow_vec4_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000906,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_pow_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000907,
        "KHR-GLES31.core.constant_express",
        "ions.basic_pow_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000908,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_pow_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000909,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_exp_float_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000910,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_exp_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000911,
        "KHR-GLES31.core.constant_express",
        "ions.basic_exp_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000912,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_exp_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000913,
        "KHR-GLES31.core.constant_expr",
        "essions.basic_exp_vec2_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000914,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_exp_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000915,
        "KHR-GLES31.core.constant_express",
        "ions.basic_exp_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000916,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_exp_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000917,
        "KHR-GLES31.core.constant_expr",
        "essions.basic_exp_vec3_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000918,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_exp_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000919,
        "KHR-GLES31.core.constant_express",
        "ions.basic_exp_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000920,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_exp_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000921,
        "KHR-GLES31.core.constant_expr",
        "essions.basic_exp_vec4_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000922,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_exp_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000923,
        "KHR-GLES31.core.constant_express",
        "ions.basic_exp_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000924,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_exp_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000925,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_log_float_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000926,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_log_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000927,
        "KHR-GLES31.core.constant_express",
        "ions.basic_log_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000928,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_log_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000929,
        "KHR-GLES31.core.constant_expr",
        "essions.basic_log_vec2_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000930,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_log_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000931,
        "KHR-GLES31.core.constant_express",
        "ions.basic_log_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000932,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_log_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000933,
        "KHR-GLES31.core.constant_expr",
        "essions.basic_log_vec3_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000934,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_log_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000935,
        "KHR-GLES31.core.constant_express",
        "ions.basic_log_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000936,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_log_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000937,
        "KHR-GLES31.core.constant_expr",
        "essions.basic_log_vec4_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000938,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_log_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000939,
        "KHR-GLES31.core.constant_express",
        "ions.basic_log_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000940,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_log_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000941,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_exp2_float_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000942,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_exp2_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000943,
        "KHR-GLES31.core.constant_expressi",
        "ons.basic_exp2_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000944,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_exp2_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000945,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_exp2_vec2_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000946,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_exp2_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000947,
        "KHR-GLES31.core.constant_express",
        "ions.basic_exp2_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000948,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_exp2_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000949,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_exp2_vec3_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000950,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_exp2_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000951,
        "KHR-GLES31.core.constant_express",
        "ions.basic_exp2_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000952,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_exp2_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000953,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_exp2_vec4_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000954,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_exp2_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000955,
        "KHR-GLES31.core.constant_express",
        "ions.basic_exp2_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000956,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_exp2_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000957,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_log2_float_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000958,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_log2_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000959,
        "KHR-GLES31.core.constant_expressi",
        "ons.basic_log2_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000960,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_log2_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000961,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_log2_vec2_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000962,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_log2_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000963,
        "KHR-GLES31.core.constant_express",
        "ions.basic_log2_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000964,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_log2_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000965,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_log2_vec3_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000966,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_log2_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000967,
        "KHR-GLES31.core.constant_express",
        "ions.basic_log2_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000968,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_log2_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000969,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_log2_vec4_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000970,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_log2_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000971,
        "KHR-GLES31.core.constant_express",
        "ions.basic_log2_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000972,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_log2_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000973,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_sqrt_float_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000974,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_sqrt_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000975,
        "KHR-GLES31.core.constant_expressi",
        "ons.basic_sqrt_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000976,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_sqrt_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000977,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_sqrt_vec2_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000978,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_sqrt_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000979,
        "KHR-GLES31.core.constant_express",
        "ions.basic_sqrt_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000980,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_sqrt_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000981,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_sqrt_vec3_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000982,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_sqrt_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000983,
        "KHR-GLES31.core.constant_express",
        "ions.basic_sqrt_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000984,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_sqrt_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000985,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_sqrt_vec4_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000986,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_sqrt_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000987,
        "KHR-GLES31.core.constant_express",
        "ions.basic_sqrt_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000988,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_sqrt_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000989,
        "KHR-GLES31.core.constant_expressio",
        "ns.basic_inversesqrt_float_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000990,
        "KHR-GLES31.core.constant_expressio",
        "ns.basic_inversesqrt_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000991,
        "KHR-GLES31.core.constant_expressions",
        ".basic_inversesqrt_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000992,
        "KHR-GLES31.core.constant_expression",
        "s.basic_inversesqrt_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000993,
        "KHR-GLES31.core.constant_expressi",
        "ons.basic_inversesqrt_vec2_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000994,
        "KHR-GLES31.core.constant_expressio",
        "ns.basic_inversesqrt_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000995,
        "KHR-GLES31.core.constant_expressions",
        ".basic_inversesqrt_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000996,
        "KHR-GLES31.core.constant_expressio",
        "ns.basic_inversesqrt_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000997,
        "KHR-GLES31.core.constant_expressi",
        "ons.basic_inversesqrt_vec3_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000998,
        "KHR-GLES31.core.constant_expressio",
        "ns.basic_inversesqrt_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000999,
        "KHR-GLES31.core.constant_expressions",
        ".basic_inversesqrt_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001000,
        "KHR-GLES31.core.constant_expressio",
        "ns.basic_inversesqrt_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001001,
        "KHR-GLES31.core.constant_expressi",
        "ons.basic_inversesqrt_vec4_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001002,
        "KHR-GLES31.core.constant_expressio",
        "ns.basic_inversesqrt_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001003,
        "KHR-GLES31.core.constant_expressions",
        ".basic_inversesqrt_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001004,
        "KHR-GLES31.core.constant_expressio",
        "ns.basic_inversesqrt_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001005,
        "KHR-GLES31.core.constant_expr",
        "essions.basic_abs_int_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001006,
        "KHR-GLES31.core.constant_expr",
        "essions.basic_abs_int_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001007,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_abs_int_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001008,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_abs_int_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001009,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_abs_ivec2_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001010,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_abs_ivec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001011,
        "KHR-GLES31.core.constant_express",
        "ions.basic_abs_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001012,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_abs_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001013,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_abs_ivec3_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001014,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_abs_ivec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001015,
        "KHR-GLES31.core.constant_express",
        "ions.basic_abs_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001016,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_abs_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001017,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_abs_ivec4_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001018,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_abs_ivec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001019,
        "KHR-GLES31.core.constant_express",
        "ions.basic_abs_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001020,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_abs_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001021,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_sign_float_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001022,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_sign_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001023,
        "KHR-GLES31.core.constant_expressi",
        "ons.basic_sign_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001024,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_sign_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001025,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_sign_vec2_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001026,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_sign_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001027,
        "KHR-GLES31.core.constant_express",
        "ions.basic_sign_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001028,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_sign_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001029,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_sign_vec3_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001030,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_sign_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001031,
        "KHR-GLES31.core.constant_express",
        "ions.basic_sign_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001032,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_sign_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001033,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_sign_vec4_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001034,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_sign_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001035,
        "KHR-GLES31.core.constant_express",
        "ions.basic_sign_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001036,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_sign_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001037,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_floor_float_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001038,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_floor_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001039,
        "KHR-GLES31.core.constant_expressi",
        "ons.basic_floor_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001040,
        "KHR-GLES31.core.constant_express",
        "ions.basic_floor_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001041,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_floor_vec2_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001042,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_floor_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001043,
        "KHR-GLES31.core.constant_expressi",
        "ons.basic_floor_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001044,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_floor_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001045,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_floor_vec3_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001046,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_floor_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001047,
        "KHR-GLES31.core.constant_expressi",
        "ons.basic_floor_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001048,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_floor_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001049,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_floor_vec4_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001050,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_floor_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001051,
        "KHR-GLES31.core.constant_expressi",
        "ons.basic_floor_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001052,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_floor_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001053,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_trunc_float_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001054,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_trunc_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001055,
        "KHR-GLES31.core.constant_expressi",
        "ons.basic_trunc_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001056,
        "KHR-GLES31.core.constant_express",
        "ions.basic_trunc_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001057,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_trunc_vec2_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001058,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_trunc_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001059,
        "KHR-GLES31.core.constant_expressi",
        "ons.basic_trunc_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001060,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_trunc_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001061,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_trunc_vec3_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001062,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_trunc_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001063,
        "KHR-GLES31.core.constant_expressi",
        "ons.basic_trunc_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001064,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_trunc_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001065,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_trunc_vec4_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001066,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_trunc_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001067,
        "KHR-GLES31.core.constant_expressi",
        "ons.basic_trunc_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001068,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_trunc_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001069,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_round_float_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001070,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_round_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001071,
        "KHR-GLES31.core.constant_expressi",
        "ons.basic_round_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001072,
        "KHR-GLES31.core.constant_express",
        "ions.basic_round_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001073,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_round_vec2_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001074,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_round_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001075,
        "KHR-GLES31.core.constant_expressi",
        "ons.basic_round_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001076,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_round_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001077,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_round_vec3_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001078,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_round_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001079,
        "KHR-GLES31.core.constant_expressi",
        "ons.basic_round_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001080,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_round_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001081,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_round_vec4_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001082,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_round_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001083,
        "KHR-GLES31.core.constant_expressi",
        "ons.basic_round_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001084,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_round_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001085,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_ceil_float_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001086,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_ceil_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001087,
        "KHR-GLES31.core.constant_expressi",
        "ons.basic_ceil_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001088,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_ceil_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001089,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_ceil_vec2_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001090,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_ceil_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001091,
        "KHR-GLES31.core.constant_express",
        "ions.basic_ceil_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001092,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_ceil_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001093,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_ceil_vec3_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001094,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_ceil_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001095,
        "KHR-GLES31.core.constant_express",
        "ions.basic_ceil_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001096,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_ceil_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001097,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_ceil_vec4_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001098,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_ceil_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001099,
        "KHR-GLES31.core.constant_express",
        "ions.basic_ceil_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001100,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_ceil_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001101,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_mod_float_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001102,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_mod_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001103,
        "KHR-GLES31.core.constant_express",
        "ions.basic_mod_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001104,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_mod_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001105,
        "KHR-GLES31.core.constant_expr",
        "essions.basic_mod_vec2_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001106,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_mod_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001107,
        "KHR-GLES31.core.constant_express",
        "ions.basic_mod_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001108,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_mod_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001109,
        "KHR-GLES31.core.constant_express",
        "ions.basic_mod_vec2_float_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001110,
        "KHR-GLES31.core.constant_expressi",
        "ons.basic_mod_vec2_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001111,
        "KHR-GLES31.core.constant_expression",
        "s.basic_mod_vec2_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001112,
        "KHR-GLES31.core.constant_expressi",
        "ons.basic_mod_vec2_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001113,
        "KHR-GLES31.core.constant_expr",
        "essions.basic_mod_vec3_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001114,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_mod_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001115,
        "KHR-GLES31.core.constant_express",
        "ions.basic_mod_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001116,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_mod_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001117,
        "KHR-GLES31.core.constant_express",
        "ions.basic_mod_vec3_float_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001118,
        "KHR-GLES31.core.constant_expressi",
        "ons.basic_mod_vec3_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001119,
        "KHR-GLES31.core.constant_expression",
        "s.basic_mod_vec3_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001120,
        "KHR-GLES31.core.constant_expressi",
        "ons.basic_mod_vec3_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001121,
        "KHR-GLES31.core.constant_expr",
        "essions.basic_mod_vec4_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001122,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_mod_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001123,
        "KHR-GLES31.core.constant_express",
        "ions.basic_mod_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001124,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_mod_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001125,
        "KHR-GLES31.core.constant_express",
        "ions.basic_mod_vec4_float_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001126,
        "KHR-GLES31.core.constant_expressi",
        "ons.basic_mod_vec4_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001127,
        "KHR-GLES31.core.constant_expression",
        "s.basic_mod_vec4_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001128,
        "KHR-GLES31.core.constant_expressi",
        "ons.basic_mod_vec4_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001129,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_min_float_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001130,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_min_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001131,
        "KHR-GLES31.core.constant_express",
        "ions.basic_min_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001132,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_min_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001133,
        "KHR-GLES31.core.constant_expr",
        "essions.basic_min_vec2_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001134,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_min_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001135,
        "KHR-GLES31.core.constant_express",
        "ions.basic_min_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001136,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_min_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001137,
        "KHR-GLES31.core.constant_express",
        "ions.basic_min_vec2_float_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001138,
        "KHR-GLES31.core.constant_expressi",
        "ons.basic_min_vec2_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001139,
        "KHR-GLES31.core.constant_expression",
        "s.basic_min_vec2_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001140,
        "KHR-GLES31.core.constant_expressi",
        "ons.basic_min_vec2_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001141,
        "KHR-GLES31.core.constant_expr",
        "essions.basic_min_vec3_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001142,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_min_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001143,
        "KHR-GLES31.core.constant_express",
        "ions.basic_min_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001144,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_min_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001145,
        "KHR-GLES31.core.constant_express",
        "ions.basic_min_vec3_float_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001146,
        "KHR-GLES31.core.constant_expressi",
        "ons.basic_min_vec3_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001147,
        "KHR-GLES31.core.constant_expression",
        "s.basic_min_vec3_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001148,
        "KHR-GLES31.core.constant_expressi",
        "ons.basic_min_vec3_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001149,
        "KHR-GLES31.core.constant_expr",
        "essions.basic_min_vec4_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001150,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_min_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001151,
        "KHR-GLES31.core.constant_express",
        "ions.basic_min_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001152,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_min_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001153,
        "KHR-GLES31.core.constant_express",
        "ions.basic_min_vec4_float_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001154,
        "KHR-GLES31.core.constant_expressi",
        "ons.basic_min_vec4_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001155,
        "KHR-GLES31.core.constant_expression",
        "s.basic_min_vec4_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001156,
        "KHR-GLES31.core.constant_expressi",
        "ons.basic_min_vec4_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001157,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_max_float_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001158,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_max_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001159,
        "KHR-GLES31.core.constant_express",
        "ions.basic_max_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001160,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_max_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001161,
        "KHR-GLES31.core.constant_expr",
        "essions.basic_max_vec2_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001162,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_max_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001163,
        "KHR-GLES31.core.constant_express",
        "ions.basic_max_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001164,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_max_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001165,
        "KHR-GLES31.core.constant_express",
        "ions.basic_max_vec2_float_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001166,
        "KHR-GLES31.core.constant_expressi",
        "ons.basic_max_vec2_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001167,
        "KHR-GLES31.core.constant_expression",
        "s.basic_max_vec2_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001168,
        "KHR-GLES31.core.constant_expressi",
        "ons.basic_max_vec2_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001169,
        "KHR-GLES31.core.constant_expr",
        "essions.basic_max_vec3_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001170,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_max_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001171,
        "KHR-GLES31.core.constant_express",
        "ions.basic_max_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001172,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_max_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001173,
        "KHR-GLES31.core.constant_express",
        "ions.basic_max_vec3_float_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001174,
        "KHR-GLES31.core.constant_expressi",
        "ons.basic_max_vec3_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001175,
        "KHR-GLES31.core.constant_expression",
        "s.basic_max_vec3_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001176,
        "KHR-GLES31.core.constant_expressi",
        "ons.basic_max_vec3_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001177,
        "KHR-GLES31.core.constant_expr",
        "essions.basic_max_vec4_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001178,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_max_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001179,
        "KHR-GLES31.core.constant_express",
        "ions.basic_max_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001180,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_max_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001181,
        "KHR-GLES31.core.constant_express",
        "ions.basic_max_vec4_float_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001182,
        "KHR-GLES31.core.constant_expressi",
        "ons.basic_max_vec4_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001183,
        "KHR-GLES31.core.constant_expression",
        "s.basic_max_vec4_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001184,
        "KHR-GLES31.core.constant_expressi",
        "ons.basic_max_vec4_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001185,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_clamp_float_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001186,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_clamp_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001187,
        "KHR-GLES31.core.constant_expressi",
        "ons.basic_clamp_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001188,
        "KHR-GLES31.core.constant_express",
        "ions.basic_clamp_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001189,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_clamp_vec2_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001190,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_clamp_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001191,
        "KHR-GLES31.core.constant_expressi",
        "ons.basic_clamp_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001192,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_clamp_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001193,
        "KHR-GLES31.core.constant_expressi",
        "ons.basic_clamp_vec2_float_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001194,
        "KHR-GLES31.core.constant_expressio",
        "ns.basic_clamp_vec2_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001195,
        "KHR-GLES31.core.constant_expressions",
        ".basic_clamp_vec2_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001196,
        "KHR-GLES31.core.constant_expressio",
        "ns.basic_clamp_vec2_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001197,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_clamp_vec3_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001198,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_clamp_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001199,
        "KHR-GLES31.core.constant_expressi",
        "ons.basic_clamp_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001200,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_clamp_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001201,
        "KHR-GLES31.core.constant_expressi",
        "ons.basic_clamp_vec3_float_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001202,
        "KHR-GLES31.core.constant_expressio",
        "ns.basic_clamp_vec3_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001203,
        "KHR-GLES31.core.constant_expressions",
        ".basic_clamp_vec3_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001204,
        "KHR-GLES31.core.constant_expressio",
        "ns.basic_clamp_vec3_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001205,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_clamp_vec4_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001206,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_clamp_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001207,
        "KHR-GLES31.core.constant_expressi",
        "ons.basic_clamp_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001208,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_clamp_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001209,
        "KHR-GLES31.core.constant_expressi",
        "ons.basic_clamp_vec4_float_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001210,
        "KHR-GLES31.core.constant_expressio",
        "ns.basic_clamp_vec4_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001211,
        "KHR-GLES31.core.constant_expressions",
        ".basic_clamp_vec4_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001212,
        "KHR-GLES31.core.constant_expressio",
        "ns.basic_clamp_vec4_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001213,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_length_float_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001214,
        "KHR-GLES31.core.constant_express",
        "ions.basic_length_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001215,
        "KHR-GLES31.core.constant_expressio",
        "ns.basic_length_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001216,
        "KHR-GLES31.core.constant_express",
        "ions.basic_length_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001217,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_length_vec2_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001218,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_length_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001219,
        "KHR-GLES31.core.constant_expressi",
        "ons.basic_length_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001220,
        "KHR-GLES31.core.constant_express",
        "ions.basic_length_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001221,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_length_vec3_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001222,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_length_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001223,
        "KHR-GLES31.core.constant_expressi",
        "ons.basic_length_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001224,
        "KHR-GLES31.core.constant_express",
        "ions.basic_length_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001225,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_length_vec4_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001226,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_length_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001227,
        "KHR-GLES31.core.constant_expressi",
        "ons.basic_length_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001228,
        "KHR-GLES31.core.constant_express",
        "ions.basic_length_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001229,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_dot_float_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001230,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_dot_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001231,
        "KHR-GLES31.core.constant_express",
        "ions.basic_dot_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001232,
        "KHR-GLES31.core.constant_expres",
        "sions.basic_dot_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001233,
        "KHR-GLES31.core.constant_expr",
        "essions.basic_dot_vec2_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001234,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_dot_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001235,
        "KHR-GLES31.core.constant_express",
        "ions.basic_dot_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001236,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_dot_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001237,
        "KHR-GLES31.core.constant_expr",
        "essions.basic_dot_vec3_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001238,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_dot_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001239,
        "KHR-GLES31.core.constant_express",
        "ions.basic_dot_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001240,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_dot_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001241,
        "KHR-GLES31.core.constant_expr",
        "essions.basic_dot_vec4_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001242,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_dot_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001243,
        "KHR-GLES31.core.constant_express",
        "ions.basic_dot_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001244,
        "KHR-GLES31.core.constant_expre",
        "ssions.basic_dot_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001245,
        "KHR-GLES31.core.constant_expressi",
        "ons.basic_normalize_float_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001246,
        "KHR-GLES31.core.constant_expressi",
        "ons.basic_normalize_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001247,
        "KHR-GLES31.core.constant_expression",
        "s.basic_normalize_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001248,
        "KHR-GLES31.core.constant_expressio",
        "ns.basic_normalize_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001249,
        "KHR-GLES31.core.constant_express",
        "ions.basic_normalize_vec2_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001250,
        "KHR-GLES31.core.constant_expressi",
        "ons.basic_normalize_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001251,
        "KHR-GLES31.core.constant_expression",
        "s.basic_normalize_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001252,
        "KHR-GLES31.core.constant_expressi",
        "ons.basic_normalize_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001253,
        "KHR-GLES31.core.constant_express",
        "ions.basic_normalize_vec3_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001254,
        "KHR-GLES31.core.constant_expressi",
        "ons.basic_normalize_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001255,
        "KHR-GLES31.core.constant_expression",
        "s.basic_normalize_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001256,
        "KHR-GLES31.core.constant_expressi",
        "ons.basic_normalize_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001257,
        "KHR-GLES31.core.constant_express",
        "ions.basic_normalize_vec4_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001258,
        "KHR-GLES31.core.constant_expressi",
        "ons.basic_normalize_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001259,
        "KHR-GLES31.core.constant_expression",
        "s.basic_normalize_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001260,
        "KHR-GLES31.core.constant_expressi",
        "ons.basic_normalize_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001261,
        "KHR-GLES31.core.constant_express",
        "ions.array_radians_float_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001262,
        "KHR-GLES31.core.constant_express",
        "ions.array_radians_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001263,
        "KHR-GLES31.core.constant_expressio",
        "ns.array_radians_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001264,
        "KHR-GLES31.core.constant_expressi",
        "ons.array_radians_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001265,
        "KHR-GLES31.core.constant_expres",
        "sions.array_radians_vec2_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001266,
        "KHR-GLES31.core.constant_express",
        "ions.array_radians_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001267,
        "KHR-GLES31.core.constant_expressio",
        "ns.array_radians_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001268,
        "KHR-GLES31.core.constant_express",
        "ions.array_radians_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001269,
        "KHR-GLES31.core.constant_expres",
        "sions.array_radians_vec3_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001270,
        "KHR-GLES31.core.constant_express",
        "ions.array_radians_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001271,
        "KHR-GLES31.core.constant_expressio",
        "ns.array_radians_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001272,
        "KHR-GLES31.core.constant_express",
        "ions.array_radians_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001273,
        "KHR-GLES31.core.constant_expres",
        "sions.array_radians_vec4_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001274,
        "KHR-GLES31.core.constant_express",
        "ions.array_radians_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001275,
        "KHR-GLES31.core.constant_expressio",
        "ns.array_radians_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001276,
        "KHR-GLES31.core.constant_express",
        "ions.array_radians_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001277,
        "KHR-GLES31.core.constant_express",
        "ions.array_degrees_float_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001278,
        "KHR-GLES31.core.constant_express",
        "ions.array_degrees_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001279,
        "KHR-GLES31.core.constant_expressio",
        "ns.array_degrees_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001280,
        "KHR-GLES31.core.constant_expressi",
        "ons.array_degrees_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001281,
        "KHR-GLES31.core.constant_expres",
        "sions.array_degrees_vec2_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001282,
        "KHR-GLES31.core.constant_express",
        "ions.array_degrees_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001283,
        "KHR-GLES31.core.constant_expressio",
        "ns.array_degrees_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001284,
        "KHR-GLES31.core.constant_express",
        "ions.array_degrees_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001285,
        "KHR-GLES31.core.constant_expres",
        "sions.array_degrees_vec3_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001286,
        "KHR-GLES31.core.constant_express",
        "ions.array_degrees_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001287,
        "KHR-GLES31.core.constant_expressio",
        "ns.array_degrees_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001288,
        "KHR-GLES31.core.constant_express",
        "ions.array_degrees_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001289,
        "KHR-GLES31.core.constant_expres",
        "sions.array_degrees_vec4_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001290,
        "KHR-GLES31.core.constant_express",
        "ions.array_degrees_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001291,
        "KHR-GLES31.core.constant_expressio",
        "ns.array_degrees_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001292,
        "KHR-GLES31.core.constant_express",
        "ions.array_degrees_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001293,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_sin_float_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001294,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_sin_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001295,
        "KHR-GLES31.core.constant_express",
        "ions.array_sin_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001296,
        "KHR-GLES31.core.constant_expres",
        "sions.array_sin_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001297,
        "KHR-GLES31.core.constant_expr",
        "essions.array_sin_vec2_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001298,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_sin_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001299,
        "KHR-GLES31.core.constant_express",
        "ions.array_sin_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001300,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_sin_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001301,
        "KHR-GLES31.core.constant_expr",
        "essions.array_sin_vec3_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001302,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_sin_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001303,
        "KHR-GLES31.core.constant_express",
        "ions.array_sin_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001304,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_sin_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001305,
        "KHR-GLES31.core.constant_expr",
        "essions.array_sin_vec4_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001306,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_sin_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001307,
        "KHR-GLES31.core.constant_express",
        "ions.array_sin_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001308,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_sin_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001309,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_cos_float_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001310,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_cos_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001311,
        "KHR-GLES31.core.constant_express",
        "ions.array_cos_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001312,
        "KHR-GLES31.core.constant_expres",
        "sions.array_cos_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001313,
        "KHR-GLES31.core.constant_expr",
        "essions.array_cos_vec2_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001314,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_cos_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001315,
        "KHR-GLES31.core.constant_express",
        "ions.array_cos_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001316,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_cos_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001317,
        "KHR-GLES31.core.constant_expr",
        "essions.array_cos_vec3_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001318,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_cos_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001319,
        "KHR-GLES31.core.constant_express",
        "ions.array_cos_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001320,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_cos_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001321,
        "KHR-GLES31.core.constant_expr",
        "essions.array_cos_vec4_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001322,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_cos_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001323,
        "KHR-GLES31.core.constant_express",
        "ions.array_cos_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001324,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_cos_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001325,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_asin_float_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001326,
        "KHR-GLES31.core.constant_expres",
        "sions.array_asin_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001327,
        "KHR-GLES31.core.constant_expressi",
        "ons.array_asin_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001328,
        "KHR-GLES31.core.constant_expres",
        "sions.array_asin_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001329,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_asin_vec2_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001330,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_asin_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001331,
        "KHR-GLES31.core.constant_express",
        "ions.array_asin_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001332,
        "KHR-GLES31.core.constant_expres",
        "sions.array_asin_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001333,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_asin_vec3_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001334,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_asin_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001335,
        "KHR-GLES31.core.constant_express",
        "ions.array_asin_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001336,
        "KHR-GLES31.core.constant_expres",
        "sions.array_asin_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001337,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_asin_vec4_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001338,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_asin_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001339,
        "KHR-GLES31.core.constant_express",
        "ions.array_asin_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001340,
        "KHR-GLES31.core.constant_expres",
        "sions.array_asin_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001341,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_acos_float_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001342,
        "KHR-GLES31.core.constant_expres",
        "sions.array_acos_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001343,
        "KHR-GLES31.core.constant_expressi",
        "ons.array_acos_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001344,
        "KHR-GLES31.core.constant_expres",
        "sions.array_acos_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001345,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_acos_vec2_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001346,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_acos_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001347,
        "KHR-GLES31.core.constant_express",
        "ions.array_acos_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001348,
        "KHR-GLES31.core.constant_expres",
        "sions.array_acos_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001349,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_acos_vec3_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001350,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_acos_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001351,
        "KHR-GLES31.core.constant_express",
        "ions.array_acos_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001352,
        "KHR-GLES31.core.constant_expres",
        "sions.array_acos_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001353,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_acos_vec4_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001354,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_acos_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001355,
        "KHR-GLES31.core.constant_express",
        "ions.array_acos_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001356,
        "KHR-GLES31.core.constant_expres",
        "sions.array_acos_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001357,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_pow_float_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001358,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_pow_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001359,
        "KHR-GLES31.core.constant_express",
        "ions.array_pow_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001360,
        "KHR-GLES31.core.constant_expres",
        "sions.array_pow_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001361,
        "KHR-GLES31.core.constant_expr",
        "essions.array_pow_vec2_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001362,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_pow_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001363,
        "KHR-GLES31.core.constant_express",
        "ions.array_pow_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001364,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_pow_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001365,
        "KHR-GLES31.core.constant_expr",
        "essions.array_pow_vec3_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001366,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_pow_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001367,
        "KHR-GLES31.core.constant_express",
        "ions.array_pow_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001368,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_pow_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001369,
        "KHR-GLES31.core.constant_expr",
        "essions.array_pow_vec4_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001370,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_pow_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001371,
        "KHR-GLES31.core.constant_express",
        "ions.array_pow_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001372,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_pow_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001373,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_exp_float_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001374,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_exp_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001375,
        "KHR-GLES31.core.constant_express",
        "ions.array_exp_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001376,
        "KHR-GLES31.core.constant_expres",
        "sions.array_exp_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001377,
        "KHR-GLES31.core.constant_expr",
        "essions.array_exp_vec2_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001378,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_exp_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001379,
        "KHR-GLES31.core.constant_express",
        "ions.array_exp_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001380,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_exp_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001381,
        "KHR-GLES31.core.constant_expr",
        "essions.array_exp_vec3_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001382,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_exp_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001383,
        "KHR-GLES31.core.constant_express",
        "ions.array_exp_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001384,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_exp_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001385,
        "KHR-GLES31.core.constant_expr",
        "essions.array_exp_vec4_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001386,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_exp_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001387,
        "KHR-GLES31.core.constant_express",
        "ions.array_exp_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001388,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_exp_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001389,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_log_float_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001390,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_log_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001391,
        "KHR-GLES31.core.constant_express",
        "ions.array_log_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001392,
        "KHR-GLES31.core.constant_expres",
        "sions.array_log_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001393,
        "KHR-GLES31.core.constant_expr",
        "essions.array_log_vec2_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001394,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_log_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001395,
        "KHR-GLES31.core.constant_express",
        "ions.array_log_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001396,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_log_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001397,
        "KHR-GLES31.core.constant_expr",
        "essions.array_log_vec3_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001398,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_log_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001399,
        "KHR-GLES31.core.constant_express",
        "ions.array_log_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001400,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_log_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001401,
        "KHR-GLES31.core.constant_expr",
        "essions.array_log_vec4_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001402,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_log_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001403,
        "KHR-GLES31.core.constant_express",
        "ions.array_log_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001404,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_log_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001405,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_exp2_float_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001406,
        "KHR-GLES31.core.constant_expres",
        "sions.array_exp2_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001407,
        "KHR-GLES31.core.constant_expressi",
        "ons.array_exp2_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001408,
        "KHR-GLES31.core.constant_expres",
        "sions.array_exp2_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001409,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_exp2_vec2_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001410,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_exp2_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001411,
        "KHR-GLES31.core.constant_express",
        "ions.array_exp2_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001412,
        "KHR-GLES31.core.constant_expres",
        "sions.array_exp2_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001413,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_exp2_vec3_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001414,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_exp2_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001415,
        "KHR-GLES31.core.constant_express",
        "ions.array_exp2_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001416,
        "KHR-GLES31.core.constant_expres",
        "sions.array_exp2_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001417,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_exp2_vec4_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001418,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_exp2_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001419,
        "KHR-GLES31.core.constant_express",
        "ions.array_exp2_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001420,
        "KHR-GLES31.core.constant_expres",
        "sions.array_exp2_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001421,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_log2_float_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001422,
        "KHR-GLES31.core.constant_expres",
        "sions.array_log2_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001423,
        "KHR-GLES31.core.constant_expressi",
        "ons.array_log2_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001424,
        "KHR-GLES31.core.constant_expres",
        "sions.array_log2_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001425,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_log2_vec2_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001426,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_log2_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001427,
        "KHR-GLES31.core.constant_express",
        "ions.array_log2_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001428,
        "KHR-GLES31.core.constant_expres",
        "sions.array_log2_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001429,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_log2_vec3_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001430,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_log2_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001431,
        "KHR-GLES31.core.constant_express",
        "ions.array_log2_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001432,
        "KHR-GLES31.core.constant_expres",
        "sions.array_log2_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001433,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_log2_vec4_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001434,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_log2_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001435,
        "KHR-GLES31.core.constant_express",
        "ions.array_log2_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001436,
        "KHR-GLES31.core.constant_expres",
        "sions.array_log2_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001437,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_sqrt_float_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001438,
        "KHR-GLES31.core.constant_expres",
        "sions.array_sqrt_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001439,
        "KHR-GLES31.core.constant_expressi",
        "ons.array_sqrt_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001440,
        "KHR-GLES31.core.constant_expres",
        "sions.array_sqrt_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001441,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_sqrt_vec2_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001442,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_sqrt_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001443,
        "KHR-GLES31.core.constant_express",
        "ions.array_sqrt_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001444,
        "KHR-GLES31.core.constant_expres",
        "sions.array_sqrt_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001445,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_sqrt_vec3_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001446,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_sqrt_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001447,
        "KHR-GLES31.core.constant_express",
        "ions.array_sqrt_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001448,
        "KHR-GLES31.core.constant_expres",
        "sions.array_sqrt_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001449,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_sqrt_vec4_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001450,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_sqrt_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001451,
        "KHR-GLES31.core.constant_express",
        "ions.array_sqrt_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001452,
        "KHR-GLES31.core.constant_expres",
        "sions.array_sqrt_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001453,
        "KHR-GLES31.core.constant_expressio",
        "ns.array_inversesqrt_float_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001454,
        "KHR-GLES31.core.constant_expressio",
        "ns.array_inversesqrt_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001455,
        "KHR-GLES31.core.constant_expressions",
        ".array_inversesqrt_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001456,
        "KHR-GLES31.core.constant_expression",
        "s.array_inversesqrt_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001457,
        "KHR-GLES31.core.constant_expressi",
        "ons.array_inversesqrt_vec2_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001458,
        "KHR-GLES31.core.constant_expressio",
        "ns.array_inversesqrt_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001459,
        "KHR-GLES31.core.constant_expressions",
        ".array_inversesqrt_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001460,
        "KHR-GLES31.core.constant_expressio",
        "ns.array_inversesqrt_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001461,
        "KHR-GLES31.core.constant_expressi",
        "ons.array_inversesqrt_vec3_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001462,
        "KHR-GLES31.core.constant_expressio",
        "ns.array_inversesqrt_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001463,
        "KHR-GLES31.core.constant_expressions",
        ".array_inversesqrt_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001464,
        "KHR-GLES31.core.constant_expressio",
        "ns.array_inversesqrt_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001465,
        "KHR-GLES31.core.constant_expressi",
        "ons.array_inversesqrt_vec4_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001466,
        "KHR-GLES31.core.constant_expressio",
        "ns.array_inversesqrt_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001467,
        "KHR-GLES31.core.constant_expressions",
        ".array_inversesqrt_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001468,
        "KHR-GLES31.core.constant_expressio",
        "ns.array_inversesqrt_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001469,
        "KHR-GLES31.core.constant_expr",
        "essions.array_abs_int_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001470,
        "KHR-GLES31.core.constant_expr",
        "essions.array_abs_int_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001471,
        "KHR-GLES31.core.constant_expres",
        "sions.array_abs_int_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001472,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_abs_int_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001473,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_abs_ivec2_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001474,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_abs_ivec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001475,
        "KHR-GLES31.core.constant_express",
        "ions.array_abs_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001476,
        "KHR-GLES31.core.constant_expres",
        "sions.array_abs_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001477,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_abs_ivec3_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001478,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_abs_ivec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001479,
        "KHR-GLES31.core.constant_express",
        "ions.array_abs_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001480,
        "KHR-GLES31.core.constant_expres",
        "sions.array_abs_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001481,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_abs_ivec4_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001482,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_abs_ivec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001483,
        "KHR-GLES31.core.constant_express",
        "ions.array_abs_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001484,
        "KHR-GLES31.core.constant_expres",
        "sions.array_abs_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001485,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_sign_float_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001486,
        "KHR-GLES31.core.constant_expres",
        "sions.array_sign_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001487,
        "KHR-GLES31.core.constant_expressi",
        "ons.array_sign_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001488,
        "KHR-GLES31.core.constant_expres",
        "sions.array_sign_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001489,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_sign_vec2_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001490,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_sign_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001491,
        "KHR-GLES31.core.constant_express",
        "ions.array_sign_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001492,
        "KHR-GLES31.core.constant_expres",
        "sions.array_sign_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001493,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_sign_vec3_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001494,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_sign_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001495,
        "KHR-GLES31.core.constant_express",
        "ions.array_sign_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001496,
        "KHR-GLES31.core.constant_expres",
        "sions.array_sign_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001497,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_sign_vec4_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001498,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_sign_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001499,
        "KHR-GLES31.core.constant_express",
        "ions.array_sign_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001500,
        "KHR-GLES31.core.constant_expres",
        "sions.array_sign_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001501,
        "KHR-GLES31.core.constant_expres",
        "sions.array_floor_float_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001502,
        "KHR-GLES31.core.constant_expres",
        "sions.array_floor_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001503,
        "KHR-GLES31.core.constant_expressi",
        "ons.array_floor_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001504,
        "KHR-GLES31.core.constant_express",
        "ions.array_floor_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001505,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_floor_vec2_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001506,
        "KHR-GLES31.core.constant_expres",
        "sions.array_floor_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001507,
        "KHR-GLES31.core.constant_expressi",
        "ons.array_floor_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001508,
        "KHR-GLES31.core.constant_expres",
        "sions.array_floor_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001509,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_floor_vec3_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001510,
        "KHR-GLES31.core.constant_expres",
        "sions.array_floor_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001511,
        "KHR-GLES31.core.constant_expressi",
        "ons.array_floor_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001512,
        "KHR-GLES31.core.constant_expres",
        "sions.array_floor_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001513,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_floor_vec4_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001514,
        "KHR-GLES31.core.constant_expres",
        "sions.array_floor_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001515,
        "KHR-GLES31.core.constant_expressi",
        "ons.array_floor_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001516,
        "KHR-GLES31.core.constant_expres",
        "sions.array_floor_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001517,
        "KHR-GLES31.core.constant_expres",
        "sions.array_trunc_float_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001518,
        "KHR-GLES31.core.constant_expres",
        "sions.array_trunc_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001519,
        "KHR-GLES31.core.constant_expressi",
        "ons.array_trunc_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001520,
        "KHR-GLES31.core.constant_express",
        "ions.array_trunc_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001521,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_trunc_vec2_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001522,
        "KHR-GLES31.core.constant_expres",
        "sions.array_trunc_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001523,
        "KHR-GLES31.core.constant_expressi",
        "ons.array_trunc_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001524,
        "KHR-GLES31.core.constant_expres",
        "sions.array_trunc_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001525,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_trunc_vec3_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001526,
        "KHR-GLES31.core.constant_expres",
        "sions.array_trunc_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001527,
        "KHR-GLES31.core.constant_expressi",
        "ons.array_trunc_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001528,
        "KHR-GLES31.core.constant_expres",
        "sions.array_trunc_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001529,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_trunc_vec4_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001530,
        "KHR-GLES31.core.constant_expres",
        "sions.array_trunc_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001531,
        "KHR-GLES31.core.constant_expressi",
        "ons.array_trunc_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001532,
        "KHR-GLES31.core.constant_expres",
        "sions.array_trunc_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001533,
        "KHR-GLES31.core.constant_expres",
        "sions.array_round_float_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001534,
        "KHR-GLES31.core.constant_expres",
        "sions.array_round_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001535,
        "KHR-GLES31.core.constant_expressi",
        "ons.array_round_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001536,
        "KHR-GLES31.core.constant_express",
        "ions.array_round_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001537,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_round_vec2_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001538,
        "KHR-GLES31.core.constant_expres",
        "sions.array_round_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001539,
        "KHR-GLES31.core.constant_expressi",
        "ons.array_round_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001540,
        "KHR-GLES31.core.constant_expres",
        "sions.array_round_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001541,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_round_vec3_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001542,
        "KHR-GLES31.core.constant_expres",
        "sions.array_round_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001543,
        "KHR-GLES31.core.constant_expressi",
        "ons.array_round_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001544,
        "KHR-GLES31.core.constant_expres",
        "sions.array_round_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001545,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_round_vec4_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001546,
        "KHR-GLES31.core.constant_expres",
        "sions.array_round_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001547,
        "KHR-GLES31.core.constant_expressi",
        "ons.array_round_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001548,
        "KHR-GLES31.core.constant_expres",
        "sions.array_round_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001549,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_ceil_float_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001550,
        "KHR-GLES31.core.constant_expres",
        "sions.array_ceil_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001551,
        "KHR-GLES31.core.constant_expressi",
        "ons.array_ceil_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001552,
        "KHR-GLES31.core.constant_expres",
        "sions.array_ceil_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001553,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_ceil_vec2_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001554,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_ceil_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001555,
        "KHR-GLES31.core.constant_express",
        "ions.array_ceil_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001556,
        "KHR-GLES31.core.constant_expres",
        "sions.array_ceil_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001557,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_ceil_vec3_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001558,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_ceil_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001559,
        "KHR-GLES31.core.constant_express",
        "ions.array_ceil_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001560,
        "KHR-GLES31.core.constant_expres",
        "sions.array_ceil_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001561,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_ceil_vec4_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001562,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_ceil_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001563,
        "KHR-GLES31.core.constant_express",
        "ions.array_ceil_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001564,
        "KHR-GLES31.core.constant_expres",
        "sions.array_ceil_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001565,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_mod_float_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001566,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_mod_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001567,
        "KHR-GLES31.core.constant_express",
        "ions.array_mod_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001568,
        "KHR-GLES31.core.constant_expres",
        "sions.array_mod_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001569,
        "KHR-GLES31.core.constant_expr",
        "essions.array_mod_vec2_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001570,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_mod_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001571,
        "KHR-GLES31.core.constant_express",
        "ions.array_mod_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001572,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_mod_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001573,
        "KHR-GLES31.core.constant_express",
        "ions.array_mod_vec2_float_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001574,
        "KHR-GLES31.core.constant_expressi",
        "ons.array_mod_vec2_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001575,
        "KHR-GLES31.core.constant_expression",
        "s.array_mod_vec2_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001576,
        "KHR-GLES31.core.constant_expressi",
        "ons.array_mod_vec2_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001577,
        "KHR-GLES31.core.constant_expr",
        "essions.array_mod_vec3_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001578,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_mod_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001579,
        "KHR-GLES31.core.constant_express",
        "ions.array_mod_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001580,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_mod_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001581,
        "KHR-GLES31.core.constant_express",
        "ions.array_mod_vec3_float_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001582,
        "KHR-GLES31.core.constant_expressi",
        "ons.array_mod_vec3_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001583,
        "KHR-GLES31.core.constant_expression",
        "s.array_mod_vec3_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001584,
        "KHR-GLES31.core.constant_expressi",
        "ons.array_mod_vec3_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001585,
        "KHR-GLES31.core.constant_expr",
        "essions.array_mod_vec4_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001586,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_mod_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001587,
        "KHR-GLES31.core.constant_express",
        "ions.array_mod_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001588,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_mod_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001589,
        "KHR-GLES31.core.constant_express",
        "ions.array_mod_vec4_float_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001590,
        "KHR-GLES31.core.constant_expressi",
        "ons.array_mod_vec4_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001591,
        "KHR-GLES31.core.constant_expression",
        "s.array_mod_vec4_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001592,
        "KHR-GLES31.core.constant_expressi",
        "ons.array_mod_vec4_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001593,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_min_float_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001594,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_min_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001595,
        "KHR-GLES31.core.constant_express",
        "ions.array_min_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001596,
        "KHR-GLES31.core.constant_expres",
        "sions.array_min_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001597,
        "KHR-GLES31.core.constant_expr",
        "essions.array_min_vec2_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001598,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_min_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001599,
        "KHR-GLES31.core.constant_express",
        "ions.array_min_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001600,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_min_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001601,
        "KHR-GLES31.core.constant_express",
        "ions.array_min_vec2_float_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001602,
        "KHR-GLES31.core.constant_expressi",
        "ons.array_min_vec2_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001603,
        "KHR-GLES31.core.constant_expression",
        "s.array_min_vec2_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001604,
        "KHR-GLES31.core.constant_expressi",
        "ons.array_min_vec2_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001605,
        "KHR-GLES31.core.constant_expr",
        "essions.array_min_vec3_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001606,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_min_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001607,
        "KHR-GLES31.core.constant_express",
        "ions.array_min_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001608,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_min_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001609,
        "KHR-GLES31.core.constant_express",
        "ions.array_min_vec3_float_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001610,
        "KHR-GLES31.core.constant_expressi",
        "ons.array_min_vec3_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001611,
        "KHR-GLES31.core.constant_expression",
        "s.array_min_vec3_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001612,
        "KHR-GLES31.core.constant_expressi",
        "ons.array_min_vec3_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001613,
        "KHR-GLES31.core.constant_expr",
        "essions.array_min_vec4_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001614,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_min_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001615,
        "KHR-GLES31.core.constant_express",
        "ions.array_min_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001616,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_min_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001617,
        "KHR-GLES31.core.constant_express",
        "ions.array_min_vec4_float_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001618,
        "KHR-GLES31.core.constant_expressi",
        "ons.array_min_vec4_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001619,
        "KHR-GLES31.core.constant_expression",
        "s.array_min_vec4_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001620,
        "KHR-GLES31.core.constant_expressi",
        "ons.array_min_vec4_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001621,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_max_float_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001622,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_max_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001623,
        "KHR-GLES31.core.constant_express",
        "ions.array_max_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001624,
        "KHR-GLES31.core.constant_expres",
        "sions.array_max_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001625,
        "KHR-GLES31.core.constant_expr",
        "essions.array_max_vec2_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001626,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_max_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001627,
        "KHR-GLES31.core.constant_express",
        "ions.array_max_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001628,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_max_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001629,
        "KHR-GLES31.core.constant_express",
        "ions.array_max_vec2_float_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001630,
        "KHR-GLES31.core.constant_expressi",
        "ons.array_max_vec2_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001631,
        "KHR-GLES31.core.constant_expression",
        "s.array_max_vec2_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001632,
        "KHR-GLES31.core.constant_expressi",
        "ons.array_max_vec2_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001633,
        "KHR-GLES31.core.constant_expr",
        "essions.array_max_vec3_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001634,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_max_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001635,
        "KHR-GLES31.core.constant_express",
        "ions.array_max_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001636,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_max_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001637,
        "KHR-GLES31.core.constant_express",
        "ions.array_max_vec3_float_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001638,
        "KHR-GLES31.core.constant_expressi",
        "ons.array_max_vec3_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001639,
        "KHR-GLES31.core.constant_expression",
        "s.array_max_vec3_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001640,
        "KHR-GLES31.core.constant_expressi",
        "ons.array_max_vec3_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001641,
        "KHR-GLES31.core.constant_expr",
        "essions.array_max_vec4_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001642,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_max_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001643,
        "KHR-GLES31.core.constant_express",
        "ions.array_max_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001644,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_max_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001645,
        "KHR-GLES31.core.constant_express",
        "ions.array_max_vec4_float_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001646,
        "KHR-GLES31.core.constant_expressi",
        "ons.array_max_vec4_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001647,
        "KHR-GLES31.core.constant_expression",
        "s.array_max_vec4_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001648,
        "KHR-GLES31.core.constant_expressi",
        "ons.array_max_vec4_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001649,
        "KHR-GLES31.core.constant_expres",
        "sions.array_clamp_float_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001650,
        "KHR-GLES31.core.constant_expres",
        "sions.array_clamp_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001651,
        "KHR-GLES31.core.constant_expressi",
        "ons.array_clamp_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001652,
        "KHR-GLES31.core.constant_express",
        "ions.array_clamp_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001653,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_clamp_vec2_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001654,
        "KHR-GLES31.core.constant_expres",
        "sions.array_clamp_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001655,
        "KHR-GLES31.core.constant_expressi",
        "ons.array_clamp_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001656,
        "KHR-GLES31.core.constant_expres",
        "sions.array_clamp_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001657,
        "KHR-GLES31.core.constant_expressi",
        "ons.array_clamp_vec2_float_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001658,
        "KHR-GLES31.core.constant_expressio",
        "ns.array_clamp_vec2_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001659,
        "KHR-GLES31.core.constant_expressions",
        ".array_clamp_vec2_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001660,
        "KHR-GLES31.core.constant_expressio",
        "ns.array_clamp_vec2_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001661,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_clamp_vec3_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001662,
        "KHR-GLES31.core.constant_expres",
        "sions.array_clamp_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001663,
        "KHR-GLES31.core.constant_expressi",
        "ons.array_clamp_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001664,
        "KHR-GLES31.core.constant_expres",
        "sions.array_clamp_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001665,
        "KHR-GLES31.core.constant_expressi",
        "ons.array_clamp_vec3_float_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001666,
        "KHR-GLES31.core.constant_expressio",
        "ns.array_clamp_vec3_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001667,
        "KHR-GLES31.core.constant_expressions",
        ".array_clamp_vec3_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001668,
        "KHR-GLES31.core.constant_expressio",
        "ns.array_clamp_vec3_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001669,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_clamp_vec4_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001670,
        "KHR-GLES31.core.constant_expres",
        "sions.array_clamp_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001671,
        "KHR-GLES31.core.constant_expressi",
        "ons.array_clamp_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001672,
        "KHR-GLES31.core.constant_expres",
        "sions.array_clamp_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001673,
        "KHR-GLES31.core.constant_expressi",
        "ons.array_clamp_vec4_float_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001674,
        "KHR-GLES31.core.constant_expressio",
        "ns.array_clamp_vec4_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001675,
        "KHR-GLES31.core.constant_expressions",
        ".array_clamp_vec4_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001676,
        "KHR-GLES31.core.constant_expressio",
        "ns.array_clamp_vec4_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001677,
        "KHR-GLES31.core.constant_expres",
        "sions.array_length_float_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001678,
        "KHR-GLES31.core.constant_express",
        "ions.array_length_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001679,
        "KHR-GLES31.core.constant_expressio",
        "ns.array_length_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001680,
        "KHR-GLES31.core.constant_express",
        "ions.array_length_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001681,
        "KHR-GLES31.core.constant_expres",
        "sions.array_length_vec2_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001682,
        "KHR-GLES31.core.constant_expres",
        "sions.array_length_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001683,
        "KHR-GLES31.core.constant_expressi",
        "ons.array_length_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001684,
        "KHR-GLES31.core.constant_express",
        "ions.array_length_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001685,
        "KHR-GLES31.core.constant_expres",
        "sions.array_length_vec3_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001686,
        "KHR-GLES31.core.constant_expres",
        "sions.array_length_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001687,
        "KHR-GLES31.core.constant_expressi",
        "ons.array_length_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001688,
        "KHR-GLES31.core.constant_express",
        "ions.array_length_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001689,
        "KHR-GLES31.core.constant_expres",
        "sions.array_length_vec4_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001690,
        "KHR-GLES31.core.constant_expres",
        "sions.array_length_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001691,
        "KHR-GLES31.core.constant_expressi",
        "ons.array_length_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001692,
        "KHR-GLES31.core.constant_express",
        "ions.array_length_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001693,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_dot_float_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001694,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_dot_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001695,
        "KHR-GLES31.core.constant_express",
        "ions.array_dot_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001696,
        "KHR-GLES31.core.constant_expres",
        "sions.array_dot_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001697,
        "KHR-GLES31.core.constant_expr",
        "essions.array_dot_vec2_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001698,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_dot_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001699,
        "KHR-GLES31.core.constant_express",
        "ions.array_dot_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001700,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_dot_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001701,
        "KHR-GLES31.core.constant_expr",
        "essions.array_dot_vec3_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001702,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_dot_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001703,
        "KHR-GLES31.core.constant_express",
        "ions.array_dot_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001704,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_dot_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001705,
        "KHR-GLES31.core.constant_expr",
        "essions.array_dot_vec4_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001706,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_dot_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001707,
        "KHR-GLES31.core.constant_express",
        "ions.array_dot_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001708,
        "KHR-GLES31.core.constant_expre",
        "ssions.array_dot_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001709,
        "KHR-GLES31.core.constant_expressi",
        "ons.array_normalize_float_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001710,
        "KHR-GLES31.core.constant_expressi",
        "ons.array_normalize_float_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001711,
        "KHR-GLES31.core.constant_expression",
        "s.array_normalize_float_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001712,
        "KHR-GLES31.core.constant_expressio",
        "ns.array_normalize_float_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001713,
        "KHR-GLES31.core.constant_express",
        "ions.array_normalize_vec2_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001714,
        "KHR-GLES31.core.constant_expressi",
        "ons.array_normalize_vec2_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001715,
        "KHR-GLES31.core.constant_expression",
        "s.array_normalize_vec2_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001716,
        "KHR-GLES31.core.constant_expressi",
        "ons.array_normalize_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001717,
        "KHR-GLES31.core.constant_express",
        "ions.array_normalize_vec3_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001718,
        "KHR-GLES31.core.constant_expressi",
        "ons.array_normalize_vec3_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001719,
        "KHR-GLES31.core.constant_expression",
        "s.array_normalize_vec3_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001720,
        "KHR-GLES31.core.constant_expressi",
        "ons.array_normalize_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001721,
        "KHR-GLES31.core.constant_express",
        "ions.array_normalize_vec4_compute");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001722,
        "KHR-GLES31.core.constant_expressi",
        "ons.array_normalize_vec4_geometry");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001723,
        "KHR-GLES31.core.constant_expression",
        "s.array_normalize_vec4_tess_control");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_001724,
        "KHR-GLES31.core.constant_expressi",
        "ons.array_normalize_vec4_tess_eval");
