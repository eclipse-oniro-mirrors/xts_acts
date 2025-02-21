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

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002378, "dEQP-EGL.functional.fence_sync.val",
    "id.create_null_attribs");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002379, "dEQP-EGL.functional.fence_sync.vali",
    "d.create_empty_attribs");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002380, "dEQP-EGL.functional.fence_sync.vali",
    "d.wait_no_timeout");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002381, "dEQP-EGL.functional.fence_sync.val",
    "id.wait_forever");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002382, "dEQP-EGL.functional.fence_sync.val",
    "id.wait_no_context");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002383, "dEQP-EGL.functional.fence_sync.val",
    "id.wait_forever_flush");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002384, "dEQP-EGL.functional.fence_sync.val",
    "id.get_type");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002385, "dEQP-EGL.functional.fence_sync.val",
    "id.get_status");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002386, "dEQP-EGL.functional.fence_sync.val",
    "id.get_status_signaled");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002387, "dEQP-EGL.functional.fence_sync.val",
    "id.get_condition");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002388, "dEQP-EGL.functional.fence_sync.val",
    "id.destroy");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002389, "dEQP-EGL.functional.fence_sync.vali",
    "d.wait_server");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002390, "dEQP-EGL.functional.fence_sync",
    ".invalid.create_invalid_display");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002391, "dEQP-EGL.functional.fence_sync.inval",
    "id.create_invalid_type");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002392, "dEQP-EGL.functional.fence_sync",
    ".invalid.create_invalid_attribs");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002393, "dEQP-EGL.functional.fence_sync",
    ".invalid.create_invalid_context");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002394, "dEQP-EGL.functional.fence_sync.inval",
    "id.wait_invalid_display");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002395, "dEQP-EGL.functional.fence_sync.inval",
    "id.wait_invalid_sync");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002396, "dEQP-EGL.functional.fence_sync.inval",
    "id.get_invalid_display");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002397, "dEQP-EGL.functional.fence_sync.inval",
    "id.get_invalid_sync");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002398, "dEQP-EGL.functional.fence_sync",
    ".invalid.get_invalid_attribute");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002399, "dEQP-EGL.functional.fence_sync.invalid.ge",
    "t_invalid_value");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002400, "dEQP-EGL.functional.fence_sync.",
    "invalid.destroy_invalid_display");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002401, "dEQP-EGL.functional.fence_sync.invalid.des",
    "troy_invalid_sync");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002402, "dEQP-EGL.functional.fence_sync.in",
    "valid.wait_server_invalid_display");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002403, "dEQP-EGL.functional.fence_sync.",
    "invalid.wait_server_invalid_sync");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC002404, "dEQP-EGL.functional.fence_sync.",
    "invalid.wait_server_invalid_flag");
