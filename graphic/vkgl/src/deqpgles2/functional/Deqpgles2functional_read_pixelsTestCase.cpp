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
#include "../Deqpgles2BaseFunc.h"
#include "../ActsDeqpgles20016TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015249,
        "dEQP-GLES2.functional.read",
        "_pixels.rgba_ubyte_align_1");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015250,
        "dEQP-GLES2.functional.read",
        "_pixels.rgba_ubyte_align_2");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015251,
        "dEQP-GLES2.functional.read",
        "_pixels.rgba_ubyte_align_4");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015252,
        "dEQP-GLES2.functional.read",
        "_pixels.rgba_ubyte_align_8");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015253,
        "dEQP-GLES2.functional.re",
        "ad_pixels.choose_align_1");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015254,
        "dEQP-GLES2.functional.re",
        "ad_pixels.choose_align_2");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015255,
        "dEQP-GLES2.functional.re",
        "ad_pixels.choose_align_4");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015256,
        "dEQP-GLES2.functional.re",
        "ad_pixels.choose_align_8");
