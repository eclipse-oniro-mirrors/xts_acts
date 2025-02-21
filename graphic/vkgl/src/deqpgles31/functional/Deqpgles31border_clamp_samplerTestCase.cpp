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
#include "../Deqpgles31BaseFunc.h"
#include "../ActsDeqpgles310015TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014594,
        "dEQP-GLES31.functional.texture.",
        "border_clamp.sampler.unorm_color");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014595,
        "dEQP-GLES31.functional.texture.",
        "border_clamp.sampler.snorm_color");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014596,
        "dEQP-GLES31.functional.texture.",
        "border_clamp.sampler.float_color");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014597,
        "dEQP-GLES31.functional.texture",
        ".border_clamp.sampler.int_color");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014598,
        "dEQP-GLES31.functional.texture.",
        "border_clamp.sampler.uint_color");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014599,
        "dEQP-GLES31.functional.texture.",
        "border_clamp.sampler.unorm_depth");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014600,
        "dEQP-GLES31.functional.texture.",
        "border_clamp.sampler.float_depth");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014601,
        "dEQP-GLES31.functional.texture.b",
        "order_clamp.sampler.uint_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014602,
        "dEQP-GLES31.functional.texture.bor",
        "der_clamp.sampler.compressed_color");
