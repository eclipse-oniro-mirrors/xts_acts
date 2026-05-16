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
#include "../Khrgles2BaseFunc.h"
#include "../ActsGles2MainUncover0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000041,
        "dEQP-GLES2.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.keep_keep_keep");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000042,
        "dEQP-GLES2.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.keep_keep_zero");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000043,
        "dEQP-GLES2.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.keep_keep_replace");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000044,
        "dEQP-GLES2.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.keep_keep_incr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000045,
        "dEQP-GLES2.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.keep_keep_decr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000046,
        "dEQP-GLES2.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.keep_keep_invert");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000047,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.keep_keep_incr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000048,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.keep_keep_decr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000049,
        "dEQP-GLES2.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.keep_zero_keep");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000050,
        "dEQP-GLES2.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.keep_zero_zero");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000051,
        "dEQP-GLES2.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.keep_zero_replace");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000052,
        "dEQP-GLES2.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.keep_zero_incr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000053,
        "dEQP-GLES2.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.keep_zero_decr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000054,
        "dEQP-GLES2.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.keep_zero_invert");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000055,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.keep_zero_incr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000056,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.keep_zero_decr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000057,
        "dEQP-GLES2.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.keep_replace_keep");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000058,
        "dEQP-GLES2.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.keep_replace_zero");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000059,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.keep_replace_replace");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000060,
        "dEQP-GLES2.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.keep_replace_incr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000061,
        "dEQP-GLES2.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.keep_replace_decr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000062,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.keep_replace_invert");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000063,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.keep_replace_incr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000064,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.keep_replace_decr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000065,
        "dEQP-GLES2.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.keep_incr_keep");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000066,
        "dEQP-GLES2.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.keep_incr_zero");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000067,
        "dEQP-GLES2.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.keep_incr_replace");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000068,
        "dEQP-GLES2.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.keep_incr_incr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000069,
        "dEQP-GLES2.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.keep_incr_decr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000070,
        "dEQP-GLES2.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.keep_incr_invert");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000071,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.keep_incr_incr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000072,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.keep_incr_decr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000073,
        "dEQP-GLES2.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.keep_decr_keep");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000074,
        "dEQP-GLES2.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.keep_decr_zero");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000075,
        "dEQP-GLES2.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.keep_decr_replace");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000076,
        "dEQP-GLES2.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.keep_decr_incr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000077,
        "dEQP-GLES2.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.keep_decr_decr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000078,
        "dEQP-GLES2.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.keep_decr_invert");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000079,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.keep_decr_incr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000080,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.keep_decr_decr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000081,
        "dEQP-GLES2.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.keep_invert_keep");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000082,
        "dEQP-GLES2.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.keep_invert_zero");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000083,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.keep_invert_replace");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000084,
        "dEQP-GLES2.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.keep_invert_incr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000085,
        "dEQP-GLES2.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.keep_invert_decr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000086,
        "dEQP-GLES2.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.keep_invert_invert");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000087,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.keep_invert_incr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000088,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.keep_invert_decr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000089,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.keep_incr_wrap_keep");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000090,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.keep_incr_wrap_zero");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000091,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.keep_incr_wrap_replace");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000092,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.keep_incr_wrap_incr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000093,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.keep_incr_wrap_decr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000094,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.keep_incr_wrap_invert");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000095,
        "dEQP-GLES2.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.keep_incr_wrap_incr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000096,
        "dEQP-GLES2.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.keep_incr_wrap_decr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000097,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.keep_decr_wrap_keep");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000098,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.keep_decr_wrap_zero");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000099,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.keep_decr_wrap_replace");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000100,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.keep_decr_wrap_incr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000101,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.keep_decr_wrap_decr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000102,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.keep_decr_wrap_invert");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000103,
        "dEQP-GLES2.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.keep_decr_wrap_incr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000104,
        "dEQP-GLES2.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.keep_decr_wrap_decr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000105,
        "dEQP-GLES2.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.zero_keep_keep");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000106,
        "dEQP-GLES2.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.zero_keep_zero");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000107,
        "dEQP-GLES2.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.zero_keep_replace");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000108,
        "dEQP-GLES2.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.zero_keep_incr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000109,
        "dEQP-GLES2.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.zero_keep_decr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000110,
        "dEQP-GLES2.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.zero_keep_invert");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000111,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.zero_keep_incr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000112,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.zero_keep_decr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000113,
        "dEQP-GLES2.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.zero_zero_keep");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000114,
        "dEQP-GLES2.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.zero_zero_zero");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000115,
        "dEQP-GLES2.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.zero_zero_replace");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000116,
        "dEQP-GLES2.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.zero_zero_incr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000117,
        "dEQP-GLES2.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.zero_zero_decr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000118,
        "dEQP-GLES2.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.zero_zero_invert");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000119,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.zero_zero_incr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000120,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.zero_zero_decr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000121,
        "dEQP-GLES2.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.zero_replace_keep");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000122,
        "dEQP-GLES2.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.zero_replace_zero");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000123,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.zero_replace_replace");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000124,
        "dEQP-GLES2.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.zero_replace_incr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000125,
        "dEQP-GLES2.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.zero_replace_decr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000126,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.zero_replace_invert");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000127,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.zero_replace_incr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000128,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.zero_replace_decr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000129,
        "dEQP-GLES2.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.zero_incr_keep");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000130,
        "dEQP-GLES2.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.zero_incr_zero");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000131,
        "dEQP-GLES2.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.zero_incr_replace");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000132,
        "dEQP-GLES2.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.zero_incr_incr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000133,
        "dEQP-GLES2.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.zero_incr_decr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000134,
        "dEQP-GLES2.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.zero_incr_invert");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000135,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.zero_incr_incr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000136,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.zero_incr_decr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000137,
        "dEQP-GLES2.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.zero_decr_keep");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000138,
        "dEQP-GLES2.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.zero_decr_zero");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000139,
        "dEQP-GLES2.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.zero_decr_replace");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000140,
        "dEQP-GLES2.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.zero_decr_incr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000141,
        "dEQP-GLES2.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.zero_decr_decr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000142,
        "dEQP-GLES2.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.zero_decr_invert");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000143,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.zero_decr_incr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000144,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.zero_decr_decr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000145,
        "dEQP-GLES2.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.zero_invert_keep");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000146,
        "dEQP-GLES2.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.zero_invert_zero");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000147,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.zero_invert_replace");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000148,
        "dEQP-GLES2.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.zero_invert_incr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000149,
        "dEQP-GLES2.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.zero_invert_decr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000150,
        "dEQP-GLES2.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.zero_invert_invert");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000151,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.zero_invert_incr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000152,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.zero_invert_decr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000153,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.zero_incr_wrap_keep");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000154,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.zero_incr_wrap_zero");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000155,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.zero_incr_wrap_replace");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000156,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.zero_incr_wrap_incr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000157,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.zero_incr_wrap_decr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000158,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.zero_incr_wrap_invert");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000159,
        "dEQP-GLES2.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.zero_incr_wrap_incr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000160,
        "dEQP-GLES2.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.zero_incr_wrap_decr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000161,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.zero_decr_wrap_keep");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000162,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.zero_decr_wrap_zero");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000163,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.zero_decr_wrap_replace");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000164,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.zero_decr_wrap_incr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000165,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.zero_decr_wrap_decr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000166,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.zero_decr_wrap_invert");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000167,
        "dEQP-GLES2.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.zero_decr_wrap_incr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000168,
        "dEQP-GLES2.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.zero_decr_wrap_decr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000169,
        "dEQP-GLES2.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.replace_keep_keep");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000170,
        "dEQP-GLES2.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.replace_keep_zero");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000171,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.replace_keep_replace");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000172,
        "dEQP-GLES2.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.replace_keep_incr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000173,
        "dEQP-GLES2.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.replace_keep_decr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000174,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.replace_keep_invert");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000175,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.replace_keep_incr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000176,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.replace_keep_decr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000177,
        "dEQP-GLES2.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.replace_zero_keep");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000178,
        "dEQP-GLES2.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.replace_zero_zero");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000179,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.replace_zero_replace");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000180,
        "dEQP-GLES2.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.replace_zero_incr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000181,
        "dEQP-GLES2.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.replace_zero_decr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000182,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.replace_zero_invert");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000183,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.replace_zero_incr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000184,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.replace_zero_decr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000185,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.replace_replace_keep");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000186,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.replace_replace_zero");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000187,
        "dEQP-GLES2.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.replace_replace_replace");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000188,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.replace_replace_incr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000189,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.replace_replace_decr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000190,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.replace_replace_invert");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000191,
        "dEQP-GLES2.functional.fragment_ops.depth_st",
        "encil.stencil_ops.replace_replace_incr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000192,
        "dEQP-GLES2.functional.fragment_ops.depth_st",
        "encil.stencil_ops.replace_replace_decr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000193,
        "dEQP-GLES2.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.replace_incr_keep");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000194,
        "dEQP-GLES2.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.replace_incr_zero");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000195,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.replace_incr_replace");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000196,
        "dEQP-GLES2.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.replace_incr_incr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000197,
        "dEQP-GLES2.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.replace_incr_decr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000198,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.replace_incr_invert");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000199,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.replace_incr_incr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000200,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.replace_incr_decr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000201,
        "dEQP-GLES2.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.replace_decr_keep");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000202,
        "dEQP-GLES2.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.replace_decr_zero");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000203,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.replace_decr_replace");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000204,
        "dEQP-GLES2.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.replace_decr_incr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000205,
        "dEQP-GLES2.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.replace_decr_decr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000206,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.replace_decr_invert");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000207,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.replace_decr_incr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000208,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.replace_decr_decr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000209,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.replace_invert_keep");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000210,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.replace_invert_zero");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000211,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.replace_invert_replace");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000212,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.replace_invert_incr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000213,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.replace_invert_decr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000214,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.replace_invert_invert");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000215,
        "dEQP-GLES2.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.replace_invert_incr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000216,
        "dEQP-GLES2.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.replace_invert_decr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000217,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.replace_incr_wrap_keep");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000218,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.replace_incr_wrap_zero");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000219,
        "dEQP-GLES2.functional.fragment_ops.depth_st",
        "encil.stencil_ops.replace_incr_wrap_replace");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000220,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.replace_incr_wrap_incr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000221,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.replace_incr_wrap_decr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000222,
        "dEQP-GLES2.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.replace_incr_wrap_invert");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000223,
        "dEQP-GLES2.functional.fragment_ops.depth_ste",
        "ncil.stencil_ops.replace_incr_wrap_incr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000224,
        "dEQP-GLES2.functional.fragment_ops.depth_ste",
        "ncil.stencil_ops.replace_incr_wrap_decr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000225,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.replace_decr_wrap_keep");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000226,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.replace_decr_wrap_zero");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000227,
        "dEQP-GLES2.functional.fragment_ops.depth_st",
        "encil.stencil_ops.replace_decr_wrap_replace");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000228,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.replace_decr_wrap_incr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000229,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.replace_decr_wrap_decr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000230,
        "dEQP-GLES2.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.replace_decr_wrap_invert");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000231,
        "dEQP-GLES2.functional.fragment_ops.depth_ste",
        "ncil.stencil_ops.replace_decr_wrap_incr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000232,
        "dEQP-GLES2.functional.fragment_ops.depth_ste",
        "ncil.stencil_ops.replace_decr_wrap_decr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000233,
        "dEQP-GLES2.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.incr_keep_keep");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000234,
        "dEQP-GLES2.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.incr_keep_zero");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000235,
        "dEQP-GLES2.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.incr_keep_replace");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000236,
        "dEQP-GLES2.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.incr_keep_incr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000237,
        "dEQP-GLES2.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.incr_keep_decr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000238,
        "dEQP-GLES2.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.incr_keep_invert");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000239,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.incr_keep_incr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000240,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.incr_keep_decr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000241,
        "dEQP-GLES2.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.incr_zero_keep");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000242,
        "dEQP-GLES2.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.incr_zero_zero");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000243,
        "dEQP-GLES2.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.incr_zero_replace");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000244,
        "dEQP-GLES2.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.incr_zero_incr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000245,
        "dEQP-GLES2.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.incr_zero_decr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000246,
        "dEQP-GLES2.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.incr_zero_invert");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000247,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.incr_zero_incr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000248,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.incr_zero_decr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000249,
        "dEQP-GLES2.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.incr_replace_keep");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000250,
        "dEQP-GLES2.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.incr_replace_zero");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000251,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.incr_replace_replace");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000252,
        "dEQP-GLES2.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.incr_replace_incr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000253,
        "dEQP-GLES2.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.incr_replace_decr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000254,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.incr_replace_invert");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000255,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.incr_replace_incr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000256,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.incr_replace_decr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000257,
        "dEQP-GLES2.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.incr_incr_keep");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000258,
        "dEQP-GLES2.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.incr_incr_zero");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000259,
        "dEQP-GLES2.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.incr_incr_replace");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000260,
        "dEQP-GLES2.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.incr_incr_incr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000261,
        "dEQP-GLES2.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.incr_incr_decr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000262,
        "dEQP-GLES2.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.incr_incr_invert");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000263,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.incr_incr_incr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000264,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.incr_incr_decr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000265,
        "dEQP-GLES2.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.incr_decr_keep");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000266,
        "dEQP-GLES2.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.incr_decr_zero");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000267,
        "dEQP-GLES2.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.incr_decr_replace");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000268,
        "dEQP-GLES2.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.incr_decr_incr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000269,
        "dEQP-GLES2.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.incr_decr_decr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000270,
        "dEQP-GLES2.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.incr_decr_invert");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000271,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.incr_decr_incr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000272,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.incr_decr_decr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000273,
        "dEQP-GLES2.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.incr_invert_keep");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000274,
        "dEQP-GLES2.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.incr_invert_zero");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000275,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.incr_invert_replace");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000276,
        "dEQP-GLES2.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.incr_invert_incr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000277,
        "dEQP-GLES2.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.incr_invert_decr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000278,
        "dEQP-GLES2.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.incr_invert_invert");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000279,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.incr_invert_incr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000280,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.incr_invert_decr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000281,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.incr_incr_wrap_keep");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000282,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.incr_incr_wrap_zero");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000283,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.incr_incr_wrap_replace");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000284,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.incr_incr_wrap_incr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000285,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.incr_incr_wrap_decr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000286,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.incr_incr_wrap_invert");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000287,
        "dEQP-GLES2.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.incr_incr_wrap_incr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000288,
        "dEQP-GLES2.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.incr_incr_wrap_decr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000289,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.incr_decr_wrap_keep");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000290,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.incr_decr_wrap_zero");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000291,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.incr_decr_wrap_replace");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000292,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.incr_decr_wrap_incr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000293,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.incr_decr_wrap_decr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000294,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.incr_decr_wrap_invert");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000295,
        "dEQP-GLES2.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.incr_decr_wrap_incr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000296,
        "dEQP-GLES2.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.incr_decr_wrap_decr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000297,
        "dEQP-GLES2.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.decr_keep_keep");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000298,
        "dEQP-GLES2.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.decr_keep_zero");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000299,
        "dEQP-GLES2.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.decr_keep_replace");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000300,
        "dEQP-GLES2.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.decr_keep_incr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000301,
        "dEQP-GLES2.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.decr_keep_decr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000302,
        "dEQP-GLES2.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.decr_keep_invert");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000303,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.decr_keep_incr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000304,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.decr_keep_decr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000305,
        "dEQP-GLES2.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.decr_zero_keep");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000306,
        "dEQP-GLES2.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.decr_zero_zero");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000307,
        "dEQP-GLES2.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.decr_zero_replace");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000308,
        "dEQP-GLES2.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.decr_zero_incr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000309,
        "dEQP-GLES2.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.decr_zero_decr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000310,
        "dEQP-GLES2.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.decr_zero_invert");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000311,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.decr_zero_incr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000312,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.decr_zero_decr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000313,
        "dEQP-GLES2.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.decr_replace_keep");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000314,
        "dEQP-GLES2.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.decr_replace_zero");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000315,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.decr_replace_replace");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000316,
        "dEQP-GLES2.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.decr_replace_incr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000317,
        "dEQP-GLES2.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.decr_replace_decr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000318,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.decr_replace_invert");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000319,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.decr_replace_incr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000320,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.decr_replace_decr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000321,
        "dEQP-GLES2.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.decr_incr_keep");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000322,
        "dEQP-GLES2.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.decr_incr_zero");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000323,
        "dEQP-GLES2.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.decr_incr_replace");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000324,
        "dEQP-GLES2.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.decr_incr_incr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000325,
        "dEQP-GLES2.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.decr_incr_decr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000326,
        "dEQP-GLES2.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.decr_incr_invert");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000327,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.decr_incr_incr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000328,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.decr_incr_decr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000329,
        "dEQP-GLES2.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.decr_decr_keep");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000330,
        "dEQP-GLES2.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.decr_decr_zero");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000331,
        "dEQP-GLES2.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.decr_decr_replace");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000332,
        "dEQP-GLES2.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.decr_decr_incr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000333,
        "dEQP-GLES2.functional.fragment_ops.de",
        "pth_stencil.stencil_ops.decr_decr_decr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000334,
        "dEQP-GLES2.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.decr_decr_invert");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000335,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.decr_decr_incr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000336,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.decr_decr_decr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000337,
        "dEQP-GLES2.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.decr_invert_keep");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000338,
        "dEQP-GLES2.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.decr_invert_zero");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000339,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.decr_invert_replace");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000340,
        "dEQP-GLES2.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.decr_invert_incr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000341,
        "dEQP-GLES2.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.decr_invert_decr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000342,
        "dEQP-GLES2.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.decr_invert_invert");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000343,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.decr_invert_incr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000344,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.decr_invert_decr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000345,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.decr_incr_wrap_keep");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000346,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.decr_incr_wrap_zero");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000347,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.decr_incr_wrap_replace");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000348,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.decr_incr_wrap_incr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000349,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.decr_incr_wrap_decr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000350,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.decr_incr_wrap_invert");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000351,
        "dEQP-GLES2.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.decr_incr_wrap_incr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000352,
        "dEQP-GLES2.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.decr_incr_wrap_decr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000353,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.decr_decr_wrap_keep");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000354,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.decr_decr_wrap_zero");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000355,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.decr_decr_wrap_replace");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000356,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.decr_decr_wrap_incr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000357,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.decr_decr_wrap_decr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000358,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.decr_decr_wrap_invert");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000359,
        "dEQP-GLES2.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.decr_decr_wrap_incr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000360,
        "dEQP-GLES2.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.decr_decr_wrap_decr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000361,
        "dEQP-GLES2.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.invert_keep_keep");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000362,
        "dEQP-GLES2.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.invert_keep_zero");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000363,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.invert_keep_replace");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000364,
        "dEQP-GLES2.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.invert_keep_incr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000365,
        "dEQP-GLES2.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.invert_keep_decr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000366,
        "dEQP-GLES2.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.invert_keep_invert");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000367,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.invert_keep_incr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000368,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.invert_keep_decr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000369,
        "dEQP-GLES2.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.invert_zero_keep");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000370,
        "dEQP-GLES2.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.invert_zero_zero");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000371,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.invert_zero_replace");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000372,
        "dEQP-GLES2.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.invert_zero_incr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000373,
        "dEQP-GLES2.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.invert_zero_decr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000374,
        "dEQP-GLES2.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.invert_zero_invert");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000375,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.invert_zero_incr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000376,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.invert_zero_decr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000377,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.invert_replace_keep");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000378,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.invert_replace_zero");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000379,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.invert_replace_replace");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000380,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.invert_replace_incr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000381,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.invert_replace_decr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000382,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.invert_replace_invert");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000383,
        "dEQP-GLES2.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.invert_replace_incr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000384,
        "dEQP-GLES2.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.invert_replace_decr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000385,
        "dEQP-GLES2.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.invert_incr_keep");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000386,
        "dEQP-GLES2.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.invert_incr_zero");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000387,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.invert_incr_replace");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000388,
        "dEQP-GLES2.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.invert_incr_incr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000389,
        "dEQP-GLES2.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.invert_incr_decr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000390,
        "dEQP-GLES2.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.invert_incr_invert");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000391,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.invert_incr_incr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000392,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.invert_incr_decr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000393,
        "dEQP-GLES2.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.invert_decr_keep");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000394,
        "dEQP-GLES2.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.invert_decr_zero");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000395,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.invert_decr_replace");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000396,
        "dEQP-GLES2.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.invert_decr_incr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000397,
        "dEQP-GLES2.functional.fragment_ops.dep",
        "th_stencil.stencil_ops.invert_decr_decr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000398,
        "dEQP-GLES2.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.invert_decr_invert");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000399,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.invert_decr_incr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000400,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.invert_decr_decr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000401,
        "dEQP-GLES2.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.invert_invert_keep");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000402,
        "dEQP-GLES2.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.invert_invert_zero");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000403,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.invert_invert_replace");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000404,
        "dEQP-GLES2.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.invert_invert_incr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000405,
        "dEQP-GLES2.functional.fragment_ops.dept",
        "h_stencil.stencil_ops.invert_invert_decr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000406,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.invert_invert_invert");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000407,
        "dEQP-GLES2.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.invert_invert_incr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000408,
        "dEQP-GLES2.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.invert_invert_decr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000409,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.invert_incr_wrap_keep");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000410,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.invert_incr_wrap_zero");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000411,
        "dEQP-GLES2.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.invert_incr_wrap_replace");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000412,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.invert_incr_wrap_incr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000413,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.invert_incr_wrap_decr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000414,
        "dEQP-GLES2.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.invert_incr_wrap_invert");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000415,
        "dEQP-GLES2.functional.fragment_ops.depth_st",
        "encil.stencil_ops.invert_incr_wrap_incr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000416,
        "dEQP-GLES2.functional.fragment_ops.depth_st",
        "encil.stencil_ops.invert_incr_wrap_decr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000417,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.invert_decr_wrap_keep");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000418,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.invert_decr_wrap_zero");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000419,
        "dEQP-GLES2.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.invert_decr_wrap_replace");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000420,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.invert_decr_wrap_incr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000421,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.invert_decr_wrap_decr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000422,
        "dEQP-GLES2.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.invert_decr_wrap_invert");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000423,
        "dEQP-GLES2.functional.fragment_ops.depth_st",
        "encil.stencil_ops.invert_decr_wrap_incr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000424,
        "dEQP-GLES2.functional.fragment_ops.depth_st",
        "encil.stencil_ops.invert_decr_wrap_decr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000425,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.incr_wrap_keep_keep");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000426,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.incr_wrap_keep_zero");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000427,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.incr_wrap_keep_replace");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000428,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.incr_wrap_keep_incr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000429,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.incr_wrap_keep_decr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000430,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.incr_wrap_keep_invert");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000431,
        "dEQP-GLES2.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.incr_wrap_keep_incr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000432,
        "dEQP-GLES2.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.incr_wrap_keep_decr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000433,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.incr_wrap_zero_keep");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000434,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.incr_wrap_zero_zero");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000435,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.incr_wrap_zero_replace");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000436,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.incr_wrap_zero_incr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000437,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.incr_wrap_zero_decr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000438,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.incr_wrap_zero_invert");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000439,
        "dEQP-GLES2.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.incr_wrap_zero_incr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000440,
        "dEQP-GLES2.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.incr_wrap_zero_decr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000441,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.incr_wrap_replace_keep");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000442,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.incr_wrap_replace_zero");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000443,
        "dEQP-GLES2.functional.fragment_ops.depth_st",
        "encil.stencil_ops.incr_wrap_replace_replace");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000444,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.incr_wrap_replace_incr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000445,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.incr_wrap_replace_decr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000446,
        "dEQP-GLES2.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.incr_wrap_replace_invert");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000447,
        "dEQP-GLES2.functional.fragment_ops.depth_ste",
        "ncil.stencil_ops.incr_wrap_replace_incr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000448,
        "dEQP-GLES2.functional.fragment_ops.depth_ste",
        "ncil.stencil_ops.incr_wrap_replace_decr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000449,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.incr_wrap_incr_keep");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000450,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.incr_wrap_incr_zero");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000451,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.incr_wrap_incr_replace");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000452,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.incr_wrap_incr_incr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000453,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.incr_wrap_incr_decr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000454,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.incr_wrap_incr_invert");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000455,
        "dEQP-GLES2.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.incr_wrap_incr_incr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000456,
        "dEQP-GLES2.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.incr_wrap_incr_decr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000457,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.incr_wrap_decr_keep");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000458,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.incr_wrap_decr_zero");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000459,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.incr_wrap_decr_replace");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000460,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.incr_wrap_decr_incr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000461,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.incr_wrap_decr_decr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000462,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.incr_wrap_decr_invert");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000463,
        "dEQP-GLES2.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.incr_wrap_decr_incr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000464,
        "dEQP-GLES2.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.incr_wrap_decr_decr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000465,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.incr_wrap_invert_keep");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000466,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.incr_wrap_invert_zero");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000467,
        "dEQP-GLES2.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.incr_wrap_invert_replace");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000468,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.incr_wrap_invert_incr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000469,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.incr_wrap_invert_decr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000470,
        "dEQP-GLES2.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.incr_wrap_invert_invert");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000471,
        "dEQP-GLES2.functional.fragment_ops.depth_st",
        "encil.stencil_ops.incr_wrap_invert_incr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000472,
        "dEQP-GLES2.functional.fragment_ops.depth_st",
        "encil.stencil_ops.incr_wrap_invert_decr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000473,
        "dEQP-GLES2.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.incr_wrap_incr_wrap_keep");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000474,
        "dEQP-GLES2.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.incr_wrap_incr_wrap_zero");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000475,
        "dEQP-GLES2.functional.fragment_ops.depth_ste",
        "ncil.stencil_ops.incr_wrap_incr_wrap_replace");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000476,
        "dEQP-GLES2.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.incr_wrap_incr_wrap_incr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000477,
        "dEQP-GLES2.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.incr_wrap_incr_wrap_decr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000478,
        "dEQP-GLES2.functional.fragment_ops.depth_st",
        "encil.stencil_ops.incr_wrap_incr_wrap_invert");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000479,
        "dEQP-GLES2.functional.fragment_ops.depth_sten",
        "cil.stencil_ops.incr_wrap_incr_wrap_incr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000480,
        "dEQP-GLES2.functional.fragment_ops.depth_sten",
        "cil.stencil_ops.incr_wrap_incr_wrap_decr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000481,
        "dEQP-GLES2.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.incr_wrap_decr_wrap_keep");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000482,
        "dEQP-GLES2.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.incr_wrap_decr_wrap_zero");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000483,
        "dEQP-GLES2.functional.fragment_ops.depth_ste",
        "ncil.stencil_ops.incr_wrap_decr_wrap_replace");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000484,
        "dEQP-GLES2.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.incr_wrap_decr_wrap_incr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000485,
        "dEQP-GLES2.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.incr_wrap_decr_wrap_decr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000486,
        "dEQP-GLES2.functional.fragment_ops.depth_st",
        "encil.stencil_ops.incr_wrap_decr_wrap_invert");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000487,
        "dEQP-GLES2.functional.fragment_ops.depth_sten",
        "cil.stencil_ops.incr_wrap_decr_wrap_incr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000488,
        "dEQP-GLES2.functional.fragment_ops.depth_sten",
        "cil.stencil_ops.incr_wrap_decr_wrap_decr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000489,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.decr_wrap_keep_keep");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000490,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.decr_wrap_keep_zero");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000491,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.decr_wrap_keep_replace");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000492,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.decr_wrap_keep_incr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000493,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.decr_wrap_keep_decr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000494,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.decr_wrap_keep_invert");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000495,
        "dEQP-GLES2.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.decr_wrap_keep_incr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000496,
        "dEQP-GLES2.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.decr_wrap_keep_decr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000497,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.decr_wrap_zero_keep");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000498,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.decr_wrap_zero_zero");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000499,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.decr_wrap_zero_replace");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000500,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.decr_wrap_zero_incr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000501,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.decr_wrap_zero_decr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000502,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.decr_wrap_zero_invert");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000503,
        "dEQP-GLES2.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.decr_wrap_zero_incr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000504,
        "dEQP-GLES2.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.decr_wrap_zero_decr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000505,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.decr_wrap_replace_keep");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000506,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.decr_wrap_replace_zero");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000507,
        "dEQP-GLES2.functional.fragment_ops.depth_st",
        "encil.stencil_ops.decr_wrap_replace_replace");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000508,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.decr_wrap_replace_incr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000509,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.decr_wrap_replace_decr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000510,
        "dEQP-GLES2.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.decr_wrap_replace_invert");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000511,
        "dEQP-GLES2.functional.fragment_ops.depth_ste",
        "ncil.stencil_ops.decr_wrap_replace_incr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000512,
        "dEQP-GLES2.functional.fragment_ops.depth_ste",
        "ncil.stencil_ops.decr_wrap_replace_decr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000513,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.decr_wrap_incr_keep");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000514,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.decr_wrap_incr_zero");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000515,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.decr_wrap_incr_replace");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000516,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.decr_wrap_incr_incr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000517,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.decr_wrap_incr_decr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000518,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.decr_wrap_incr_invert");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000519,
        "dEQP-GLES2.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.decr_wrap_incr_incr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000520,
        "dEQP-GLES2.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.decr_wrap_incr_decr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000521,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.decr_wrap_decr_keep");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000522,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.decr_wrap_decr_zero");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000523,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.decr_wrap_decr_replace");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000524,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.decr_wrap_decr_incr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000525,
        "dEQP-GLES2.functional.fragment_ops.depth",
        "_stencil.stencil_ops.decr_wrap_decr_decr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000526,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.decr_wrap_decr_invert");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000527,
        "dEQP-GLES2.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.decr_wrap_decr_incr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000528,
        "dEQP-GLES2.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.decr_wrap_decr_decr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000529,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.decr_wrap_invert_keep");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000530,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.decr_wrap_invert_zero");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000531,
        "dEQP-GLES2.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.decr_wrap_invert_replace");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000532,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.decr_wrap_invert_incr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000533,
        "dEQP-GLES2.functional.fragment_ops.depth_",
        "stencil.stencil_ops.decr_wrap_invert_decr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000534,
        "dEQP-GLES2.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.decr_wrap_invert_invert");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000535,
        "dEQP-GLES2.functional.fragment_ops.depth_st",
        "encil.stencil_ops.decr_wrap_invert_incr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000536,
        "dEQP-GLES2.functional.fragment_ops.depth_st",
        "encil.stencil_ops.decr_wrap_invert_decr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000537,
        "dEQP-GLES2.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.decr_wrap_incr_wrap_keep");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000538,
        "dEQP-GLES2.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.decr_wrap_incr_wrap_zero");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000539,
        "dEQP-GLES2.functional.fragment_ops.depth_ste",
        "ncil.stencil_ops.decr_wrap_incr_wrap_replace");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000540,
        "dEQP-GLES2.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.decr_wrap_incr_wrap_incr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000541,
        "dEQP-GLES2.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.decr_wrap_incr_wrap_decr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000542,
        "dEQP-GLES2.functional.fragment_ops.depth_st",
        "encil.stencil_ops.decr_wrap_incr_wrap_invert");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000543,
        "dEQP-GLES2.functional.fragment_ops.depth_sten",
        "cil.stencil_ops.decr_wrap_incr_wrap_incr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000544,
        "dEQP-GLES2.functional.fragment_ops.depth_sten",
        "cil.stencil_ops.decr_wrap_incr_wrap_decr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000545,
        "dEQP-GLES2.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.decr_wrap_decr_wrap_keep");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000546,
        "dEQP-GLES2.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.decr_wrap_decr_wrap_zero");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000547,
        "dEQP-GLES2.functional.fragment_ops.depth_ste",
        "ncil.stencil_ops.decr_wrap_decr_wrap_replace");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000548,
        "dEQP-GLES2.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.decr_wrap_decr_wrap_incr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000549,
        "dEQP-GLES2.functional.fragment_ops.depth_s",
        "tencil.stencil_ops.decr_wrap_decr_wrap_decr");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000550,
        "dEQP-GLES2.functional.fragment_ops.depth_st",
        "encil.stencil_ops.decr_wrap_decr_wrap_invert");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000551,
        "dEQP-GLES2.functional.fragment_ops.depth_sten",
        "cil.stencil_ops.decr_wrap_decr_wrap_incr_wrap");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000552,
        "dEQP-GLES2.functional.fragment_ops.depth_sten",
        "cil.stencil_ops.decr_wrap_decr_wrap_decr_wrap");
