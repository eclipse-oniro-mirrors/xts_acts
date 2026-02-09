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
#include "../Deqpgles31BaseFunc.h"
#include "../ActsDeqpgles310009TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008695,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.std430.lowp_float");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008696,
        "dEQP-GLES31.functional.ssbo.layout.s",
        "ingle_basic_type.std430.mediump_float");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008697,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.std430.highp_float");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008698,
        "dEQP-GLES31.functional.ssbo.layout",
        ".single_basic_type.std430.lowp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008699,
        "dEQP-GLES31.functional.ssbo.layout.s",
        "ingle_basic_type.std430.mediump_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008700,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.std430.highp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008701,
        "dEQP-GLES31.functional.ssbo.layout",
        ".single_basic_type.std430.lowp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008702,
        "dEQP-GLES31.functional.ssbo.layout.s",
        "ingle_basic_type.std430.mediump_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008703,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.std430.highp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008704,
        "dEQP-GLES31.functional.ssbo.layout",
        ".single_basic_type.std430.lowp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008705,
        "dEQP-GLES31.functional.ssbo.layout.s",
        "ingle_basic_type.std430.mediump_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008706,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.std430.highp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008707,
        "dEQP-GLES31.functional.ssbo.layout",
        ".single_basic_type.std430.lowp_int");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008708,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.std430.mediump_int");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008709,
        "dEQP-GLES31.functional.ssbo.layout",
        ".single_basic_type.std430.highp_int");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008710,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.std430.lowp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008711,
        "dEQP-GLES31.functional.ssbo.layout.s",
        "ingle_basic_type.std430.mediump_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008712,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.std430.highp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008713,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.std430.lowp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008714,
        "dEQP-GLES31.functional.ssbo.layout.s",
        "ingle_basic_type.std430.mediump_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008715,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.std430.highp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008716,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.std430.lowp_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008717,
        "dEQP-GLES31.functional.ssbo.layout.s",
        "ingle_basic_type.std430.mediump_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008718,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.std430.highp_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008719,
        "dEQP-GLES31.functional.ssbo.layout",
        ".single_basic_type.std430.lowp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008720,
        "dEQP-GLES31.functional.ssbo.layout.s",
        "ingle_basic_type.std430.mediump_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008721,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.std430.highp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008722,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.std430.lowp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008723,
        "dEQP-GLES31.functional.ssbo.layout.s",
        "ingle_basic_type.std430.mediump_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008724,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.std430.highp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008725,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.std430.lowp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008726,
        "dEQP-GLES31.functional.ssbo.layout.s",
        "ingle_basic_type.std430.mediump_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008727,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.std430.highp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008728,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.std430.lowp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008729,
        "dEQP-GLES31.functional.ssbo.layout.s",
        "ingle_basic_type.std430.mediump_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008730,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.std430.highp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008731,
        "dEQP-GLES31.functional.ssbo.layo",
        "ut.single_basic_type.std430.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008732,
        "dEQP-GLES31.functional.ssbo.layo",
        "ut.single_basic_type.std430.bvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008733,
        "dEQP-GLES31.functional.ssbo.layo",
        "ut.single_basic_type.std430.bvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008734,
        "dEQP-GLES31.functional.ssbo.layo",
        "ut.single_basic_type.std430.bvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008735,
        "dEQP-GLES31.functional.ssbo.layout",
        ".single_basic_type.std430.lowp_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008736,
        "dEQP-GLES31.functional.ssbo.layout.s",
        "ingle_basic_type.std430.mediump_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008737,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.std430.highp_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008738,
        "dEQP-GLES31.functional.ssbo.layout.sing",
        "le_basic_type.std430.row_major_lowp_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008739,
        "dEQP-GLES31.functional.ssbo.layout.single",
        "_basic_type.std430.row_major_mediump_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008740,
        "dEQP-GLES31.functional.ssbo.layout.singl",
        "e_basic_type.std430.row_major_highp_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008741,
        "dEQP-GLES31.functional.ssbo.layout.single",
        "_basic_type.std430.column_major_lowp_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008742,
        "dEQP-GLES31.functional.ssbo.layout.single_",
        "basic_type.std430.column_major_mediump_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008743,
        "dEQP-GLES31.functional.ssbo.layout.single",
        "_basic_type.std430.column_major_highp_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008744,
        "dEQP-GLES31.functional.ssbo.layout",
        ".single_basic_type.std430.lowp_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008745,
        "dEQP-GLES31.functional.ssbo.layout.s",
        "ingle_basic_type.std430.mediump_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008746,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.std430.highp_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008747,
        "dEQP-GLES31.functional.ssbo.layout.sing",
        "le_basic_type.std430.row_major_lowp_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008748,
        "dEQP-GLES31.functional.ssbo.layout.single",
        "_basic_type.std430.row_major_mediump_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008749,
        "dEQP-GLES31.functional.ssbo.layout.singl",
        "e_basic_type.std430.row_major_highp_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008750,
        "dEQP-GLES31.functional.ssbo.layout.single",
        "_basic_type.std430.column_major_lowp_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008751,
        "dEQP-GLES31.functional.ssbo.layout.single_",
        "basic_type.std430.column_major_mediump_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008752,
        "dEQP-GLES31.functional.ssbo.layout.single",
        "_basic_type.std430.column_major_highp_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008753,
        "dEQP-GLES31.functional.ssbo.layout",
        ".single_basic_type.std430.lowp_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008754,
        "dEQP-GLES31.functional.ssbo.layout.s",
        "ingle_basic_type.std430.mediump_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008755,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.std430.highp_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008756,
        "dEQP-GLES31.functional.ssbo.layout.sing",
        "le_basic_type.std430.row_major_lowp_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008757,
        "dEQP-GLES31.functional.ssbo.layout.single",
        "_basic_type.std430.row_major_mediump_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008758,
        "dEQP-GLES31.functional.ssbo.layout.singl",
        "e_basic_type.std430.row_major_highp_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008759,
        "dEQP-GLES31.functional.ssbo.layout.single",
        "_basic_type.std430.column_major_lowp_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008760,
        "dEQP-GLES31.functional.ssbo.layout.single_",
        "basic_type.std430.column_major_mediump_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008761,
        "dEQP-GLES31.functional.ssbo.layout.single",
        "_basic_type.std430.column_major_highp_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008762,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.std430.lowp_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008763,
        "dEQP-GLES31.functional.ssbo.layout.si",
        "ngle_basic_type.std430.mediump_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008764,
        "dEQP-GLES31.functional.ssbo.layout.s",
        "ingle_basic_type.std430.highp_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008765,
        "dEQP-GLES31.functional.ssbo.layout.singl",
        "e_basic_type.std430.row_major_lowp_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008766,
        "dEQP-GLES31.functional.ssbo.layout.single_",
        "basic_type.std430.row_major_mediump_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008767,
        "dEQP-GLES31.functional.ssbo.layout.single",
        "_basic_type.std430.row_major_highp_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008768,
        "dEQP-GLES31.functional.ssbo.layout.single_",
        "basic_type.std430.column_major_lowp_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008769,
        "dEQP-GLES31.functional.ssbo.layout.single_b",
        "asic_type.std430.column_major_mediump_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008770,
        "dEQP-GLES31.functional.ssbo.layout.single_",
        "basic_type.std430.column_major_highp_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008771,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.std430.lowp_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008772,
        "dEQP-GLES31.functional.ssbo.layout.si",
        "ngle_basic_type.std430.mediump_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008773,
        "dEQP-GLES31.functional.ssbo.layout.s",
        "ingle_basic_type.std430.highp_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008774,
        "dEQP-GLES31.functional.ssbo.layout.singl",
        "e_basic_type.std430.row_major_lowp_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008775,
        "dEQP-GLES31.functional.ssbo.layout.single_",
        "basic_type.std430.row_major_mediump_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008776,
        "dEQP-GLES31.functional.ssbo.layout.single",
        "_basic_type.std430.row_major_highp_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008777,
        "dEQP-GLES31.functional.ssbo.layout.single_",
        "basic_type.std430.column_major_lowp_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008778,
        "dEQP-GLES31.functional.ssbo.layout.single_b",
        "asic_type.std430.column_major_mediump_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008779,
        "dEQP-GLES31.functional.ssbo.layout.single_",
        "basic_type.std430.column_major_highp_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008780,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.std430.lowp_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008781,
        "dEQP-GLES31.functional.ssbo.layout.si",
        "ngle_basic_type.std430.mediump_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008782,
        "dEQP-GLES31.functional.ssbo.layout.s",
        "ingle_basic_type.std430.highp_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008783,
        "dEQP-GLES31.functional.ssbo.layout.singl",
        "e_basic_type.std430.row_major_lowp_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008784,
        "dEQP-GLES31.functional.ssbo.layout.single_",
        "basic_type.std430.row_major_mediump_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008785,
        "dEQP-GLES31.functional.ssbo.layout.single",
        "_basic_type.std430.row_major_highp_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008786,
        "dEQP-GLES31.functional.ssbo.layout.single_",
        "basic_type.std430.column_major_lowp_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008787,
        "dEQP-GLES31.functional.ssbo.layout.single_b",
        "asic_type.std430.column_major_mediump_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008788,
        "dEQP-GLES31.functional.ssbo.layout.single_",
        "basic_type.std430.column_major_highp_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008789,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.std430.lowp_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008790,
        "dEQP-GLES31.functional.ssbo.layout.si",
        "ngle_basic_type.std430.mediump_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008791,
        "dEQP-GLES31.functional.ssbo.layout.s",
        "ingle_basic_type.std430.highp_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008792,
        "dEQP-GLES31.functional.ssbo.layout.singl",
        "e_basic_type.std430.row_major_lowp_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008793,
        "dEQP-GLES31.functional.ssbo.layout.single_",
        "basic_type.std430.row_major_mediump_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008794,
        "dEQP-GLES31.functional.ssbo.layout.single",
        "_basic_type.std430.row_major_highp_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008795,
        "dEQP-GLES31.functional.ssbo.layout.single_",
        "basic_type.std430.column_major_lowp_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008796,
        "dEQP-GLES31.functional.ssbo.layout.single_b",
        "asic_type.std430.column_major_mediump_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008797,
        "dEQP-GLES31.functional.ssbo.layout.single_",
        "basic_type.std430.column_major_highp_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008798,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.std430.lowp_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008799,
        "dEQP-GLES31.functional.ssbo.layout.si",
        "ngle_basic_type.std430.mediump_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008800,
        "dEQP-GLES31.functional.ssbo.layout.s",
        "ingle_basic_type.std430.highp_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008801,
        "dEQP-GLES31.functional.ssbo.layout.singl",
        "e_basic_type.std430.row_major_lowp_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008802,
        "dEQP-GLES31.functional.ssbo.layout.single_",
        "basic_type.std430.row_major_mediump_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008803,
        "dEQP-GLES31.functional.ssbo.layout.single",
        "_basic_type.std430.row_major_highp_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008804,
        "dEQP-GLES31.functional.ssbo.layout.single_",
        "basic_type.std430.column_major_lowp_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008805,
        "dEQP-GLES31.functional.ssbo.layout.single_b",
        "asic_type.std430.column_major_mediump_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008806,
        "dEQP-GLES31.functional.ssbo.layout.single_",
        "basic_type.std430.column_major_highp_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008807,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.std430.lowp_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008808,
        "dEQP-GLES31.functional.ssbo.layout.si",
        "ngle_basic_type.std430.mediump_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008809,
        "dEQP-GLES31.functional.ssbo.layout.s",
        "ingle_basic_type.std430.highp_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008810,
        "dEQP-GLES31.functional.ssbo.layout.singl",
        "e_basic_type.std430.row_major_lowp_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008811,
        "dEQP-GLES31.functional.ssbo.layout.single_",
        "basic_type.std430.row_major_mediump_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008812,
        "dEQP-GLES31.functional.ssbo.layout.single",
        "_basic_type.std430.row_major_highp_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008813,
        "dEQP-GLES31.functional.ssbo.layout.single_",
        "basic_type.std430.column_major_lowp_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008814,
        "dEQP-GLES31.functional.ssbo.layout.single_b",
        "asic_type.std430.column_major_mediump_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008815,
        "dEQP-GLES31.functional.ssbo.layout.single_",
        "basic_type.std430.column_major_highp_mat4x3");
