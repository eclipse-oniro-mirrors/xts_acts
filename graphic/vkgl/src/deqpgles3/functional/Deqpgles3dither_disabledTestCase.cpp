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

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042338,
        "dEQP-GLES3.functional.dith",
        "er.disabled.gradient_white");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042339,
        "dEQP-GLES3.functional.dit",
        "her.disabled.gradient_red");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042340,
        "dEQP-GLES3.functional.dith",
        "er.disabled.gradient_green");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042341,
        "dEQP-GLES3.functional.dit",
        "her.disabled.gradient_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042342,
        "dEQP-GLES3.functional.dith",
        "er.disabled.gradient_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042343,
        "dEQP-GLES3.functional.dither.",
        "disabled.unicolored_quad_white");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042344,
        "dEQP-GLES3.functional.dither",
        ".disabled.unicolored_quad_red");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042345,
        "dEQP-GLES3.functional.dither.",
        "disabled.unicolored_quad_green");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042346,
        "dEQP-GLES3.functional.dither.",
        "disabled.unicolored_quad_blue");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042347,
        "dEQP-GLES3.functional.dither.",
        "disabled.unicolored_quad_alpha");
