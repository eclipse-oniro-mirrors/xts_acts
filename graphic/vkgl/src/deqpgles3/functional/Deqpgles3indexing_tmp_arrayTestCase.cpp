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
#include "../ActsDeqpgles30007TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006047,
        "dEQP-GLES3.functional.shaders.indexing.tmp_",
        "array.float_static_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006048,
        "dEQP-GLES3.functional.shaders.indexing.tmp_a",
        "rray.float_static_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006049,
        "dEQP-GLES3.functional.shaders.indexing.tmp_",
        "array.float_static_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006050,
        "dEQP-GLES3.functional.shaders.indexing.tmp_a",
        "rray.float_static_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006051,
        "dEQP-GLES3.functional.shaders.indexing.tmp_ar",
        "ray.float_static_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006052,
        "dEQP-GLES3.functional.shaders.indexing.tmp_arr",
        "ay.float_static_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006053,
        "dEQP-GLES3.functional.shaders.indexing.tmp_arr",
        "ay.float_static_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006054,
        "dEQP-GLES3.functional.shaders.indexing.tmp_arra",
        "y.float_static_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006055,
        "dEQP-GLES3.functional.shaders.indexing.tmp_",
        "array.float_dynamic_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006056,
        "dEQP-GLES3.functional.shaders.indexing.tmp_a",
        "rray.float_dynamic_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006057,
        "dEQP-GLES3.functional.shaders.indexing.tmp_a",
        "rray.float_dynamic_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006058,
        "dEQP-GLES3.functional.shaders.indexing.tmp_ar",
        "ray.float_dynamic_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006059,
        "dEQP-GLES3.functional.shaders.indexing.tmp_arr",
        "ay.float_dynamic_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006060,
        "dEQP-GLES3.functional.shaders.indexing.tmp_arra",
        "y.float_dynamic_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006061,
        "dEQP-GLES3.functional.shaders.indexing.tmp_arr",
        "ay.float_dynamic_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006062,
        "dEQP-GLES3.functional.shaders.indexing.tmp_arra",
        "y.float_dynamic_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006063,
        "dEQP-GLES3.functional.shaders.indexing.tmp_ar",
        "ray.float_static_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006064,
        "dEQP-GLES3.functional.shaders.indexing.tmp_arr",
        "ay.float_static_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006065,
        "dEQP-GLES3.functional.shaders.indexing.tmp_arr",
        "ay.float_static_loop_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006066,
        "dEQP-GLES3.functional.shaders.indexing.tmp_arra",
        "y.float_static_loop_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006067,
        "dEQP-GLES3.functional.shaders.indexing.tmp_array",
        ".float_static_loop_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006068,
        "dEQP-GLES3.functional.shaders.indexing.tmp_array.",
        "float_static_loop_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006069,
        "dEQP-GLES3.functional.shaders.indexing.tmp_array",
        ".float_static_loop_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006070,
        "dEQP-GLES3.functional.shaders.indexing.tmp_array.",
        "float_static_loop_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006071,
        "dEQP-GLES3.functional.shaders.indexing.tmp_arr",
        "ay.float_dynamic_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006072,
        "dEQP-GLES3.functional.shaders.indexing.tmp_arra",
        "y.float_dynamic_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006073,
        "dEQP-GLES3.functional.shaders.indexing.tmp_arr",
        "ay.float_dynamic_loop_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006074,
        "dEQP-GLES3.functional.shaders.indexing.tmp_arra",
        "y.float_dynamic_loop_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006075,
        "dEQP-GLES3.functional.shaders.indexing.tmp_array",
        ".float_dynamic_loop_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006076,
        "dEQP-GLES3.functional.shaders.indexing.tmp_array.",
        "float_dynamic_loop_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006077,
        "dEQP-GLES3.functional.shaders.indexing.tmp_array.",
        "float_dynamic_loop_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006078,
        "dEQP-GLES3.functional.shaders.indexing.tmp_array.f",
        "loat_dynamic_loop_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006079,
        "dEQP-GLES3.functional.shaders.indexing.tmp",
        "_array.vec2_static_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006080,
        "dEQP-GLES3.functional.shaders.indexing.tmp_",
        "array.vec2_static_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006081,
        "dEQP-GLES3.functional.shaders.indexing.tmp_",
        "array.vec2_static_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006082,
        "dEQP-GLES3.functional.shaders.indexing.tmp_a",
        "rray.vec2_static_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006083,
        "dEQP-GLES3.functional.shaders.indexing.tmp_ar",
        "ray.vec2_static_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006084,
        "dEQP-GLES3.functional.shaders.indexing.tmp_arr",
        "ay.vec2_static_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006085,
        "dEQP-GLES3.functional.shaders.indexing.tmp_ar",
        "ray.vec2_static_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006086,
        "dEQP-GLES3.functional.shaders.indexing.tmp_arr",
        "ay.vec2_static_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006087,
        "dEQP-GLES3.functional.shaders.indexing.tmp_",
        "array.vec2_dynamic_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006088,
        "dEQP-GLES3.functional.shaders.indexing.tmp_a",
        "rray.vec2_dynamic_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006089,
        "dEQP-GLES3.functional.shaders.indexing.tmp_",
        "array.vec2_dynamic_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006090,
        "dEQP-GLES3.functional.shaders.indexing.tmp_a",
        "rray.vec2_dynamic_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006091,
        "dEQP-GLES3.functional.shaders.indexing.tmp_ar",
        "ray.vec2_dynamic_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006092,
        "dEQP-GLES3.functional.shaders.indexing.tmp_arr",
        "ay.vec2_dynamic_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006093,
        "dEQP-GLES3.functional.shaders.indexing.tmp_arr",
        "ay.vec2_dynamic_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006094,
        "dEQP-GLES3.functional.shaders.indexing.tmp_arra",
        "y.vec2_dynamic_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006095,
        "dEQP-GLES3.functional.shaders.indexing.tmp_ar",
        "ray.vec2_static_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006096,
        "dEQP-GLES3.functional.shaders.indexing.tmp_arr",
        "ay.vec2_static_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006097,
        "dEQP-GLES3.functional.shaders.indexing.tmp_ar",
        "ray.vec2_static_loop_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006098,
        "dEQP-GLES3.functional.shaders.indexing.tmp_arr",
        "ay.vec2_static_loop_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006099,
        "dEQP-GLES3.functional.shaders.indexing.tmp_arra",
        "y.vec2_static_loop_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006100,
        "dEQP-GLES3.functional.shaders.indexing.tmp_array",
        ".vec2_static_loop_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006101,
        "dEQP-GLES3.functional.shaders.indexing.tmp_array",
        ".vec2_static_loop_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006102,
        "dEQP-GLES3.functional.shaders.indexing.tmp_array.",
        "vec2_static_loop_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006103,
        "dEQP-GLES3.functional.shaders.indexing.tmp_ar",
        "ray.vec2_dynamic_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006104,
        "dEQP-GLES3.functional.shaders.indexing.tmp_arr",
        "ay.vec2_dynamic_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006105,
        "dEQP-GLES3.functional.shaders.indexing.tmp_arr",
        "ay.vec2_dynamic_loop_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006106,
        "dEQP-GLES3.functional.shaders.indexing.tmp_arra",
        "y.vec2_dynamic_loop_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006107,
        "dEQP-GLES3.functional.shaders.indexing.tmp_array",
        ".vec2_dynamic_loop_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006108,
        "dEQP-GLES3.functional.shaders.indexing.tmp_array.",
        "vec2_dynamic_loop_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006109,
        "dEQP-GLES3.functional.shaders.indexing.tmp_array",
        ".vec2_dynamic_loop_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006110,
        "dEQP-GLES3.functional.shaders.indexing.tmp_array.",
        "vec2_dynamic_loop_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006111,
        "dEQP-GLES3.functional.shaders.indexing.tmp",
        "_array.vec3_static_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006112,
        "dEQP-GLES3.functional.shaders.indexing.tmp_",
        "array.vec3_static_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006113,
        "dEQP-GLES3.functional.shaders.indexing.tmp_",
        "array.vec3_static_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006114,
        "dEQP-GLES3.functional.shaders.indexing.tmp_a",
        "rray.vec3_static_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006115,
        "dEQP-GLES3.functional.shaders.indexing.tmp_ar",
        "ray.vec3_static_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006116,
        "dEQP-GLES3.functional.shaders.indexing.tmp_arr",
        "ay.vec3_static_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006117,
        "dEQP-GLES3.functional.shaders.indexing.tmp_ar",
        "ray.vec3_static_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006118,
        "dEQP-GLES3.functional.shaders.indexing.tmp_arr",
        "ay.vec3_static_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006119,
        "dEQP-GLES3.functional.shaders.indexing.tmp_",
        "array.vec3_dynamic_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006120,
        "dEQP-GLES3.functional.shaders.indexing.tmp_a",
        "rray.vec3_dynamic_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006121,
        "dEQP-GLES3.functional.shaders.indexing.tmp_",
        "array.vec3_dynamic_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006122,
        "dEQP-GLES3.functional.shaders.indexing.tmp_a",
        "rray.vec3_dynamic_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006123,
        "dEQP-GLES3.functional.shaders.indexing.tmp_ar",
        "ray.vec3_dynamic_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006124,
        "dEQP-GLES3.functional.shaders.indexing.tmp_arr",
        "ay.vec3_dynamic_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006125,
        "dEQP-GLES3.functional.shaders.indexing.tmp_arr",
        "ay.vec3_dynamic_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006126,
        "dEQP-GLES3.functional.shaders.indexing.tmp_arra",
        "y.vec3_dynamic_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006127,
        "dEQP-GLES3.functional.shaders.indexing.tmp_ar",
        "ray.vec3_static_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006128,
        "dEQP-GLES3.functional.shaders.indexing.tmp_arr",
        "ay.vec3_static_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006129,
        "dEQP-GLES3.functional.shaders.indexing.tmp_ar",
        "ray.vec3_static_loop_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006130,
        "dEQP-GLES3.functional.shaders.indexing.tmp_arr",
        "ay.vec3_static_loop_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006131,
        "dEQP-GLES3.functional.shaders.indexing.tmp_arra",
        "y.vec3_static_loop_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006132,
        "dEQP-GLES3.functional.shaders.indexing.tmp_array",
        ".vec3_static_loop_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006133,
        "dEQP-GLES3.functional.shaders.indexing.tmp_array",
        ".vec3_static_loop_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006134,
        "dEQP-GLES3.functional.shaders.indexing.tmp_array.",
        "vec3_static_loop_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006135,
        "dEQP-GLES3.functional.shaders.indexing.tmp_ar",
        "ray.vec3_dynamic_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006136,
        "dEQP-GLES3.functional.shaders.indexing.tmp_arr",
        "ay.vec3_dynamic_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006137,
        "dEQP-GLES3.functional.shaders.indexing.tmp_arr",
        "ay.vec3_dynamic_loop_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006138,
        "dEQP-GLES3.functional.shaders.indexing.tmp_arra",
        "y.vec3_dynamic_loop_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006139,
        "dEQP-GLES3.functional.shaders.indexing.tmp_array",
        ".vec3_dynamic_loop_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006140,
        "dEQP-GLES3.functional.shaders.indexing.tmp_array.",
        "vec3_dynamic_loop_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006141,
        "dEQP-GLES3.functional.shaders.indexing.tmp_array",
        ".vec3_dynamic_loop_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006142,
        "dEQP-GLES3.functional.shaders.indexing.tmp_array.",
        "vec3_dynamic_loop_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006143,
        "dEQP-GLES3.functional.shaders.indexing.tmp",
        "_array.vec4_static_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006144,
        "dEQP-GLES3.functional.shaders.indexing.tmp_",
        "array.vec4_static_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006145,
        "dEQP-GLES3.functional.shaders.indexing.tmp_",
        "array.vec4_static_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006146,
        "dEQP-GLES3.functional.shaders.indexing.tmp_a",
        "rray.vec4_static_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006147,
        "dEQP-GLES3.functional.shaders.indexing.tmp_ar",
        "ray.vec4_static_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006148,
        "dEQP-GLES3.functional.shaders.indexing.tmp_arr",
        "ay.vec4_static_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006149,
        "dEQP-GLES3.functional.shaders.indexing.tmp_ar",
        "ray.vec4_static_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006150,
        "dEQP-GLES3.functional.shaders.indexing.tmp_arr",
        "ay.vec4_static_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006151,
        "dEQP-GLES3.functional.shaders.indexing.tmp_",
        "array.vec4_dynamic_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006152,
        "dEQP-GLES3.functional.shaders.indexing.tmp_a",
        "rray.vec4_dynamic_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006153,
        "dEQP-GLES3.functional.shaders.indexing.tmp_",
        "array.vec4_dynamic_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006154,
        "dEQP-GLES3.functional.shaders.indexing.tmp_a",
        "rray.vec4_dynamic_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006155,
        "dEQP-GLES3.functional.shaders.indexing.tmp_ar",
        "ray.vec4_dynamic_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006156,
        "dEQP-GLES3.functional.shaders.indexing.tmp_arr",
        "ay.vec4_dynamic_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006157,
        "dEQP-GLES3.functional.shaders.indexing.tmp_arr",
        "ay.vec4_dynamic_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006158,
        "dEQP-GLES3.functional.shaders.indexing.tmp_arra",
        "y.vec4_dynamic_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006159,
        "dEQP-GLES3.functional.shaders.indexing.tmp_ar",
        "ray.vec4_static_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006160,
        "dEQP-GLES3.functional.shaders.indexing.tmp_arr",
        "ay.vec4_static_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006161,
        "dEQP-GLES3.functional.shaders.indexing.tmp_ar",
        "ray.vec4_static_loop_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006162,
        "dEQP-GLES3.functional.shaders.indexing.tmp_arr",
        "ay.vec4_static_loop_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006163,
        "dEQP-GLES3.functional.shaders.indexing.tmp_arra",
        "y.vec4_static_loop_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006164,
        "dEQP-GLES3.functional.shaders.indexing.tmp_array",
        ".vec4_static_loop_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006165,
        "dEQP-GLES3.functional.shaders.indexing.tmp_array",
        ".vec4_static_loop_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006166,
        "dEQP-GLES3.functional.shaders.indexing.tmp_array.",
        "vec4_static_loop_write_dynamic_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006167,
        "dEQP-GLES3.functional.shaders.indexing.tmp_ar",
        "ray.vec4_dynamic_loop_write_static_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006168,
        "dEQP-GLES3.functional.shaders.indexing.tmp_arr",
        "ay.vec4_dynamic_loop_write_static_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006169,
        "dEQP-GLES3.functional.shaders.indexing.tmp_arr",
        "ay.vec4_dynamic_loop_write_dynamic_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006170,
        "dEQP-GLES3.functional.shaders.indexing.tmp_arra",
        "y.vec4_dynamic_loop_write_dynamic_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006171,
        "dEQP-GLES3.functional.shaders.indexing.tmp_array",
        ".vec4_dynamic_loop_write_static_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006172,
        "dEQP-GLES3.functional.shaders.indexing.tmp_array.",
        "vec4_dynamic_loop_write_static_loop_read_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006173,
        "dEQP-GLES3.functional.shaders.indexing.tmp_array",
        ".vec4_dynamic_loop_write_dynamic_loop_read_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006174,
        "dEQP-GLES3.functional.shaders.indexing.tmp_array.",
        "vec4_dynamic_loop_write_dynamic_loop_read_fragment");
