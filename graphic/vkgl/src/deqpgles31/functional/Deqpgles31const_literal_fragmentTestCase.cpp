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

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003313,
        "dEQP-GLES31.functional.shaders.opaque_type_ind",
        "exing.sampler.const_literal.fragment.sampler2d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003314,
        "dEQP-GLES31.functional.shaders.opaque_type_inde",
        "xing.sampler.const_literal.fragment.samplercube");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003315,
        "dEQP-GLES31.functional.shaders.opaque_type_index",
        "ing.sampler.const_literal.fragment.sampler2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003316,
        "dEQP-GLES31.functional.shaders.opaque_type_ind",
        "exing.sampler.const_literal.fragment.sampler3d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003317,
        "dEQP-GLES31.functional.shaders.opaque_type_indexi",
        "ng.sampler.const_literal.fragment.sampler2dshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003318,
        "dEQP-GLES31.functional.shaders.opaque_type_indexin",
        "g.sampler.const_literal.fragment.samplercubeshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003319,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing",
        ".sampler.const_literal.fragment.sampler2darrayshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003320,
        "dEQP-GLES31.functional.shaders.opaque_type_ind",
        "exing.sampler.const_literal.fragment.isampler2d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003321,
        "dEQP-GLES31.functional.shaders.opaque_type_inde",
        "xing.sampler.const_literal.fragment.isamplercube");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003322,
        "dEQP-GLES31.functional.shaders.opaque_type_indexi",
        "ng.sampler.const_literal.fragment.isampler2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003323,
        "dEQP-GLES31.functional.shaders.opaque_type_ind",
        "exing.sampler.const_literal.fragment.isampler3d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003324,
        "dEQP-GLES31.functional.shaders.opaque_type_ind",
        "exing.sampler.const_literal.fragment.usampler2d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003325,
        "dEQP-GLES31.functional.shaders.opaque_type_inde",
        "xing.sampler.const_literal.fragment.usamplercube");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003326,
        "dEQP-GLES31.functional.shaders.opaque_type_indexi",
        "ng.sampler.const_literal.fragment.usampler2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003327,
        "dEQP-GLES31.functional.shaders.opaque_type_ind",
        "exing.sampler.const_literal.fragment.usampler3d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003328,
        "dEQP-GLES31.functional.shaders.opaque_type_indexi",
        "ng.sampler.const_literal.fragment.samplercubearray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003329,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.",
        "sampler.const_literal.fragment.samplercubearrayshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003330,
        "dEQP-GLES31.functional.shaders.opaque_type_indexin",
        "g.sampler.const_literal.fragment.isamplercubearray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003331,
        "dEQP-GLES31.functional.shaders.opaque_type_indexin",
        "g.sampler.const_literal.fragment.usamplercubearray");
