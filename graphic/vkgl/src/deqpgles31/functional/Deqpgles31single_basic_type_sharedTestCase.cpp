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

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008332,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.shared.lowp_float");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008333,
        "dEQP-GLES31.functional.ssbo.layout.s",
        "ingle_basic_type.shared.mediump_float");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008334,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.shared.highp_float");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008335,
        "dEQP-GLES31.functional.ssbo.layout",
        ".single_basic_type.shared.lowp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008336,
        "dEQP-GLES31.functional.ssbo.layout.s",
        "ingle_basic_type.shared.mediump_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008337,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.shared.highp_vec2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008338,
        "dEQP-GLES31.functional.ssbo.layout",
        ".single_basic_type.shared.lowp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008339,
        "dEQP-GLES31.functional.ssbo.layout.s",
        "ingle_basic_type.shared.mediump_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008340,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.shared.highp_vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008341,
        "dEQP-GLES31.functional.ssbo.layout",
        ".single_basic_type.shared.lowp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008342,
        "dEQP-GLES31.functional.ssbo.layout.s",
        "ingle_basic_type.shared.mediump_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008343,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.shared.highp_vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008344,
        "dEQP-GLES31.functional.ssbo.layout",
        ".single_basic_type.shared.lowp_int");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008345,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.shared.mediump_int");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008346,
        "dEQP-GLES31.functional.ssbo.layout",
        ".single_basic_type.shared.highp_int");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008347,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.shared.lowp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008348,
        "dEQP-GLES31.functional.ssbo.layout.s",
        "ingle_basic_type.shared.mediump_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008349,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.shared.highp_ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008350,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.shared.lowp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008351,
        "dEQP-GLES31.functional.ssbo.layout.s",
        "ingle_basic_type.shared.mediump_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008352,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.shared.highp_ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008353,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.shared.lowp_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008354,
        "dEQP-GLES31.functional.ssbo.layout.s",
        "ingle_basic_type.shared.mediump_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008355,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.shared.highp_ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008356,
        "dEQP-GLES31.functional.ssbo.layout",
        ".single_basic_type.shared.lowp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008357,
        "dEQP-GLES31.functional.ssbo.layout.s",
        "ingle_basic_type.shared.mediump_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008358,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.shared.highp_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008359,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.shared.lowp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008360,
        "dEQP-GLES31.functional.ssbo.layout.s",
        "ingle_basic_type.shared.mediump_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008361,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.shared.highp_uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008362,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.shared.lowp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008363,
        "dEQP-GLES31.functional.ssbo.layout.s",
        "ingle_basic_type.shared.mediump_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008364,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.shared.highp_uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008365,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.shared.lowp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008366,
        "dEQP-GLES31.functional.ssbo.layout.s",
        "ingle_basic_type.shared.mediump_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008367,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.shared.highp_uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008368,
        "dEQP-GLES31.functional.ssbo.layo",
        "ut.single_basic_type.shared.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008369,
        "dEQP-GLES31.functional.ssbo.layo",
        "ut.single_basic_type.shared.bvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008370,
        "dEQP-GLES31.functional.ssbo.layo",
        "ut.single_basic_type.shared.bvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008371,
        "dEQP-GLES31.functional.ssbo.layo",
        "ut.single_basic_type.shared.bvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008372,
        "dEQP-GLES31.functional.ssbo.layout",
        ".single_basic_type.shared.lowp_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008373,
        "dEQP-GLES31.functional.ssbo.layout.s",
        "ingle_basic_type.shared.mediump_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008374,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.shared.highp_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008375,
        "dEQP-GLES31.functional.ssbo.layout.sing",
        "le_basic_type.shared.row_major_lowp_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008376,
        "dEQP-GLES31.functional.ssbo.layout.single",
        "_basic_type.shared.row_major_mediump_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008377,
        "dEQP-GLES31.functional.ssbo.layout.singl",
        "e_basic_type.shared.row_major_highp_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008378,
        "dEQP-GLES31.functional.ssbo.layout.single",
        "_basic_type.shared.column_major_lowp_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008379,
        "dEQP-GLES31.functional.ssbo.layout.single_",
        "basic_type.shared.column_major_mediump_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008380,
        "dEQP-GLES31.functional.ssbo.layout.single",
        "_basic_type.shared.column_major_highp_mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008381,
        "dEQP-GLES31.functional.ssbo.layout",
        ".single_basic_type.shared.lowp_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008382,
        "dEQP-GLES31.functional.ssbo.layout.s",
        "ingle_basic_type.shared.mediump_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008383,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.shared.highp_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008384,
        "dEQP-GLES31.functional.ssbo.layout.sing",
        "le_basic_type.shared.row_major_lowp_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008385,
        "dEQP-GLES31.functional.ssbo.layout.single",
        "_basic_type.shared.row_major_mediump_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008386,
        "dEQP-GLES31.functional.ssbo.layout.singl",
        "e_basic_type.shared.row_major_highp_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008387,
        "dEQP-GLES31.functional.ssbo.layout.single",
        "_basic_type.shared.column_major_lowp_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008388,
        "dEQP-GLES31.functional.ssbo.layout.single_",
        "basic_type.shared.column_major_mediump_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008389,
        "dEQP-GLES31.functional.ssbo.layout.single",
        "_basic_type.shared.column_major_highp_mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008390,
        "dEQP-GLES31.functional.ssbo.layout",
        ".single_basic_type.shared.lowp_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008391,
        "dEQP-GLES31.functional.ssbo.layout.s",
        "ingle_basic_type.shared.mediump_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008392,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.shared.highp_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008393,
        "dEQP-GLES31.functional.ssbo.layout.sing",
        "le_basic_type.shared.row_major_lowp_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008394,
        "dEQP-GLES31.functional.ssbo.layout.single",
        "_basic_type.shared.row_major_mediump_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008395,
        "dEQP-GLES31.functional.ssbo.layout.singl",
        "e_basic_type.shared.row_major_highp_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008396,
        "dEQP-GLES31.functional.ssbo.layout.single",
        "_basic_type.shared.column_major_lowp_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008397,
        "dEQP-GLES31.functional.ssbo.layout.single_",
        "basic_type.shared.column_major_mediump_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008398,
        "dEQP-GLES31.functional.ssbo.layout.single",
        "_basic_type.shared.column_major_highp_mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008399,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.shared.lowp_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008400,
        "dEQP-GLES31.functional.ssbo.layout.si",
        "ngle_basic_type.shared.mediump_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008401,
        "dEQP-GLES31.functional.ssbo.layout.s",
        "ingle_basic_type.shared.highp_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008402,
        "dEQP-GLES31.functional.ssbo.layout.singl",
        "e_basic_type.shared.row_major_lowp_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008403,
        "dEQP-GLES31.functional.ssbo.layout.single_",
        "basic_type.shared.row_major_mediump_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008404,
        "dEQP-GLES31.functional.ssbo.layout.single",
        "_basic_type.shared.row_major_highp_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008405,
        "dEQP-GLES31.functional.ssbo.layout.single_",
        "basic_type.shared.column_major_lowp_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008406,
        "dEQP-GLES31.functional.ssbo.layout.single_b",
        "asic_type.shared.column_major_mediump_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008407,
        "dEQP-GLES31.functional.ssbo.layout.single_",
        "basic_type.shared.column_major_highp_mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008408,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.shared.lowp_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008409,
        "dEQP-GLES31.functional.ssbo.layout.si",
        "ngle_basic_type.shared.mediump_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008410,
        "dEQP-GLES31.functional.ssbo.layout.s",
        "ingle_basic_type.shared.highp_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008411,
        "dEQP-GLES31.functional.ssbo.layout.singl",
        "e_basic_type.shared.row_major_lowp_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008412,
        "dEQP-GLES31.functional.ssbo.layout.single_",
        "basic_type.shared.row_major_mediump_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008413,
        "dEQP-GLES31.functional.ssbo.layout.single",
        "_basic_type.shared.row_major_highp_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008414,
        "dEQP-GLES31.functional.ssbo.layout.single_",
        "basic_type.shared.column_major_lowp_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008415,
        "dEQP-GLES31.functional.ssbo.layout.single_b",
        "asic_type.shared.column_major_mediump_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008416,
        "dEQP-GLES31.functional.ssbo.layout.single_",
        "basic_type.shared.column_major_highp_mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008417,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.shared.lowp_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008418,
        "dEQP-GLES31.functional.ssbo.layout.si",
        "ngle_basic_type.shared.mediump_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008419,
        "dEQP-GLES31.functional.ssbo.layout.s",
        "ingle_basic_type.shared.highp_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008420,
        "dEQP-GLES31.functional.ssbo.layout.singl",
        "e_basic_type.shared.row_major_lowp_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008421,
        "dEQP-GLES31.functional.ssbo.layout.single_",
        "basic_type.shared.row_major_mediump_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008422,
        "dEQP-GLES31.functional.ssbo.layout.single",
        "_basic_type.shared.row_major_highp_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008423,
        "dEQP-GLES31.functional.ssbo.layout.single_",
        "basic_type.shared.column_major_lowp_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008424,
        "dEQP-GLES31.functional.ssbo.layout.single_b",
        "asic_type.shared.column_major_mediump_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008425,
        "dEQP-GLES31.functional.ssbo.layout.single_",
        "basic_type.shared.column_major_highp_mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008426,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.shared.lowp_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008427,
        "dEQP-GLES31.functional.ssbo.layout.si",
        "ngle_basic_type.shared.mediump_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008428,
        "dEQP-GLES31.functional.ssbo.layout.s",
        "ingle_basic_type.shared.highp_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008429,
        "dEQP-GLES31.functional.ssbo.layout.singl",
        "e_basic_type.shared.row_major_lowp_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008430,
        "dEQP-GLES31.functional.ssbo.layout.single_",
        "basic_type.shared.row_major_mediump_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008431,
        "dEQP-GLES31.functional.ssbo.layout.single",
        "_basic_type.shared.row_major_highp_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008432,
        "dEQP-GLES31.functional.ssbo.layout.single_",
        "basic_type.shared.column_major_lowp_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008433,
        "dEQP-GLES31.functional.ssbo.layout.single_b",
        "asic_type.shared.column_major_mediump_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008434,
        "dEQP-GLES31.functional.ssbo.layout.single_",
        "basic_type.shared.column_major_highp_mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008435,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.shared.lowp_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008436,
        "dEQP-GLES31.functional.ssbo.layout.si",
        "ngle_basic_type.shared.mediump_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008437,
        "dEQP-GLES31.functional.ssbo.layout.s",
        "ingle_basic_type.shared.highp_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008438,
        "dEQP-GLES31.functional.ssbo.layout.singl",
        "e_basic_type.shared.row_major_lowp_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008439,
        "dEQP-GLES31.functional.ssbo.layout.single_",
        "basic_type.shared.row_major_mediump_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008440,
        "dEQP-GLES31.functional.ssbo.layout.single",
        "_basic_type.shared.row_major_highp_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008441,
        "dEQP-GLES31.functional.ssbo.layout.single_",
        "basic_type.shared.column_major_lowp_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008442,
        "dEQP-GLES31.functional.ssbo.layout.single_b",
        "asic_type.shared.column_major_mediump_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008443,
        "dEQP-GLES31.functional.ssbo.layout.single_",
        "basic_type.shared.column_major_highp_mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008444,
        "dEQP-GLES31.functional.ssbo.layout.",
        "single_basic_type.shared.lowp_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008445,
        "dEQP-GLES31.functional.ssbo.layout.si",
        "ngle_basic_type.shared.mediump_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008446,
        "dEQP-GLES31.functional.ssbo.layout.s",
        "ingle_basic_type.shared.highp_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008447,
        "dEQP-GLES31.functional.ssbo.layout.singl",
        "e_basic_type.shared.row_major_lowp_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008448,
        "dEQP-GLES31.functional.ssbo.layout.single_",
        "basic_type.shared.row_major_mediump_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008449,
        "dEQP-GLES31.functional.ssbo.layout.single",
        "_basic_type.shared.row_major_highp_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008450,
        "dEQP-GLES31.functional.ssbo.layout.single_",
        "basic_type.shared.column_major_lowp_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008451,
        "dEQP-GLES31.functional.ssbo.layout.single_b",
        "asic_type.shared.column_major_mediump_mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310009TestSuite, TestCase_008452,
        "dEQP-GLES31.functional.ssbo.layout.single_",
        "basic_type.shared.column_major_highp_mat4x3");
