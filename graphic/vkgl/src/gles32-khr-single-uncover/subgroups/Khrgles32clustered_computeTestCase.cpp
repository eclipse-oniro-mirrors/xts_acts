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
#include "../Khrgles32BaseFunc.h"
#include "../ActsGles32KhrSingleUncover0003TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002422,
        "KHR-Single-GLES32.subgroups.cluster",
        "ed.compute.subgroupclusteredadd_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002423,
        "KHR-Single-GLES32.subgroups.cluster",
        "ed.compute.subgroupclusteredmul_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002424,
        "KHR-Single-GLES32.subgroups.cluster",
        "ed.compute.subgroupclusteredmin_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002425,
        "KHR-Single-GLES32.subgroups.cluster",
        "ed.compute.subgroupclusteredmax_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002426,
        "KHR-Single-GLES32.subgroups.cluster",
        "ed.compute.subgroupclusteredand_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002427,
        "KHR-Single-GLES32.subgroups.cluste",
        "red.compute.subgroupclusteredor_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002428,
        "KHR-Single-GLES32.subgroups.cluster",
        "ed.compute.subgroupclusteredxor_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002429,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.compute.subgroupclusteredadd_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002430,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.compute.subgroupclusteredmul_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002431,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.compute.subgroupclusteredmin_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002432,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.compute.subgroupclusteredmax_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002433,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.compute.subgroupclusteredand_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002434,
        "KHR-Single-GLES32.subgroups.cluster",
        "ed.compute.subgroupclusteredor_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002435,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.compute.subgroupclusteredxor_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002436,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.compute.subgroupclusteredadd_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002437,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.compute.subgroupclusteredmul_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002438,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.compute.subgroupclusteredmin_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002439,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.compute.subgroupclusteredmax_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002440,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.compute.subgroupclusteredand_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002441,
        "KHR-Single-GLES32.subgroups.cluster",
        "ed.compute.subgroupclusteredor_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002442,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.compute.subgroupclusteredxor_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002443,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.compute.subgroupclusteredadd_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002444,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.compute.subgroupclusteredmul_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002445,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.compute.subgroupclusteredmin_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002446,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.compute.subgroupclusteredmax_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002447,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.compute.subgroupclusteredand_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002448,
        "KHR-Single-GLES32.subgroups.cluster",
        "ed.compute.subgroupclusteredor_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002449,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.compute.subgroupclusteredxor_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002450,
        "KHR-Single-GLES32.subgroups.cluster",
        "ed.compute.subgroupclusteredadd_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002451,
        "KHR-Single-GLES32.subgroups.cluster",
        "ed.compute.subgroupclusteredmul_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002452,
        "KHR-Single-GLES32.subgroups.cluster",
        "ed.compute.subgroupclusteredmin_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002453,
        "KHR-Single-GLES32.subgroups.cluster",
        "ed.compute.subgroupclusteredmax_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002454,
        "KHR-Single-GLES32.subgroups.cluster",
        "ed.compute.subgroupclusteredand_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002455,
        "KHR-Single-GLES32.subgroups.cluster",
        "ed.compute.subgroupclusteredor_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002456,
        "KHR-Single-GLES32.subgroups.cluster",
        "ed.compute.subgroupclusteredxor_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002457,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.compute.subgroupclusteredadd_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002458,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.compute.subgroupclusteredmul_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002459,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.compute.subgroupclusteredmin_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002460,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.compute.subgroupclusteredmax_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002461,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.compute.subgroupclusteredand_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002462,
        "KHR-Single-GLES32.subgroups.cluster",
        "ed.compute.subgroupclusteredor_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002463,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.compute.subgroupclusteredxor_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002464,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.compute.subgroupclusteredadd_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002465,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.compute.subgroupclusteredmul_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002466,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.compute.subgroupclusteredmin_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002467,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.compute.subgroupclusteredmax_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002468,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.compute.subgroupclusteredand_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002469,
        "KHR-Single-GLES32.subgroups.cluster",
        "ed.compute.subgroupclusteredor_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002470,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.compute.subgroupclusteredxor_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002471,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.compute.subgroupclusteredadd_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002472,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.compute.subgroupclusteredmul_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002473,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.compute.subgroupclusteredmin_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002474,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.compute.subgroupclusteredmax_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002475,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.compute.subgroupclusteredand_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002476,
        "KHR-Single-GLES32.subgroups.cluster",
        "ed.compute.subgroupclusteredor_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002477,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.compute.subgroupclusteredxor_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002478,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.compute.subgroupclusteredadd_float");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002479,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.compute.subgroupclusteredmul_float");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002480,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.compute.subgroupclusteredmin_float");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002481,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.compute.subgroupclusteredmax_float");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002482,
        "KHR-Single-GLES32.subgroups.cluster",
        "ed.compute.subgroupclusteredadd_vec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002483,
        "KHR-Single-GLES32.subgroups.cluster",
        "ed.compute.subgroupclusteredmul_vec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002484,
        "KHR-Single-GLES32.subgroups.cluster",
        "ed.compute.subgroupclusteredmin_vec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002485,
        "KHR-Single-GLES32.subgroups.cluster",
        "ed.compute.subgroupclusteredmax_vec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002486,
        "KHR-Single-GLES32.subgroups.cluster",
        "ed.compute.subgroupclusteredadd_vec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002487,
        "KHR-Single-GLES32.subgroups.cluster",
        "ed.compute.subgroupclusteredmul_vec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002488,
        "KHR-Single-GLES32.subgroups.cluster",
        "ed.compute.subgroupclusteredmin_vec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002489,
        "KHR-Single-GLES32.subgroups.cluster",
        "ed.compute.subgroupclusteredmax_vec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002490,
        "KHR-Single-GLES32.subgroups.cluster",
        "ed.compute.subgroupclusteredadd_vec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002491,
        "KHR-Single-GLES32.subgroups.cluster",
        "ed.compute.subgroupclusteredmul_vec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002492,
        "KHR-Single-GLES32.subgroups.cluster",
        "ed.compute.subgroupclusteredmin_vec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002493,
        "KHR-Single-GLES32.subgroups.cluster",
        "ed.compute.subgroupclusteredmax_vec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002494,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.compute.subgroupclusteredadd_double");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002495,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.compute.subgroupclusteredmul_double");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002496,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.compute.subgroupclusteredmin_double");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002497,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.compute.subgroupclusteredmax_double");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002498,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.compute.subgroupclusteredadd_dvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002499,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.compute.subgroupclusteredmul_dvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002500,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.compute.subgroupclusteredmin_dvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002501,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.compute.subgroupclusteredmax_dvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002502,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.compute.subgroupclusteredadd_dvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002503,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.compute.subgroupclusteredmul_dvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002504,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.compute.subgroupclusteredmin_dvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002505,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.compute.subgroupclusteredmax_dvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002506,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.compute.subgroupclusteredadd_dvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002507,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.compute.subgroupclusteredmul_dvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002508,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.compute.subgroupclusteredmin_dvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002509,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.compute.subgroupclusteredmax_dvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002510,
        "KHR-Single-GLES32.subgroups.cluster",
        "ed.compute.subgroupclusteredand_bool");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002511,
        "KHR-Single-GLES32.subgroups.cluster",
        "ed.compute.subgroupclusteredor_bool");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002512,
        "KHR-Single-GLES32.subgroups.cluster",
        "ed.compute.subgroupclusteredxor_bool");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002513,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.compute.subgroupclusteredand_bvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002514,
        "KHR-Single-GLES32.subgroups.cluster",
        "ed.compute.subgroupclusteredor_bvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002515,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.compute.subgroupclusteredxor_bvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002516,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.compute.subgroupclusteredand_bvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002517,
        "KHR-Single-GLES32.subgroups.cluster",
        "ed.compute.subgroupclusteredor_bvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002518,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.compute.subgroupclusteredxor_bvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002519,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.compute.subgroupclusteredand_bvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002520,
        "KHR-Single-GLES32.subgroups.cluster",
        "ed.compute.subgroupclusteredor_bvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002521,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.compute.subgroupclusteredxor_bvec4");
