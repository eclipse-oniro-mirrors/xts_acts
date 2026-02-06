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
#include "../ActsDeqpgles30009TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008984,
        "dEQP-GLES3.functional.shaders.operator.b",
        "inary_operator.bitwise_or.lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008985,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.bitwise_or.lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008986,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.bitwise_or.mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008987,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.bitwise_or.mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008988,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.bitwise_or.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008989,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.bitwise_or.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008990,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.bitwise_or.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008991,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.bitwise_or.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008992,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.bitwise_or.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008993,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.bitwise_or.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008994,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.bitwise_or.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008995,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.bitwise_or.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008996,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.bitwise_or.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008997,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.bitwise_or.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008998,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.bitwise_or.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008999,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.bitwise_or.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009000,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.bitwise_or.highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009001,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.bitwise_or.highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009002,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.bitwise_or.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009003,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.bitwise_or.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009004,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.bitwise_or.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009005,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.bitwise_or.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009006,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.bitwise_or.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009007,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.bitwise_or.highp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009008,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.bitwise_or.lowp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009009,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.bitwise_or.lowp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009010,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.bitwise_or.mediump_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009011,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.bitwise_or.mediump_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009012,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.bitwise_or.lowp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009013,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.bitwise_or.lowp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009014,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.bitwise_or.mediump_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009015,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.bitwise_or.mediump_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009016,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.bitwise_or.lowp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009017,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.bitwise_or.lowp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009018,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.bitwise_or.mediump_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009019,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.bitwise_or.mediump_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009020,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.bitwise_or.lowp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009021,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.bitwise_or.lowp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009022,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.bitwise_or.mediump_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009023,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.bitwise_or.mediump_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009024,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.bitwise_or.highp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009025,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.bitwise_or.highp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009026,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.bitwise_or.highp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009027,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.bitwise_or.highp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009028,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.bitwise_or.highp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009029,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.bitwise_or.highp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009030,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.bitwise_or.highp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009031,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.bitwise_or.highp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009032,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.bitwise_or.lowp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009033,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.bitwise_or.lowp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009034,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_or.mediump_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009035,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.bitwise_or.mediump_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009036,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.bitwise_or.lowp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009037,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.bitwise_or.lowp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009038,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_or.mediump_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009039,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.bitwise_or.mediump_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009040,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.bitwise_or.lowp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009041,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.bitwise_or.lowp_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009042,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_or.mediump_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009043,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.bitwise_or.mediump_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009044,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.bitwise_or.highp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009045,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_or.highp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009046,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.bitwise_or.highp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009047,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_or.highp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009048,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.bitwise_or.highp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009049,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_or.highp_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009050,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.bitwise_or.lowp_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009051,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_or.lowp_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009052,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_or.mediump_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009053,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.bitwise_or.mediump_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009054,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.bitwise_or.lowp_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009055,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_or.lowp_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009056,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_or.mediump_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009057,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.bitwise_or.mediump_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009058,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.bitwise_or.lowp_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009059,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_or.lowp_uvec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009060,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_or.mediump_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009061,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.bitwise_or.mediump_uvec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009062,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.bitwise_or.highp_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009063,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_or.highp_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009064,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.bitwise_or.highp_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009065,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_or.highp_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009066,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.bitwise_or.highp_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009067,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_or.highp_uvec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009068,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.bitwise_or.lowp_int_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009069,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.bitwise_or.lowp_int_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009070,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_or.mediump_int_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009071,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.bitwise_or.mediump_int_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009072,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.bitwise_or.lowp_int_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009073,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.bitwise_or.lowp_int_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009074,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_or.mediump_int_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009075,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.bitwise_or.mediump_int_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009076,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.bitwise_or.lowp_int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009077,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.bitwise_or.lowp_int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009078,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_or.mediump_int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009079,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.bitwise_or.mediump_int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009080,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.bitwise_or.highp_int_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009081,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_or.highp_int_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009082,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.bitwise_or.highp_int_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009083,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_or.highp_int_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009084,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.bitwise_or.highp_int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009085,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_or.highp_int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009086,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.bitwise_or.lowp_uint_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009087,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_or.lowp_uint_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009088,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_or.mediump_uint_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009089,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.bitwise_or.mediump_uint_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009090,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.bitwise_or.lowp_uint_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009091,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_or.lowp_uint_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009092,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_or.mediump_uint_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009093,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.bitwise_or.mediump_uint_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009094,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.bitwise_or.lowp_uint_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009095,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_or.lowp_uint_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009096,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_or.mediump_uint_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009097,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.bitwise_or.mediump_uint_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009098,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.bitwise_or.highp_uint_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009099,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_or.highp_uint_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009100,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.bitwise_or.highp_uint_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009101,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_or.highp_uint_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009102,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.bitwise_or.highp_uint_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_009103,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_or.highp_uint_uvec4_fragment");
