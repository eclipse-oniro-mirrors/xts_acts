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

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044359,
        "dEQP-GLES3.functional.lif",
        "etime.delete_bound.buffer");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044360,
        "dEQP-GLES3.functional.lif",
        "etime.delete_bound.texture");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044361,
        "dEQP-GLES3.functional.lifeti",
        "me.delete_bound.renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044362,
        "dEQP-GLES3.functional.lifet",
        "ime.delete_bound.framebuffer");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044363,
        "dEQP-GLES3.functional.li",
        "fetime.delete_bound.query");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044364,
        "dEQP-GLES3.functional.lifetime.",
        "delete_bound.transform_feedback");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044365,
        "dEQP-GLES3.functional.lifeti",
        "me.delete_bound.vertex_array");

static SHRINK_HWTEST_F(ActsDeqpgles30045TestSuite, TestCase_044366,
        "dEQP-GLES3.functional.lif",
        "etime.delete_bound.sampler");
