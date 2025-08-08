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

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003531, "dEQP-EGL.functional.partial_update",
    ".odd_clear_even_none");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003532, "dEQP-EGL.functional.partial_update",
    ".odd_render_even_none");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003533, "dEQP-EGL.functional.partial_up",
    "date.odd_clear_clear_even_none");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003534, "dEQP-EGL.functional.partial_upd",
    "ate.odd_render_render_even_none");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003535, "dEQP-EGL.functional.partial_up",
    "date.odd_clear_render_even_none");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003536, "dEQP-EGL.functional.partial_up",
    "date.odd_render_clear_even_none");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003537, "dEQP-EGL.functional.partial_upd",
    "ate.odd_clear_even_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003538, "dEQP-EGL.functional.partial_upd",
    "ate.odd_render_even_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003539, "dEQP-EGL.functional.partial_up",
    "date.odd_clear_clear_even_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003540, "dEQP-EGL.functional.partial_upd",
    "ate.odd_render_render_even_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003541, "dEQP-EGL.functional.partial_upd",
    "ate.odd_clear_render_even_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003542, "dEQP-EGL.functional.partial_upd",
    "ate.odd_render_clear_even_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003543, "dEQP-EGL.functional.partial_upda",
    "te.odd_render_even_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003544, "dEQP-EGL.functional.partial_upd",
    "ate.odd_clear_clear_even_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003545, "dEQP-EGL.functional.partial_upda",
    "te.odd_render_render_even_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003546, "dEQP-EGL.functional.partial_upd",
    "ate.odd_clear_render_even_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003547, "dEQP-EGL.functional.partial_upd",
    "ate.odd_render_clear_even_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003548, "dEQP-EGL.functional.partial_updat",
    "e.odd_clear_clear_even_clear_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003549, "dEQP-EGL.functional.partial_update",
    ".odd_render_render_even_clear_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003550, "dEQP-EGL.functional.partial_update",
    ".odd_clear_render_even_clear_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003551, "dEQP-EGL.functional.partial_update",
    ".odd_render_clear_even_clear_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003552, "dEQP-EGL.functional.partial_update.",
    "odd_render_render_even_render_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003553, "dEQP-EGL.functional.partial_update.",
    "odd_clear_render_even_render_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003554, "dEQP-EGL.functional.partial_update.",
    "odd_render_clear_even_render_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003555, "dEQP-EGL.functional.partial_update",
    ".odd_clear_render_even_clear_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003556, "dEQP-EGL.functional.partial_update",
    ".odd_render_clear_even_clear_render");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003557, "dEQP-EGL.functional.partial_update",
    ".odd_render_clear_even_render_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003558, "dEQP-EGL.functional.partial_upd",
    "ate.render_outside_damage_region");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003559, "dEQP-EGL.functional.partial_updat",
    "e.render_before_set_damage_region");
