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
#include "../SubgroupsBaseFunc.h"
#include "../ActsSubgroups0010TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupinclusivexori64vec3, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupinclusivexor_i64vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupexclusiveaddi64vec3, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupexclusiveadd_i64vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupexclusivemuli64vec3, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupexclusivemul_i64vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupexclusivemini64vec3, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupexclusivemin_i64vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupexclusivemaxi64vec3, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupexclusivemax_i64vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupexclusiveandi64vec3, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupexclusiveand_i64vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupexclusiveori64vec3, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupexclusiveor_i64vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupexclusivexori64vec3, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupexclusivexor_i64vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupadduint64t, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupadd_uint64_t*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupmuluint64t, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupmul_uint64_t*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupminuint64t, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupmin_uint64_t*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupmaxuint64t, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupmax_uint64_t*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupanduint64t, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupand_uint64_t*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgrouporuint64t, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupor_uint64_t*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupxoruint64t, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupxor_uint64_t*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupinclusiveadduint64t, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupinclusiveadd_uint64_t*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupinclusivemuluint64t, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupinclusivemul_uint64_t*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupinclusiveminuint64t, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupinclusivemin_uint64_t*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupinclusivemaxuint64t, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupinclusivemax_uint64_t*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupinclusiveanduint64t, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupinclusiveand_uint64_t*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupinclusiveoruint64t, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupinclusiveor_uint64_t*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupinclusivexoruint64t, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupinclusivexor_uint64_t*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupexclusiveadduint64t, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupexclusiveadd_uint64_t*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupexclusivemuluint64t, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupexclusivemul_uint64_t*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupexclusiveminuint64t, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupexclusivemin_uint64_t*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupexclusivemaxuint64t, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupexclusivemax_uint64_t*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupexclusiveanduint64t, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupexclusiveand_uint64_t*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupexclusiveoruint64t, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupexclusiveor_uint64_t*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupexclusivexoruint64t, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupexclusivexor_uint64_t*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupaddu64vec4, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupadd_u64vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupmulu64vec4, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupmul_u64vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupminu64vec4, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupmin_u64vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupmaxu64vec4, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupmax_u64vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupandu64vec4, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupand_u64vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgrouporu64vec4, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupor_u64vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupxoru64vec4, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupxor_u64vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupinclusiveaddu64vec4, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupinclusiveadd_u64vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupinclusivemulu64vec4, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupinclusivemul_u64vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupinclusiveminu64vec4, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupinclusivemin_u64vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupinclusivemaxu64vec4, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupinclusivemax_u64vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupinclusiveandu64vec4, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupinclusiveand_u64vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupinclusiveoru64vec4, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupinclusiveor_u64vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupinclusivexoru64vec4, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupinclusivexor_u64vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupexclusiveaddu64vec4, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupexclusiveadd_u64vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupexclusivemulu64vec4, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupexclusivemul_u64vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupexclusiveminu64vec4, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupexclusivemin_u64vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupexclusivemaxu64vec4, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupexclusivemax_u64vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupexclusiveandu64vec4, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupexclusiveand_u64vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupexclusiveoru64vec4, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupexclusiveor_u64vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupexclusivexoru64vec4, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupexclusivexor_u64vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupaddf16vec4, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupadd_f16vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupmulf16vec4, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupmul_f16vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupminf16vec4, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupmin_f16vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupmaxf16vec4, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupmax_f16vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupinclusiveaddf16vec4, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupinclusiveadd_f16vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupinclusivemulf16vec4, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupinclusivemul_f16vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupinclusiveminf16vec4, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupinclusivemin_f16vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupinclusivemaxf16vec4, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupinclusivemax_f16vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupexclusiveaddf16vec4, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupexclusiveadd_f16vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupexclusivemulf16vec4, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupexclusivemul_f16vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupexclusiveminf16vec4, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupexclusivemin_f16vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupexclusivemaxf16vec4, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupexclusivemax_f16vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupaddfloat, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupadd_float*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupmulfloat, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupmul_float*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupminfloat, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupmin_float*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupmaxfloat, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupmax_float*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupinclusiveaddfloat, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupinclusiveadd_float*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupinclusivemulfloat, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupinclusivemul_float*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupinclusiveminfloat, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupinclusivemin_float*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupinclusivemaxfloat, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupinclusivemax_float*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupexclusiveaddfloat, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupexclusiveadd_float*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupexclusivemulfloat, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupexclusivemul_float*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupexclusiveminfloat, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupexclusivemin_float*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupexclusivemaxfloat, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupexclusivemax_float*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupaddvec4, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupadd_vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupmulvec4, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupmul_vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupminvec4, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupmin_vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupmaxvec4, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupmax_vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupinclusiveaddvec4, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupinclusiveadd_vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupinclusivemulvec4, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupinclusivemul_vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupinclusiveminvec4, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupinclusivemin_vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupinclusivemaxvec4, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupinclusivemax_vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupexclusiveaddvec4, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupexclusiveadd_vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupexclusivemulvec4, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupexclusivemul_vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupexclusiveminvec4, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupexclusivemin_vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupexclusivemaxvec4, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupexclusivemax_vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupadddouble, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupadd_double*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupmuldouble, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupmul_double*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupmindouble, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupmin_double*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupmaxdouble, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupmax_double*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupinclusiveadddouble, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupinclusiveadd_double*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupinclusivemuldouble, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupinclusivemul_double*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupinclusivemindouble, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupinclusivemin_double*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupinclusivemaxdouble, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupinclusivemax_double*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupexclusiveadddouble, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupexclusiveadd_double*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupexclusivemuldouble, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupexclusivemul_double*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupexclusivemindouble, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupexclusivemin_double*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupexclusivemaxdouble, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupexclusivemax_double*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupadddvec3, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupadd_dvec3*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupmuldvec3, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupmul_dvec3*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupmindvec3, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupmin_dvec3*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupmaxdvec3, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupmax_dvec3*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupinclusiveadddvec3, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupinclusiveadd_dvec3*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupinclusivemuldvec3, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupinclusivemul_dvec3*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupinclusivemindvec3, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupinclusivemin_dvec3*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupinclusivemaxdvec3, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupinclusivemax_dvec3*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupexclusiveadddvec3, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupexclusiveadd_dvec3*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupexclusivemuldvec3, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupexclusivemul_dvec3*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupexclusivemindvec3, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupexclusivemin_dvec3*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupexclusivemaxdvec3, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupexclusivemax_dvec3*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupadddvec4, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupadd_dvec4*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupmuldvec4, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupmul_dvec4*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupmindvec4, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupmin_dvec4*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupmaxdvec4, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupmax_dvec4*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupinclusiveadddvec4, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupinclusiveadd_dvec4*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupinclusivemuldvec4, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupinclusivemul_dvec4*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupinclusivemindvec4, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupinclusivemin_dvec4*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupinclusivemaxdvec4, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupinclusivemax_dvec4*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupexclusiveadddvec4, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupexclusiveadd_dvec4*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupexclusivemuldvec4, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupexclusivemul_dvec4*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupexclusivemindvec4, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupexclusivemin_dvec4*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupexclusivemaxdvec4, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupexclusivemax_dvec4*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupandbool, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupand_bool*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgrouporbool, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupor_bool*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupxorbool, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupxor_bool*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupinclusiveandbool, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupinclusiveand_bool*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupinclusiveorbool, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupinclusiveor_bool*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupinclusivexorbool, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupinclusivexor_bool*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupexclusiveandbool, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupexclusiveand_bool*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupexclusiveorbool, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupexclusiveor_bool*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupexclusivexorbool, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupexclusivexor_bool*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupandbvec2, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupand_bvec2*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgrouporbvec2, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupor_bvec2*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupxorbvec2, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupxor_bvec2*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupinclusiveandbvec2, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupinclusiveand_bvec2*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupinclusiveorbvec2, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupinclusiveor_bvec2*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupinclusivexorbvec2, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupinclusivexor_bvec2*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupexclusiveandbvec2, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupexclusiveand_bvec2*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupexclusiveorbvec2, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupexclusiveor_bvec2*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupexclusivexorbvec2, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupexclusivexor_bvec2*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupandbvec3, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupand_bvec3*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgrouporbvec3, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupor_bvec3*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupxorbvec3, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupxor_bvec3*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupinclusiveandbvec3, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupinclusiveand_bvec3*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupinclusiveorbvec3, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupinclusiveor_bvec3*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupinclusivexorbvec3, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupinclusivexor_bvec3*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupexclusiveandbvec3, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupexclusiveand_bvec3*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupexclusiveorbvec3, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupexclusiveor_bvec3*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupexclusivexorbvec3, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupexclusivexor_bvec3*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupandbvec4, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupand_bvec4*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgrouporbvec4, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupor_bvec4*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupxorbvec4, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupxor_bvec4*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupinclusiveandbvec4, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupinclusiveand_bvec4*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupinclusiveorbvec4, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupinclusiveor_bvec4*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupinclusivexorbvec4, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupinclusivexor_bvec4*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupexclusiveandbvec4, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupexclusiveand_bvec4*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupexclusiveorbvec4, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupexclusiveor_bvec4*");
static SHRINK_HWTEST_F(ActsSubgroups0010TS, TCRaytracingSubgroupexclusivexorbvec4, "dEQP-VK.subgroups.arithmetic.ray_tracing.subgroupexclusivexor_bvec4*");