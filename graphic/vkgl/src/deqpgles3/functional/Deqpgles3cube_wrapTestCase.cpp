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

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027029,
        "dEQP-GLES3.functional.texture",
        ".vertex.cube.wrap.clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027030,
        "dEQP-GLES3.functional.texture",
        ".vertex.cube.wrap.clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027031,
        "dEQP-GLES3.functional.texture",
        ".vertex.cube.wrap.clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027032,
        "dEQP-GLES3.functional.texture",
        ".vertex.cube.wrap.repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027033,
        "dEQP-GLES3.functional.texture.",
        "vertex.cube.wrap.repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027034,
        "dEQP-GLES3.functional.texture.",
        "vertex.cube.wrap.repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027035,
        "dEQP-GLES3.functional.texture",
        ".vertex.cube.wrap.mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027036,
        "dEQP-GLES3.functional.texture.",
        "vertex.cube.wrap.mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027037,
        "dEQP-GLES3.functional.texture.",
        "vertex.cube.wrap.mirror_mirror");

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
