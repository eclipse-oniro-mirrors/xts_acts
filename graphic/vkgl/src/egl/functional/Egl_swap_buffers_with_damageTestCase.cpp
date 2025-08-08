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

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003567, "dEQP-EGL.functional.swap_buffe",
    "rs_with_damage.no_resize.clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003568, "dEQP-EGL.functional.swap_buffe",
    "rs_with_damage.no_resize.render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003569, "dEQP-EGL.functional.swap_buffers_",
    "with_damage.no_resize.clear_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003570, "dEQP-EGL.functional.swap_buffers_w",
    "ith_damage.no_resize.render_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003571, "dEQP-EGL.functional.swap_buffers_",
    "with_damage.no_resize.clear_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003572, "dEQP-EGL.functional.swap_buffers_",
    "with_damage.no_resize.render_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003573, "dEQP-EGL.functional.swap_buffers_with_",
    "damage.no_resize.preserve_buffer_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003574, "dEQP-EGL.functional.swap_buffers_with_",
    "damage.no_resize.preserve_buffer_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003575, "dEQP-EGL.functional.swap_buffers_with_dam",
    "age.no_resize.preserve_buffer_clear_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003576, "dEQP-EGL.functional.swap_buffers_with_dama",
    "ge.no_resize.preserve_buffer_render_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003577, "dEQP-EGL.functional.swap_buffers_with_dam",
    "age.no_resize.preserve_buffer_clear_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003578, "dEQP-EGL.functional.swap_buffers_with_dam",
    "age.no_resize.preserve_buffer_render_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003579, "dEQP-EGL.functional.swap_buffers_wi",
    "th_damage.no_resize.buffer_age_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003580, "dEQP-EGL.functional.swap_buffers_wit",
    "h_damage.no_resize.buffer_age_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003581, "dEQP-EGL.functional.swap_buffers_with_",
    "damage.no_resize.buffer_age_clear_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003582, "dEQP-EGL.functional.swap_buffers_with_d",
    "amage.no_resize.buffer_age_render_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003583, "dEQP-EGL.functional.swap_buffers_with_d",
    "amage.no_resize.buffer_age_clear_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003584, "dEQP-EGL.functional.swap_buffers_with_d",
    "amage.no_resize.buffer_age_render_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003585, "dEQP-EGL.functional.swap_buffers_w",
    "ith_damage.resize_before_swap.clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003586, "dEQP-EGL.functional.swap_buffers_wi",
    "th_damage.resize_before_swap.render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003587, "dEQP-EGL.functional.swap_buffers_with",
    "_damage.resize_before_swap.clear_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003588, "dEQP-EGL.functional.swap_buffers_with_",
    "damage.resize_before_swap.render_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003589, "dEQP-EGL.functional.swap_buffers_with_",
    "damage.resize_before_swap.clear_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003590, "dEQP-EGL.functional.swap_buffers_with_",
    "damage.resize_before_swap.render_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003591, "dEQP-EGL.functional.swap_buffers_with_dama",
    "ge.resize_before_swap.preserve_buffer_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003592, "dEQP-EGL.functional.swap_buffers_with_damag",
    "e.resize_before_swap.preserve_buffer_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003593, "dEQP-EGL.functional.swap_buffers_with_damage.",
    "resize_before_swap.preserve_buffer_clear_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003594, "dEQP-EGL.functional.swap_buffers_with_damage.r",
    "esize_before_swap.preserve_buffer_render_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003595, "dEQP-EGL.functional.swap_buffers_with_damage.r",
    "esize_before_swap.preserve_buffer_clear_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003596, "dEQP-EGL.functional.swap_buffers_with_damage.r",
    "esize_before_swap.preserve_buffer_render_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003597, "dEQP-EGL.functional.swap_buffers_with_da",
    "mage.resize_before_swap.buffer_age_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003598, "dEQP-EGL.functional.swap_buffers_with_da",
    "mage.resize_before_swap.buffer_age_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003599, "dEQP-EGL.functional.swap_buffers_with_damag",
    "e.resize_before_swap.buffer_age_clear_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003600, "dEQP-EGL.functional.swap_buffers_with_damage",
    ".resize_before_swap.buffer_age_render_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003601, "dEQP-EGL.functional.swap_buffers_with_damag",
    "e.resize_before_swap.buffer_age_clear_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003602, "dEQP-EGL.functional.swap_buffers_with_damag",
    "e.resize_before_swap.buffer_age_render_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003603, "dEQP-EGL.functional.swap_buffers_w",
    "ith_damage.resize_after_swap.clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003604, "dEQP-EGL.functional.swap_buffers_w",
    "ith_damage.resize_after_swap.render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003605, "dEQP-EGL.functional.swap_buffers_with",
    "_damage.resize_after_swap.clear_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003606, "dEQP-EGL.functional.swap_buffers_with_",
    "damage.resize_after_swap.render_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003607, "dEQP-EGL.functional.swap_buffers_with",
    "_damage.resize_after_swap.clear_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003608, "dEQP-EGL.functional.swap_buffers_with",
    "_damage.resize_after_swap.render_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003609, "dEQP-EGL.functional.swap_buffers_with_dama",
    "ge.resize_after_swap.preserve_buffer_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003610, "dEQP-EGL.functional.swap_buffers_with_dama",
    "ge.resize_after_swap.preserve_buffer_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003611, "dEQP-EGL.functional.swap_buffers_with_damage.",
    "resize_after_swap.preserve_buffer_clear_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003612, "dEQP-EGL.functional.swap_buffers_with_damage.r",
    "esize_after_swap.preserve_buffer_render_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003613, "dEQP-EGL.functional.swap_buffers_with_damage.",
    "resize_after_swap.preserve_buffer_clear_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003614, "dEQP-EGL.functional.swap_buffers_with_damage.",
    "resize_after_swap.preserve_buffer_render_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003615, "dEQP-EGL.functional.swap_buffers_with_d",
    "amage.resize_after_swap.buffer_age_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003616, "dEQP-EGL.functional.swap_buffers_with_da",
    "mage.resize_after_swap.buffer_age_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003617, "dEQP-EGL.functional.swap_buffers_with_dama",
    "ge.resize_after_swap.buffer_age_clear_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003618, "dEQP-EGL.functional.swap_buffers_with_damag",
    "e.resize_after_swap.buffer_age_render_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003619, "dEQP-EGL.functional.swap_buffers_with_damag",
    "e.resize_after_swap.buffer_age_clear_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003620, "dEQP-EGL.functional.swap_buffers_with_damag",
    "e.resize_after_swap.buffer_age_render_clear");
