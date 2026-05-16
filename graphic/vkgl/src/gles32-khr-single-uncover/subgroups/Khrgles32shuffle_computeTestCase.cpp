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

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004802,
        "KHR-Single-GLES32.subgroups.shu",
        "ffle.compute.subgroupshuffle_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004803,
        "KHR-Single-GLES32.subgroups.shuff",
        "le.compute.subgroupshufflexor_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004804,
        "KHR-Single-GLES32.subgroups.shuf",
        "fle.compute.subgroupshuffleup_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004805,
        "KHR-Single-GLES32.subgroups.shuff",
        "le.compute.subgroupshuffledown_int");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004806,
        "KHR-Single-GLES32.subgroups.shuf",
        "fle.compute.subgroupshuffle_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004807,
        "KHR-Single-GLES32.subgroups.shuffl",
        "e.compute.subgroupshufflexor_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004808,
        "KHR-Single-GLES32.subgroups.shuff",
        "le.compute.subgroupshuffleup_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004809,
        "KHR-Single-GLES32.subgroups.shuffl",
        "e.compute.subgroupshuffledown_ivec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004810,
        "KHR-Single-GLES32.subgroups.shuf",
        "fle.compute.subgroupshuffle_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004811,
        "KHR-Single-GLES32.subgroups.shuffl",
        "e.compute.subgroupshufflexor_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004812,
        "KHR-Single-GLES32.subgroups.shuff",
        "le.compute.subgroupshuffleup_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004813,
        "KHR-Single-GLES32.subgroups.shuffl",
        "e.compute.subgroupshuffledown_ivec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004814,
        "KHR-Single-GLES32.subgroups.shuf",
        "fle.compute.subgroupshuffle_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004815,
        "KHR-Single-GLES32.subgroups.shuffl",
        "e.compute.subgroupshufflexor_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004816,
        "KHR-Single-GLES32.subgroups.shuff",
        "le.compute.subgroupshuffleup_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004817,
        "KHR-Single-GLES32.subgroups.shuffl",
        "e.compute.subgroupshuffledown_ivec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004818,
        "KHR-Single-GLES32.subgroups.shuf",
        "fle.compute.subgroupshuffle_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004819,
        "KHR-Single-GLES32.subgroups.shuff",
        "le.compute.subgroupshufflexor_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004820,
        "KHR-Single-GLES32.subgroups.shuff",
        "le.compute.subgroupshuffleup_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004821,
        "KHR-Single-GLES32.subgroups.shuffl",
        "e.compute.subgroupshuffledown_uint");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004822,
        "KHR-Single-GLES32.subgroups.shuf",
        "fle.compute.subgroupshuffle_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004823,
        "KHR-Single-GLES32.subgroups.shuffl",
        "e.compute.subgroupshufflexor_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004824,
        "KHR-Single-GLES32.subgroups.shuff",
        "le.compute.subgroupshuffleup_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004825,
        "KHR-Single-GLES32.subgroups.shuffl",
        "e.compute.subgroupshuffledown_uvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004826,
        "KHR-Single-GLES32.subgroups.shuf",
        "fle.compute.subgroupshuffle_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004827,
        "KHR-Single-GLES32.subgroups.shuffl",
        "e.compute.subgroupshufflexor_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004828,
        "KHR-Single-GLES32.subgroups.shuff",
        "le.compute.subgroupshuffleup_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004829,
        "KHR-Single-GLES32.subgroups.shuffl",
        "e.compute.subgroupshuffledown_uvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004830,
        "KHR-Single-GLES32.subgroups.shuf",
        "fle.compute.subgroupshuffle_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004831,
        "KHR-Single-GLES32.subgroups.shuffl",
        "e.compute.subgroupshufflexor_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004832,
        "KHR-Single-GLES32.subgroups.shuff",
        "le.compute.subgroupshuffleup_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004833,
        "KHR-Single-GLES32.subgroups.shuffl",
        "e.compute.subgroupshuffledown_uvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004834,
        "KHR-Single-GLES32.subgroups.shuf",
        "fle.compute.subgroupshuffle_float");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004835,
        "KHR-Single-GLES32.subgroups.shuffl",
        "e.compute.subgroupshufflexor_float");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004836,
        "KHR-Single-GLES32.subgroups.shuff",
        "le.compute.subgroupshuffleup_float");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004837,
        "KHR-Single-GLES32.subgroups.shuffl",
        "e.compute.subgroupshuffledown_float");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004838,
        "KHR-Single-GLES32.subgroups.shuf",
        "fle.compute.subgroupshuffle_vec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004839,
        "KHR-Single-GLES32.subgroups.shuff",
        "le.compute.subgroupshufflexor_vec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004840,
        "KHR-Single-GLES32.subgroups.shuff",
        "le.compute.subgroupshuffleup_vec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004841,
        "KHR-Single-GLES32.subgroups.shuffl",
        "e.compute.subgroupshuffledown_vec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004842,
        "KHR-Single-GLES32.subgroups.shuf",
        "fle.compute.subgroupshuffle_vec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004843,
        "KHR-Single-GLES32.subgroups.shuff",
        "le.compute.subgroupshufflexor_vec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004844,
        "KHR-Single-GLES32.subgroups.shuff",
        "le.compute.subgroupshuffleup_vec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004845,
        "KHR-Single-GLES32.subgroups.shuffl",
        "e.compute.subgroupshuffledown_vec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004846,
        "KHR-Single-GLES32.subgroups.shuf",
        "fle.compute.subgroupshuffle_vec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004847,
        "KHR-Single-GLES32.subgroups.shuff",
        "le.compute.subgroupshufflexor_vec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004848,
        "KHR-Single-GLES32.subgroups.shuff",
        "le.compute.subgroupshuffleup_vec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004849,
        "KHR-Single-GLES32.subgroups.shuffl",
        "e.compute.subgroupshuffledown_vec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004850,
        "KHR-Single-GLES32.subgroups.shuff",
        "le.compute.subgroupshuffle_double");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004851,
        "KHR-Single-GLES32.subgroups.shuffl",
        "e.compute.subgroupshufflexor_double");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004852,
        "KHR-Single-GLES32.subgroups.shuffl",
        "e.compute.subgroupshuffleup_double");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004853,
        "KHR-Single-GLES32.subgroups.shuffle",
        ".compute.subgroupshuffledown_double");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004854,
        "KHR-Single-GLES32.subgroups.shuf",
        "fle.compute.subgroupshuffle_dvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004855,
        "KHR-Single-GLES32.subgroups.shuffl",
        "e.compute.subgroupshufflexor_dvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004856,
        "KHR-Single-GLES32.subgroups.shuff",
        "le.compute.subgroupshuffleup_dvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004857,
        "KHR-Single-GLES32.subgroups.shuffl",
        "e.compute.subgroupshuffledown_dvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004858,
        "KHR-Single-GLES32.subgroups.shuf",
        "fle.compute.subgroupshuffle_dvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004859,
        "KHR-Single-GLES32.subgroups.shuffl",
        "e.compute.subgroupshufflexor_dvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004860,
        "KHR-Single-GLES32.subgroups.shuff",
        "le.compute.subgroupshuffleup_dvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004861,
        "KHR-Single-GLES32.subgroups.shuffl",
        "e.compute.subgroupshuffledown_dvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004862,
        "KHR-Single-GLES32.subgroups.shuf",
        "fle.compute.subgroupshuffle_dvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004863,
        "KHR-Single-GLES32.subgroups.shuffl",
        "e.compute.subgroupshufflexor_dvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004864,
        "KHR-Single-GLES32.subgroups.shuff",
        "le.compute.subgroupshuffleup_dvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004865,
        "KHR-Single-GLES32.subgroups.shuffl",
        "e.compute.subgroupshuffledown_dvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004866,
        "KHR-Single-GLES32.subgroups.shuf",
        "fle.compute.subgroupshuffle_bool");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004867,
        "KHR-Single-GLES32.subgroups.shuff",
        "le.compute.subgroupshufflexor_bool");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004868,
        "KHR-Single-GLES32.subgroups.shuff",
        "le.compute.subgroupshuffleup_bool");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004869,
        "KHR-Single-GLES32.subgroups.shuffl",
        "e.compute.subgroupshuffledown_bool");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004870,
        "KHR-Single-GLES32.subgroups.shuf",
        "fle.compute.subgroupshuffle_bvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004871,
        "KHR-Single-GLES32.subgroups.shuffl",
        "e.compute.subgroupshufflexor_bvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004872,
        "KHR-Single-GLES32.subgroups.shuff",
        "le.compute.subgroupshuffleup_bvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004873,
        "KHR-Single-GLES32.subgroups.shuffl",
        "e.compute.subgroupshuffledown_bvec2");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004874,
        "KHR-Single-GLES32.subgroups.shuf",
        "fle.compute.subgroupshuffle_bvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004875,
        "KHR-Single-GLES32.subgroups.shuffl",
        "e.compute.subgroupshufflexor_bvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004876,
        "KHR-Single-GLES32.subgroups.shuff",
        "le.compute.subgroupshuffleup_bvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004877,
        "KHR-Single-GLES32.subgroups.shuffl",
        "e.compute.subgroupshuffledown_bvec3");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004878,
        "KHR-Single-GLES32.subgroups.shuf",
        "fle.compute.subgroupshuffle_bvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004879,
        "KHR-Single-GLES32.subgroups.shuffl",
        "e.compute.subgroupshufflexor_bvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004880,
        "KHR-Single-GLES32.subgroups.shuff",
        "le.compute.subgroupshuffleup_bvec4");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0005TestSuite, TestCase_004881,
        "KHR-Single-GLES32.subgroups.shuffl",
        "e.compute.subgroupshuffledown_bvec4");
