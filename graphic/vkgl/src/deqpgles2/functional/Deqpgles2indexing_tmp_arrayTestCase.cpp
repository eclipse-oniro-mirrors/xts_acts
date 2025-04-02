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
#include "../ActsDeqpgles20003TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002835,
        "dEQP-GLES2.functional.shaders.indexing.tmp_",
        "array.float_static_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002836,
        "dEQP-GLES2.functional.shaders.indexing.tmp_a",
        "rray.float_static_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002837,
        "dEQP-GLES2.functional.shaders.indexing.tmp_",
        "array.float_static_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002838,
        "dEQP-GLES2.functional.shaders.indexing.tmp_a",
        "rray.float_static_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002839,
        "dEQP-GLES2.functional.shaders.indexing.tmp_ar",
        "ray.float_static_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002840,
        "dEQP-GLES2.functional.shaders.indexing.tmp_arr",
        "ay.float_static_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002841,
        "dEQP-GLES2.functional.shaders.indexing.tmp_arr",
        "ay.float_static_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002842,
        "dEQP-GLES2.functional.shaders.indexing.tmp_arra",
        "y.float_static_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002843,
        "dEQP-GLES2.functional.shaders.indexing.tmp_",
        "array.float_dynamic_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002844,
        "dEQP-GLES2.functional.shaders.indexing.tmp_a",
        "rray.float_dynamic_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002845,
        "dEQP-GLES2.functional.shaders.indexing.tmp_a",
        "rray.float_dynamic_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002846,
        "dEQP-GLES2.functional.shaders.indexing.tmp_ar",
        "ray.float_dynamic_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002847,
        "dEQP-GLES2.functional.shaders.indexing.tmp_arr",
        "ay.float_dynamic_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002848,
        "dEQP-GLES2.functional.shaders.indexing.tmp_arra",
        "y.float_dynamic_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002849,
        "dEQP-GLES2.functional.shaders.indexing.tmp_arr",
        "ay.float_dynamic_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002850,
        "dEQP-GLES2.functional.shaders.indexing.tmp_arra",
        "y.float_dynamic_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002851,
        "dEQP-GLES2.functional.shaders.indexing.tmp_ar",
        "ray.float_static_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002852,
        "dEQP-GLES2.functional.shaders.indexing.tmp_arr",
        "ay.float_static_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002853,
        "dEQP-GLES2.functional.shaders.indexing.tmp_arr",
        "ay.float_static_loop_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002854,
        "dEQP-GLES2.functional.shaders.indexing.tmp_arra",
        "y.float_static_loop_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002855,
        "dEQP-GLES2.functional.shaders.indexing.tmp_array",
        ".float_static_loop_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002856,
        "dEQP-GLES2.functional.shaders.indexing.tmp_array.",
        "float_static_loop_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002857,
        "dEQP-GLES2.functional.shaders.indexing.tmp_array",
        ".float_static_loop_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002858,
        "dEQP-GLES2.functional.shaders.indexing.tmp_array.",
        "float_static_loop_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002859,
        "dEQP-GLES2.functional.shaders.indexing.tmp_arr",
        "ay.float_dynamic_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002860,
        "dEQP-GLES2.functional.shaders.indexing.tmp_arra",
        "y.float_dynamic_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002861,
        "dEQP-GLES2.functional.shaders.indexing.tmp_arr",
        "ay.float_dynamic_loop_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002862,
        "dEQP-GLES2.functional.shaders.indexing.tmp_arra",
        "y.float_dynamic_loop_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002863,
        "dEQP-GLES2.functional.shaders.indexing.tmp_array",
        ".float_dynamic_loop_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002864,
        "dEQP-GLES2.functional.shaders.indexing.tmp_array.",
        "float_dynamic_loop_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002865,
        "dEQP-GLES2.functional.shaders.indexing.tmp_array.",
        "float_dynamic_loop_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002866,
        "dEQP-GLES2.functional.shaders.indexing.tmp_array.f",
        "loat_dynamic_loop_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002867,
        "dEQP-GLES2.functional.shaders.indexing.tmp",
        "_array.float_const_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002868,
        "dEQP-GLES2.functional.shaders.indexing.tmp_",
        "array.float_const_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002869,
        "dEQP-GLES2.functional.shaders.indexing.tmp_",
        "array.float_const_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002870,
        "dEQP-GLES2.functional.shaders.indexing.tmp_a",
        "rray.float_const_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002871,
        "dEQP-GLES2.functional.shaders.indexing.tmp_ar",
        "ray.float_const_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002872,
        "dEQP-GLES2.functional.shaders.indexing.tmp_arr",
        "ay.float_const_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002873,
        "dEQP-GLES2.functional.shaders.indexing.tmp_ar",
        "ray.float_const_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002874,
        "dEQP-GLES2.functional.shaders.indexing.tmp_arr",
        "ay.float_const_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002875,
        "dEQP-GLES2.functional.shaders.indexing.tmp",
        "_array.vec2_static_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002876,
        "dEQP-GLES2.functional.shaders.indexing.tmp_",
        "array.vec2_static_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002877,
        "dEQP-GLES2.functional.shaders.indexing.tmp_",
        "array.vec2_static_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002878,
        "dEQP-GLES2.functional.shaders.indexing.tmp_a",
        "rray.vec2_static_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002879,
        "dEQP-GLES2.functional.shaders.indexing.tmp_ar",
        "ray.vec2_static_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002880,
        "dEQP-GLES2.functional.shaders.indexing.tmp_arr",
        "ay.vec2_static_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002881,
        "dEQP-GLES2.functional.shaders.indexing.tmp_ar",
        "ray.vec2_static_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002882,
        "dEQP-GLES2.functional.shaders.indexing.tmp_arr",
        "ay.vec2_static_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002883,
        "dEQP-GLES2.functional.shaders.indexing.tmp_",
        "array.vec2_dynamic_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002884,
        "dEQP-GLES2.functional.shaders.indexing.tmp_a",
        "rray.vec2_dynamic_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002885,
        "dEQP-GLES2.functional.shaders.indexing.tmp_",
        "array.vec2_dynamic_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002886,
        "dEQP-GLES2.functional.shaders.indexing.tmp_a",
        "rray.vec2_dynamic_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002887,
        "dEQP-GLES2.functional.shaders.indexing.tmp_ar",
        "ray.vec2_dynamic_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002888,
        "dEQP-GLES2.functional.shaders.indexing.tmp_arr",
        "ay.vec2_dynamic_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002889,
        "dEQP-GLES2.functional.shaders.indexing.tmp_arr",
        "ay.vec2_dynamic_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002890,
        "dEQP-GLES2.functional.shaders.indexing.tmp_arra",
        "y.vec2_dynamic_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002891,
        "dEQP-GLES2.functional.shaders.indexing.tmp_ar",
        "ray.vec2_static_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002892,
        "dEQP-GLES2.functional.shaders.indexing.tmp_arr",
        "ay.vec2_static_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002893,
        "dEQP-GLES2.functional.shaders.indexing.tmp_ar",
        "ray.vec2_static_loop_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002894,
        "dEQP-GLES2.functional.shaders.indexing.tmp_arr",
        "ay.vec2_static_loop_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002895,
        "dEQP-GLES2.functional.shaders.indexing.tmp_arra",
        "y.vec2_static_loop_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002896,
        "dEQP-GLES2.functional.shaders.indexing.tmp_array",
        ".vec2_static_loop_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002897,
        "dEQP-GLES2.functional.shaders.indexing.tmp_array",
        ".vec2_static_loop_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002898,
        "dEQP-GLES2.functional.shaders.indexing.tmp_array.",
        "vec2_static_loop_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002899,
        "dEQP-GLES2.functional.shaders.indexing.tmp_ar",
        "ray.vec2_dynamic_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002900,
        "dEQP-GLES2.functional.shaders.indexing.tmp_arr",
        "ay.vec2_dynamic_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002901,
        "dEQP-GLES2.functional.shaders.indexing.tmp_arr",
        "ay.vec2_dynamic_loop_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002902,
        "dEQP-GLES2.functional.shaders.indexing.tmp_arra",
        "y.vec2_dynamic_loop_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002903,
        "dEQP-GLES2.functional.shaders.indexing.tmp_array",
        ".vec2_dynamic_loop_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002904,
        "dEQP-GLES2.functional.shaders.indexing.tmp_array.",
        "vec2_dynamic_loop_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002905,
        "dEQP-GLES2.functional.shaders.indexing.tmp_array",
        ".vec2_dynamic_loop_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002906,
        "dEQP-GLES2.functional.shaders.indexing.tmp_array.",
        "vec2_dynamic_loop_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002907,
        "dEQP-GLES2.functional.shaders.indexing.tmp",
        "_array.vec2_const_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002908,
        "dEQP-GLES2.functional.shaders.indexing.tmp_",
        "array.vec2_const_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002909,
        "dEQP-GLES2.functional.shaders.indexing.tmp",
        "_array.vec2_const_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002910,
        "dEQP-GLES2.functional.shaders.indexing.tmp_",
        "array.vec2_const_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002911,
        "dEQP-GLES2.functional.shaders.indexing.tmp_a",
        "rray.vec2_const_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002912,
        "dEQP-GLES2.functional.shaders.indexing.tmp_ar",
        "ray.vec2_const_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002913,
        "dEQP-GLES2.functional.shaders.indexing.tmp_ar",
        "ray.vec2_const_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002914,
        "dEQP-GLES2.functional.shaders.indexing.tmp_arr",
        "ay.vec2_const_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002915,
        "dEQP-GLES2.functional.shaders.indexing.tmp",
        "_array.vec3_static_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002916,
        "dEQP-GLES2.functional.shaders.indexing.tmp_",
        "array.vec3_static_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002917,
        "dEQP-GLES2.functional.shaders.indexing.tmp_",
        "array.vec3_static_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002918,
        "dEQP-GLES2.functional.shaders.indexing.tmp_a",
        "rray.vec3_static_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002919,
        "dEQP-GLES2.functional.shaders.indexing.tmp_ar",
        "ray.vec3_static_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002920,
        "dEQP-GLES2.functional.shaders.indexing.tmp_arr",
        "ay.vec3_static_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002921,
        "dEQP-GLES2.functional.shaders.indexing.tmp_ar",
        "ray.vec3_static_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002922,
        "dEQP-GLES2.functional.shaders.indexing.tmp_arr",
        "ay.vec3_static_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002923,
        "dEQP-GLES2.functional.shaders.indexing.tmp_",
        "array.vec3_dynamic_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002924,
        "dEQP-GLES2.functional.shaders.indexing.tmp_a",
        "rray.vec3_dynamic_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002925,
        "dEQP-GLES2.functional.shaders.indexing.tmp_",
        "array.vec3_dynamic_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002926,
        "dEQP-GLES2.functional.shaders.indexing.tmp_a",
        "rray.vec3_dynamic_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002927,
        "dEQP-GLES2.functional.shaders.indexing.tmp_ar",
        "ray.vec3_dynamic_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002928,
        "dEQP-GLES2.functional.shaders.indexing.tmp_arr",
        "ay.vec3_dynamic_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002929,
        "dEQP-GLES2.functional.shaders.indexing.tmp_arr",
        "ay.vec3_dynamic_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002930,
        "dEQP-GLES2.functional.shaders.indexing.tmp_arra",
        "y.vec3_dynamic_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002931,
        "dEQP-GLES2.functional.shaders.indexing.tmp_ar",
        "ray.vec3_static_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002932,
        "dEQP-GLES2.functional.shaders.indexing.tmp_arr",
        "ay.vec3_static_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002933,
        "dEQP-GLES2.functional.shaders.indexing.tmp_ar",
        "ray.vec3_static_loop_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002934,
        "dEQP-GLES2.functional.shaders.indexing.tmp_arr",
        "ay.vec3_static_loop_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002935,
        "dEQP-GLES2.functional.shaders.indexing.tmp_arra",
        "y.vec3_static_loop_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002936,
        "dEQP-GLES2.functional.shaders.indexing.tmp_array",
        ".vec3_static_loop_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002937,
        "dEQP-GLES2.functional.shaders.indexing.tmp_array",
        ".vec3_static_loop_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002938,
        "dEQP-GLES2.functional.shaders.indexing.tmp_array.",
        "vec3_static_loop_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002939,
        "dEQP-GLES2.functional.shaders.indexing.tmp_ar",
        "ray.vec3_dynamic_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002940,
        "dEQP-GLES2.functional.shaders.indexing.tmp_arr",
        "ay.vec3_dynamic_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002941,
        "dEQP-GLES2.functional.shaders.indexing.tmp_arr",
        "ay.vec3_dynamic_loop_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002942,
        "dEQP-GLES2.functional.shaders.indexing.tmp_arra",
        "y.vec3_dynamic_loop_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002943,
        "dEQP-GLES2.functional.shaders.indexing.tmp_array",
        ".vec3_dynamic_loop_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002944,
        "dEQP-GLES2.functional.shaders.indexing.tmp_array.",
        "vec3_dynamic_loop_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002945,
        "dEQP-GLES2.functional.shaders.indexing.tmp_array",
        ".vec3_dynamic_loop_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002946,
        "dEQP-GLES2.functional.shaders.indexing.tmp_array.",
        "vec3_dynamic_loop_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002947,
        "dEQP-GLES2.functional.shaders.indexing.tmp",
        "_array.vec3_const_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002948,
        "dEQP-GLES2.functional.shaders.indexing.tmp_",
        "array.vec3_const_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002949,
        "dEQP-GLES2.functional.shaders.indexing.tmp",
        "_array.vec3_const_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002950,
        "dEQP-GLES2.functional.shaders.indexing.tmp_",
        "array.vec3_const_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002951,
        "dEQP-GLES2.functional.shaders.indexing.tmp_a",
        "rray.vec3_const_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002952,
        "dEQP-GLES2.functional.shaders.indexing.tmp_ar",
        "ray.vec3_const_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002953,
        "dEQP-GLES2.functional.shaders.indexing.tmp_ar",
        "ray.vec3_const_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002954,
        "dEQP-GLES2.functional.shaders.indexing.tmp_arr",
        "ay.vec3_const_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002955,
        "dEQP-GLES2.functional.shaders.indexing.tmp",
        "_array.vec4_static_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002956,
        "dEQP-GLES2.functional.shaders.indexing.tmp_",
        "array.vec4_static_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002957,
        "dEQP-GLES2.functional.shaders.indexing.tmp_",
        "array.vec4_static_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002958,
        "dEQP-GLES2.functional.shaders.indexing.tmp_a",
        "rray.vec4_static_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002959,
        "dEQP-GLES2.functional.shaders.indexing.tmp_ar",
        "ray.vec4_static_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002960,
        "dEQP-GLES2.functional.shaders.indexing.tmp_arr",
        "ay.vec4_static_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002961,
        "dEQP-GLES2.functional.shaders.indexing.tmp_ar",
        "ray.vec4_static_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002962,
        "dEQP-GLES2.functional.shaders.indexing.tmp_arr",
        "ay.vec4_static_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002963,
        "dEQP-GLES2.functional.shaders.indexing.tmp_",
        "array.vec4_dynamic_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002964,
        "dEQP-GLES2.functional.shaders.indexing.tmp_a",
        "rray.vec4_dynamic_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002965,
        "dEQP-GLES2.functional.shaders.indexing.tmp_",
        "array.vec4_dynamic_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002966,
        "dEQP-GLES2.functional.shaders.indexing.tmp_a",
        "rray.vec4_dynamic_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002967,
        "dEQP-GLES2.functional.shaders.indexing.tmp_ar",
        "ray.vec4_dynamic_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002968,
        "dEQP-GLES2.functional.shaders.indexing.tmp_arr",
        "ay.vec4_dynamic_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002969,
        "dEQP-GLES2.functional.shaders.indexing.tmp_arr",
        "ay.vec4_dynamic_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002970,
        "dEQP-GLES2.functional.shaders.indexing.tmp_arra",
        "y.vec4_dynamic_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002971,
        "dEQP-GLES2.functional.shaders.indexing.tmp_ar",
        "ray.vec4_static_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002972,
        "dEQP-GLES2.functional.shaders.indexing.tmp_arr",
        "ay.vec4_static_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002973,
        "dEQP-GLES2.functional.shaders.indexing.tmp_ar",
        "ray.vec4_static_loop_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002974,
        "dEQP-GLES2.functional.shaders.indexing.tmp_arr",
        "ay.vec4_static_loop_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002975,
        "dEQP-GLES2.functional.shaders.indexing.tmp_arra",
        "y.vec4_static_loop_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002976,
        "dEQP-GLES2.functional.shaders.indexing.tmp_array",
        ".vec4_static_loop_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002977,
        "dEQP-GLES2.functional.shaders.indexing.tmp_array",
        ".vec4_static_loop_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002978,
        "dEQP-GLES2.functional.shaders.indexing.tmp_array.",
        "vec4_static_loop_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002979,
        "dEQP-GLES2.functional.shaders.indexing.tmp_ar",
        "ray.vec4_dynamic_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002980,
        "dEQP-GLES2.functional.shaders.indexing.tmp_arr",
        "ay.vec4_dynamic_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002981,
        "dEQP-GLES2.functional.shaders.indexing.tmp_arr",
        "ay.vec4_dynamic_loop_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002982,
        "dEQP-GLES2.functional.shaders.indexing.tmp_arra",
        "y.vec4_dynamic_loop_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002983,
        "dEQP-GLES2.functional.shaders.indexing.tmp_array",
        ".vec4_dynamic_loop_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002984,
        "dEQP-GLES2.functional.shaders.indexing.tmp_array.",
        "vec4_dynamic_loop_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002985,
        "dEQP-GLES2.functional.shaders.indexing.tmp_array",
        ".vec4_dynamic_loop_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002986,
        "dEQP-GLES2.functional.shaders.indexing.tmp_array.",
        "vec4_dynamic_loop_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002987,
        "dEQP-GLES2.functional.shaders.indexing.tmp",
        "_array.vec4_const_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002988,
        "dEQP-GLES2.functional.shaders.indexing.tmp_",
        "array.vec4_const_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002989,
        "dEQP-GLES2.functional.shaders.indexing.tmp",
        "_array.vec4_const_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002990,
        "dEQP-GLES2.functional.shaders.indexing.tmp_",
        "array.vec4_const_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002991,
        "dEQP-GLES2.functional.shaders.indexing.tmp_a",
        "rray.vec4_const_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002992,
        "dEQP-GLES2.functional.shaders.indexing.tmp_ar",
        "ray.vec4_const_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002993,
        "dEQP-GLES2.functional.shaders.indexing.tmp_ar",
        "ray.vec4_const_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20003TestSuite, TestCase_002994,
        "dEQP-GLES2.functional.shaders.indexing.tmp_arr",
        "ay.vec4_const_write_dynamic_loop_read_fragment");
