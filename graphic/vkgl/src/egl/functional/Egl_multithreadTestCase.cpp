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

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002405, "dEQP-EGL.functional.mult",
    "ithread.config");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002406, "dEQP-EGL.functional.multi",
    "thread.pbuffer");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002407, "dEQP-EGL.functional.multi",
    "thread.single_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002408, "dEQP-EGL.functional.multit",
    "hread.context");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002409, "dEQP-EGL.functional.multith",
    "read.pbuffer_single_window");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002410, "dEQP-EGL.functional.multith",
    "read.pbuffer_context");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002411, "dEQP-EGL.functional.multith",
    "read.single_window_context");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002412, "dEQP-EGL.functional.multithrea",
    "d.pbuffer_single_window_context");
