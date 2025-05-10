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
#include "../ActsDeqpgles30026TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025197,
        "dEQP-GLES3.functional.texture.",
        "swizzle.single_channel.r_green");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025198,
        "dEQP-GLES3.functional.texture",
        ".swizzle.single_channel.r_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025199,
        "dEQP-GLES3.functional.texture.",
        "swizzle.single_channel.r_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025200,
        "dEQP-GLES3.functional.texture",
        ".swizzle.single_channel.r_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025201,
        "dEQP-GLES3.functional.texture",
        ".swizzle.single_channel.r_one");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025202,
        "dEQP-GLES3.functional.texture",
        ".swizzle.single_channel.g_red");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025203,
        "dEQP-GLES3.functional.texture",
        ".swizzle.single_channel.g_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025204,
        "dEQP-GLES3.functional.texture.",
        "swizzle.single_channel.g_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025205,
        "dEQP-GLES3.functional.texture",
        ".swizzle.single_channel.g_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025206,
        "dEQP-GLES3.functional.texture",
        ".swizzle.single_channel.g_one");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025207,
        "dEQP-GLES3.functional.texture",
        ".swizzle.single_channel.b_red");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025208,
        "dEQP-GLES3.functional.texture.",
        "swizzle.single_channel.b_green");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025209,
        "dEQP-GLES3.functional.texture.",
        "swizzle.single_channel.b_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025210,
        "dEQP-GLES3.functional.texture",
        ".swizzle.single_channel.b_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025211,
        "dEQP-GLES3.functional.texture",
        ".swizzle.single_channel.b_one");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025212,
        "dEQP-GLES3.functional.texture",
        ".swizzle.single_channel.a_red");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025213,
        "dEQP-GLES3.functional.texture.",
        "swizzle.single_channel.a_green");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025214,
        "dEQP-GLES3.functional.texture",
        ".swizzle.single_channel.a_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025215,
        "dEQP-GLES3.functional.texture",
        ".swizzle.single_channel.a_zero");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025216,
        "dEQP-GLES3.functional.texture",
        ".swizzle.single_channel.a_one");
