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

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044351,
        "dEQP-GLES3.functional",
        ".lifetime.bind.buffer");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044352,
        "dEQP-GLES3.functional",
        ".lifetime.bind.texture");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044353,
        "dEQP-GLES3.functional.li",
        "fetime.bind.renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044354,
        "dEQP-GLES3.functional.l",
        "ifetime.bind.framebuffer");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044355,
        "dEQP-GLES3.functiona",
        "l.lifetime.bind.query");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044356,
        "dEQP-GLES3.functional.lifet",
        "ime.bind.transform_feedback");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044357,
        "dEQP-GLES3.functional.li",
        "fetime.bind.vertex_array");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044358,
        "dEQP-GLES3.functional",
        ".lifetime.bind.sampler");
