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

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015295,
        "dEQP-GLES2.functional.dit",
        "her.enabled.gradient_white");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015296,
        "dEQP-GLES2.functional.di",
        "ther.enabled.gradient_red");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015297,
        "dEQP-GLES2.functional.dit",
        "her.enabled.gradient_green");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015298,
        "dEQP-GLES2.functional.dit",
        "her.enabled.gradient_blue");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015299,
        "dEQP-GLES2.functional.dit",
        "her.enabled.gradient_alpha");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015300,
        "dEQP-GLES2.functional.dither.",
        "enabled.unicolored_quad_white");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015301,
        "dEQP-GLES2.functional.dither",
        ".enabled.unicolored_quad_red");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015302,
        "dEQP-GLES2.functional.dither.",
        "enabled.unicolored_quad_green");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015303,
        "dEQP-GLES2.functional.dither",
        ".enabled.unicolored_quad_blue");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015304,
        "dEQP-GLES2.functional.dither.",
        "enabled.unicolored_quad_alpha");
