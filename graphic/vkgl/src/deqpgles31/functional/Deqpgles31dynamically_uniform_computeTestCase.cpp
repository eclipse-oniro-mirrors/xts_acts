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

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003674,
        "dEQP-GLES31.functional.shaders.opaque_type_index",
        "ing.sampler.dynamically_uniform.compute.sampler2d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003675,
        "dEQP-GLES31.functional.shaders.opaque_type_indexi",
        "ng.sampler.dynamically_uniform.compute.samplercube");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003676,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing",
        ".sampler.dynamically_uniform.compute.sampler2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003677,
        "dEQP-GLES31.functional.shaders.opaque_type_index",
        "ing.sampler.dynamically_uniform.compute.sampler3d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003678,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing",
        ".sampler.dynamically_uniform.compute.sampler2dshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003679,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.",
        "sampler.dynamically_uniform.compute.samplercubeshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003680,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sa",
        "mpler.dynamically_uniform.compute.sampler2darrayshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003681,
        "dEQP-GLES31.functional.shaders.opaque_type_indexi",
        "ng.sampler.dynamically_uniform.compute.isampler2d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003682,
        "dEQP-GLES31.functional.shaders.opaque_type_indexin",
        "g.sampler.dynamically_uniform.compute.isamplercube");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003683,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing",
        ".sampler.dynamically_uniform.compute.isampler2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003684,
        "dEQP-GLES31.functional.shaders.opaque_type_indexi",
        "ng.sampler.dynamically_uniform.compute.isampler3d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003685,
        "dEQP-GLES31.functional.shaders.opaque_type_indexi",
        "ng.sampler.dynamically_uniform.compute.usampler2d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003686,
        "dEQP-GLES31.functional.shaders.opaque_type_indexin",
        "g.sampler.dynamically_uniform.compute.usamplercube");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003687,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing",
        ".sampler.dynamically_uniform.compute.usampler2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003688,
        "dEQP-GLES31.functional.shaders.opaque_type_indexi",
        "ng.sampler.dynamically_uniform.compute.usampler3d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003689,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.",
        "sampler.dynamically_uniform.compute.samplercubearray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003690,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sam",
        "pler.dynamically_uniform.compute.samplercubearrayshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003691,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.",
        "sampler.dynamically_uniform.compute.isamplercubearray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003692,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.",
        "sampler.dynamically_uniform.compute.usamplercubearray");
