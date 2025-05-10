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
#include "../Deqpgles3BaseFunc.h"
#include "../ActsDeqpgles30028TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027668,
        "dEQP-GLES3.functional.fra",
        "gment_ops.depth.cmp_always");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027669,
        "dEQP-GLES3.functional.fra",
        "gment_ops.depth.cmp_never");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027670,
        "dEQP-GLES3.functional.fra",
        "gment_ops.depth.cmp_equal");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027671,
        "dEQP-GLES3.functional.fragm",
        "ent_ops.depth.cmp_not_equal");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027672,
        "dEQP-GLES3.functional.fragm",
        "ent_ops.depth.cmp_less_than");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027673,
        "dEQP-GLES3.functional.fragmen",
        "t_ops.depth.cmp_less_or_equal");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027674,
        "dEQP-GLES3.functional.fragme",
        "nt_ops.depth.cmp_greater_than");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027675,
        "dEQP-GLES3.functional.fragment",
        "_ops.depth.cmp_greater_or_equal");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028114,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.invert_replace_decr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028115,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.invert_replace_invert");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028116,
        "dEQP-GLES3.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.invert_replace_incr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028117,
        "dEQP-GLES3.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.invert_replace_decr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028118,
        "dEQP-GLES3.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.invert_incr_keep");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028119,
        "dEQP-GLES3.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.invert_incr_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028120,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.invert_incr_replace");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028121,
        "dEQP-GLES3.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.invert_incr_incr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028122,
        "dEQP-GLES3.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.invert_incr_decr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028123,
        "dEQP-GLES3.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.invert_incr_invert");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028124,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.invert_incr_incr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028125,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.invert_incr_decr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028126,
        "dEQP-GLES3.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.invert_decr_keep");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028127,
        "dEQP-GLES3.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.invert_decr_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028128,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.invert_decr_replace");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028129,
        "dEQP-GLES3.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.invert_decr_incr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028130,
        "dEQP-GLES3.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.invert_decr_decr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028131,
        "dEQP-GLES3.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.invert_decr_invert");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028132,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.invert_decr_incr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028133,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.invert_decr_decr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028134,
        "dEQP-GLES3.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.invert_invert_keep");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028135,
        "dEQP-GLES3.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.invert_invert_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028136,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.invert_invert_replace");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028137,
        "dEQP-GLES3.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.invert_invert_incr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028138,
        "dEQP-GLES3.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.invert_invert_decr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028139,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.invert_invert_invert");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028140,
        "dEQP-GLES3.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.invert_invert_incr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028141,
        "dEQP-GLES3.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.invert_invert_decr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028142,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.invert_incr_wrap_keep");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028143,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.invert_incr_wrap_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028144,
        "dEQP-GLES3.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.invert_incr_wrap_replace");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028145,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.invert_incr_wrap_incr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028146,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.invert_incr_wrap_decr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028147,
        "dEQP-GLES3.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.invert_incr_wrap_invert");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028148,
        "dEQP-GLES3.functional.fragment_ops.depth_st",
        "encil.stencil_ops.invert_incr_wrap_incr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028149,
        "dEQP-GLES3.functional.fragment_ops.depth_st",
        "encil.stencil_ops.invert_incr_wrap_decr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028150,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.invert_decr_wrap_keep");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028151,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.invert_decr_wrap_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028152,
        "dEQP-GLES3.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.invert_decr_wrap_replace");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028153,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.invert_decr_wrap_incr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028154,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.invert_decr_wrap_decr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028155,
        "dEQP-GLES3.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.invert_decr_wrap_invert");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028156,
        "dEQP-GLES3.functional.fragment_ops.depth_st",
        "encil.stencil_ops.invert_decr_wrap_incr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028157,
        "dEQP-GLES3.functional.fragment_ops.depth_st",
        "encil.stencil_ops.invert_decr_wrap_decr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028158,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.incr_wrap_keep_keep");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028159,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.incr_wrap_keep_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028160,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.incr_wrap_keep_replace");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028161,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.incr_wrap_keep_incr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028162,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.incr_wrap_keep_decr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028163,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.incr_wrap_keep_invert");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028164,
        "dEQP-GLES3.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.incr_wrap_keep_incr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028165,
        "dEQP-GLES3.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.incr_wrap_keep_decr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028166,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.incr_wrap_zero_keep");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028167,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.incr_wrap_zero_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028168,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.incr_wrap_zero_replace");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028169,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.incr_wrap_zero_incr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028170,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.incr_wrap_zero_decr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028171,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.incr_wrap_zero_invert");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028172,
        "dEQP-GLES3.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.incr_wrap_zero_incr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028173,
        "dEQP-GLES3.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.incr_wrap_zero_decr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028174,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.incr_wrap_replace_keep");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028175,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.incr_wrap_replace_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028176,
        "dEQP-GLES3.functional.fragment_ops.depth_st",
        "encil.stencil_ops.incr_wrap_replace_replace");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028177,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.incr_wrap_replace_incr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028178,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.incr_wrap_replace_decr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028179,
        "dEQP-GLES3.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.incr_wrap_replace_invert");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028180,
        "dEQP-GLES3.functional.fragment_ops.depth_ste",
        "ncil.stencil_ops.incr_wrap_replace_incr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028181,
        "dEQP-GLES3.functional.fragment_ops.depth_ste",
        "ncil.stencil_ops.incr_wrap_replace_decr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028182,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.incr_wrap_incr_keep");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028183,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.incr_wrap_incr_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028184,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.incr_wrap_incr_replace");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028185,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.incr_wrap_incr_incr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028186,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.incr_wrap_incr_decr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028187,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.incr_wrap_incr_invert");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028188,
        "dEQP-GLES3.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.incr_wrap_incr_incr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028189,
        "dEQP-GLES3.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.incr_wrap_incr_decr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028190,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.incr_wrap_decr_keep");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028191,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.incr_wrap_decr_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028192,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.incr_wrap_decr_replace");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028193,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.incr_wrap_decr_incr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028194,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.incr_wrap_decr_decr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028195,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.incr_wrap_decr_invert");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028196,
        "dEQP-GLES3.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.incr_wrap_decr_incr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028197,
        "dEQP-GLES3.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.incr_wrap_decr_decr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028198,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.incr_wrap_invert_keep");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028199,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.incr_wrap_invert_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028200,
        "dEQP-GLES3.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.incr_wrap_invert_replace");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028201,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.incr_wrap_invert_incr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028202,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.incr_wrap_invert_decr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028203,
        "dEQP-GLES3.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.incr_wrap_invert_invert");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028204,
        "dEQP-GLES3.functional.fragment_ops.depth_st",
        "encil.stencil_ops.incr_wrap_invert_incr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028205,
        "dEQP-GLES3.functional.fragment_ops.depth_st",
        "encil.stencil_ops.incr_wrap_invert_decr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028206,
        "dEQP-GLES3.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.incr_wrap_incr_wrap_keep");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028207,
        "dEQP-GLES3.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.incr_wrap_incr_wrap_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028208,
        "dEQP-GLES3.functional.fragment_ops.depth_ste",
        "ncil.stencil_ops.incr_wrap_incr_wrap_replace");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028209,
        "dEQP-GLES3.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.incr_wrap_incr_wrap_incr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028210,
        "dEQP-GLES3.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.incr_wrap_incr_wrap_decr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028211,
        "dEQP-GLES3.functional.fragment_ops.depth_st",
        "encil.stencil_ops.incr_wrap_incr_wrap_invert");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028212,
        "dEQP-GLES3.functional.fragment_ops.depth_sten",
        "cil.stencil_ops.incr_wrap_incr_wrap_incr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028213,
        "dEQP-GLES3.functional.fragment_ops.depth_sten",
        "cil.stencil_ops.incr_wrap_incr_wrap_decr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028214,
        "dEQP-GLES3.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.incr_wrap_decr_wrap_keep");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028215,
        "dEQP-GLES3.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.incr_wrap_decr_wrap_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028216,
        "dEQP-GLES3.functional.fragment_ops.depth_ste",
        "ncil.stencil_ops.incr_wrap_decr_wrap_replace");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028217,
        "dEQP-GLES3.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.incr_wrap_decr_wrap_incr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028218,
        "dEQP-GLES3.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.incr_wrap_decr_wrap_decr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028219,
        "dEQP-GLES3.functional.fragment_ops.depth_st",
        "encil.stencil_ops.incr_wrap_decr_wrap_invert");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028220,
        "dEQP-GLES3.functional.fragment_ops.depth_sten",
        "cil.stencil_ops.incr_wrap_decr_wrap_incr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028221,
        "dEQP-GLES3.functional.fragment_ops.depth_sten",
        "cil.stencil_ops.incr_wrap_decr_wrap_decr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028222,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.decr_wrap_keep_keep");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028223,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.decr_wrap_keep_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028224,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.decr_wrap_keep_replace");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028225,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.decr_wrap_keep_incr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028226,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.decr_wrap_keep_decr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028227,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.decr_wrap_keep_invert");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028228,
        "dEQP-GLES3.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.decr_wrap_keep_incr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028229,
        "dEQP-GLES3.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.decr_wrap_keep_decr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028230,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.decr_wrap_zero_keep");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028231,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.decr_wrap_zero_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028232,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.decr_wrap_zero_replace");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028233,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.decr_wrap_zero_incr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028234,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.decr_wrap_zero_decr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028235,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.decr_wrap_zero_invert");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028236,
        "dEQP-GLES3.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.decr_wrap_zero_incr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028237,
        "dEQP-GLES3.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.decr_wrap_zero_decr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028238,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.decr_wrap_replace_keep");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028239,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.decr_wrap_replace_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028240,
        "dEQP-GLES3.functional.fragment_ops.depth_st",
        "encil.stencil_ops.decr_wrap_replace_replace");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028241,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.decr_wrap_replace_incr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028242,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.decr_wrap_replace_decr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028243,
        "dEQP-GLES3.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.decr_wrap_replace_invert");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028244,
        "dEQP-GLES3.functional.fragment_ops.depth_ste",
        "ncil.stencil_ops.decr_wrap_replace_incr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028245,
        "dEQP-GLES3.functional.fragment_ops.depth_ste",
        "ncil.stencil_ops.decr_wrap_replace_decr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028246,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.decr_wrap_incr_keep");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028247,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.decr_wrap_incr_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028248,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.decr_wrap_incr_replace");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028249,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.decr_wrap_incr_incr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028250,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.decr_wrap_incr_decr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028251,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.decr_wrap_incr_invert");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028252,
        "dEQP-GLES3.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.decr_wrap_incr_incr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028253,
        "dEQP-GLES3.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.decr_wrap_incr_decr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028254,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.decr_wrap_decr_keep");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028255,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.decr_wrap_decr_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028256,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.decr_wrap_decr_replace");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028257,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.decr_wrap_decr_incr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028258,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.decr_wrap_decr_decr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028259,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.decr_wrap_decr_invert");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028260,
        "dEQP-GLES3.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.decr_wrap_decr_incr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028261,
        "dEQP-GLES3.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.decr_wrap_decr_decr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028262,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.decr_wrap_invert_keep");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028263,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.decr_wrap_invert_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028264,
        "dEQP-GLES3.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.decr_wrap_invert_replace");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028265,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.decr_wrap_invert_incr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028266,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.decr_wrap_invert_decr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028267,
        "dEQP-GLES3.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.decr_wrap_invert_invert");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028268,
        "dEQP-GLES3.functional.fragment_ops.depth_st",
        "encil.stencil_ops.decr_wrap_invert_incr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028269,
        "dEQP-GLES3.functional.fragment_ops.depth_st",
        "encil.stencil_ops.decr_wrap_invert_decr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028270,
        "dEQP-GLES3.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.decr_wrap_incr_wrap_keep");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028271,
        "dEQP-GLES3.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.decr_wrap_incr_wrap_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028272,
        "dEQP-GLES3.functional.fragment_ops.depth_ste",
        "ncil.stencil_ops.decr_wrap_incr_wrap_replace");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028273,
        "dEQP-GLES3.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.decr_wrap_incr_wrap_incr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028274,
        "dEQP-GLES3.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.decr_wrap_incr_wrap_decr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028275,
        "dEQP-GLES3.functional.fragment_ops.depth_st",
        "encil.stencil_ops.decr_wrap_incr_wrap_invert");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028276,
        "dEQP-GLES3.functional.fragment_ops.depth_sten",
        "cil.stencil_ops.decr_wrap_incr_wrap_incr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028277,
        "dEQP-GLES3.functional.fragment_ops.depth_sten",
        "cil.stencil_ops.decr_wrap_incr_wrap_decr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028278,
        "dEQP-GLES3.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.decr_wrap_decr_wrap_keep");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028279,
        "dEQP-GLES3.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.decr_wrap_decr_wrap_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028280,
        "dEQP-GLES3.functional.fragment_ops.depth_ste",
        "ncil.stencil_ops.decr_wrap_decr_wrap_replace");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028281,
        "dEQP-GLES3.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.decr_wrap_decr_wrap_incr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028282,
        "dEQP-GLES3.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.decr_wrap_decr_wrap_decr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028283,
        "dEQP-GLES3.functional.fragment_ops.depth_st",
        "encil.stencil_ops.decr_wrap_decr_wrap_invert");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028284,
        "dEQP-GLES3.functional.fragment_ops.depth_sten",
        "cil.stencil_ops.decr_wrap_decr_wrap_incr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028285,
        "dEQP-GLES3.functional.fragment_ops.depth_sten",
        "cil.stencil_ops.decr_wrap_decr_wrap_decr_wrap");
