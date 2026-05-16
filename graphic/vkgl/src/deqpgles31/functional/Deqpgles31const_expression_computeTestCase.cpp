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

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003446,
        "dEQP-GLES31.functional.shaders.opaque_type_inde",
        "xing.sampler.const_expression.compute.sampler2d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003447,
        "dEQP-GLES31.functional.shaders.opaque_type_index",
        "ing.sampler.const_expression.compute.samplercube");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003448,
        "dEQP-GLES31.functional.shaders.opaque_type_indexi",
        "ng.sampler.const_expression.compute.sampler2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003449,
        "dEQP-GLES31.functional.shaders.opaque_type_inde",
        "xing.sampler.const_expression.compute.sampler3d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003450,
        "dEQP-GLES31.functional.shaders.opaque_type_indexin",
        "g.sampler.const_expression.compute.sampler2dshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003451,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing",
        ".sampler.const_expression.compute.samplercubeshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003452,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.",
        "sampler.const_expression.compute.sampler2darrayshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003453,
        "dEQP-GLES31.functional.shaders.opaque_type_inde",
        "xing.sampler.const_expression.compute.isampler2d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003454,
        "dEQP-GLES31.functional.shaders.opaque_type_index",
        "ing.sampler.const_expression.compute.isamplercube");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003455,
        "dEQP-GLES31.functional.shaders.opaque_type_indexin",
        "g.sampler.const_expression.compute.isampler2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003456,
        "dEQP-GLES31.functional.shaders.opaque_type_inde",
        "xing.sampler.const_expression.compute.isampler3d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003457,
        "dEQP-GLES31.functional.shaders.opaque_type_inde",
        "xing.sampler.const_expression.compute.usampler2d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003458,
        "dEQP-GLES31.functional.shaders.opaque_type_index",
        "ing.sampler.const_expression.compute.usamplercube");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003459,
        "dEQP-GLES31.functional.shaders.opaque_type_indexin",
        "g.sampler.const_expression.compute.usampler2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003460,
        "dEQP-GLES31.functional.shaders.opaque_type_inde",
        "xing.sampler.const_expression.compute.usampler3d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003461,
        "dEQP-GLES31.functional.shaders.opaque_type_indexin",
        "g.sampler.const_expression.compute.samplercubearray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003462,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.s",
        "ampler.const_expression.compute.samplercubearrayshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003463,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing",
        ".sampler.const_expression.compute.isamplercubearray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003464,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing",
        ".sampler.const_expression.compute.usamplercubearray");
