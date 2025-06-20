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
#include "../ActsDeqpgles30001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000059,
        "dEQP-GLES3.functional.",
        "color_clear.single_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000060,
        "dEQP-GLES3.functional.",
        "color_clear.single_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000061,
        "dEQP-GLES3.functional.c",
        "olor_clear.multiple_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000062,
        "dEQP-GLES3.functional.c",
        "olor_clear.multiple_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000063,
        "dEQP-GLES3.functional",
        ".color_clear.long_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000064,
        "dEQP-GLES3.functional",
        ".color_clear.long_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000065,
        "dEQP-GLES3.functional.c",
        "olor_clear.subclears_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000066,
        "dEQP-GLES3.functional.co",
        "lor_clear.subclears_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000067,
        "dEQP-GLES3.functional.colo",
        "r_clear.short_scissored_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000068,
        "dEQP-GLES3.functional.c",
        "olor_clear.scissored_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000069,
        "dEQP-GLES3.functional.co",
        "lor_clear.scissored_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000070,
        "dEQP-GLES3.functional.",
        "color_clear.masked_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000071,
        "dEQP-GLES3.functional.",
        "color_clear.masked_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000072,
        "dEQP-GLES3.functional.color",
        "_clear.masked_scissored_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000073,
        "dEQP-GLES3.functional.color",
        "_clear.masked_scissored_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000074,
        "dEQP-GLES3.functional.",
        "color_clear.complex_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000075,
        "dEQP-GLES3.functional.c",
        "olor_clear.complex_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000076,
        "dEQP-GLES3.functional.co",
        "lor_clear.long_masked_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000077,
        "dEQP-GLES3.functional.col",
        "or_clear.long_masked_rgba");
