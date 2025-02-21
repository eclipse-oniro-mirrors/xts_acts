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

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042306,
        "dEQP-GLES3.functional.read_p",
        "ixels.rowlength.rgba_ubyte_17");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042307,
        "dEQP-GLES3.functional.read_p",
        "ixels.rowlength.rgba_ubyte_19");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042308,
        "dEQP-GLES3.functional.read_p",
        "ixels.rowlength.rgba_ubyte_23");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042309,
        "dEQP-GLES3.functional.read_p",
        "ixels.rowlength.rgba_ubyte_29");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042310,
        "dEQP-GLES3.functional.read_",
        "pixels.rowlength.rgba_int_17");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042311,
        "dEQP-GLES3.functional.read_",
        "pixels.rowlength.rgba_int_19");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042312,
        "dEQP-GLES3.functional.read_",
        "pixels.rowlength.rgba_int_23");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042313,
        "dEQP-GLES3.functional.read_",
        "pixels.rowlength.rgba_int_29");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042314,
        "dEQP-GLES3.functional.read_p",
        "ixels.rowlength.rgba_uint_17");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042315,
        "dEQP-GLES3.functional.read_p",
        "ixels.rowlength.rgba_uint_19");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042316,
        "dEQP-GLES3.functional.read_p",
        "ixels.rowlength.rgba_uint_23");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042317,
        "dEQP-GLES3.functional.read_p",
        "ixels.rowlength.rgba_uint_29");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042318,
        "dEQP-GLES3.functional.read",
        "_pixels.rowlength.choose_17");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042319,
        "dEQP-GLES3.functional.read",
        "_pixels.rowlength.choose_19");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042320,
        "dEQP-GLES3.functional.read",
        "_pixels.rowlength.choose_23");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042321,
        "dEQP-GLES3.functional.read",
        "_pixels.rowlength.choose_29");
