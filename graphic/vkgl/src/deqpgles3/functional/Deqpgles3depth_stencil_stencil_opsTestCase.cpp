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

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027944,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.replace_invert_replace");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027945,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.replace_invert_incr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027946,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.replace_invert_decr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027947,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.replace_invert_invert");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027948,
        "dEQP-GLES3.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.replace_invert_incr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027949,
        "dEQP-GLES3.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.replace_invert_decr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027950,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.replace_incr_wrap_keep");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027951,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.replace_incr_wrap_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027952,
        "dEQP-GLES3.functional.fragment_ops.depth_st",
        "encil.stencil_ops.replace_incr_wrap_replace");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027953,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.replace_incr_wrap_incr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027954,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.replace_incr_wrap_decr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027955,
        "dEQP-GLES3.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.replace_incr_wrap_invert");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027956,
        "dEQP-GLES3.functional.fragment_ops.depth_ste",
        "ncil.stencil_ops.replace_incr_wrap_incr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027957,
        "dEQP-GLES3.functional.fragment_ops.depth_ste",
        "ncil.stencil_ops.replace_incr_wrap_decr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027958,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.replace_decr_wrap_keep");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027959,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.replace_decr_wrap_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027960,
        "dEQP-GLES3.functional.fragment_ops.depth_st",
        "encil.stencil_ops.replace_decr_wrap_replace");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027961,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.replace_decr_wrap_incr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027962,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.replace_decr_wrap_decr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027963,
        "dEQP-GLES3.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.replace_decr_wrap_invert");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027964,
        "dEQP-GLES3.functional.fragment_ops.depth_ste",
        "ncil.stencil_ops.replace_decr_wrap_incr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027965,
        "dEQP-GLES3.functional.fragment_ops.depth_ste",
        "ncil.stencil_ops.replace_decr_wrap_decr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027966,
        "dEQP-GLES3.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.incr_keep_keep");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027967,
        "dEQP-GLES3.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.incr_keep_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027968,
        "dEQP-GLES3.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.incr_keep_replace");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027969,
        "dEQP-GLES3.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.incr_keep_incr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027970,
        "dEQP-GLES3.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.incr_keep_decr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027971,
        "dEQP-GLES3.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.incr_keep_invert");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027972,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.incr_keep_incr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027973,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.incr_keep_decr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027974,
        "dEQP-GLES3.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.incr_zero_keep");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027975,
        "dEQP-GLES3.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.incr_zero_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027976,
        "dEQP-GLES3.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.incr_zero_replace");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027977,
        "dEQP-GLES3.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.incr_zero_incr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027978,
        "dEQP-GLES3.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.incr_zero_decr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027979,
        "dEQP-GLES3.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.incr_zero_invert");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027980,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.incr_zero_incr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027981,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.incr_zero_decr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027982,
        "dEQP-GLES3.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.incr_replace_keep");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027983,
        "dEQP-GLES3.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.incr_replace_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027984,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.incr_replace_replace");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027985,
        "dEQP-GLES3.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.incr_replace_incr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027986,
        "dEQP-GLES3.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.incr_replace_decr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027987,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.incr_replace_invert");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027988,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.incr_replace_incr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027989,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.incr_replace_decr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027990,
        "dEQP-GLES3.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.incr_incr_keep");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027991,
        "dEQP-GLES3.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.incr_incr_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027992,
        "dEQP-GLES3.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.incr_incr_replace");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027993,
        "dEQP-GLES3.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.incr_incr_incr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027994,
        "dEQP-GLES3.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.incr_incr_decr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027995,
        "dEQP-GLES3.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.incr_incr_invert");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027996,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.incr_incr_incr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027997,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.incr_incr_decr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027998,
        "dEQP-GLES3.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.incr_decr_keep");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027999,
        "dEQP-GLES3.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.incr_decr_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028000,
        "dEQP-GLES3.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.incr_decr_replace");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028001,
        "dEQP-GLES3.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.incr_decr_incr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028002,
        "dEQP-GLES3.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.incr_decr_decr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028003,
        "dEQP-GLES3.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.incr_decr_invert");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028004,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.incr_decr_incr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028005,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.incr_decr_decr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028006,
        "dEQP-GLES3.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.incr_invert_keep");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028007,
        "dEQP-GLES3.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.incr_invert_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028008,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.incr_invert_replace");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028009,
        "dEQP-GLES3.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.incr_invert_incr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028010,
        "dEQP-GLES3.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.incr_invert_decr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028011,
        "dEQP-GLES3.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.incr_invert_invert");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028012,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.incr_invert_incr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028013,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.incr_invert_decr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028014,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.incr_incr_wrap_keep");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028015,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.incr_incr_wrap_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028016,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.incr_incr_wrap_replace");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028017,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.incr_incr_wrap_incr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028018,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.incr_incr_wrap_decr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028019,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.incr_incr_wrap_invert");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028020,
        "dEQP-GLES3.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.incr_incr_wrap_incr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028021,
        "dEQP-GLES3.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.incr_incr_wrap_decr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028022,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.incr_decr_wrap_keep");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028023,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.incr_decr_wrap_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028024,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.incr_decr_wrap_replace");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028025,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.incr_decr_wrap_incr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028026,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.incr_decr_wrap_decr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028027,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.incr_decr_wrap_invert");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028028,
        "dEQP-GLES3.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.incr_decr_wrap_incr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028029,
        "dEQP-GLES3.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.incr_decr_wrap_decr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028030,
        "dEQP-GLES3.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.decr_keep_keep");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028031,
        "dEQP-GLES3.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.decr_keep_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028032,
        "dEQP-GLES3.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.decr_keep_replace");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028033,
        "dEQP-GLES3.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.decr_keep_incr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028034,
        "dEQP-GLES3.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.decr_keep_decr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028035,
        "dEQP-GLES3.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.decr_keep_invert");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028036,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.decr_keep_incr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028037,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.decr_keep_decr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028038,
        "dEQP-GLES3.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.decr_zero_keep");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028039,
        "dEQP-GLES3.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.decr_zero_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028040,
        "dEQP-GLES3.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.decr_zero_replace");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028041,
        "dEQP-GLES3.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.decr_zero_incr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028042,
        "dEQP-GLES3.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.decr_zero_decr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028043,
        "dEQP-GLES3.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.decr_zero_invert");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028044,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.decr_zero_incr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028045,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.decr_zero_decr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028046,
        "dEQP-GLES3.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.decr_replace_keep");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028047,
        "dEQP-GLES3.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.decr_replace_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028048,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.decr_replace_replace");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028049,
        "dEQP-GLES3.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.decr_replace_incr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028050,
        "dEQP-GLES3.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.decr_replace_decr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028051,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.decr_replace_invert");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028052,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.decr_replace_incr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028053,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.decr_replace_decr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028054,
        "dEQP-GLES3.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.decr_incr_keep");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028055,
        "dEQP-GLES3.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.decr_incr_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028056,
        "dEQP-GLES3.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.decr_incr_replace");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028057,
        "dEQP-GLES3.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.decr_incr_incr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028058,
        "dEQP-GLES3.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.decr_incr_decr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028059,
        "dEQP-GLES3.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.decr_incr_invert");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028060,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.decr_incr_incr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028061,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.decr_incr_decr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028062,
        "dEQP-GLES3.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.decr_decr_keep");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028063,
        "dEQP-GLES3.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.decr_decr_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028064,
        "dEQP-GLES3.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.decr_decr_replace");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028065,
        "dEQP-GLES3.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.decr_decr_incr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028066,
        "dEQP-GLES3.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.decr_decr_decr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028067,
        "dEQP-GLES3.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.decr_decr_invert");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028068,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.decr_decr_incr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028069,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.decr_decr_decr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028070,
        "dEQP-GLES3.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.decr_invert_keep");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028071,
        "dEQP-GLES3.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.decr_invert_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028072,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.decr_invert_replace");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028073,
        "dEQP-GLES3.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.decr_invert_incr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028074,
        "dEQP-GLES3.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.decr_invert_decr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028075,
        "dEQP-GLES3.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.decr_invert_invert");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028076,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.decr_invert_incr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028077,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.decr_invert_decr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028078,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.decr_incr_wrap_keep");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028079,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.decr_incr_wrap_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028080,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.decr_incr_wrap_replace");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028081,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.decr_incr_wrap_incr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028082,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.decr_incr_wrap_decr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028083,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.decr_incr_wrap_invert");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028084,
        "dEQP-GLES3.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.decr_incr_wrap_incr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028085,
        "dEQP-GLES3.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.decr_incr_wrap_decr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028086,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.decr_decr_wrap_keep");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028087,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.decr_decr_wrap_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028088,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.decr_decr_wrap_replace");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028089,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.decr_decr_wrap_incr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028090,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.decr_decr_wrap_decr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028091,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.decr_decr_wrap_invert");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028092,
        "dEQP-GLES3.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.decr_decr_wrap_incr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028093,
        "dEQP-GLES3.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.decr_decr_wrap_decr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028094,
        "dEQP-GLES3.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.invert_keep_keep");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028095,
        "dEQP-GLES3.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.invert_keep_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028096,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.invert_keep_replace");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028097,
        "dEQP-GLES3.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.invert_keep_incr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028098,
        "dEQP-GLES3.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.invert_keep_decr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028099,
        "dEQP-GLES3.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.invert_keep_invert");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028100,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.invert_keep_incr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028101,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.invert_keep_decr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028102,
        "dEQP-GLES3.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.invert_zero_keep");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028103,
        "dEQP-GLES3.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.invert_zero_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028104,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.invert_zero_replace");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028105,
        "dEQP-GLES3.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.invert_zero_incr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028106,
        "dEQP-GLES3.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.invert_zero_decr");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028107,
        "dEQP-GLES3.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.invert_zero_invert");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028108,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.invert_zero_incr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028109,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.invert_zero_decr_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028110,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.invert_replace_keep");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028111,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.invert_replace_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028112,
        "dEQP-GLES3.functional.fragment_ops.depth_",
        "stencil.stencil_ops.invert_replace_replace");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_028113,
        "dEQP-GLES3.functional.fragment_ops.depth",
        "_stencil.stencil_ops.invert_replace_incr");

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
