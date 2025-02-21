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

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003328, "dEQP-EGL.functional.reusable_sync.vali",
    "d.create_null_attribs");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003329, "dEQP-EGL.functional.reusable_s",
    "ync.valid.create_empty_attribs");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003330, "dEQP-EGL.functional.reusable_sync.vali",
    "d.wait_no_timeout");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003331, "dEQP-EGL.functional.reusable_sync.vali",
    "d.wait_forever");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003332, "dEQP-EGL.functional.reusable_sync.vali",
    "d.wait_no_context");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003333, "dEQP-EGL.functional.reusable_sync.vali",
    "d.wait_forever_flush");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003334, "dEQP-EGL.functional.reusable_sync.vali",
    "d.get_type");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003335, "dEQP-EGL.functional.reusable_sync.vali",
    "d.get_status");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003336, "dEQP-EGL.functional.reusable_sync.vali",
    "d.get_status_signaled");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003337, "dEQP-EGL.functional.reusable_sync.vali",
    "d.destroy");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003338, "dEQP-EGL.functional.reusable_syn",
    "c.invalid.create_invalid_display");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003339, "dEQP-EGL.functional.reusable_s",
    "ync.invalid.create_invalid_type");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003340, "dEQP-EGL.functional.reusable_syn",
    "c.invalid.create_invalid_attribs");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003341, "dEQP-EGL.functional.reusable_sy",
    "nc.invalid.wait_invalid_display");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003342, "dEQP-EGL.functional.reusable_sync.inval",
    "id.wait_invalid_sync");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003343, "dEQP-EGL.functional.reusable_s",
    "ync.invalid.get_invalid_display");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003344, "dEQP-EGL.functional.reusable_sync.inval",
    "id.get_invalid_sync");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003345, "dEQP-EGL.functional.reusable_sy",
    "nc.invalid.get_invalid_attribute");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003346, "dEQP-EGL.functional.reusable_sync.inval",
    "id.get_invalid_value");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003347, "dEQP-EGL.functional.reusable_syn",
    "c.invalid.destroy_invalid_display");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003348, "dEQP-EGL.functional.reusable_sy",
    "nc.invalid.destroy_invalid_sync");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003349, "dEQP-EGL.functional.reusable_sync.",
    "invalid.wait_server_invalid_display");

static SHRINK_HWTEST_F(ActsEgl0001TS, TC003350, "dEQP-EGL.functional.reusable_sync",
    ".invalid.wait_server_invalid_sync");
