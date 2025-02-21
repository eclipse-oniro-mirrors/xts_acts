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

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003294,
        "dEQP-GLES31.functional.shaders.opaque_type_in",
        "dexing.sampler.const_literal.vertex.sampler2d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003295,
        "dEQP-GLES31.functional.shaders.opaque_type_ind",
        "exing.sampler.const_literal.vertex.samplercube");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003296,
        "dEQP-GLES31.functional.shaders.opaque_type_inde",
        "xing.sampler.const_literal.vertex.sampler2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003297,
        "dEQP-GLES31.functional.shaders.opaque_type_in",
        "dexing.sampler.const_literal.vertex.sampler3d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003298,
        "dEQP-GLES31.functional.shaders.opaque_type_index",
        "ing.sampler.const_literal.vertex.sampler2dshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003299,
        "dEQP-GLES31.functional.shaders.opaque_type_indexi",
        "ng.sampler.const_literal.vertex.samplercubeshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003300,
        "dEQP-GLES31.functional.shaders.opaque_type_indexin",
        "g.sampler.const_literal.vertex.sampler2darrayshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003301,
        "dEQP-GLES31.functional.shaders.opaque_type_in",
        "dexing.sampler.const_literal.vertex.isampler2d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003302,
        "dEQP-GLES31.functional.shaders.opaque_type_ind",
        "exing.sampler.const_literal.vertex.isamplercube");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003303,
        "dEQP-GLES31.functional.shaders.opaque_type_index",
        "ing.sampler.const_literal.vertex.isampler2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003304,
        "dEQP-GLES31.functional.shaders.opaque_type_in",
        "dexing.sampler.const_literal.vertex.isampler3d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003305,
        "dEQP-GLES31.functional.shaders.opaque_type_in",
        "dexing.sampler.const_literal.vertex.usampler2d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003306,
        "dEQP-GLES31.functional.shaders.opaque_type_ind",
        "exing.sampler.const_literal.vertex.usamplercube");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003307,
        "dEQP-GLES31.functional.shaders.opaque_type_index",
        "ing.sampler.const_literal.vertex.usampler2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003308,
        "dEQP-GLES31.functional.shaders.opaque_type_in",
        "dexing.sampler.const_literal.vertex.usampler3d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003309,
        "dEQP-GLES31.functional.shaders.opaque_type_index",
        "ing.sampler.const_literal.vertex.samplercubearray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003310,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing",
        ".sampler.const_literal.vertex.samplercubearrayshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003311,
        "dEQP-GLES31.functional.shaders.opaque_type_indexi",
        "ng.sampler.const_literal.vertex.isamplercubearray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003312,
        "dEQP-GLES31.functional.shaders.opaque_type_indexi",
        "ng.sampler.const_literal.vertex.usamplercubearray");
