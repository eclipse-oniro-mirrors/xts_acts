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

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003465,
        "dEQP-GLES31.functional.shaders.opaque_type_inde",
        "xing.sampler.const_expression.geometry.sampler2d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003466,
        "dEQP-GLES31.functional.shaders.opaque_type_index",
        "ing.sampler.const_expression.geometry.samplercube");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003467,
        "dEQP-GLES31.functional.shaders.opaque_type_indexin",
        "g.sampler.const_expression.geometry.sampler2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003468,
        "dEQP-GLES31.functional.shaders.opaque_type_inde",
        "xing.sampler.const_expression.geometry.sampler3d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003469,
        "dEQP-GLES31.functional.shaders.opaque_type_indexin",
        "g.sampler.const_expression.geometry.sampler2dshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003470,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing",
        ".sampler.const_expression.geometry.samplercubeshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003471,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.s",
        "ampler.const_expression.geometry.sampler2darrayshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003472,
        "dEQP-GLES31.functional.shaders.opaque_type_index",
        "ing.sampler.const_expression.geometry.isampler2d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003473,
        "dEQP-GLES31.functional.shaders.opaque_type_indexi",
        "ng.sampler.const_expression.geometry.isamplercube");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003474,
        "dEQP-GLES31.functional.shaders.opaque_type_indexin",
        "g.sampler.const_expression.geometry.isampler2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003475,
        "dEQP-GLES31.functional.shaders.opaque_type_index",
        "ing.sampler.const_expression.geometry.isampler3d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003476,
        "dEQP-GLES31.functional.shaders.opaque_type_index",
        "ing.sampler.const_expression.geometry.usampler2d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003477,
        "dEQP-GLES31.functional.shaders.opaque_type_indexi",
        "ng.sampler.const_expression.geometry.usamplercube");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003478,
        "dEQP-GLES31.functional.shaders.opaque_type_indexin",
        "g.sampler.const_expression.geometry.usampler2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003479,
        "dEQP-GLES31.functional.shaders.opaque_type_index",
        "ing.sampler.const_expression.geometry.usampler3d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003480,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing",
        ".sampler.const_expression.geometry.samplercubearray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003481,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sa",
        "mpler.const_expression.geometry.samplercubearrayshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003482,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing",
        ".sampler.const_expression.geometry.isamplercubearray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003483,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing",
        ".sampler.const_expression.geometry.usamplercubearray");
