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

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003427,
        "dEQP-GLES31.functional.shaders.opaque_type_inde",
        "xing.sampler.const_expression.fragment.sampler2d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003428,
        "dEQP-GLES31.functional.shaders.opaque_type_index",
        "ing.sampler.const_expression.fragment.samplercube");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003429,
        "dEQP-GLES31.functional.shaders.opaque_type_indexin",
        "g.sampler.const_expression.fragment.sampler2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003430,
        "dEQP-GLES31.functional.shaders.opaque_type_inde",
        "xing.sampler.const_expression.fragment.sampler3d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003431,
        "dEQP-GLES31.functional.shaders.opaque_type_indexin",
        "g.sampler.const_expression.fragment.sampler2dshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003432,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing",
        ".sampler.const_expression.fragment.samplercubeshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003433,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.s",
        "ampler.const_expression.fragment.sampler2darrayshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003434,
        "dEQP-GLES31.functional.shaders.opaque_type_index",
        "ing.sampler.const_expression.fragment.isampler2d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003435,
        "dEQP-GLES31.functional.shaders.opaque_type_indexi",
        "ng.sampler.const_expression.fragment.isamplercube");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003436,
        "dEQP-GLES31.functional.shaders.opaque_type_indexin",
        "g.sampler.const_expression.fragment.isampler2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003437,
        "dEQP-GLES31.functional.shaders.opaque_type_index",
        "ing.sampler.const_expression.fragment.isampler3d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003438,
        "dEQP-GLES31.functional.shaders.opaque_type_index",
        "ing.sampler.const_expression.fragment.usampler2d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003439,
        "dEQP-GLES31.functional.shaders.opaque_type_indexi",
        "ng.sampler.const_expression.fragment.usamplercube");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003440,
        "dEQP-GLES31.functional.shaders.opaque_type_indexin",
        "g.sampler.const_expression.fragment.usampler2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003441,
        "dEQP-GLES31.functional.shaders.opaque_type_index",
        "ing.sampler.const_expression.fragment.usampler3d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003442,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing",
        ".sampler.const_expression.fragment.samplercubearray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003443,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sa",
        "mpler.const_expression.fragment.samplercubearrayshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003444,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing",
        ".sampler.const_expression.fragment.isamplercubearray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003445,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing",
        ".sampler.const_expression.fragment.usamplercubearray");
