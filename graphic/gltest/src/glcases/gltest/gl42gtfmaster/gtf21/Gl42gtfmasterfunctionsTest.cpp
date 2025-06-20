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
#include "../Gl42gtfmasterBaseFunc.h"
#include "../ActsGl42gtfmaster0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000354,
    "GTF-GL42.gtf21.GL.functions.qualifiers_float_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000355,
    "GTF-GL42.gtf21.GL.functions.qualifiers_float_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000356,
    "GTF-GL42.gtf21.GL.functions.qualifiers_struct_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000357,
    "GTF-GL42.gtf21.GL.functions.qualifiers_struct_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000358,
    "GTF-GL42.gtf21.GL.functions.array_float_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000359,
    "GTF-GL42.gtf21.GL.functions.array_float_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000360,
    "GTF-GL42.gtf21.GL.functions.void_empty_empty_void_empty_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000361,
    "GTF-GL42.gtf21.GL.functions.void_empty_empty_void_empty_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000362,
    "GTF-GL42.gtf21.GL.functions.bool_empty_empty_bool_empty_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000363,
    "GTF-GL42.gtf21.GL.functions.bool_empty_empty_bool_empty_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000364,
    "GTF-GL42.gtf21.GL.functions.bool_empty_empty_bool_array_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000365,
    "GTF-GL42.gtf21.GL.functions.bool_empty_empty_bool_array_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000366,
    "GTF-GL42.gtf21.GL.functions.bool_empty_in_bool_empty_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000367,
    "GTF-GL42.gtf21.GL.functions.bool_empty_in_bool_empty_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000368,
    "GTF-GL42.gtf21.GL.functions.bool_empty_in_bool_array_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000369,
    "GTF-GL42.gtf21.GL.functions.bool_empty_in_bool_array_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000370,
    "GTF-GL42.gtf21.GL.functions.bool_empty_inout_bool_empty_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000371,
    "GTF-GL42.gtf21.GL.functions.bool_empty_inout_bool_empty_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000372,
    "GTF-GL42.gtf21.GL.functions.bool_empty_inout_bool_array_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000373,
    "GTF-GL42.gtf21.GL.functions.bool_empty_inout_bool_array_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000374,
    "GTF-GL42.gtf21.GL.functions.bool_empty_out_bool_empty_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000375,
    "GTF-GL42.gtf21.GL.functions.bool_empty_out_bool_empty_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000376,
    "GTF-GL42.gtf21.GL.functions.bool_empty_out_bool_array_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000377,
    "GTF-GL42.gtf21.GL.functions.bool_empty_out_bool_array_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000378,
    "GTF-GL42.gtf21.GL.functions.int_empty_empty_int_empty_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000379,
    "GTF-GL42.gtf21.GL.functions.int_empty_empty_int_empty_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000380,
    "GTF-GL42.gtf21.GL.functions.int_empty_empty_int_array_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000381,
    "GTF-GL42.gtf21.GL.functions.int_empty_empty_int_array_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000382,
    "GTF-GL42.gtf21.GL.functions.int_empty_in_int_empty_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000383,
    "GTF-GL42.gtf21.GL.functions.int_empty_in_int_empty_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000384,
    "GTF-GL42.gtf21.GL.functions.int_empty_in_int_array_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000385,
    "GTF-GL42.gtf21.GL.functions.int_empty_in_int_array_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000386,
    "GTF-GL42.gtf21.GL.functions.int_empty_inout_int_empty_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000387,
    "GTF-GL42.gtf21.GL.functions.int_empty_inout_int_empty_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000388,
    "GTF-GL42.gtf21.GL.functions.int_empty_inout_int_array_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000389,
    "GTF-GL42.gtf21.GL.functions.int_empty_inout_int_array_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000390,
    "GTF-GL42.gtf21.GL.functions.int_empty_out_int_empty_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000391,
    "GTF-GL42.gtf21.GL.functions.int_empty_out_int_empty_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000392,
    "GTF-GL42.gtf21.GL.functions.int_empty_out_int_array_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000393,
    "GTF-GL42.gtf21.GL.functions.int_empty_out_int_array_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000394,
    "GTF-GL42.gtf21.GL.functions.float_empty_empty_float_empty_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000395,
    "GTF-GL42.gtf21.GL.functions.float_empty_empty_float_empty_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000396,
    "GTF-GL42.gtf21.GL.functions.float_empty_empty_float_array_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000397,
    "GTF-GL42.gtf21.GL.functions.float_empty_empty_float_array_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000398,
    "GTF-GL42.gtf21.GL.functions.float_empty_in_float_empty_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000399,
    "GTF-GL42.gtf21.GL.functions.float_empty_in_float_empty_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000400,
    "GTF-GL42.gtf21.GL.functions.float_empty_in_float_array_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000401,
    "GTF-GL42.gtf21.GL.functions.float_empty_in_float_array_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000402,
    "GTF-GL42.gtf21.GL.functions.float_empty_inout_float_empty_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000403,
    "GTF-GL42.gtf21.GL.functions.float_empty_inout_float_empty_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000404,
    "GTF-GL42.gtf21.GL.functions.float_empty_inout_float_array_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000405,
    "GTF-GL42.gtf21.GL.functions.float_empty_inout_float_array_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000406,
    "GTF-GL42.gtf21.GL.functions.float_empty_out_float_empty_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000407,
    "GTF-GL42.gtf21.GL.functions.float_empty_out_float_empty_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000408,
    "GTF-GL42.gtf21.GL.functions.float_empty_out_float_array_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000409,
    "GTF-GL42.gtf21.GL.functions.float_empty_out_float_array_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000410,
    "GTF-GL42.gtf21.GL.functions.bvec4_empty_empty_bvec4_empty_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000411,
    "GTF-GL42.gtf21.GL.functions.bvec4_empty_empty_bvec4_empty_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000412,
    "GTF-GL42.gtf21.GL.functions.bvec4_empty_empty_bvec4_array_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000413,
    "GTF-GL42.gtf21.GL.functions.bvec4_empty_empty_bvec4_array_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000414,
    "GTF-GL42.gtf21.GL.functions.bvec4_empty_in_bvec4_empty_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000415,
    "GTF-GL42.gtf21.GL.functions.bvec4_empty_in_bvec4_empty_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000416,
    "GTF-GL42.gtf21.GL.functions.bvec4_empty_in_bvec4_array_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000417,
    "GTF-GL42.gtf21.GL.functions.bvec4_empty_in_bvec4_array_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000418,
    "GTF-GL42.gtf21.GL.functions.bvec4_empty_inout_bvec4_empty_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000419,
    "GTF-GL42.gtf21.GL.functions.bvec4_empty_inout_bvec4_empty_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000420,
    "GTF-GL42.gtf21.GL.functions.bvec4_empty_inout_bvec4_array_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000421,
    "GTF-GL42.gtf21.GL.functions.bvec4_empty_inout_bvec4_bigarray_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000422,
    "GTF-GL42.gtf21.GL.functions.bvec4_empty_inout_bvec4_array_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000423,
    "GTF-GL42.gtf21.GL.functions.bvec4_empty_inout_bvec4_bigarray_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000424,
    "GTF-GL42.gtf21.GL.functions.bvec4_empty_out_bvec4_empty_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000425,
    "GTF-GL42.gtf21.GL.functions.bvec4_empty_out_bvec4_empty_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000426,
    "GTF-GL42.gtf21.GL.functions.bvec4_empty_out_bvec4_array_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000427,
    "GTF-GL42.gtf21.GL.functions.bvec4_empty_out_bvec4_array_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000428,
    "GTF-GL42.gtf21.GL.functions.ivec4_empty_empty_ivec4_empty_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000429,
    "GTF-GL42.gtf21.GL.functions.ivec4_empty_empty_ivec4_empty_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000430,
    "GTF-GL42.gtf21.GL.functions.ivec4_empty_empty_ivec4_array_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000431,
    "GTF-GL42.gtf21.GL.functions.ivec4_empty_empty_ivec4_array_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000432,
    "GTF-GL42.gtf21.GL.functions.ivec4_empty_in_ivec4_empty_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000433,
    "GTF-GL42.gtf21.GL.functions.ivec4_empty_in_ivec4_empty_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000434,
    "GTF-GL42.gtf21.GL.functions.ivec4_empty_in_ivec4_array_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000435,
    "GTF-GL42.gtf21.GL.functions.ivec4_empty_in_ivec4_array_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000436,
    "GTF-GL42.gtf21.GL.functions.ivec4_empty_inout_ivec4_empty_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000437,
    "GTF-GL42.gtf21.GL.functions.ivec4_empty_inout_ivec4_empty_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000438,
    "GTF-GL42.gtf21.GL.functions.ivec4_empty_inout_ivec4_array_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000439,
    "GTF-GL42.gtf21.GL.functions.ivec4_empty_inout_ivec4_bigarray_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000440,
    "GTF-GL42.gtf21.GL.functions.ivec4_empty_inout_ivec4_array_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000441,
    "GTF-GL42.gtf21.GL.functions.ivec4_empty_inout_ivec4_bigarray_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000442,
    "GTF-GL42.gtf21.GL.functions.ivec4_empty_out_ivec4_empty_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000443,
    "GTF-GL42.gtf21.GL.functions.ivec4_empty_out_ivec4_empty_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000444,
    "GTF-GL42.gtf21.GL.functions.ivec4_empty_out_ivec4_array_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000445,
    "GTF-GL42.gtf21.GL.functions.ivec4_empty_out_ivec4_array_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000446,
    "GTF-GL42.gtf21.GL.functions.vec4_empty_empty_vec4_empty_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000447,
    "GTF-GL42.gtf21.GL.functions.vec4_empty_empty_vec4_empty_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000448,
    "GTF-GL42.gtf21.GL.functions.vec4_empty_empty_vec4_array_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000449,
    "GTF-GL42.gtf21.GL.functions.vec4_empty_empty_vec4_array_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000450,
    "GTF-GL42.gtf21.GL.functions.vec4_empty_in_vec4_empty_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000451,
    "GTF-GL42.gtf21.GL.functions.vec4_empty_in_vec4_empty_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000452,
    "GTF-GL42.gtf21.GL.functions.vec4_empty_in_vec4_array_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000453,
    "GTF-GL42.gtf21.GL.functions.vec4_empty_in_vec4_array_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000454,
    "GTF-GL42.gtf21.GL.functions.vec4_empty_inout_vec4_empty_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000455,
    "GTF-GL42.gtf21.GL.functions.vec4_empty_inout_vec4_empty_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000456,
    "GTF-GL42.gtf21.GL.functions.vec4_empty_inout_vec4_array_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000457,
    "GTF-GL42.gtf21.GL.functions.vec4_empty_inout_vec4_bigarray_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000458,
    "GTF-GL42.gtf21.GL.functions.vec4_empty_inout_vec4_array_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000459,
    "GTF-GL42.gtf21.GL.functions.vec4_empty_inout_vec4_bigarray_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000460,
    "GTF-GL42.gtf21.GL.functions.vec4_empty_out_vec4_empty_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000461,
    "GTF-GL42.gtf21.GL.functions.vec4_empty_out_vec4_empty_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000462,
    "GTF-GL42.gtf21.GL.functions.vec4_empty_out_vec4_array_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000463,
    "GTF-GL42.gtf21.GL.functions.vec4_empty_out_vec4_array_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000464,
    "GTF-GL42.gtf21.GL.functions.mat4_empty_empty_mat4_empty_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000465,
    "GTF-GL42.gtf21.GL.functions.mat4_empty_empty_mat4_empty_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000466,
    "GTF-GL42.gtf21.GL.functions.mat4_empty_empty_mat4_array_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000467,
    "GTF-GL42.gtf21.GL.functions.mat4_empty_empty_mat4_array_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000468,
    "GTF-GL42.gtf21.GL.functions.mat4_empty_in_mat4_empty_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000469,
    "GTF-GL42.gtf21.GL.functions.mat4_empty_in_mat4_empty_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000470,
    "GTF-GL42.gtf21.GL.functions.mat4_empty_in_mat4_array_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000471,
    "GTF-GL42.gtf21.GL.functions.mat4_empty_in_mat4_array_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000472,
    "GTF-GL42.gtf21.GL.functions.mat4_empty_inout_mat4_empty_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000473,
    "GTF-GL42.gtf21.GL.functions.mat4_empty_inout_mat4_empty_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000474,
    "GTF-GL42.gtf21.GL.functions.mat4_empty_inout_mat4_array_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000475,
    "GTF-GL42.gtf21.GL.functions.mat4_empty_inout_mat4_array_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000476,
    "GTF-GL42.gtf21.GL.functions.mat4_empty_out_mat4_empty_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000477,
    "GTF-GL42.gtf21.GL.functions.mat4_empty_out_mat4_empty_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000478,
    "GTF-GL42.gtf21.GL.functions.mat4_empty_out_mat4_array_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000479,
    "GTF-GL42.gtf21.GL.functions.mat4_empty_out_mat4_array_vert");
