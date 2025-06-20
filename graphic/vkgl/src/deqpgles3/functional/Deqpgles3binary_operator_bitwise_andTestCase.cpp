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

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008864,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.bitwise_and.lowp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008865,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.bitwise_and.lowp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008866,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.bitwise_and.mediump_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008867,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.bitwise_and.mediump_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008868,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.bitwise_and.lowp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008869,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.bitwise_and.lowp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008870,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.bitwise_and.mediump_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008871,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.bitwise_and.mediump_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008872,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.bitwise_and.lowp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008873,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.bitwise_and.lowp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008874,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.bitwise_and.mediump_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008875,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.bitwise_and.mediump_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008876,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.bitwise_and.lowp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008877,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.bitwise_and.lowp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008878,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.bitwise_and.mediump_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008879,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.bitwise_and.mediump_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008880,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.bitwise_and.highp_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008881,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.bitwise_and.highp_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008882,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.bitwise_and.highp_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008883,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.bitwise_and.highp_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008884,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.bitwise_and.highp_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008885,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.bitwise_and.highp_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008886,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.bitwise_and.highp_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008887,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.bitwise_and.highp_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008888,
        "dEQP-GLES3.functional.shaders.operator.bi",
        "nary_operator.bitwise_and.lowp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008889,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.bitwise_and.lowp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008890,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.bitwise_and.mediump_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008891,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.bitwise_and.mediump_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008892,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.bitwise_and.lowp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008893,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.bitwise_and.lowp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008894,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.bitwise_and.mediump_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008895,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.bitwise_and.mediump_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008896,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.bitwise_and.lowp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008897,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.bitwise_and.lowp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008898,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.bitwise_and.mediump_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008899,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.bitwise_and.mediump_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008900,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.bitwise_and.lowp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008901,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.bitwise_and.lowp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008902,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.bitwise_and.mediump_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008903,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.bitwise_and.mediump_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008904,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.bitwise_and.highp_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008905,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.bitwise_and.highp_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008906,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.bitwise_and.highp_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008907,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.bitwise_and.highp_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008908,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.bitwise_and.highp_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008909,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.bitwise_and.highp_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008910,
        "dEQP-GLES3.functional.shaders.operator.bin",
        "ary_operator.bitwise_and.highp_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008911,
        "dEQP-GLES3.functional.shaders.operator.bina",
        "ry_operator.bitwise_and.highp_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008912,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.bitwise_and.lowp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008913,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_and.lowp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008914,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_and.mediump_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008915,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.bitwise_and.mediump_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008916,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.bitwise_and.lowp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008917,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_and.lowp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008918,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_and.mediump_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008919,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.bitwise_and.mediump_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008920,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.bitwise_and.lowp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008921,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_and.lowp_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008922,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_and.mediump_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008923,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.bitwise_and.mediump_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008924,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.bitwise_and.highp_ivec2_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008925,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_and.highp_ivec2_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008926,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.bitwise_and.highp_ivec3_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008927,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_and.highp_ivec3_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008928,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.bitwise_and.highp_ivec4_int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008929,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_and.highp_ivec4_int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008930,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.bitwise_and.lowp_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008931,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_and.lowp_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008932,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.bitwise_and.mediump_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008933,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.bitwise_and.mediump_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008934,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.bitwise_and.lowp_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008935,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_and.lowp_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008936,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.bitwise_and.mediump_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008937,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.bitwise_and.mediump_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008938,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.bitwise_and.lowp_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008939,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_and.lowp_uvec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008940,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.bitwise_and.mediump_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008941,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.bitwise_and.mediump_uvec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008942,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_and.highp_uvec2_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008943,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.bitwise_and.highp_uvec2_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008944,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_and.highp_uvec3_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008945,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.bitwise_and.highp_uvec3_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008946,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_and.highp_uvec4_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008947,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.bitwise_and.highp_uvec4_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008948,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.bitwise_and.lowp_int_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008949,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_and.lowp_int_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008950,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_and.mediump_int_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008951,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.bitwise_and.mediump_int_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008952,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.bitwise_and.lowp_int_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008953,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_and.lowp_int_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008954,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_and.mediump_int_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008955,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.bitwise_and.mediump_int_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008956,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.bitwise_and.lowp_int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008957,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_and.lowp_int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008958,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_and.mediump_int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008959,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.bitwise_and.mediump_int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008960,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.bitwise_and.highp_int_ivec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008961,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_and.highp_int_ivec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008962,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.bitwise_and.highp_int_ivec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008963,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_and.highp_int_ivec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008964,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.bitwise_and.highp_int_ivec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008965,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_and.highp_int_ivec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008966,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.bitwise_and.lowp_uint_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008967,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_and.lowp_uint_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008968,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.bitwise_and.mediump_uint_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008969,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.bitwise_and.mediump_uint_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008970,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.bitwise_and.lowp_uint_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008971,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_and.lowp_uint_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008972,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.bitwise_and.mediump_uint_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008973,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.bitwise_and.mediump_uint_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008974,
        "dEQP-GLES3.functional.shaders.operator.binar",
        "y_operator.bitwise_and.lowp_uint_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008975,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_and.lowp_uint_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008976,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.bitwise_and.mediump_uint_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008977,
        "dEQP-GLES3.functional.shaders.operator.binary_o",
        "perator.bitwise_and.mediump_uint_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008978,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_and.highp_uint_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008979,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.bitwise_and.highp_uint_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008980,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_and.highp_uint_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008981,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.bitwise_and.highp_uint_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008982,
        "dEQP-GLES3.functional.shaders.operator.binary",
        "_operator.bitwise_and.highp_uint_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30009TestSuite, TestCase_008983,
        "dEQP-GLES3.functional.shaders.operator.binary_",
        "operator.bitwise_and.highp_uint_uvec4_fragment");
