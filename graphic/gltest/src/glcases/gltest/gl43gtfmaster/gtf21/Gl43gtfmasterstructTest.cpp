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
#include "../Gl43gtfmasterBaseFunc.h"
#include "../ActsGl43gtfmaster0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000762,
    "GTF-GL43.gtf21.GL.struct.struct_float_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000763,
    "GTF-GL43.gtf21.GL.struct.struct_float_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000764,
    "GTF-GL43.gtf21.GL.struct.structcopy_float_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000765,
    "GTF-GL43.gtf21.GL.struct.structcopy_float_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000766,
    "GTF-GL43.gtf21.GL.struct.structnest_float_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000767,
    "GTF-GL43.gtf21.GL.struct.structnest_float_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000768,
    "GTF-GL43.gtf21.GL.struct.struct_bool_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000769,
    "GTF-GL43.gtf21.GL.struct.struct_bool_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000770,
    "GTF-GL43.gtf21.GL.struct.structcopy_bool_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000771,
    "GTF-GL43.gtf21.GL.struct.structcopy_bool_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000772,
    "GTF-GL43.gtf21.GL.struct.structnest_bool_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000773,
    "GTF-GL43.gtf21.GL.struct.structnest_bool_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000774,
    "GTF-GL43.gtf21.GL.struct.struct_vec2_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000775,
    "GTF-GL43.gtf21.GL.struct.struct_vec2_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000776,
    "GTF-GL43.gtf21.GL.struct.structcopy_vec2_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000777,
    "GTF-GL43.gtf21.GL.struct.structcopy_vec2_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000778,
    "GTF-GL43.gtf21.GL.struct.structnest_vec2_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000779,
    "GTF-GL43.gtf21.GL.struct.structnest_vec2_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000780,
    "GTF-GL43.gtf21.GL.struct.struct_vec3_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000781,
    "GTF-GL43.gtf21.GL.struct.struct_vec3_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000782,
    "GTF-GL43.gtf21.GL.struct.structcopy_vec3_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000783,
    "GTF-GL43.gtf21.GL.struct.structcopy_vec3_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000784,
    "GTF-GL43.gtf21.GL.struct.structnest_vec3_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000785,
    "GTF-GL43.gtf21.GL.struct.structnest_vec3_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000786,
    "GTF-GL43.gtf21.GL.struct.struct_vec4_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000787,
    "GTF-GL43.gtf21.GL.struct.struct_vec4_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000788,
    "GTF-GL43.gtf21.GL.struct.structcopy_vec4_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000789,
    "GTF-GL43.gtf21.GL.struct.structcopy_vec4_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000790,
    "GTF-GL43.gtf21.GL.struct.structnest_vec4_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000791,
    "GTF-GL43.gtf21.GL.struct.structnest_vec4_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000792,
    "GTF-GL43.gtf21.GL.struct.struct_bvec2bvec3bvec4_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000793,
    "GTF-GL43.gtf21.GL.struct.struct_bvec2bvec3bvec4_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000794,
    "GTF-GL43.gtf21.GL.struct.structcopy_bvec2bvec3bvec4_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000795,
    "GTF-GL43.gtf21.GL.struct.structcopy_bvec2bvec3bvec4_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000796,
    "GTF-GL43.gtf21.GL.struct.structnest_bvec2bvec3bvec4_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000797,
    "GTF-GL43.gtf21.GL.struct.structnest_bvec2bvec3bvec4_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000798,
    "GTF-GL43.gtf21.GL.struct.struct_mat2_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000799,
    "GTF-GL43.gtf21.GL.struct.struct_mat2_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000800,
    "GTF-GL43.gtf21.GL.struct.structcopy_mat2_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000801,
    "GTF-GL43.gtf21.GL.struct.structcopy_mat2_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000802,
    "GTF-GL43.gtf21.GL.struct.structnest_mat2_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000803,
    "GTF-GL43.gtf21.GL.struct.structnest_mat2_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000804,
    "GTF-GL43.gtf21.GL.struct.struct_mat3_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000805,
    "GTF-GL43.gtf21.GL.struct.struct_mat3_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000806,
    "GTF-GL43.gtf21.GL.struct.structcopy_mat3_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000807,
    "GTF-GL43.gtf21.GL.struct.structcopy_mat3_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000808,
    "GTF-GL43.gtf21.GL.struct.structnest_mat3_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000809,
    "GTF-GL43.gtf21.GL.struct.structnest_mat3_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000810,
    "GTF-GL43.gtf21.GL.struct.struct_mat4_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000811,
    "GTF-GL43.gtf21.GL.struct.struct_mat4_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000812,
    "GTF-GL43.gtf21.GL.struct.structcopy_mat4_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000813,
    "GTF-GL43.gtf21.GL.struct.structcopy_mat4_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000814,
    "GTF-GL43.gtf21.GL.struct.structnest_mat4_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000815,
    "GTF-GL43.gtf21.GL.struct.structnest_mat4_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000816,
    "GTF-GL43.gtf21.GL.struct.nestedstructcomb_various_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000817,
    "GTF-GL43.gtf21.GL.struct.nestedstructcomb_various_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000818,
    "GTF-GL43.gtf21.GL.struct.struct_int_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000819,
    "GTF-GL43.gtf21.GL.struct.struct_int_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000820,
    "GTF-GL43.gtf21.GL.struct.structcopy_int_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000821,
    "GTF-GL43.gtf21.GL.struct.structcopy_int_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000822,
    "GTF-GL43.gtf21.GL.struct.structnest_int_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000823,
    "GTF-GL43.gtf21.GL.struct.structnest_int_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000824,
    "GTF-GL43.gtf21.GL.struct.struct_ivec2ivec3ivec4_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000825,
    "GTF-GL43.gtf21.GL.struct.struct_ivec2ivec3ivec4_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000826,
    "GTF-GL43.gtf21.GL.struct.structcopy_ivec2ivec3ivec4_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000827,
    "GTF-GL43.gtf21.GL.struct.structcopy_ivec2ivec3ivec4_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000828,
    "GTF-GL43.gtf21.GL.struct.structnest_ivec2ivec3ivec4_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000829,
    "GTF-GL43.gtf21.GL.struct.structnest_ivec2ivec3ivec4_vert");
