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

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003351,
        "dEQP-GLES31.functional.shaders.opaque_type_ind",
        "exing.sampler.const_literal.geometry.sampler2d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003352,
        "dEQP-GLES31.functional.shaders.opaque_type_inde",
        "xing.sampler.const_literal.geometry.samplercube");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003353,
        "dEQP-GLES31.functional.shaders.opaque_type_index",
        "ing.sampler.const_literal.geometry.sampler2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003354,
        "dEQP-GLES31.functional.shaders.opaque_type_ind",
        "exing.sampler.const_literal.geometry.sampler3d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003355,
        "dEQP-GLES31.functional.shaders.opaque_type_indexi",
        "ng.sampler.const_literal.geometry.sampler2dshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003356,
        "dEQP-GLES31.functional.shaders.opaque_type_indexin",
        "g.sampler.const_literal.geometry.samplercubeshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003357,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing",
        ".sampler.const_literal.geometry.sampler2darrayshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003358,
        "dEQP-GLES31.functional.shaders.opaque_type_ind",
        "exing.sampler.const_literal.geometry.isampler2d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003359,
        "dEQP-GLES31.functional.shaders.opaque_type_inde",
        "xing.sampler.const_literal.geometry.isamplercube");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003360,
        "dEQP-GLES31.functional.shaders.opaque_type_indexi",
        "ng.sampler.const_literal.geometry.isampler2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003361,
        "dEQP-GLES31.functional.shaders.opaque_type_ind",
        "exing.sampler.const_literal.geometry.isampler3d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003362,
        "dEQP-GLES31.functional.shaders.opaque_type_ind",
        "exing.sampler.const_literal.geometry.usampler2d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003363,
        "dEQP-GLES31.functional.shaders.opaque_type_inde",
        "xing.sampler.const_literal.geometry.usamplercube");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003364,
        "dEQP-GLES31.functional.shaders.opaque_type_indexi",
        "ng.sampler.const_literal.geometry.usampler2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003365,
        "dEQP-GLES31.functional.shaders.opaque_type_ind",
        "exing.sampler.const_literal.geometry.usampler3d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003366,
        "dEQP-GLES31.functional.shaders.opaque_type_indexi",
        "ng.sampler.const_literal.geometry.samplercubearray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003367,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.",
        "sampler.const_literal.geometry.samplercubearrayshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003368,
        "dEQP-GLES31.functional.shaders.opaque_type_indexin",
        "g.sampler.const_literal.geometry.isamplercubearray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003369,
        "dEQP-GLES31.functional.shaders.opaque_type_indexin",
        "g.sampler.const_literal.geometry.usamplercubearray");