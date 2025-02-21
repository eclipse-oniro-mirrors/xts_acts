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

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042290,
        "dEQP-GLES3.functional.read_p",
        "ixels.alignment.rgba_ubyte_1");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042291,
        "dEQP-GLES3.functional.read_p",
        "ixels.alignment.rgba_ubyte_2");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042292,
        "dEQP-GLES3.functional.read_p",
        "ixels.alignment.rgba_ubyte_4");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042293,
        "dEQP-GLES3.functional.read_p",
        "ixels.alignment.rgba_ubyte_8");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042294,
        "dEQP-GLES3.functional.read_",
        "pixels.alignment.rgba_int_1");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042295,
        "dEQP-GLES3.functional.read_",
        "pixels.alignment.rgba_int_2");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042296,
        "dEQP-GLES3.functional.read_",
        "pixels.alignment.rgba_int_4");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042297,
        "dEQP-GLES3.functional.read_",
        "pixels.alignment.rgba_int_8");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042298,
        "dEQP-GLES3.functional.read_",
        "pixels.alignment.rgba_uint_1");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042299,
        "dEQP-GLES3.functional.read_",
        "pixels.alignment.rgba_uint_2");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042300,
        "dEQP-GLES3.functional.read_",
        "pixels.alignment.rgba_uint_4");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042301,
        "dEQP-GLES3.functional.read_",
        "pixels.alignment.rgba_uint_8");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042302,
        "dEQP-GLES3.functional.read",
        "_pixels.alignment.choose_1");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042303,
        "dEQP-GLES3.functional.read",
        "_pixels.alignment.choose_2");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042304,
        "dEQP-GLES3.functional.read",
        "_pixels.alignment.choose_4");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042305,
        "dEQP-GLES3.functional.read",
        "_pixels.alignment.choose_8");
