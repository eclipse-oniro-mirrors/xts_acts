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
#include "../ActsDeqpgles30045TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044341,
        "dEQP-GLES3.functional.",
        "lifetime.delete.buffer");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044342,
        "dEQP-GLES3.functional.",
        "lifetime.delete.texture");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044343,
        "dEQP-GLES3.functional.lif",
        "etime.delete.renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044344,
        "dEQP-GLES3.functional.li",
        "fetime.delete.framebuffer");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044345,
        "dEQP-GLES3.functional.",
        "lifetime.delete.shader");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044346,
        "dEQP-GLES3.functional.",
        "lifetime.delete.program");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044347,
        "dEQP-GLES3.functional",
        ".lifetime.delete.query");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044348,
        "dEQP-GLES3.functional.lifeti",
        "me.delete.transform_feedback");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044349,
        "dEQP-GLES3.functional.lif",
        "etime.delete.vertex_array");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044350,
        "dEQP-GLES3.functional.",
        "lifetime.delete.sampler");
