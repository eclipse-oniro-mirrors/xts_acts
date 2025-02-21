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
#include "../ActsSubgroups0012TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCFramebufferSubgroupclusteredmaxvec2tesscontrol, "dEQP-VK.subgroups.clustered.framebuffer.*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredaddi8vec3, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredadd_i8vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredmuli8vec3, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredmul_i8vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredmini8vec3, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredmin_i8vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredmaxi8vec3, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredmax_i8vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredandi8vec3, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredand_i8vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredori8vec3, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredor_i8vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredxori8vec3, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredxor_i8vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredadduint8t, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredadd_uint8_t*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredmuluint8t, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredmul_uint8_t*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredminuint8t, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredmin_uint8_t*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredmaxuint8t, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredmax_uint8_t*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredanduint8t, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredand_uint8_t*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredoruint8t, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredor_uint8_t*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredxoruint8t, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredxor_uint8_t*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredaddu8vec4, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredadd_u8vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredmulu8vec4, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredmul_u8vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredminu8vec4, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredmin_u8vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredmaxu8vec4, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredmax_u8vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredandu8vec4, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredand_u8vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredoru8vec4, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredor_u8vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredxoru8vec4, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredxor_u8vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredaddi16vec3, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredadd_i16vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredmuli16vec3, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredmul_i16vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredmini16vec3, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredmin_i16vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredmaxi16vec3, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredmax_i16vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredandi16vec3, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredand_i16vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredori16vec3, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredor_i16vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredxori16vec3, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredxor_i16vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredadduint16t, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredadd_uint16_t*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredmuluint16t, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredmul_uint16_t*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredminuint16t, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredmin_uint16_t*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredmaxuint16t, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredmax_uint16_t*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredanduint16t, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredand_uint16_t*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredoruint16t, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredor_uint16_t*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredxoruint16t, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredxor_uint16_t*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredaddu16vec4, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredadd_u16vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredmulu16vec4, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredmul_u16vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredminu16vec4, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredmin_u16vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredmaxu16vec4, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredmax_u16vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredandu16vec4, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredand_u16vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredoru16vec4, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredor_u16vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredxoru16vec4, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredxor_u16vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredaddivec3, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredadd_ivec3*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredmulivec3, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredmul_ivec3*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredminivec3, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredmin_ivec3*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredmaxivec3, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredmax_ivec3*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredandivec3, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredand_ivec3*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredorivec3, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredor_ivec3*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredxorivec3, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredxor_ivec3*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredadduint, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredadd_uint*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredmuluint, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredmul_uint*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredminuint, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredmin_uint*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredmaxuint, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredmax_uint*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredanduint, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredand_uint*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredoruint, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredor_uint*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredxoruint, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredxor_uint*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredadduvec4, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredadd_uvec4*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredmuluvec4, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredmul_uvec4*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredminuvec4, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredmin_uvec4*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredmaxuvec4, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredmax_uvec4*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredanduvec4, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredand_uvec4*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredoruvec4, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredor_uvec4*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredxoruvec4, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredxor_uvec4*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredaddi64vec3, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredadd_i64vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredmuli64vec3, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredmul_i64vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredmini64vec3, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredmin_i64vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredmaxi64vec3, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredmax_i64vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredandi64vec3, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredand_i64vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredori64vec3, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredor_i64vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredxori64vec3, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredxor_i64vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredadduint64t, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredadd_uint64_t*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredmuluint64t, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredmul_uint64_t*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredminuint64t, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredmin_uint64_t*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredmaxuint64t, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredmax_uint64_t*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredanduint64t, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredand_uint64_t*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredoruint64t, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredor_uint64_t*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredxoruint64t, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredxor_uint64_t*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredaddu64vec4, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredadd_u64vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredmulu64vec4, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredmul_u64vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredminu64vec4, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredmin_u64vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredmaxu64vec4, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredmax_u64vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredandu64vec4, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredand_u64vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredoru64vec4, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredor_u64vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredxoru64vec4, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredxor_u64vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredaddf16vec4, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredadd_f16vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredmulf16vec4, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredmul_f16vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredminf16vec4, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredmin_f16vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredmaxf16vec4, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredmax_f16vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredaddfloat, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredadd_float*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredmulfloat, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredmul_float*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredminfloat, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredmin_float*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredmaxfloat, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredmax_float*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredaddvec4, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredadd_vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredmulvec4, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredmul_vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredminvec4, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredmin_vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredmaxvec4, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredmax_vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredadddouble, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredadd_double*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredmuldouble, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredmul_double*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredmindouble, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredmin_double*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredmaxdouble, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredmax_double*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredadddvec3, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredadd_dvec3*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredmuldvec3, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredmul_dvec3*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredmindvec3, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredmin_dvec3*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredmaxdvec3, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredmax_dvec3*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredadddvec4, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredadd_dvec4*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredmuldvec4, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredmul_dvec4*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredmindvec4, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredmin_dvec4*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredmaxdvec4, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredmax_dvec4*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredandbool, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredand_bool*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredorbool, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredor_bool*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredxorbool, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredxor_bool*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredandbvec2, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredand_bvec2*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredorbvec2, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredor_bvec2*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredxorbvec2, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredxor_bvec2*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredandbvec3, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredand_bvec3*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredorbvec3, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredor_bvec3*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredxorbvec3, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredxor_bvec3*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredandbvec4, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredand_bvec4*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredorbvec4, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredor_bvec4*");
static SHRINK_HWTEST_F(ActsSubgroups0012TS, TCRaytracingSubgroupclusteredxorbvec4, "dEQP-VK.subgroups.clustered.ray_tracing.subgroupclusteredxor_bvec4*");