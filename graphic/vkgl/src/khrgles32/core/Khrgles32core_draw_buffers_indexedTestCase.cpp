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
#include "../Khrgles32BaseFunc.h"
#include "../ActsKhrgles320001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000319,
        "KHR-GLES32.core.draw_b",
        "uffers_indexed.coverage");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000320,
        "KHR-GLES32.core.draw_buff",
        "ers_indexed.default_state");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000321,
        "KHR-GLES32.core.draw_b",
        "uffers_indexed.set_get");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000322,
        "KHR-GLES32.core.draw_buf",
        "fers_indexed.color_masks");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000323,
        "KHR-GLES32.core.draw_b",
        "uffers_indexed.blending");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000324,
        "KHR-GLES32.core.draw_b",
        "uffers_indexed.negative");
