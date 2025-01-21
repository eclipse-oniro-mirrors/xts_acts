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
#include "../Deqpgles3BaseFunc.h"
#include "../ActsDeqpgles30043TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042322,
        "dEQP-GLES3.functional.read",
        "_pixels.skip.rgba_ubyte_0_3");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042323,
        "dEQP-GLES3.functional.read",
        "_pixels.skip.rgba_ubyte_3_0");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042324,
        "dEQP-GLES3.functional.read",
        "_pixels.skip.rgba_ubyte_3_3");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042325,
        "dEQP-GLES3.functional.read",
        "_pixels.skip.rgba_ubyte_3_5");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042326,
        "dEQP-GLES3.functional.rea",
        "d_pixels.skip.rgba_int_0_3");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042327,
        "dEQP-GLES3.functional.rea",
        "d_pixels.skip.rgba_int_3_0");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042328,
        "dEQP-GLES3.functional.rea",
        "d_pixels.skip.rgba_int_3_3");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042329,
        "dEQP-GLES3.functional.rea",
        "d_pixels.skip.rgba_int_3_5");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042330,
        "dEQP-GLES3.functional.read",
        "_pixels.skip.rgba_uint_0_3");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042331,
        "dEQP-GLES3.functional.read",
        "_pixels.skip.rgba_uint_3_0");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042332,
        "dEQP-GLES3.functional.read",
        "_pixels.skip.rgba_uint_3_3");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042333,
        "dEQP-GLES3.functional.read",
        "_pixels.skip.rgba_uint_3_5");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042334,
        "dEQP-GLES3.functional.re",
        "ad_pixels.skip.choose_0_3");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042335,
        "dEQP-GLES3.functional.re",
        "ad_pixels.skip.choose_3_0");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042336,
        "dEQP-GLES3.functional.re",
        "ad_pixels.skip.choose_3_3");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042337,
        "dEQP-GLES3.functional.re",
        "ad_pixels.skip.choose_3_5");
