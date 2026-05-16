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

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027774,
        "dEQP-GLES3.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.keep_keep_keep");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027775,
        "dEQP-GLES3.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.keep_keep_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027776,
        "dEQP-GLES3.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.keep_keep_replace");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027777,
        "dEQP-GLES3.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.keep_keep_incr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027778,
        "dEQP-GLES3.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.keep_keep_decr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027779,
        "dEQP-GLES3.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.keep_keep_invert");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027780,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.keep_keep_incr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027781,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.keep_keep_decr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027782,
        "dEQP-GLES3.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.keep_zero_keep");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027783,
        "dEQP-GLES3.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.keep_zero_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027784,
        "dEQP-GLES3.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.keep_zero_replace");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027785,
        "dEQP-GLES3.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.keep_zero_incr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027786,
        "dEQP-GLES3.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.keep_zero_decr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027787,
        "dEQP-GLES3.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.keep_zero_invert");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027788,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.keep_zero_incr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027789,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.keep_zero_decr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027790,
        "dEQP-GLES3.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.keep_replace_keep");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027791,
        "dEQP-GLES3.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.keep_replace_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027792,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.keep_replace_replace");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027793,
        "dEQP-GLES3.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.keep_replace_incr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027794,
        "dEQP-GLES3.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.keep_replace_decr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027795,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.keep_replace_invert");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027796,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.keep_replace_incr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027797,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.keep_replace_decr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027798,
        "dEQP-GLES3.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.keep_incr_keep");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027799,
        "dEQP-GLES3.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.keep_incr_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027800,
        "dEQP-GLES3.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.keep_incr_replace");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027801,
        "dEQP-GLES3.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.keep_incr_incr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027802,
        "dEQP-GLES3.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.keep_incr_decr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027803,
        "dEQP-GLES3.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.keep_incr_invert");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027804,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.keep_incr_incr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027805,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.keep_incr_decr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027806,
        "dEQP-GLES3.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.keep_decr_keep");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027807,
        "dEQP-GLES3.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.keep_decr_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027808,
        "dEQP-GLES3.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.keep_decr_replace");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027809,
        "dEQP-GLES3.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.keep_decr_incr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027810,
        "dEQP-GLES3.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.keep_decr_decr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027811,
        "dEQP-GLES3.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.keep_decr_invert");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027812,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.keep_decr_incr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027813,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.keep_decr_decr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027814,
        "dEQP-GLES3.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.keep_invert_keep");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027815,
        "dEQP-GLES3.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.keep_invert_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027816,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.keep_invert_replace");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027817,
        "dEQP-GLES3.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.keep_invert_incr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027818,
        "dEQP-GLES3.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.keep_invert_decr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027819,
        "dEQP-GLES3.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.keep_invert_invert");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027820,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.keep_invert_incr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027821,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.keep_invert_decr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027822,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.keep_incr_wrap_keep");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027823,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.keep_incr_wrap_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027824,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.keep_incr_wrap_replace");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027825,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.keep_incr_wrap_incr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027826,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.keep_incr_wrap_decr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027827,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.keep_incr_wrap_invert");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027828,
        "dEQP-GLES3.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.keep_incr_wrap_incr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027829,
        "dEQP-GLES3.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.keep_incr_wrap_decr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027830,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.keep_decr_wrap_keep");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027831,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.keep_decr_wrap_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027832,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.keep_decr_wrap_replace");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027833,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.keep_decr_wrap_incr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027834,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.keep_decr_wrap_decr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027835,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.keep_decr_wrap_invert");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027836,
        "dEQP-GLES3.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.keep_decr_wrap_incr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027837,
        "dEQP-GLES3.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.keep_decr_wrap_decr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027838,
        "dEQP-GLES3.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.zero_keep_keep");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027839,
        "dEQP-GLES3.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.zero_keep_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027840,
        "dEQP-GLES3.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.zero_keep_replace");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027841,
        "dEQP-GLES3.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.zero_keep_incr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027842,
        "dEQP-GLES3.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.zero_keep_decr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027843,
        "dEQP-GLES3.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.zero_keep_invert");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027844,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.zero_keep_incr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027845,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.zero_keep_decr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027846,
        "dEQP-GLES3.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.zero_zero_keep");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027847,
        "dEQP-GLES3.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.zero_zero_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027848,
        "dEQP-GLES3.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.zero_zero_replace");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027849,
        "dEQP-GLES3.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.zero_zero_incr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027850,
        "dEQP-GLES3.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.zero_zero_decr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027851,
        "dEQP-GLES3.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.zero_zero_invert");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027852,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.zero_zero_incr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027853,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.zero_zero_decr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027854,
        "dEQP-GLES3.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.zero_replace_keep");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027855,
        "dEQP-GLES3.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.zero_replace_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027856,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.zero_replace_replace");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027857,
        "dEQP-GLES3.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.zero_replace_incr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027858,
        "dEQP-GLES3.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.zero_replace_decr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027859,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.zero_replace_invert");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027860,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.zero_replace_incr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027861,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.zero_replace_decr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027862,
        "dEQP-GLES3.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.zero_incr_keep");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027863,
        "dEQP-GLES3.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.zero_incr_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027864,
        "dEQP-GLES3.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.zero_incr_replace");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027865,
        "dEQP-GLES3.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.zero_incr_incr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027866,
        "dEQP-GLES3.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.zero_incr_decr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027867,
        "dEQP-GLES3.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.zero_incr_invert");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027868,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.zero_incr_incr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027869,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.zero_incr_decr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027870,
        "dEQP-GLES3.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.zero_decr_keep");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027871,
        "dEQP-GLES3.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.zero_decr_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027872,
        "dEQP-GLES3.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.zero_decr_replace");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027873,
        "dEQP-GLES3.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.zero_decr_incr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027874,
        "dEQP-GLES3.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.zero_decr_decr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027875,
        "dEQP-GLES3.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.zero_decr_invert");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027876,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.zero_decr_incr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027877,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.zero_decr_decr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027878,
        "dEQP-GLES3.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.zero_invert_keep");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027879,
        "dEQP-GLES3.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.zero_invert_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027880,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.zero_invert_replace");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027881,
        "dEQP-GLES3.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.zero_invert_incr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027882,
        "dEQP-GLES3.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.zero_invert_decr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027883,
        "dEQP-GLES3.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.zero_invert_invert");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027884,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.zero_invert_incr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027885,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.zero_invert_decr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027886,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.zero_incr_wrap_keep");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027887,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.zero_incr_wrap_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027888,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.zero_incr_wrap_replace");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027889,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.zero_incr_wrap_incr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027890,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.zero_incr_wrap_decr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027891,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.zero_incr_wrap_invert");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027892,
        "dEQP-GLES3.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.zero_incr_wrap_incr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027893,
        "dEQP-GLES3.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.zero_incr_wrap_decr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027894,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.zero_decr_wrap_keep");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027895,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.zero_decr_wrap_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027896,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.zero_decr_wrap_replace");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027897,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.zero_decr_wrap_incr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027898,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.zero_decr_wrap_decr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027899,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.zero_decr_wrap_invert");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027900,
        "dEQP-GLES3.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.zero_decr_wrap_incr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027901,
        "dEQP-GLES3.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.zero_decr_wrap_decr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027902,
        "dEQP-GLES3.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.replace_keep_keep");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027903,
        "dEQP-GLES3.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.replace_keep_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027904,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.replace_keep_replace");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027905,
        "dEQP-GLES3.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.replace_keep_incr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027906,
        "dEQP-GLES3.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.replace_keep_decr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027907,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.replace_keep_invert");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027908,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.replace_keep_incr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027909,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.replace_keep_decr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027910,
        "dEQP-GLES3.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.replace_zero_keep");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027911,
        "dEQP-GLES3.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.replace_zero_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027912,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.replace_zero_replace");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027913,
        "dEQP-GLES3.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.replace_zero_incr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027914,
        "dEQP-GLES3.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.replace_zero_decr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027915,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.replace_zero_invert");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027916,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.replace_zero_incr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027917,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.replace_zero_decr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027918,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.replace_replace_keep");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027919,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.replace_replace_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027920,
        "dEQP-GLES3.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.replace_replace_replace");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027921,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.replace_replace_incr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027922,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.replace_replace_decr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027923,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.replace_replace_invert");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027924,
        "dEQP-GLES3.functional.fragment_ops.depth_st",
        "encil.stencil_ops.replace_replace_incr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027925,
        "dEQP-GLES3.functional.fragment_ops.depth_st",
        "encil.stencil_ops.replace_replace_decr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027926,
        "dEQP-GLES3.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.replace_incr_keep");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027927,
        "dEQP-GLES3.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.replace_incr_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027928,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.replace_incr_replace");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027929,
        "dEQP-GLES3.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.replace_incr_incr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027930,
        "dEQP-GLES3.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.replace_incr_decr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027931,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.replace_incr_invert");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027932,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.replace_incr_incr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027933,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.replace_incr_decr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027934,
        "dEQP-GLES3.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.replace_decr_keep");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027935,
        "dEQP-GLES3.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.replace_decr_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027936,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.replace_decr_replace");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027937,
        "dEQP-GLES3.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.replace_decr_incr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027938,
        "dEQP-GLES3.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.replace_decr_decr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027939,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.replace_decr_invert");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027940,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.replace_decr_incr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027941,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.replace_decr_decr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027942,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.replace_invert_keep");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027943,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.replace_invert_zero");
