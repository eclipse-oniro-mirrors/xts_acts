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

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000006, "dEQP-EGL.functional.create_con",
    "text.rgb565_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000007, "dEQP-EGL.functional.create_cont",
    "ext.rgb565_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000008, "dEQP-EGL.functional.create_cont",
    "ext.rgb565_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000009, "dEQP-EGL.functional.create_cont",
    "ext.rgb565_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000010, "dEQP-EGL.functional.create_con",
    "text.rgb888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000011, "dEQP-EGL.functional.create_cont",
    "ext.rgb888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000012, "dEQP-EGL.functional.create_cont",
    "ext.rgb888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000013, "dEQP-EGL.functional.create_cont",
    "ext.rgb888_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000014, "dEQP-EGL.functional.create_cont",
    "ext.rgba4444_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000015, "dEQP-EGL.functional.create_con",
    "text.rgba4444_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000016, "dEQP-EGL.functional.create_con",
    "text.rgba4444_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000017, "dEQP-EGL.functional.create_cont",
    "ext.rgba4444_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000018, "dEQP-EGL.functional.create_cont",
    "ext.rgba5551_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000019, "dEQP-EGL.functional.create_con",
    "text.rgba5551_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000020, "dEQP-EGL.functional.create_con",
    "text.rgba5551_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000021, "dEQP-EGL.functional.create_cont",
    "ext.rgba5551_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000022, "dEQP-EGL.functional.create_cont",
    "ext.rgba8888_no_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000023, "dEQP-EGL.functional.create_con",
    "text.rgba8888_no_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000024, "dEQP-EGL.functional.create_con",
    "text.rgba8888_depth_no_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000025, "dEQP-EGL.functional.create_cont",
    "ext.rgba8888_depth_stencil");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000026, "dEQP-EGL.functional.create_cont",
    "ext.other");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC000027, "dEQP-EGL.functional.create_cont",
    "ext.no_config");
