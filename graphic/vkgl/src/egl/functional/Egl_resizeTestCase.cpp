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

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003351, "dEQP-EGL.functional.resize.sur",
    "face_size.shrink");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003352, "dEQP-EGL.functional.resize.sur",
    "face_size.grow");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003353, "dEQP-EGL.functional.resize.sur",
    "face_size.stretch_width");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003354, "dEQP-EGL.functional.resize.sur",
    "face_size.stretch_height");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003355, "dEQP-EGL.functional.resize.back_buf",
    "fer.shrink");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003356, "dEQP-EGL.functional.resize.back_buff",
    "er.grow");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003357, "dEQP-EGL.functional.resize.back_buff",
    "er.stretch_width");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003358, "dEQP-EGL.functional.resize.back_buff",
    "er.stretch_height");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003359, "dEQP-EGL.functional.resize.pixel_den",
    "sity.shrink");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003360, "dEQP-EGL.functional.resize.pixel_den",
    "sity.grow");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003361, "dEQP-EGL.functional.resize.pixel_den",
    "ity.stretch_width");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003362, "dEQP-EGL.functional.resize.pixel_dens",
    "ity.stretch_height");
