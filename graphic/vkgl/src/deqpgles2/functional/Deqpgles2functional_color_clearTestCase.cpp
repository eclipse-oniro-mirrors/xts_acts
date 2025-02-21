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
#include "../ActsDeqpgles20001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000034,
        "dEQP-GLES2.functional.",
        "color_clear.single_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000035,
        "dEQP-GLES2.functional.",
        "color_clear.single_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000036,
        "dEQP-GLES2.functional.c",
        "olor_clear.multiple_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000037,
        "dEQP-GLES2.functional.c",
        "olor_clear.multiple_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000038,
        "dEQP-GLES2.functional",
        ".color_clear.long_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000039,
        "dEQP-GLES2.functional",
        ".color_clear.long_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000040,
        "dEQP-GLES2.functional.c",
        "olor_clear.subclears_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000041,
        "dEQP-GLES2.functional.co",
        "lor_clear.subclears_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000042,
        "dEQP-GLES2.functional.colo",
        "r_clear.short_scissored_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000043,
        "dEQP-GLES2.functional.c",
        "olor_clear.scissored_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000044,
        "dEQP-GLES2.functional.co",
        "lor_clear.scissored_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000045,
        "dEQP-GLES2.functional.",
        "color_clear.masked_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000046,
        "dEQP-GLES2.functional.",
        "color_clear.masked_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000047,
        "dEQP-GLES2.functional.color",
        "_clear.masked_scissored_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000048,
        "dEQP-GLES2.functional.color",
        "_clear.masked_scissored_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000049,
        "dEQP-GLES2.functional.",
        "color_clear.complex_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000050,
        "dEQP-GLES2.functional.c",
        "olor_clear.complex_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000051,
        "dEQP-GLES2.functional.co",
        "lor_clear.long_masked_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000052,
        "dEQP-GLES2.functional.col",
        "or_clear.long_masked_rgba");
