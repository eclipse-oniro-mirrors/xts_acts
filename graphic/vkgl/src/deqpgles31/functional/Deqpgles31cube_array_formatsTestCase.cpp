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
#include "../ActsDeqpgles310013TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012279,
        "dEQP-GLES31.functional.texture.filter",
        "ing.cube_array.formats.rgba16f_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012280,
        "dEQP-GLES31.functional.texture.filter",
        "ing.cube_array.formats.rgba16f_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012281,
        "dEQP-GLES31.functional.texture.filtering.cube",
        "_array.formats.rgba16f_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012282,
        "dEQP-GLES31.functional.texture.filtering.cub",
        "e_array.formats.rgba16f_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012283,
        "dEQP-GLES31.functional.texture.filtering.cub",
        "e_array.formats.rgba16f_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012284,
        "dEQP-GLES31.functional.texture.filtering.cub",
        "e_array.formats.rgba16f_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012285,
        "dEQP-GLES31.functional.texture.filtering.",
        "cube_array.formats.r11f_g11f_b10f_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012286,
        "dEQP-GLES31.functional.texture.filtering",
        ".cube_array.formats.r11f_g11f_b10f_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012287,
        "dEQP-GLES31.functional.texture.filtering.cube_ar",
        "ray.formats.r11f_g11f_b10f_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012288,
        "dEQP-GLES31.functional.texture.filtering.cube_ar",
        "ray.formats.r11f_g11f_b10f_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012289,
        "dEQP-GLES31.functional.texture.filtering.cube_ar",
        "ray.formats.r11f_g11f_b10f_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012290,
        "dEQP-GLES31.functional.texture.filtering.cube_a",
        "rray.formats.r11f_g11f_b10f_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012291,
        "dEQP-GLES31.functional.texture.filter",
        "ing.cube_array.formats.rgb9_e5_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012292,
        "dEQP-GLES31.functional.texture.filter",
        "ing.cube_array.formats.rgb9_e5_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012293,
        "dEQP-GLES31.functional.texture.filtering.cube",
        "_array.formats.rgb9_e5_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012294,
        "dEQP-GLES31.functional.texture.filtering.cub",
        "e_array.formats.rgb9_e5_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012295,
        "dEQP-GLES31.functional.texture.filtering.cub",
        "e_array.formats.rgb9_e5_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012296,
        "dEQP-GLES31.functional.texture.filtering.cub",
        "e_array.formats.rgb9_e5_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012297,
        "dEQP-GLES31.functional.texture.filte",
        "ring.cube_array.formats.rgba8_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012298,
        "dEQP-GLES31.functional.texture.filte",
        "ring.cube_array.formats.rgba8_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012299,
        "dEQP-GLES31.functional.texture.filtering.cub",
        "e_array.formats.rgba8_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012300,
        "dEQP-GLES31.functional.texture.filtering.cu",
        "be_array.formats.rgba8_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012301,
        "dEQP-GLES31.functional.texture.filtering.cu",
        "be_array.formats.rgba8_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012302,
        "dEQP-GLES31.functional.texture.filtering.cu",
        "be_array.formats.rgba8_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012303,
        "dEQP-GLES31.functional.texture.filterin",
        "g.cube_array.formats.rgba8_snorm_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012304,
        "dEQP-GLES31.functional.texture.filterin",
        "g.cube_array.formats.rgba8_snorm_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012305,
        "dEQP-GLES31.functional.texture.filtering.cube_a",
        "rray.formats.rgba8_snorm_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012306,
        "dEQP-GLES31.functional.texture.filtering.cube_",
        "array.formats.rgba8_snorm_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012307,
        "dEQP-GLES31.functional.texture.filtering.cube_",
        "array.formats.rgba8_snorm_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012308,
        "dEQP-GLES31.functional.texture.filtering.cube_",
        "array.formats.rgba8_snorm_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012309,
        "dEQP-GLES31.functional.texture.filter",
        "ing.cube_array.formats.rgb565_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012310,
        "dEQP-GLES31.functional.texture.filte",
        "ring.cube_array.formats.rgb565_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012311,
        "dEQP-GLES31.functional.texture.filtering.cub",
        "e_array.formats.rgb565_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012312,
        "dEQP-GLES31.functional.texture.filtering.cub",
        "e_array.formats.rgb565_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012313,
        "dEQP-GLES31.functional.texture.filtering.cub",
        "e_array.formats.rgb565_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012314,
        "dEQP-GLES31.functional.texture.filtering.cu",
        "be_array.formats.rgb565_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012315,
        "dEQP-GLES31.functional.texture.filte",
        "ring.cube_array.formats.rgba4_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012316,
        "dEQP-GLES31.functional.texture.filte",
        "ring.cube_array.formats.rgba4_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012317,
        "dEQP-GLES31.functional.texture.filtering.cub",
        "e_array.formats.rgba4_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012318,
        "dEQP-GLES31.functional.texture.filtering.cu",
        "be_array.formats.rgba4_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012319,
        "dEQP-GLES31.functional.texture.filtering.cu",
        "be_array.formats.rgba4_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012320,
        "dEQP-GLES31.functional.texture.filtering.cu",
        "be_array.formats.rgba4_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012321,
        "dEQP-GLES31.functional.texture.filter",
        "ing.cube_array.formats.rgb5_a1_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012322,
        "dEQP-GLES31.functional.texture.filter",
        "ing.cube_array.formats.rgb5_a1_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012323,
        "dEQP-GLES31.functional.texture.filtering.cube",
        "_array.formats.rgb5_a1_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012324,
        "dEQP-GLES31.functional.texture.filtering.cub",
        "e_array.formats.rgb5_a1_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012325,
        "dEQP-GLES31.functional.texture.filtering.cub",
        "e_array.formats.rgb5_a1_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012326,
        "dEQP-GLES31.functional.texture.filtering.cub",
        "e_array.formats.rgb5_a1_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012327,
        "dEQP-GLES31.functional.texture.filt",
        "ering.cube_array.formats.sr8_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012328,
        "dEQP-GLES31.functional.texture.filt",
        "ering.cube_array.formats.sr8_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012329,
        "dEQP-GLES31.functional.texture.filtering.cu",
        "be_array.formats.sr8_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012330,
        "dEQP-GLES31.functional.texture.filtering.c",
        "ube_array.formats.sr8_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012331,
        "dEQP-GLES31.functional.texture.filtering.c",
        "ube_array.formats.sr8_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012332,
        "dEQP-GLES31.functional.texture.filtering.c",
        "ube_array.formats.sr8_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012333,
        "dEQP-GLES31.functional.texture.filte",
        "ring.cube_array.formats.srg8_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012334,
        "dEQP-GLES31.functional.texture.filt",
        "ering.cube_array.formats.srg8_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012335,
        "dEQP-GLES31.functional.texture.filtering.cu",
        "be_array.formats.srg8_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012336,
        "dEQP-GLES31.functional.texture.filtering.cu",
        "be_array.formats.srg8_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012337,
        "dEQP-GLES31.functional.texture.filtering.cu",
        "be_array.formats.srg8_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012338,
        "dEQP-GLES31.functional.texture.filtering.c",
        "ube_array.formats.srg8_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012339,
        "dEQP-GLES31.functional.texture.filtering",
        ".cube_array.formats.srgb8_alpha8_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012340,
        "dEQP-GLES31.functional.texture.filterin",
        "g.cube_array.formats.srgb8_alpha8_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012341,
        "dEQP-GLES31.functional.texture.filtering.cube_a",
        "rray.formats.srgb8_alpha8_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012342,
        "dEQP-GLES31.functional.texture.filtering.cube_a",
        "rray.formats.srgb8_alpha8_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012343,
        "dEQP-GLES31.functional.texture.filtering.cube_a",
        "rray.formats.srgb8_alpha8_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012344,
        "dEQP-GLES31.functional.texture.filtering.cube_",
        "array.formats.srgb8_alpha8_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012345,
        "dEQP-GLES31.functional.texture.filteri",
        "ng.cube_array.formats.rgb10_a2_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012346,
        "dEQP-GLES31.functional.texture.filter",
        "ing.cube_array.formats.rgb10_a2_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012347,
        "dEQP-GLES31.functional.texture.filtering.cube",
        "_array.formats.rgb10_a2_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012348,
        "dEQP-GLES31.functional.texture.filtering.cube",
        "_array.formats.rgb10_a2_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012349,
        "dEQP-GLES31.functional.texture.filtering.cube",
        "_array.formats.rgb10_a2_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012350,
        "dEQP-GLES31.functional.texture.filtering.cub",
        "e_array.formats.rgb10_a2_linear_mipmap_linear");
