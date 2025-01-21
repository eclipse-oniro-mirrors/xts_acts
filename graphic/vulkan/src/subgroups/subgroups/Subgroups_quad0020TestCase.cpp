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
#include "../ActsSubgroups0021TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCFramebufferSubgroupquadswapdiagonaluint16ttesscontrol, "dEQP-VK.subgroups.quad.framebuffer.*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadbroadcasti8vec3, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadbroadcast_i8vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadbroadcastnonconsti8vec3, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadbroadcast_nonconst_i8vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadswaphorizontali8vec3, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadswaphorizontal_i8vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadswapverticali8vec3, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadswapvertical_i8vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadswapdiagonali8vec3, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadswapdiagonal_i8vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadbroadcastuint8t, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadbroadcast_uint8_t*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadbroadcastnonconstuint8t, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadbroadcast_nonconst_uint8_t*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadswaphorizontaluint8t, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadswaphorizontal_uint8_t*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadswapverticaluint8t, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadswapvertical_uint8_t*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadswapdiagonaluint8t, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadswapdiagonal_uint8_t*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadbroadcastu8vec4, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadbroadcast_u8vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadbroadcastnonconstu8vec4, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadbroadcast_nonconst_u8vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadswaphorizontalu8vec4, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadswaphorizontal_u8vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadswapverticalu8vec4, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadswapvertical_u8vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadswapdiagonalu8vec4, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadswapdiagonal_u8vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadbroadcasti16vec3, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadbroadcast_i16vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadbroadcastnonconsti16vec3, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadbroadcast_nonconst_i16vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadswaphorizontali16vec3, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadswaphorizontal_i16vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadswapverticali16vec3, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadswapvertical_i16vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadswapdiagonali16vec3, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadswapdiagonal_i16vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadbroadcastuint16t, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadbroadcast_uint16_t*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadbroadcastnonconstuint16t, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadbroadcast_nonconst_uint16_t*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadswaphorizontaluint16t, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadswaphorizontal_uint16_t*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadswapverticaluint16t, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadswapvertical_uint16_t*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadswapdiagonaluint16t, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadswapdiagonal_uint16_t*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadbroadcastu16vec4, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadbroadcast_u16vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadbroadcastnonconstu16vec4, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadbroadcast_nonconst_u16vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadswaphorizontalu16vec4, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadswaphorizontal_u16vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadswapverticalu16vec4, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadswapvertical_u16vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadswapdiagonalu16vec4, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadswapdiagonal_u16vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadbroadcastivec3, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadbroadcast_ivec3*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadbroadcastnonconstivec3, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadbroadcast_nonconst_ivec3*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadswaphorizontalivec3, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadswaphorizontal_ivec3*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadswapverticalivec3, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadswapvertical_ivec3*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadswapdiagonalivec3, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadswapdiagonal_ivec3*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadbroadcastuint, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadbroadcast_uint*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadbroadcastnonconstuint, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadbroadcast_nonconst_uint*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadswaphorizontaluint, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadswaphorizontal_uint*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadswapverticaluint, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadswapvertical_uint*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadswapdiagonaluint, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadswapdiagonal_uint*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadbroadcastuvec4, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadbroadcast_uvec4*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadbroadcastnonconstuvec4, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadbroadcast_nonconst_uvec4*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadswaphorizontaluvec4, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadswaphorizontal_uvec4*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadswapverticaluvec4, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadswapvertical_uvec4*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadswapdiagonaluvec4, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadswapdiagonal_uvec4*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadbroadcasti64vec3, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadbroadcast_i64vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadbroadcastnonconsti64vec3, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadbroadcast_nonconst_i64vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadswaphorizontali64vec3, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadswaphorizontal_i64vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadswapverticali64vec3, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadswapvertical_i64vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadswapdiagonali64vec3, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadswapdiagonal_i64vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadbroadcastuint64t, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadbroadcast_uint64_t*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadbroadcastnonconstuint64t, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadbroadcast_nonconst_uint64_t*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadswaphorizontaluint64t, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadswaphorizontal_uint64_t*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadswapverticaluint64t, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadswapvertical_uint64_t*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadswapdiagonaluint64t, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadswapdiagonal_uint64_t*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadbroadcastu64vec4, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadbroadcast_u64vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadbroadcastnonconstu64vec4, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadbroadcast_nonconst_u64vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadswaphorizontalu64vec4, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadswaphorizontal_u64vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadswapverticalu64vec4, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadswapvertical_u64vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadswapdiagonalu64vec4, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadswapdiagonal_u64vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadbroadcastf16vec4, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadbroadcast_f16vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadbroadcastnonconstf16vec4, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadbroadcast_nonconst_f16vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadswaphorizontalf16vec4, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadswaphorizontal_f16vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadswapverticalf16vec4, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadswapvertical_f16vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadswapdiagonalf16vec4, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadswapdiagonal_f16vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadbroadcastfloat, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadbroadcast_float*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadbroadcastnonconstfloat, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadbroadcast_nonconst_float*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadswaphorizontalfloat, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadswaphorizontal_float*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadswapverticalfloat, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadswapvertical_float*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadswapdiagonalfloat, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadswapdiagonal_float*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadbroadcastvec4, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadbroadcast_vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadbroadcastnonconstvec4, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadbroadcast_nonconst_vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadswaphorizontalvec4, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadswaphorizontal_vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadswapverticalvec4, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadswapvertical_vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadswapdiagonalvec4, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadswapdiagonal_vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadbroadcastdouble, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadbroadcast_double*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadbroadcastnonconstdouble, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadbroadcast_nonconst_double*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadswaphorizontaldouble, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadswaphorizontal_double*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadswapverticaldouble, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadswapvertical_double*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadswapdiagonaldouble, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadswapdiagonal_double*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadbroadcastdvec3, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadbroadcast_dvec3*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadbroadcastnonconstdvec3, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadbroadcast_nonconst_dvec3*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadswaphorizontaldvec3, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadswaphorizontal_dvec3*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadswapverticaldvec3, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadswapvertical_dvec3*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadswapdiagonaldvec3, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadswapdiagonal_dvec3*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadbroadcastdvec4, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadbroadcast_dvec4*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadbroadcastnonconstdvec4, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadbroadcast_nonconst_dvec4*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadswaphorizontaldvec4, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadswaphorizontal_dvec4*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadswapverticaldvec4, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadswapvertical_dvec4*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadswapdiagonaldvec4, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadswapdiagonal_dvec4*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadbroadcastbool, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadbroadcast_bool*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadbroadcastnonconstbool, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadbroadcast_nonconst_bool*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadswaphorizontalbool, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadswaphorizontal_bool*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadswapverticalbool, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadswapvertical_bool*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadswapdiagonalbool, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadswapdiagonal_bool*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadbroadcastbvec2, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadbroadcast_bvec2*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadbroadcastnonconstbvec2, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadbroadcast_nonconst_bvec2*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadswaphorizontalbvec2, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadswaphorizontal_bvec2*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadswapverticalbvec2, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadswapvertical_bvec2*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadswapdiagonalbvec2, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadswapdiagonal_bvec2*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadbroadcastbvec3, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadbroadcast_bvec3*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadbroadcastnonconstbvec3, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadbroadcast_nonconst_bvec3*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadswaphorizontalbvec3, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadswaphorizontal_bvec3*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadswapverticalbvec3, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadswapvertical_bvec3*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadswapdiagonalbvec3, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadswapdiagonal_bvec3*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadbroadcastbvec4, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadbroadcast_bvec4*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadbroadcastnonconstbvec4, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadbroadcast_nonconst_bvec4*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadswaphorizontalbvec4, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadswaphorizontal_bvec4*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadswapverticalbvec4, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadswapvertical_bvec4*");
static SHRINK_HWTEST_F(ActsSubgroups0021TS, TCRaytracingSubgroupquadswapdiagonalbvec4, "dEQP-VK.subgroups.quad.ray_tracing.subgroupquadswapdiagonal_bvec4*");