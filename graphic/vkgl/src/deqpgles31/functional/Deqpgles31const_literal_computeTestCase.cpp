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
#include "../ActsDeqpgles310004TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003332,
        "dEQP-GLES31.functional.shaders.opaque_type_in",
        "dexing.sampler.const_literal.compute.sampler2d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003333,
        "dEQP-GLES31.functional.shaders.opaque_type_ind",
        "exing.sampler.const_literal.compute.samplercube");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003334,
        "dEQP-GLES31.functional.shaders.opaque_type_index",
        "ing.sampler.const_literal.compute.sampler2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003335,
        "dEQP-GLES31.functional.shaders.opaque_type_in",
        "dexing.sampler.const_literal.compute.sampler3d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003336,
        "dEQP-GLES31.functional.shaders.opaque_type_index",
        "ing.sampler.const_literal.compute.sampler2dshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003337,
        "dEQP-GLES31.functional.shaders.opaque_type_indexi",
        "ng.sampler.const_literal.compute.samplercubeshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003338,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing",
        ".sampler.const_literal.compute.sampler2darrayshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003339,
        "dEQP-GLES31.functional.shaders.opaque_type_ind",
        "exing.sampler.const_literal.compute.isampler2d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003340,
        "dEQP-GLES31.functional.shaders.opaque_type_inde",
        "xing.sampler.const_literal.compute.isamplercube");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003341,
        "dEQP-GLES31.functional.shaders.opaque_type_index",
        "ing.sampler.const_literal.compute.isampler2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003342,
        "dEQP-GLES31.functional.shaders.opaque_type_ind",
        "exing.sampler.const_literal.compute.isampler3d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003343,
        "dEQP-GLES31.functional.shaders.opaque_type_ind",
        "exing.sampler.const_literal.compute.usampler2d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003344,
        "dEQP-GLES31.functional.shaders.opaque_type_inde",
        "xing.sampler.const_literal.compute.usamplercube");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003345,
        "dEQP-GLES31.functional.shaders.opaque_type_index",
        "ing.sampler.const_literal.compute.usampler2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003346,
        "dEQP-GLES31.functional.shaders.opaque_type_ind",
        "exing.sampler.const_literal.compute.usampler3d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003347,
        "dEQP-GLES31.functional.shaders.opaque_type_indexi",
        "ng.sampler.const_literal.compute.samplercubearray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003348,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.",
        "sampler.const_literal.compute.samplercubearrayshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003349,
        "dEQP-GLES31.functional.shaders.opaque_type_indexi",
        "ng.sampler.const_literal.compute.isamplercubearray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003350,
        "dEQP-GLES31.functional.shaders.opaque_type_indexi",
        "ng.sampler.const_literal.compute.usamplercubearray");
