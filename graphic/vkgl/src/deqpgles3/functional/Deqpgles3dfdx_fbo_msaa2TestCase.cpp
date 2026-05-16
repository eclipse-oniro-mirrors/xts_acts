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

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017481,
        "dEQP-GLES3.functional.shaders.der",
        "ivate.dfdx.fbo_msaa2.float_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017482,
        "dEQP-GLES3.functional.shaders.de",
        "rivate.dfdx.fbo_msaa2.float_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017483,
        "dEQP-GLES3.functional.shaders.der",
        "ivate.dfdx.fbo_msaa2.vec2_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017484,
        "dEQP-GLES3.functional.shaders.de",
        "rivate.dfdx.fbo_msaa2.vec2_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017485,
        "dEQP-GLES3.functional.shaders.der",
        "ivate.dfdx.fbo_msaa2.vec3_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017486,
        "dEQP-GLES3.functional.shaders.de",
        "rivate.dfdx.fbo_msaa2.vec3_highp");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017487,
        "dEQP-GLES3.functional.shaders.der",
        "ivate.dfdx.fbo_msaa2.vec4_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles30018TestSuite, TestCase_017488,
        "dEQP-GLES3.functional.shaders.de",
        "rivate.dfdx.fbo_msaa2.vec4_highp");
