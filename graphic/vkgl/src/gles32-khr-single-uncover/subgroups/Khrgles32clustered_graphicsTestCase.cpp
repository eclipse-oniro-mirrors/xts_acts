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

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002322,
        "KHR-Single-GLES32.subgroups.cluster",
        "ed.graphics.subgroupclusteredadd_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002323,
        "KHR-Single-GLES32.subgroups.cluster",
        "ed.graphics.subgroupclusteredmul_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002324,
        "KHR-Single-GLES32.subgroups.cluster",
        "ed.graphics.subgroupclusteredmin_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002325,
        "KHR-Single-GLES32.subgroups.cluster",
        "ed.graphics.subgroupclusteredmax_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002326,
        "KHR-Single-GLES32.subgroups.cluster",
        "ed.graphics.subgroupclusteredand_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002327,
        "KHR-Single-GLES32.subgroups.cluster",
        "ed.graphics.subgroupclusteredor_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002328,
        "KHR-Single-GLES32.subgroups.cluster",
        "ed.graphics.subgroupclusteredxor_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002329,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredadd_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002330,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredmul_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002331,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredmin_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002332,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredmax_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002333,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredand_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002334,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredor_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002335,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredxor_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002336,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredadd_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002337,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredmul_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002338,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredmin_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002339,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredmax_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002340,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredand_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002341,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredor_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002342,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredxor_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002343,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredadd_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002344,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredmul_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002345,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredmin_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002346,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredmax_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002347,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredand_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002348,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredor_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002349,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredxor_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002350,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredadd_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002351,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredmul_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002352,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredmin_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002353,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredmax_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002354,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredand_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002355,
        "KHR-Single-GLES32.subgroups.cluster",
        "ed.graphics.subgroupclusteredor_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002356,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredxor_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002357,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredadd_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002358,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredmul_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002359,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredmin_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002360,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredmax_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002361,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredand_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002362,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredor_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002363,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredxor_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002364,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredadd_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002365,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredmul_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002366,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredmin_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002367,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredmax_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002368,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredand_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002369,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredor_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002370,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredxor_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002371,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredadd_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002372,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredmul_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002373,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredmin_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002374,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredmax_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002375,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredand_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002376,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredor_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002377,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredxor_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002378,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredadd_float");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002379,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredmul_float");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002380,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredmin_float");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002381,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredmax_float");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002382,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredadd_vec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002383,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredmul_vec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002384,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredmin_vec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002385,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredmax_vec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002386,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredadd_vec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002387,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredmul_vec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002388,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredmin_vec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002389,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredmax_vec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002390,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredadd_vec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002391,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredmul_vec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002392,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredmin_vec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002393,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredmax_vec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002394,
        "KHR-Single-GLES32.subgroups.clustered",
        ".graphics.subgroupclusteredadd_double");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002395,
        "KHR-Single-GLES32.subgroups.clustered",
        ".graphics.subgroupclusteredmul_double");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002396,
        "KHR-Single-GLES32.subgroups.clustered",
        ".graphics.subgroupclusteredmin_double");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002397,
        "KHR-Single-GLES32.subgroups.clustered",
        ".graphics.subgroupclusteredmax_double");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002398,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredadd_dvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002399,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredmul_dvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002400,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredmin_dvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002401,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredmax_dvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002402,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredadd_dvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002403,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredmul_dvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002404,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredmin_dvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002405,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredmax_dvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002406,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredadd_dvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002407,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredmul_dvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002408,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredmin_dvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002409,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredmax_dvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002410,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredand_bool");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002411,
        "KHR-Single-GLES32.subgroups.cluster",
        "ed.graphics.subgroupclusteredor_bool");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002412,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredxor_bool");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002413,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredand_bvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002414,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredor_bvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002415,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredxor_bvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002416,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredand_bvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002417,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredor_bvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002418,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredxor_bvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002419,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredand_bvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002420,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredor_bvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002421,
        "KHR-Single-GLES32.subgroups.clustere",
        "d.graphics.subgroupclusteredxor_bvec4");
