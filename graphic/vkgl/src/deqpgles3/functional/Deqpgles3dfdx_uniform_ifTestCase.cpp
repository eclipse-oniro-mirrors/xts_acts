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

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017453,
        "dEQP-GLES3.functional.shaders.deri",
        "vate.dfdx.uniform_if.float_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017454,
        "dEQP-GLES3.functional.shaders.der",
        "ivate.dfdx.uniform_if.float_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017455,
        "dEQP-GLES3.functional.shaders.der",
        "ivate.dfdx.uniform_if.vec2_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017456,
        "dEQP-GLES3.functional.shaders.de",
        "rivate.dfdx.uniform_if.vec2_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017457,
        "dEQP-GLES3.functional.shaders.der",
        "ivate.dfdx.uniform_if.vec3_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017458,
        "dEQP-GLES3.functional.shaders.de",
        "rivate.dfdx.uniform_if.vec3_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017459,
        "dEQP-GLES3.functional.shaders.de",
        "rivate.dfdx.uniform_if.vec4_highp");
