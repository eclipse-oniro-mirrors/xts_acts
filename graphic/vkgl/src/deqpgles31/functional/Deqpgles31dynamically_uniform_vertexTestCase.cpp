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

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003636,
        "dEQP-GLES31.functional.shaders.opaque_type_index",
        "ing.sampler.dynamically_uniform.vertex.sampler2d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003637,
        "dEQP-GLES31.functional.shaders.opaque_type_indexi",
        "ng.sampler.dynamically_uniform.vertex.samplercube");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003638,
        "dEQP-GLES31.functional.shaders.opaque_type_indexin",
        "g.sampler.dynamically_uniform.vertex.sampler2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003639,
        "dEQP-GLES31.functional.shaders.opaque_type_index",
        "ing.sampler.dynamically_uniform.vertex.sampler3d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003640,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing",
        ".sampler.dynamically_uniform.vertex.sampler2dshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003641,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.",
        "sampler.dynamically_uniform.vertex.samplercubeshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003642,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.s",
        "ampler.dynamically_uniform.vertex.sampler2darrayshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003643,
        "dEQP-GLES31.functional.shaders.opaque_type_index",
        "ing.sampler.dynamically_uniform.vertex.isampler2d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003644,
        "dEQP-GLES31.functional.shaders.opaque_type_indexi",
        "ng.sampler.dynamically_uniform.vertex.isamplercube");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003645,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing",
        ".sampler.dynamically_uniform.vertex.isampler2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003646,
        "dEQP-GLES31.functional.shaders.opaque_type_index",
        "ing.sampler.dynamically_uniform.vertex.isampler3d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003647,
        "dEQP-GLES31.functional.shaders.opaque_type_index",
        "ing.sampler.dynamically_uniform.vertex.usampler2d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003648,
        "dEQP-GLES31.functional.shaders.opaque_type_indexi",
        "ng.sampler.dynamically_uniform.vertex.usamplercube");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003649,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing",
        ".sampler.dynamically_uniform.vertex.usampler2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003650,
        "dEQP-GLES31.functional.shaders.opaque_type_index",
        "ing.sampler.dynamically_uniform.vertex.usampler3d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003651,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing",
        ".sampler.dynamically_uniform.vertex.samplercubearray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003652,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sa",
        "mpler.dynamically_uniform.vertex.samplercubearrayshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003653,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.",
        "sampler.dynamically_uniform.vertex.isamplercubearray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003654,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.",
        "sampler.dynamically_uniform.vertex.usamplercubearray");
