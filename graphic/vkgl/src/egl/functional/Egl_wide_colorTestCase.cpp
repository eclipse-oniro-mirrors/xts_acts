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
#include "../EglBaseFunc.h"
#include "../ActsEgl0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003713, "dEQP-EGL.functional.wi",
    "de_color.fp16");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003714, "dEQP-EGL.functional.wi",
    "de_color.1010102");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003715, "dEQP-EGL.functional.wide_color",
    ".window_fp16_default_colorspace");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003716, "dEQP-EGL.functional.wide_color.win",
    "dow_fp16_colorspace_srgb");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003717, "dEQP-EGL.functional.wide_color.win",
    "dow_fp16_colorspace_p3");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003718, "dEQP-EGL.functional.wide_color.win",
    "dow_fp16_colorspace_p3_passthrough");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003719, "dEQP-EGL.functional.wide_color.win",
    "dow_fp16_colorspace_scrgb");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003720, "dEQP-EGL.functional.wide_color.wi",
    "ndow_fp16_colorspace_scrgb_linear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003721, "dEQP-EGL.functional.wide_color.",
    "pbuffer_fp16_default_colorspace");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003722, "dEQP-EGL.functional.wide_color.pbuff",
    "er_fp16_colorspace_srgb");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003723, "dEQP-EGL.functional.wide_color.pbuf",
    "er_fp16_colorspace_p3");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003724, "dEQP-EGL.functional.wide_color.pbu",
    "ffer_fp16_colorspace_p3_passthrough");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003725, "dEQP-EGL.functional.wide_color",
    ".pbuffer_fp16_colorspace_scrgb");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003726, "dEQP-EGL.functional.wide_color.pb",
    "uffer_fp16_colorspace_scrgb_linear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003727, "dEQP-EGL.functional.wide_color.w",
    "indow_1010102_colorspace_default");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003728, "dEQP-EGL.functional.wide_color",
    ".window_1010102_colorspace_srgb");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003729, "dEQP-EGL.functional.wide_color.win",
    "dow_1010102_colorspace_p3");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003730, "dEQP-EGL.functional.wide_color.wind",
    "ow_1010102_colorspace_p3_passthrough");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003731, "dEQP-EGL.functional.wide_color.p",
    "buffer_1010102_colorspace_default");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003732, "dEQP-EGL.functional.wide_color.",
    "pbuffer_1010102_colorspace_srgb");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003733, "dEQP-EGL.functional.wide_color",
    ".pbuffer_1010102_colorspace_p3");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003734, "dEQP-EGL.functional.wide_color.pbuff",
    "er_1010102_colorspace_p3_passthrough");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003735, "dEQP-EGL.functional.wide_color",
    ".window_8888_colorspace_default");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003736, "dEQP-EGL.functional.wide_color.wind",
    "ow_8888_colorspace_srgb");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003737, "dEQP-EGL.functional.wide_color.wind",
    "ow_8888_colorspace_p3");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003738, "dEQP-EGL.functional.wide_color.win",
    "dow_8888_colorspace_p3_passthrough");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003739, "dEQP-EGL.functional.wide_color.",
    "pbuffer_8888_colorspace_default");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003740, "dEQP-EGL.functional.wide_color.pbuffe",
    "r_8888_colorspace_srgb");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003741, "dEQP-EGL.functional.wide_color.pbuff",
    "er_8888_colorspace_p3");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003742, "dEQP-EGL.functional.wide_color.pbu",
    "ffer_8888_colorspace_p3_passthrough");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003743, "dEQP-EGL.functional.wide_color",
    ".window_888_colorspace_default");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003744, "dEQP-EGL.functional.wide_color.windo",
    "w_888_colorspace_srgb");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003745, "dEQP-EGL.functional.wide_color.wind",
    "ow_888_colorspace_p3");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003746, "dEQP-EGL.functional.wide_color.wi",
    "ndow_888_colorspace_p3_passthrough");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003747, "dEQP-EGL.functional.wide_color",
    ".pbuffer_888_colorspace_default");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003748, "dEQP-EGL.functional.wide_color.pbuff",
    "er_888_colorspace_srgb");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003749, "dEQP-EGL.functional.wide_color.pbuff",
    "er_888_colorspace_p3");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003750, "dEQP-EGL.functional.wide_color.pbu",
    "ffer_888_colorspace_p3_passthrough");
