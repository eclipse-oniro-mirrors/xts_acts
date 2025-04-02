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

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002601, "dEQP-EGL.functional.preserve_swap.p",
    "reserve.no_read_before_swap.no_draw");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002602, "dEQP-EGL.functional.preserve_swap.pr",
    "eserve.no_read_before_swap.post_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002603, "dEQP-EGL.functional.preserve_swap.pre",
    "serve.no_read_before_swap.post_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002604, "dEQP-EGL.functional.preserve_swap.pr",
    "eserve.no_read_before_swap.pre_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002605, "dEQP-EGL.functional.preserve_swap.preserv",
    "e.no_read_before_swap.pre_clear_post_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002606, "dEQP-EGL.functional.preserve_swap.preserve",
    ".no_read_before_swap.pre_clear_post_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002607, "dEQP-EGL.functional.preserve_swap.pr",
    "eserve.no_read_before_swap.pre_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002608, "dEQP-EGL.functional.preserve_swap.preserve",
    ".no_read_before_swap.pre_render_post_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002609, "dEQP-EGL.functional.preserve_swap.preserve",
    ".no_read_before_swap.pre_render_post_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002610, "dEQP-EGL.functional.preserve_swap",
    ".preserve.read_before_swap.no_draw");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002611, "dEQP-EGL.functional.preserve_swap.p",
    "reserve.read_before_swap.post_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002612, "dEQP-EGL.functional.preserve_swap.p",
    "reserve.read_before_swap.post_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002613, "dEQP-EGL.functional.preserve_swap.",
    "preserve.read_before_swap.pre_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002614, "dEQP-EGL.functional.preserve_swap.preser",
    "ve.read_before_swap.pre_clear_post_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002615, "dEQP-EGL.functional.preserve_swap.preser",
    "ve.read_before_swap.pre_clear_post_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002616, "dEQP-EGL.functional.preserve_swap.p",
    "reserve.read_before_swap.pre_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002617, "dEQP-EGL.functional.preserve_swap.preser",
    "ve.read_before_swap.pre_render_post_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002618, "dEQP-EGL.functional.preserve_swap.preserv",
    "e.read_before_swap.pre_render_post_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002619, "dEQP-EGL.functional.preserve_swap.no_p",
    "reserve.no_read_before_swap.post_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002620, "dEQP-EGL.functional.preserve_swap.no_p",
    "reserve.no_read_before_swap.post_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002621, "dEQP-EGL.functional.preserve_swap.no_preser",
    "ve.no_read_before_swap.pre_clear_post_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002622, "dEQP-EGL.functional.preserve_swap.no_preser",
    "ve.no_read_before_swap.pre_clear_post_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002623, "dEQP-EGL.functional.preserve_swap.no_preser",
    "ve.no_read_before_swap.pre_render_post_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002624, "dEQP-EGL.functional.preserve_swap.no_preserv",
    "e.no_read_before_swap.pre_render_post_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002625, "dEQP-EGL.functional.preserve_swap.no",
    "_preserve.read_before_swap.post_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002626, "dEQP-EGL.functional.preserve_swap.no_",
    "preserve.read_before_swap.post_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002627, "dEQP-EGL.functional.preserve_swap.no_pres",
    "erve.read_before_swap.pre_clear_post_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002628, "dEQP-EGL.functional.preserve_swap.no_prese",
    "rve.read_before_swap.pre_clear_post_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002629, "dEQP-EGL.functional.preserve_swap.no_prese",
    "rve.read_before_swap.pre_render_post_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002630, "dEQP-EGL.functional.preserve_swap.no_prese",
    "rve.read_before_swap.pre_render_post_render");
