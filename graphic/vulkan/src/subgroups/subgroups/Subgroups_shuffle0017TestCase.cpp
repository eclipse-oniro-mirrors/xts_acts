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
#include "../ActsSubgroups0018TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffleint8t, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffle_int8_t*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshufflexorint8t, "dEQP-VK.subgroups.shuffle.graphics.subgroupshufflexor_int8_t*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffleupint8t, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffleup_int8_t*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffledownint8t, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffledown_int8_t*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshufflei8vec2, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffle_i8vec2*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshufflexori8vec2, "dEQP-VK.subgroups.shuffle.graphics.subgroupshufflexor_i8vec2*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffleupi8vec2, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffleup_i8vec2*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffledowni8vec2, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffledown_i8vec2*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshufflei8vec3, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffle_i8vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshufflexori8vec3, "dEQP-VK.subgroups.shuffle.graphics.subgroupshufflexor_i8vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffleupi8vec3, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffleup_i8vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffledowni8vec3, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffledown_i8vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshufflei8vec4, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffle_i8vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshufflexori8vec4, "dEQP-VK.subgroups.shuffle.graphics.subgroupshufflexor_i8vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffleupi8vec4, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffleup_i8vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffledowni8vec4, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffledown_i8vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffleuint8t, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffle_uint8_t*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshufflexoruint8t, "dEQP-VK.subgroups.shuffle.graphics.subgroupshufflexor_uint8_t*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffleupuint8t, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffleup_uint8_t*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffledownuint8t, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffledown_uint8_t*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffleu8vec2, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffle_u8vec2*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshufflexoru8vec2, "dEQP-VK.subgroups.shuffle.graphics.subgroupshufflexor_u8vec2*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffleupu8vec2, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffleup_u8vec2*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffledownu8vec2, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffledown_u8vec2*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffleu8vec3, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffle_u8vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshufflexoru8vec3, "dEQP-VK.subgroups.shuffle.graphics.subgroupshufflexor_u8vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffleupu8vec3, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffleup_u8vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffledownu8vec3, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffledown_u8vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffleu8vec4, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffle_u8vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshufflexoru8vec4, "dEQP-VK.subgroups.shuffle.graphics.subgroupshufflexor_u8vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffleupu8vec4, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffleup_u8vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffledownu8vec4, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffledown_u8vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffleint16t, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffle_int16_t*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshufflexorint16t, "dEQP-VK.subgroups.shuffle.graphics.subgroupshufflexor_int16_t*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffleupint16t, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffleup_int16_t*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffledownint16t, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffledown_int16_t*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshufflei16vec2, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffle_i16vec2*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshufflexori16vec2, "dEQP-VK.subgroups.shuffle.graphics.subgroupshufflexor_i16vec2*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffleupi16vec2, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffleup_i16vec2*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffledowni16vec2, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffledown_i16vec2*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshufflei16vec3, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffle_i16vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshufflexori16vec3, "dEQP-VK.subgroups.shuffle.graphics.subgroupshufflexor_i16vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffleupi16vec3, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffleup_i16vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffledowni16vec3, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffledown_i16vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshufflei16vec4, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffle_i16vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshufflexori16vec4, "dEQP-VK.subgroups.shuffle.graphics.subgroupshufflexor_i16vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffleupi16vec4, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffleup_i16vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffledowni16vec4, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffledown_i16vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffleuint16t, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffle_uint16_t*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshufflexoruint16t, "dEQP-VK.subgroups.shuffle.graphics.subgroupshufflexor_uint16_t*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffleupuint16t, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffleup_uint16_t*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffledownuint16t, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffledown_uint16_t*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffleu16vec2, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffle_u16vec2*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshufflexoru16vec2, "dEQP-VK.subgroups.shuffle.graphics.subgroupshufflexor_u16vec2*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffleupu16vec2, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffleup_u16vec2*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffledownu16vec2, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffledown_u16vec2*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffleu16vec3, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffle_u16vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshufflexoru16vec3, "dEQP-VK.subgroups.shuffle.graphics.subgroupshufflexor_u16vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffleupu16vec3, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffleup_u16vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffledownu16vec3, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffledown_u16vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffleu16vec4, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffle_u16vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshufflexoru16vec4, "dEQP-VK.subgroups.shuffle.graphics.subgroupshufflexor_u16vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffleupu16vec4, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffleup_u16vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffledownu16vec4, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffledown_u16vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffleint, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffle_int*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshufflexorint, "dEQP-VK.subgroups.shuffle.graphics.subgroupshufflexor_int*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffleupint, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffleup_int*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffledownint, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffledown_int*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffleivec2, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffle_ivec2*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshufflexorivec2, "dEQP-VK.subgroups.shuffle.graphics.subgroupshufflexor_ivec2*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffleupivec2, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffleup_ivec2*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffledownivec2, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffledown_ivec2*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffleivec3, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffle_ivec3*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshufflexorivec3, "dEQP-VK.subgroups.shuffle.graphics.subgroupshufflexor_ivec3*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffleupivec3, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffleup_ivec3*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffledownivec3, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffledown_ivec3*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffleivec4, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffle_ivec4*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshufflexorivec4, "dEQP-VK.subgroups.shuffle.graphics.subgroupshufflexor_ivec4*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffleupivec4, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffleup_ivec4*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffledownivec4, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffledown_ivec4*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffleuint, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffle_uint*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshufflexoruint, "dEQP-VK.subgroups.shuffle.graphics.subgroupshufflexor_uint*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffleupuint, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffleup_uint*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffledownuint, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffledown_uint*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffleuvec2, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffle_uvec2*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshufflexoruvec2, "dEQP-VK.subgroups.shuffle.graphics.subgroupshufflexor_uvec2*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffleupuvec2, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffleup_uvec2*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffledownuvec2, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffledown_uvec2*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffleuvec3, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffle_uvec3*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshufflexoruvec3, "dEQP-VK.subgroups.shuffle.graphics.subgroupshufflexor_uvec3*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffleupuvec3, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffleup_uvec3*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffledownuvec3, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffledown_uvec3*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffleuvec4, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffle_uvec4*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshufflexoruvec4, "dEQP-VK.subgroups.shuffle.graphics.subgroupshufflexor_uvec4*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffleupuvec4, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffleup_uvec4*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffledownuvec4, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffledown_uvec4*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffleint64t, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffle_int64_t*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshufflexorint64t, "dEQP-VK.subgroups.shuffle.graphics.subgroupshufflexor_int64_t*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffleupint64t, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffleup_int64_t*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffledownint64t, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffledown_int64_t*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshufflei64vec2, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffle_i64vec2*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshufflexori64vec2, "dEQP-VK.subgroups.shuffle.graphics.subgroupshufflexor_i64vec2*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffleupi64vec2, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffleup_i64vec2*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffledowni64vec2, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffledown_i64vec2*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshufflei64vec3, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffle_i64vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshufflexori64vec3, "dEQP-VK.subgroups.shuffle.graphics.subgroupshufflexor_i64vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffleupi64vec3, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffleup_i64vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffledowni64vec3, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffledown_i64vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshufflei64vec4, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffle_i64vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshufflexori64vec4, "dEQP-VK.subgroups.shuffle.graphics.subgroupshufflexor_i64vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffleupi64vec4, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffleup_i64vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffledowni64vec4, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffledown_i64vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffleuint64t, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffle_uint64_t*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshufflexoruint64t, "dEQP-VK.subgroups.shuffle.graphics.subgroupshufflexor_uint64_t*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffleupuint64t, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffleup_uint64_t*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffledownuint64t, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffledown_uint64_t*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffleu64vec2, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffle_u64vec2*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshufflexoru64vec2, "dEQP-VK.subgroups.shuffle.graphics.subgroupshufflexor_u64vec2*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffleupu64vec2, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffleup_u64vec2*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffledownu64vec2, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffledown_u64vec2*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffleu64vec3, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffle_u64vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshufflexoru64vec3, "dEQP-VK.subgroups.shuffle.graphics.subgroupshufflexor_u64vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffleupu64vec3, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffleup_u64vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffledownu64vec3, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffledown_u64vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffleu64vec4, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffle_u64vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshufflexoru64vec4, "dEQP-VK.subgroups.shuffle.graphics.subgroupshufflexor_u64vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffleupu64vec4, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffleup_u64vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffledownu64vec4, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffledown_u64vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshufflefloat16t, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffle_float16_t*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshufflexorfloat16t, "dEQP-VK.subgroups.shuffle.graphics.subgroupshufflexor_float16_t*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffleupfloat16t, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffleup_float16_t*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffledownfloat16t, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffledown_float16_t*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshufflef16vec2, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffle_f16vec2*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshufflexorf16vec2, "dEQP-VK.subgroups.shuffle.graphics.subgroupshufflexor_f16vec2*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffleupf16vec2, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffleup_f16vec2*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffledownf16vec2, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffledown_f16vec2*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshufflef16vec3, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffle_f16vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshufflexorf16vec3, "dEQP-VK.subgroups.shuffle.graphics.subgroupshufflexor_f16vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffleupf16vec3, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffleup_f16vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffledownf16vec3, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffledown_f16vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshufflef16vec4, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffle_f16vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshufflexorf16vec4, "dEQP-VK.subgroups.shuffle.graphics.subgroupshufflexor_f16vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffleupf16vec4, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffleup_f16vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffledownf16vec4, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffledown_f16vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshufflefloat, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffle_float*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshufflexorfloat, "dEQP-VK.subgroups.shuffle.graphics.subgroupshufflexor_float*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffleupfloat, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffleup_float*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffledownfloat, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffledown_float*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshufflevec2, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffle_vec2*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshufflexorvec2, "dEQP-VK.subgroups.shuffle.graphics.subgroupshufflexor_vec2*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffleupvec2, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffleup_vec2*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffledownvec2, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffledown_vec2*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshufflevec3, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffle_vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshufflexorvec3, "dEQP-VK.subgroups.shuffle.graphics.subgroupshufflexor_vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffleupvec3, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffleup_vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffledownvec3, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffledown_vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshufflevec4, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffle_vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshufflexorvec4, "dEQP-VK.subgroups.shuffle.graphics.subgroupshufflexor_vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffleupvec4, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffleup_vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffledownvec4, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffledown_vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffledouble, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffle_double*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshufflexordouble, "dEQP-VK.subgroups.shuffle.graphics.subgroupshufflexor_double*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffleupdouble, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffleup_double*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffledowndouble, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffledown_double*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffledvec2, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffle_dvec2*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshufflexordvec2, "dEQP-VK.subgroups.shuffle.graphics.subgroupshufflexor_dvec2*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffleupdvec2, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffleup_dvec2*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffledowndvec2, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffledown_dvec2*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffledvec3, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffle_dvec3*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshufflexordvec3, "dEQP-VK.subgroups.shuffle.graphics.subgroupshufflexor_dvec3*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffleupdvec3, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffleup_dvec3*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffledowndvec3, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffledown_dvec3*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffledvec4, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffle_dvec4*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshufflexordvec4, "dEQP-VK.subgroups.shuffle.graphics.subgroupshufflexor_dvec4*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffleupdvec4, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffleup_dvec4*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffledowndvec4, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffledown_dvec4*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshufflebool, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffle_bool*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshufflexorbool, "dEQP-VK.subgroups.shuffle.graphics.subgroupshufflexor_bool*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffleupbool, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffleup_bool*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffledownbool, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffledown_bool*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshufflebvec2, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffle_bvec2*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshufflexorbvec2, "dEQP-VK.subgroups.shuffle.graphics.subgroupshufflexor_bvec2*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffleupbvec2, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffleup_bvec2*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffledownbvec2, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffledown_bvec2*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshufflebvec3, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffle_bvec3*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshufflexorbvec3, "dEQP-VK.subgroups.shuffle.graphics.subgroupshufflexor_bvec3*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffleupbvec3, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffleup_bvec3*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffledownbvec3, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffledown_bvec3*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshufflebvec4, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffle_bvec4*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshufflexorbvec4, "dEQP-VK.subgroups.shuffle.graphics.subgroupshufflexor_bvec4*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffleupbvec4, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffleup_bvec4*");
static SHRINK_HWTEST_F(ActsSubgroups0018TS, TCGraphicsSubgroupshuffledownbvec4, "dEQP-VK.subgroups.shuffle.graphics.subgroupshuffledown_bvec4*");