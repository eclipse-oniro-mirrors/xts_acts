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
#include "../Khrgles3BaseFunc.h"
#include "../ActsKhrgles30001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000029,
        "KHR-GLES3.shaders.indexing.varying_a",
        "rray.float_static_write_dynamic_read");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000030,
        "KHR-GLES3.shaders.indexing.varying_arr",
        "ay.float_static_write_static_loop_read");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000031,
        "KHR-GLES3.shaders.indexing.varying_arr",
        "ay.float_static_write_dynamic_loop_read");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000032,
        "KHR-GLES3.shaders.indexing.varying_a",
        "rray.float_dynamic_write_static_read");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000033,
        "KHR-GLES3.shaders.indexing.varying_a",
        "rray.float_dynamic_write_dynamic_read");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000034,
        "KHR-GLES3.shaders.indexing.varying_arr",
        "ay.float_dynamic_write_static_loop_read");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000035,
        "KHR-GLES3.shaders.indexing.varying_arra",
        "y.float_dynamic_write_dynamic_loop_read");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000036,
        "KHR-GLES3.shaders.indexing.varying_arr",
        "ay.float_static_loop_write_static_read");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000037,
        "KHR-GLES3.shaders.indexing.varying_arr",
        "ay.float_static_loop_write_dynamic_read");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000038,
        "KHR-GLES3.shaders.indexing.varying_array",
        ".float_static_loop_write_static_loop_read");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000039,
        "KHR-GLES3.shaders.indexing.varying_array.",
        "float_static_loop_write_dynamic_loop_read");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000040,
        "KHR-GLES3.shaders.indexing.varying_arr",
        "ay.float_dynamic_loop_write_static_read");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000041,
        "KHR-GLES3.shaders.indexing.varying_arra",
        "y.float_dynamic_loop_write_dynamic_read");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000042,
        "KHR-GLES3.shaders.indexing.varying_array.",
        "float_dynamic_loop_write_static_loop_read");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000043,
        "KHR-GLES3.shaders.indexing.varying_array.",
        "float_dynamic_loop_write_dynamic_loop_read");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000044,
        "KHR-GLES3.shaders.indexing.varying_",
        "array.vec2_static_write_dynamic_read");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000045,
        "KHR-GLES3.shaders.indexing.varying_ar",
        "ray.vec2_static_write_static_loop_read");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000046,
        "KHR-GLES3.shaders.indexing.varying_arr",
        "ay.vec2_static_write_dynamic_loop_read");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000047,
        "KHR-GLES3.shaders.indexing.varying_",
        "array.vec2_dynamic_write_static_read");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000048,
        "KHR-GLES3.shaders.indexing.varying_a",
        "rray.vec2_dynamic_write_dynamic_read");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000049,
        "KHR-GLES3.shaders.indexing.varying_arr",
        "ay.vec2_dynamic_write_static_loop_read");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000050,
        "KHR-GLES3.shaders.indexing.varying_arr",
        "ay.vec2_dynamic_write_dynamic_loop_read");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000051,
        "KHR-GLES3.shaders.indexing.varying_ar",
        "ray.vec2_static_loop_write_static_read");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000052,
        "KHR-GLES3.shaders.indexing.varying_arr",
        "ay.vec2_static_loop_write_dynamic_read");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000053,
        "KHR-GLES3.shaders.indexing.varying_array",
        ".vec2_static_loop_write_static_loop_read");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000054,
        "KHR-GLES3.shaders.indexing.varying_array",
        ".vec2_static_loop_write_dynamic_loop_read");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000055,
        "KHR-GLES3.shaders.indexing.varying_arr",
        "ay.vec2_dynamic_loop_write_static_read");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000056,
        "KHR-GLES3.shaders.indexing.varying_arr",
        "ay.vec2_dynamic_loop_write_dynamic_read");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000057,
        "KHR-GLES3.shaders.indexing.varying_array",
        ".vec2_dynamic_loop_write_static_loop_read");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000058,
        "KHR-GLES3.shaders.indexing.varying_array.",
        "vec2_dynamic_loop_write_dynamic_loop_read");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000059,
        "KHR-GLES3.shaders.indexing.varying_",
        "array.vec3_static_write_dynamic_read");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000060,
        "KHR-GLES3.shaders.indexing.varying_ar",
        "ray.vec3_static_write_static_loop_read");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000061,
        "KHR-GLES3.shaders.indexing.varying_arr",
        "ay.vec3_static_write_dynamic_loop_read");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000062,
        "KHR-GLES3.shaders.indexing.varying_",
        "array.vec3_dynamic_write_static_read");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000063,
        "KHR-GLES3.shaders.indexing.varying_a",
        "rray.vec3_dynamic_write_dynamic_read");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000064,
        "KHR-GLES3.shaders.indexing.varying_arr",
        "ay.vec3_dynamic_write_static_loop_read");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000065,
        "KHR-GLES3.shaders.indexing.varying_arr",
        "ay.vec3_dynamic_write_dynamic_loop_read");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000066,
        "KHR-GLES3.shaders.indexing.varying_ar",
        "ray.vec3_static_loop_write_static_read");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000067,
        "KHR-GLES3.shaders.indexing.varying_arr",
        "ay.vec3_static_loop_write_dynamic_read");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000068,
        "KHR-GLES3.shaders.indexing.varying_array",
        ".vec3_static_loop_write_static_loop_read");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000069,
        "KHR-GLES3.shaders.indexing.varying_array",
        ".vec3_static_loop_write_dynamic_loop_read");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000070,
        "KHR-GLES3.shaders.indexing.varying_arr",
        "ay.vec3_dynamic_loop_write_static_read");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000071,
        "KHR-GLES3.shaders.indexing.varying_arr",
        "ay.vec3_dynamic_loop_write_dynamic_read");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000072,
        "KHR-GLES3.shaders.indexing.varying_array",
        ".vec3_dynamic_loop_write_static_loop_read");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000073,
        "KHR-GLES3.shaders.indexing.varying_array.",
        "vec3_dynamic_loop_write_dynamic_loop_read");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000074,
        "KHR-GLES3.shaders.indexing.varying_",
        "array.vec4_static_write_dynamic_read");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000075,
        "KHR-GLES3.shaders.indexing.varying_ar",
        "ray.vec4_static_write_static_loop_read");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000076,
        "KHR-GLES3.shaders.indexing.varying_arr",
        "ay.vec4_static_write_dynamic_loop_read");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000077,
        "KHR-GLES3.shaders.indexing.varying_",
        "array.vec4_dynamic_write_static_read");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000078,
        "KHR-GLES3.shaders.indexing.varying_a",
        "rray.vec4_dynamic_write_dynamic_read");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000079,
        "KHR-GLES3.shaders.indexing.varying_arr",
        "ay.vec4_dynamic_write_static_loop_read");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000080,
        "KHR-GLES3.shaders.indexing.varying_arr",
        "ay.vec4_dynamic_write_dynamic_loop_read");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000081,
        "KHR-GLES3.shaders.indexing.varying_ar",
        "ray.vec4_static_loop_write_static_read");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000082,
        "KHR-GLES3.shaders.indexing.varying_arr",
        "ay.vec4_static_loop_write_dynamic_read");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000083,
        "KHR-GLES3.shaders.indexing.varying_array",
        ".vec4_static_loop_write_static_loop_read");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000084,
        "KHR-GLES3.shaders.indexing.varying_array",
        ".vec4_static_loop_write_dynamic_loop_read");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000085,
        "KHR-GLES3.shaders.indexing.varying_arr",
        "ay.vec4_dynamic_loop_write_static_read");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000086,
        "KHR-GLES3.shaders.indexing.varying_arr",
        "ay.vec4_dynamic_loop_write_dynamic_read");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000087,
        "KHR-GLES3.shaders.indexing.varying_array",
        ".vec4_dynamic_loop_write_static_loop_read");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000088,
        "KHR-GLES3.shaders.indexing.varying_array.",
        "vec4_dynamic_loop_write_dynamic_loop_read");
