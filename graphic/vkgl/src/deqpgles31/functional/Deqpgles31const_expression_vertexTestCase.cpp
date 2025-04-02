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

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003408,
        "dEQP-GLES31.functional.shaders.opaque_type_ind",
        "exing.sampler.const_expression.vertex.sampler2d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003409,
        "dEQP-GLES31.functional.shaders.opaque_type_inde",
        "xing.sampler.const_expression.vertex.samplercube");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003410,
        "dEQP-GLES31.functional.shaders.opaque_type_indexi",
        "ng.sampler.const_expression.vertex.sampler2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003411,
        "dEQP-GLES31.functional.shaders.opaque_type_ind",
        "exing.sampler.const_expression.vertex.sampler3d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003412,
        "dEQP-GLES31.functional.shaders.opaque_type_indexi",
        "ng.sampler.const_expression.vertex.sampler2dshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003413,
        "dEQP-GLES31.functional.shaders.opaque_type_indexin",
        "g.sampler.const_expression.vertex.samplercubeshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003414,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.",
        "sampler.const_expression.vertex.sampler2darrayshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003415,
        "dEQP-GLES31.functional.shaders.opaque_type_inde",
        "xing.sampler.const_expression.vertex.isampler2d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003416,
        "dEQP-GLES31.functional.shaders.opaque_type_index",
        "ing.sampler.const_expression.vertex.isamplercube");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003417,
        "dEQP-GLES31.functional.shaders.opaque_type_indexi",
        "ng.sampler.const_expression.vertex.isampler2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003418,
        "dEQP-GLES31.functional.shaders.opaque_type_inde",
        "xing.sampler.const_expression.vertex.isampler3d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003419,
        "dEQP-GLES31.functional.shaders.opaque_type_inde",
        "xing.sampler.const_expression.vertex.usampler2d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003420,
        "dEQP-GLES31.functional.shaders.opaque_type_index",
        "ing.sampler.const_expression.vertex.usamplercube");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003421,
        "dEQP-GLES31.functional.shaders.opaque_type_indexi",
        "ng.sampler.const_expression.vertex.usampler2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003422,
        "dEQP-GLES31.functional.shaders.opaque_type_inde",
        "xing.sampler.const_expression.vertex.usampler3d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003423,
        "dEQP-GLES31.functional.shaders.opaque_type_indexin",
        "g.sampler.const_expression.vertex.samplercubearray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003424,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.s",
        "ampler.const_expression.vertex.samplercubearrayshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003425,
        "dEQP-GLES31.functional.shaders.opaque_type_indexin",
        "g.sampler.const_expression.vertex.isamplercubearray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003426,
        "dEQP-GLES31.functional.shaders.opaque_type_indexin",
        "g.sampler.const_expression.vertex.usamplercubearray");
