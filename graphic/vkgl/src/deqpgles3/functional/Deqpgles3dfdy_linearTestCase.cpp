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
#include "../ActsDeqpgles30018TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017586,
        "dEQP-GLES3.functional.shaders.",
        "derivate.dfdy.linear.float_lowp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017587,
        "dEQP-GLES3.functional.shaders.de",
        "rivate.dfdy.linear.float_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017588,
        "dEQP-GLES3.functional.shaders.d",
        "erivate.dfdy.linear.float_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017589,
        "dEQP-GLES3.functional.shaders.",
        "derivate.dfdy.linear.vec2_lowp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017590,
        "dEQP-GLES3.functional.shaders.d",
        "erivate.dfdy.linear.vec2_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017591,
        "dEQP-GLES3.functional.shaders.",
        "derivate.dfdy.linear.vec2_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017592,
        "dEQP-GLES3.functional.shaders.",
        "derivate.dfdy.linear.vec3_lowp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017593,
        "dEQP-GLES3.functional.shaders.d",
        "erivate.dfdy.linear.vec3_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017594,
        "dEQP-GLES3.functional.shaders.",
        "derivate.dfdy.linear.vec3_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017595,
        "dEQP-GLES3.functional.shaders.",
        "derivate.dfdy.linear.vec4_lowp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017596,
        "dEQP-GLES3.functional.shaders.",
        "derivate.dfdy.linear.vec4_highp");
