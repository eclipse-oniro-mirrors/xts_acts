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

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017819,
        "dEQP-GLES3.functional.shaders.deriva",
        "te.fwidth.uniform_loop.float_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017820,
        "dEQP-GLES3.functional.shaders.deriv",
        "ate.fwidth.uniform_loop.float_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017821,
        "dEQP-GLES3.functional.shaders.deriv",
        "ate.fwidth.uniform_loop.vec2_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017822,
        "dEQP-GLES3.functional.shaders.deri",
        "vate.fwidth.uniform_loop.vec2_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017823,
        "dEQP-GLES3.functional.shaders.deriv",
        "ate.fwidth.uniform_loop.vec3_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017824,
        "dEQP-GLES3.functional.shaders.deri",
        "vate.fwidth.uniform_loop.vec3_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017825,
        "dEQP-GLES3.functional.shaders.deriv",
        "ate.fwidth.uniform_loop.vec4_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017826,
        "dEQP-GLES3.functional.shaders.deri",
        "vate.fwidth.uniform_loop.vec4_highp");
