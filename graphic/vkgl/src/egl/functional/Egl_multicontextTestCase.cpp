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

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003621, "dEQP-EGL.functional.multico",
    "ntext.non_shared");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003622, "dEQP-EGL.functional.multicon",
    "text.shared");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003623, "dEQP-EGL.functional.multicon",
    "text.non_shared_make_current");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003624, "dEQP-EGL.functional.multicont",
    "ext.shared_make_current");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003625, "dEQP-EGL.functional.multicont",
    "ext.non_shared_clear");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003626, "dEQP-EGL.functional.multicont",
    "ext.shared_clear");
