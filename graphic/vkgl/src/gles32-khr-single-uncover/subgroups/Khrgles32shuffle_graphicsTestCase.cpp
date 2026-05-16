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
#include "../ActsGles32KhrSingleUncover0005TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004722,
        "KHR-Single-GLES32.subgroups.shuf",
        "fle.graphics.subgroupshuffle_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004723,
        "KHR-Single-GLES32.subgroups.shuff",
        "le.graphics.subgroupshufflexor_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004724,
        "KHR-Single-GLES32.subgroups.shuff",
        "le.graphics.subgroupshuffleup_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004725,
        "KHR-Single-GLES32.subgroups.shuffl",
        "e.graphics.subgroupshuffledown_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004726,
        "KHR-Single-GLES32.subgroups.shuff",
        "le.graphics.subgroupshuffle_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004727,
        "KHR-Single-GLES32.subgroups.shuffl",
        "e.graphics.subgroupshufflexor_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004728,
        "KHR-Single-GLES32.subgroups.shuffl",
        "e.graphics.subgroupshuffleup_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004729,
        "KHR-Single-GLES32.subgroups.shuffle",
        ".graphics.subgroupshuffledown_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004730,
        "KHR-Single-GLES32.subgroups.shuff",
        "le.graphics.subgroupshuffle_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004731,
        "KHR-Single-GLES32.subgroups.shuffl",
        "e.graphics.subgroupshufflexor_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004732,
        "KHR-Single-GLES32.subgroups.shuffl",
        "e.graphics.subgroupshuffleup_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004733,
        "KHR-Single-GLES32.subgroups.shuffle",
        ".graphics.subgroupshuffledown_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004734,
        "KHR-Single-GLES32.subgroups.shuff",
        "le.graphics.subgroupshuffle_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004735,
        "KHR-Single-GLES32.subgroups.shuffl",
        "e.graphics.subgroupshufflexor_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004736,
        "KHR-Single-GLES32.subgroups.shuffl",
        "e.graphics.subgroupshuffleup_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004737,
        "KHR-Single-GLES32.subgroups.shuffle",
        ".graphics.subgroupshuffledown_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004738,
        "KHR-Single-GLES32.subgroups.shuf",
        "fle.graphics.subgroupshuffle_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004739,
        "KHR-Single-GLES32.subgroups.shuffl",
        "e.graphics.subgroupshufflexor_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004740,
        "KHR-Single-GLES32.subgroups.shuff",
        "le.graphics.subgroupshuffleup_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004741,
        "KHR-Single-GLES32.subgroups.shuffl",
        "e.graphics.subgroupshuffledown_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004742,
        "KHR-Single-GLES32.subgroups.shuff",
        "le.graphics.subgroupshuffle_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004743,
        "KHR-Single-GLES32.subgroups.shuffl",
        "e.graphics.subgroupshufflexor_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004744,
        "KHR-Single-GLES32.subgroups.shuffl",
        "e.graphics.subgroupshuffleup_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004745,
        "KHR-Single-GLES32.subgroups.shuffle",
        ".graphics.subgroupshuffledown_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004746,
        "KHR-Single-GLES32.subgroups.shuff",
        "le.graphics.subgroupshuffle_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004747,
        "KHR-Single-GLES32.subgroups.shuffl",
        "e.graphics.subgroupshufflexor_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004748,
        "KHR-Single-GLES32.subgroups.shuffl",
        "e.graphics.subgroupshuffleup_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004749,
        "KHR-Single-GLES32.subgroups.shuffle",
        ".graphics.subgroupshuffledown_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004750,
        "KHR-Single-GLES32.subgroups.shuff",
        "le.graphics.subgroupshuffle_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004751,
        "KHR-Single-GLES32.subgroups.shuffl",
        "e.graphics.subgroupshufflexor_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004752,
        "KHR-Single-GLES32.subgroups.shuffl",
        "e.graphics.subgroupshuffleup_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004753,
        "KHR-Single-GLES32.subgroups.shuffle",
        ".graphics.subgroupshuffledown_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004754,
        "KHR-Single-GLES32.subgroups.shuff",
        "le.graphics.subgroupshuffle_float");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004755,
        "KHR-Single-GLES32.subgroups.shuffl",
        "e.graphics.subgroupshufflexor_float");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004756,
        "KHR-Single-GLES32.subgroups.shuffl",
        "e.graphics.subgroupshuffleup_float");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004757,
        "KHR-Single-GLES32.subgroups.shuffle",
        ".graphics.subgroupshuffledown_float");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004758,
        "KHR-Single-GLES32.subgroups.shuf",
        "fle.graphics.subgroupshuffle_vec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004759,
        "KHR-Single-GLES32.subgroups.shuffl",
        "e.graphics.subgroupshufflexor_vec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004760,
        "KHR-Single-GLES32.subgroups.shuff",
        "le.graphics.subgroupshuffleup_vec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004761,
        "KHR-Single-GLES32.subgroups.shuffl",
        "e.graphics.subgroupshuffledown_vec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004762,
        "KHR-Single-GLES32.subgroups.shuf",
        "fle.graphics.subgroupshuffle_vec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004763,
        "KHR-Single-GLES32.subgroups.shuffl",
        "e.graphics.subgroupshufflexor_vec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004764,
        "KHR-Single-GLES32.subgroups.shuff",
        "le.graphics.subgroupshuffleup_vec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004765,
        "KHR-Single-GLES32.subgroups.shuffl",
        "e.graphics.subgroupshuffledown_vec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004766,
        "KHR-Single-GLES32.subgroups.shuf",
        "fle.graphics.subgroupshuffle_vec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004767,
        "KHR-Single-GLES32.subgroups.shuffl",
        "e.graphics.subgroupshufflexor_vec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004768,
        "KHR-Single-GLES32.subgroups.shuff",
        "le.graphics.subgroupshuffleup_vec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004769,
        "KHR-Single-GLES32.subgroups.shuffl",
        "e.graphics.subgroupshuffledown_vec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004770,
        "KHR-Single-GLES32.subgroups.shuff",
        "le.graphics.subgroupshuffle_double");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004771,
        "KHR-Single-GLES32.subgroups.shuffle",
        ".graphics.subgroupshufflexor_double");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004772,
        "KHR-Single-GLES32.subgroups.shuffl",
        "e.graphics.subgroupshuffleup_double");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004773,
        "KHR-Single-GLES32.subgroups.shuffle",
        ".graphics.subgroupshuffledown_double");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004774,
        "KHR-Single-GLES32.subgroups.shuff",
        "le.graphics.subgroupshuffle_dvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004775,
        "KHR-Single-GLES32.subgroups.shuffl",
        "e.graphics.subgroupshufflexor_dvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004776,
        "KHR-Single-GLES32.subgroups.shuffl",
        "e.graphics.subgroupshuffleup_dvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004777,
        "KHR-Single-GLES32.subgroups.shuffle",
        ".graphics.subgroupshuffledown_dvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004778,
        "KHR-Single-GLES32.subgroups.shuff",
        "le.graphics.subgroupshuffle_dvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004779,
        "KHR-Single-GLES32.subgroups.shuffl",
        "e.graphics.subgroupshufflexor_dvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004780,
        "KHR-Single-GLES32.subgroups.shuffl",
        "e.graphics.subgroupshuffleup_dvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004781,
        "KHR-Single-GLES32.subgroups.shuffle",
        ".graphics.subgroupshuffledown_dvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004782,
        "KHR-Single-GLES32.subgroups.shuff",
        "le.graphics.subgroupshuffle_dvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004783,
        "KHR-Single-GLES32.subgroups.shuffl",
        "e.graphics.subgroupshufflexor_dvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004784,
        "KHR-Single-GLES32.subgroups.shuffl",
        "e.graphics.subgroupshuffleup_dvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004785,
        "KHR-Single-GLES32.subgroups.shuffle",
        ".graphics.subgroupshuffledown_dvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004786,
        "KHR-Single-GLES32.subgroups.shuf",
        "fle.graphics.subgroupshuffle_bool");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004787,
        "KHR-Single-GLES32.subgroups.shuffl",
        "e.graphics.subgroupshufflexor_bool");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004788,
        "KHR-Single-GLES32.subgroups.shuff",
        "le.graphics.subgroupshuffleup_bool");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004789,
        "KHR-Single-GLES32.subgroups.shuffl",
        "e.graphics.subgroupshuffledown_bool");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004790,
        "KHR-Single-GLES32.subgroups.shuff",
        "le.graphics.subgroupshuffle_bvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004791,
        "KHR-Single-GLES32.subgroups.shuffl",
        "e.graphics.subgroupshufflexor_bvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004792,
        "KHR-Single-GLES32.subgroups.shuffl",
        "e.graphics.subgroupshuffleup_bvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004793,
        "KHR-Single-GLES32.subgroups.shuffle",
        ".graphics.subgroupshuffledown_bvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004794,
        "KHR-Single-GLES32.subgroups.shuff",
        "le.graphics.subgroupshuffle_bvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004795,
        "KHR-Single-GLES32.subgroups.shuffl",
        "e.graphics.subgroupshufflexor_bvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004796,
        "KHR-Single-GLES32.subgroups.shuffl",
        "e.graphics.subgroupshuffleup_bvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004797,
        "KHR-Single-GLES32.subgroups.shuffle",
        ".graphics.subgroupshuffledown_bvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004798,
        "KHR-Single-GLES32.subgroups.shuff",
        "le.graphics.subgroupshuffle_bvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004799,
        "KHR-Single-GLES32.subgroups.shuffl",
        "e.graphics.subgroupshufflexor_bvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004800,
        "KHR-Single-GLES32.subgroups.shuffl",
        "e.graphics.subgroupshuffleup_bvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004801,
        "KHR-Single-GLES32.subgroups.shuffle",
        ".graphics.subgroupshuffledown_bvec4");
