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
#include "../ActsSubgroups0003TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupaddint8t, "dEQP-VK.subgroups.arithmetic.graphics.subgroupadd_int8_t*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupmulint8t, "dEQP-VK.subgroups.arithmetic.graphics.subgroupmul_int8_t*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupminint8t, "dEQP-VK.subgroups.arithmetic.graphics.subgroupmin_int8_t*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupmaxint8t, "dEQP-VK.subgroups.arithmetic.graphics.subgroupmax_int8_t*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupandint8t, "dEQP-VK.subgroups.arithmetic.graphics.subgroupand_int8_t*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgrouporint8t, "dEQP-VK.subgroups.arithmetic.graphics.subgroupor_int8_t*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupxorint8t, "dEQP-VK.subgroups.arithmetic.graphics.subgroupxor_int8_t*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupinclusiveaddint8t, "dEQP-VK.subgroups.arithmetic.graphics.subgroupinclusiveadd_int8_t*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupinclusivemulint8t, "dEQP-VK.subgroups.arithmetic.graphics.subgroupinclusivemul_int8_t*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupinclusiveminint8t, "dEQP-VK.subgroups.arithmetic.graphics.subgroupinclusivemin_int8_t*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupinclusivemaxint8t, "dEQP-VK.subgroups.arithmetic.graphics.subgroupinclusivemax_int8_t*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupinclusiveandint8t, "dEQP-VK.subgroups.arithmetic.graphics.subgroupinclusiveand_int8_t*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupinclusiveorint8t, "dEQP-VK.subgroups.arithmetic.graphics.subgroupinclusiveor_int8_t*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupinclusivexorint8t, "dEQP-VK.subgroups.arithmetic.graphics.subgroupinclusivexor_int8_t*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupexclusiveaddint8t, "dEQP-VK.subgroups.arithmetic.graphics.subgroupexclusiveadd_int8_t*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupexclusivemulint8t, "dEQP-VK.subgroups.arithmetic.graphics.subgroupexclusivemul_int8_t*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupexclusiveminint8t, "dEQP-VK.subgroups.arithmetic.graphics.subgroupexclusivemin_int8_t*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupexclusivemaxint8t, "dEQP-VK.subgroups.arithmetic.graphics.subgroupexclusivemax_int8_t*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupexclusiveandint8t, "dEQP-VK.subgroups.arithmetic.graphics.subgroupexclusiveand_int8_t*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupexclusiveorint8t, "dEQP-VK.subgroups.arithmetic.graphics.subgroupexclusiveor_int8_t*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupexclusivexorint8t, "dEQP-VK.subgroups.arithmetic.graphics.subgroupexclusivexor_int8_t*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupaddi8vec2, "dEQP-VK.subgroups.arithmetic.graphics.subgroupadd_i8vec2*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupmuli8vec2, "dEQP-VK.subgroups.arithmetic.graphics.subgroupmul_i8vec2*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupmini8vec2, "dEQP-VK.subgroups.arithmetic.graphics.subgroupmin_i8vec2*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupmaxi8vec2, "dEQP-VK.subgroups.arithmetic.graphics.subgroupmax_i8vec2*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupandi8vec2, "dEQP-VK.subgroups.arithmetic.graphics.subgroupand_i8vec2*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupori8vec2, "dEQP-VK.subgroups.arithmetic.graphics.subgroupor_i8vec2*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupxori8vec2, "dEQP-VK.subgroups.arithmetic.graphics.subgroupxor_i8vec2*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupinclusiveaddi8vec2, "dEQP-VK.subgroups.arithmetic.graphics.subgroupinclusiveadd_i8vec2*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupinclusivemuli8vec2, "dEQP-VK.subgroups.arithmetic.graphics.subgroupinclusivemul_i8vec2*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupinclusivemini8vec2, "dEQP-VK.subgroups.arithmetic.graphics.subgroupinclusivemin_i8vec2*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupinclusivemaxi8vec2, "dEQP-VK.subgroups.arithmetic.graphics.subgroupinclusivemax_i8vec2*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupinclusiveandi8vec2, "dEQP-VK.subgroups.arithmetic.graphics.subgroupinclusiveand_i8vec2*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupinclusiveori8vec2, "dEQP-VK.subgroups.arithmetic.graphics.subgroupinclusiveor_i8vec2*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupinclusivexori8vec2, "dEQP-VK.subgroups.arithmetic.graphics.subgroupinclusivexor_i8vec2*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupexclusiveaddi8vec2, "dEQP-VK.subgroups.arithmetic.graphics.subgroupexclusiveadd_i8vec2*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupexclusivemuli8vec2, "dEQP-VK.subgroups.arithmetic.graphics.subgroupexclusivemul_i8vec2*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupexclusivemini8vec2, "dEQP-VK.subgroups.arithmetic.graphics.subgroupexclusivemin_i8vec2*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupexclusivemaxi8vec2, "dEQP-VK.subgroups.arithmetic.graphics.subgroupexclusivemax_i8vec2*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupexclusiveandi8vec2, "dEQP-VK.subgroups.arithmetic.graphics.subgroupexclusiveand_i8vec2*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupexclusiveori8vec2, "dEQP-VK.subgroups.arithmetic.graphics.subgroupexclusiveor_i8vec2*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupexclusivexori8vec2, "dEQP-VK.subgroups.arithmetic.graphics.subgroupexclusivexor_i8vec2*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupaddi8vec3, "dEQP-VK.subgroups.arithmetic.graphics.subgroupadd_i8vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupmuli8vec3, "dEQP-VK.subgroups.arithmetic.graphics.subgroupmul_i8vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupmini8vec3, "dEQP-VK.subgroups.arithmetic.graphics.subgroupmin_i8vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupmaxi8vec3, "dEQP-VK.subgroups.arithmetic.graphics.subgroupmax_i8vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupandi8vec3, "dEQP-VK.subgroups.arithmetic.graphics.subgroupand_i8vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupori8vec3, "dEQP-VK.subgroups.arithmetic.graphics.subgroupor_i8vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupxori8vec3, "dEQP-VK.subgroups.arithmetic.graphics.subgroupxor_i8vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupinclusiveaddi8vec3, "dEQP-VK.subgroups.arithmetic.graphics.subgroupinclusiveadd_i8vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupinclusivemuli8vec3, "dEQP-VK.subgroups.arithmetic.graphics.subgroupinclusivemul_i8vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupinclusivemini8vec3, "dEQP-VK.subgroups.arithmetic.graphics.subgroupinclusivemin_i8vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupinclusivemaxi8vec3, "dEQP-VK.subgroups.arithmetic.graphics.subgroupinclusivemax_i8vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupinclusiveandi8vec3, "dEQP-VK.subgroups.arithmetic.graphics.subgroupinclusiveand_i8vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupinclusiveori8vec3, "dEQP-VK.subgroups.arithmetic.graphics.subgroupinclusiveor_i8vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupinclusivexori8vec3, "dEQP-VK.subgroups.arithmetic.graphics.subgroupinclusivexor_i8vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupexclusiveaddi8vec3, "dEQP-VK.subgroups.arithmetic.graphics.subgroupexclusiveadd_i8vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupexclusivemuli8vec3, "dEQP-VK.subgroups.arithmetic.graphics.subgroupexclusivemul_i8vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupexclusivemini8vec3, "dEQP-VK.subgroups.arithmetic.graphics.subgroupexclusivemin_i8vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupexclusivemaxi8vec3, "dEQP-VK.subgroups.arithmetic.graphics.subgroupexclusivemax_i8vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupexclusiveandi8vec3, "dEQP-VK.subgroups.arithmetic.graphics.subgroupexclusiveand_i8vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupexclusiveori8vec3, "dEQP-VK.subgroups.arithmetic.graphics.subgroupexclusiveor_i8vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupexclusivexori8vec3, "dEQP-VK.subgroups.arithmetic.graphics.subgroupexclusivexor_i8vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupaddi8vec4, "dEQP-VK.subgroups.arithmetic.graphics.subgroupadd_i8vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupmuli8vec4, "dEQP-VK.subgroups.arithmetic.graphics.subgroupmul_i8vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupmini8vec4, "dEQP-VK.subgroups.arithmetic.graphics.subgroupmin_i8vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupmaxi8vec4, "dEQP-VK.subgroups.arithmetic.graphics.subgroupmax_i8vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupandi8vec4, "dEQP-VK.subgroups.arithmetic.graphics.subgroupand_i8vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupori8vec4, "dEQP-VK.subgroups.arithmetic.graphics.subgroupor_i8vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupxori8vec4, "dEQP-VK.subgroups.arithmetic.graphics.subgroupxor_i8vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupinclusiveaddi8vec4, "dEQP-VK.subgroups.arithmetic.graphics.subgroupinclusiveadd_i8vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupinclusivemuli8vec4, "dEQP-VK.subgroups.arithmetic.graphics.subgroupinclusivemul_i8vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupinclusivemini8vec4, "dEQP-VK.subgroups.arithmetic.graphics.subgroupinclusivemin_i8vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupinclusivemaxi8vec4, "dEQP-VK.subgroups.arithmetic.graphics.subgroupinclusivemax_i8vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupinclusiveandi8vec4, "dEQP-VK.subgroups.arithmetic.graphics.subgroupinclusiveand_i8vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupinclusiveori8vec4, "dEQP-VK.subgroups.arithmetic.graphics.subgroupinclusiveor_i8vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupinclusivexori8vec4, "dEQP-VK.subgroups.arithmetic.graphics.subgroupinclusivexor_i8vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupexclusiveaddi8vec4, "dEQP-VK.subgroups.arithmetic.graphics.subgroupexclusiveadd_i8vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupexclusivemuli8vec4, "dEQP-VK.subgroups.arithmetic.graphics.subgroupexclusivemul_i8vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupexclusivemini8vec4, "dEQP-VK.subgroups.arithmetic.graphics.subgroupexclusivemin_i8vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupexclusivemaxi8vec4, "dEQP-VK.subgroups.arithmetic.graphics.subgroupexclusivemax_i8vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupexclusiveandi8vec4, "dEQP-VK.subgroups.arithmetic.graphics.subgroupexclusiveand_i8vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupexclusiveori8vec4, "dEQP-VK.subgroups.arithmetic.graphics.subgroupexclusiveor_i8vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupexclusivexori8vec4, "dEQP-VK.subgroups.arithmetic.graphics.subgroupexclusivexor_i8vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupadduint8t, "dEQP-VK.subgroups.arithmetic.graphics.subgroupadd_uint8_t*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupmuluint8t, "dEQP-VK.subgroups.arithmetic.graphics.subgroupmul_uint8_t*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupminuint8t, "dEQP-VK.subgroups.arithmetic.graphics.subgroupmin_uint8_t*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupmaxuint8t, "dEQP-VK.subgroups.arithmetic.graphics.subgroupmax_uint8_t*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupanduint8t, "dEQP-VK.subgroups.arithmetic.graphics.subgroupand_uint8_t*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgrouporuint8t, "dEQP-VK.subgroups.arithmetic.graphics.subgroupor_uint8_t*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupxoruint8t, "dEQP-VK.subgroups.arithmetic.graphics.subgroupxor_uint8_t*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupinclusiveadduint8t, "dEQP-VK.subgroups.arithmetic.graphics.subgroupinclusiveadd_uint8_t*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupinclusivemuluint8t, "dEQP-VK.subgroups.arithmetic.graphics.subgroupinclusivemul_uint8_t*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupinclusiveminuint8t, "dEQP-VK.subgroups.arithmetic.graphics.subgroupinclusivemin_uint8_t*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupinclusivemaxuint8t, "dEQP-VK.subgroups.arithmetic.graphics.subgroupinclusivemax_uint8_t*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupinclusiveanduint8t, "dEQP-VK.subgroups.arithmetic.graphics.subgroupinclusiveand_uint8_t*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupinclusiveoruint8t, "dEQP-VK.subgroups.arithmetic.graphics.subgroupinclusiveor_uint8_t*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupinclusivexoruint8t, "dEQP-VK.subgroups.arithmetic.graphics.subgroupinclusivexor_uint8_t*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupexclusiveadduint8t, "dEQP-VK.subgroups.arithmetic.graphics.subgroupexclusiveadd_uint8_t*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupexclusivemuluint8t, "dEQP-VK.subgroups.arithmetic.graphics.subgroupexclusivemul_uint8_t*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupexclusiveminuint8t, "dEQP-VK.subgroups.arithmetic.graphics.subgroupexclusivemin_uint8_t*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupexclusivemaxuint8t, "dEQP-VK.subgroups.arithmetic.graphics.subgroupexclusivemax_uint8_t*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupexclusiveanduint8t, "dEQP-VK.subgroups.arithmetic.graphics.subgroupexclusiveand_uint8_t*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupexclusiveoruint8t, "dEQP-VK.subgroups.arithmetic.graphics.subgroupexclusiveor_uint8_t*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupexclusivexoruint8t, "dEQP-VK.subgroups.arithmetic.graphics.subgroupexclusivexor_uint8_t*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupaddu8vec2, "dEQP-VK.subgroups.arithmetic.graphics.subgroupadd_u8vec2*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupmulu8vec2, "dEQP-VK.subgroups.arithmetic.graphics.subgroupmul_u8vec2*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupminu8vec2, "dEQP-VK.subgroups.arithmetic.graphics.subgroupmin_u8vec2*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupmaxu8vec2, "dEQP-VK.subgroups.arithmetic.graphics.subgroupmax_u8vec2*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupandu8vec2, "dEQP-VK.subgroups.arithmetic.graphics.subgroupand_u8vec2*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgrouporu8vec2, "dEQP-VK.subgroups.arithmetic.graphics.subgroupor_u8vec2*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupxoru8vec2, "dEQP-VK.subgroups.arithmetic.graphics.subgroupxor_u8vec2*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupinclusiveaddu8vec2, "dEQP-VK.subgroups.arithmetic.graphics.subgroupinclusiveadd_u8vec2*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupinclusivemulu8vec2, "dEQP-VK.subgroups.arithmetic.graphics.subgroupinclusivemul_u8vec2*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupinclusiveminu8vec2, "dEQP-VK.subgroups.arithmetic.graphics.subgroupinclusivemin_u8vec2*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupinclusivemaxu8vec2, "dEQP-VK.subgroups.arithmetic.graphics.subgroupinclusivemax_u8vec2*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupinclusiveandu8vec2, "dEQP-VK.subgroups.arithmetic.graphics.subgroupinclusiveand_u8vec2*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupinclusiveoru8vec2, "dEQP-VK.subgroups.arithmetic.graphics.subgroupinclusiveor_u8vec2*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupinclusivexoru8vec2, "dEQP-VK.subgroups.arithmetic.graphics.subgroupinclusivexor_u8vec2*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupexclusiveaddu8vec2, "dEQP-VK.subgroups.arithmetic.graphics.subgroupexclusiveadd_u8vec2*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupexclusivemulu8vec2, "dEQP-VK.subgroups.arithmetic.graphics.subgroupexclusivemul_u8vec2*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupexclusiveminu8vec2, "dEQP-VK.subgroups.arithmetic.graphics.subgroupexclusivemin_u8vec2*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupexclusivemaxu8vec2, "dEQP-VK.subgroups.arithmetic.graphics.subgroupexclusivemax_u8vec2*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupexclusiveandu8vec2, "dEQP-VK.subgroups.arithmetic.graphics.subgroupexclusiveand_u8vec2*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupexclusiveoru8vec2, "dEQP-VK.subgroups.arithmetic.graphics.subgroupexclusiveor_u8vec2*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupexclusivexoru8vec2, "dEQP-VK.subgroups.arithmetic.graphics.subgroupexclusivexor_u8vec2*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupaddu8vec3, "dEQP-VK.subgroups.arithmetic.graphics.subgroupadd_u8vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupmulu8vec3, "dEQP-VK.subgroups.arithmetic.graphics.subgroupmul_u8vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupminu8vec3, "dEQP-VK.subgroups.arithmetic.graphics.subgroupmin_u8vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupmaxu8vec3, "dEQP-VK.subgroups.arithmetic.graphics.subgroupmax_u8vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupandu8vec3, "dEQP-VK.subgroups.arithmetic.graphics.subgroupand_u8vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgrouporu8vec3, "dEQP-VK.subgroups.arithmetic.graphics.subgroupor_u8vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupxoru8vec3, "dEQP-VK.subgroups.arithmetic.graphics.subgroupxor_u8vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupinclusiveaddu8vec3, "dEQP-VK.subgroups.arithmetic.graphics.subgroupinclusiveadd_u8vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupinclusivemulu8vec3, "dEQP-VK.subgroups.arithmetic.graphics.subgroupinclusivemul_u8vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupinclusiveminu8vec3, "dEQP-VK.subgroups.arithmetic.graphics.subgroupinclusivemin_u8vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupinclusivemaxu8vec3, "dEQP-VK.subgroups.arithmetic.graphics.subgroupinclusivemax_u8vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupinclusiveandu8vec3, "dEQP-VK.subgroups.arithmetic.graphics.subgroupinclusiveand_u8vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupinclusiveoru8vec3, "dEQP-VK.subgroups.arithmetic.graphics.subgroupinclusiveor_u8vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupinclusivexoru8vec3, "dEQP-VK.subgroups.arithmetic.graphics.subgroupinclusivexor_u8vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupexclusiveaddu8vec3, "dEQP-VK.subgroups.arithmetic.graphics.subgroupexclusiveadd_u8vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupexclusivemulu8vec3, "dEQP-VK.subgroups.arithmetic.graphics.subgroupexclusivemul_u8vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupexclusiveminu8vec3, "dEQP-VK.subgroups.arithmetic.graphics.subgroupexclusivemin_u8vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupexclusivemaxu8vec3, "dEQP-VK.subgroups.arithmetic.graphics.subgroupexclusivemax_u8vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupexclusiveandu8vec3, "dEQP-VK.subgroups.arithmetic.graphics.subgroupexclusiveand_u8vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupexclusiveoru8vec3, "dEQP-VK.subgroups.arithmetic.graphics.subgroupexclusiveor_u8vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupexclusivexoru8vec3, "dEQP-VK.subgroups.arithmetic.graphics.subgroupexclusivexor_u8vec3*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupaddu8vec4, "dEQP-VK.subgroups.arithmetic.graphics.subgroupadd_u8vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupmulu8vec4, "dEQP-VK.subgroups.arithmetic.graphics.subgroupmul_u8vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupminu8vec4, "dEQP-VK.subgroups.arithmetic.graphics.subgroupmin_u8vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupmaxu8vec4, "dEQP-VK.subgroups.arithmetic.graphics.subgroupmax_u8vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupandu8vec4, "dEQP-VK.subgroups.arithmetic.graphics.subgroupand_u8vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgrouporu8vec4, "dEQP-VK.subgroups.arithmetic.graphics.subgroupor_u8vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupxoru8vec4, "dEQP-VK.subgroups.arithmetic.graphics.subgroupxor_u8vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupinclusiveaddu8vec4, "dEQP-VK.subgroups.arithmetic.graphics.subgroupinclusiveadd_u8vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupinclusivemulu8vec4, "dEQP-VK.subgroups.arithmetic.graphics.subgroupinclusivemul_u8vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupinclusiveminu8vec4, "dEQP-VK.subgroups.arithmetic.graphics.subgroupinclusivemin_u8vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupinclusivemaxu8vec4, "dEQP-VK.subgroups.arithmetic.graphics.subgroupinclusivemax_u8vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupinclusiveandu8vec4, "dEQP-VK.subgroups.arithmetic.graphics.subgroupinclusiveand_u8vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupinclusiveoru8vec4, "dEQP-VK.subgroups.arithmetic.graphics.subgroupinclusiveor_u8vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupinclusivexoru8vec4, "dEQP-VK.subgroups.arithmetic.graphics.subgroupinclusivexor_u8vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupexclusiveaddu8vec4, "dEQP-VK.subgroups.arithmetic.graphics.subgroupexclusiveadd_u8vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupexclusivemulu8vec4, "dEQP-VK.subgroups.arithmetic.graphics.subgroupexclusivemul_u8vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupexclusiveminu8vec4, "dEQP-VK.subgroups.arithmetic.graphics.subgroupexclusivemin_u8vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupexclusivemaxu8vec4, "dEQP-VK.subgroups.arithmetic.graphics.subgroupexclusivemax_u8vec4*");
static SHRINK_HWTEST_F(ActsSubgroups0003TS, TCGraphicsSubgroupexclusiveandu8vec4, "dEQP-VK.subgroups.arithmetic.graphics.subgroupexclusiveand_u8vec4*");