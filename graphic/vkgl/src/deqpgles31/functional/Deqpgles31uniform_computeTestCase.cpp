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

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003560,
        "dEQP-GLES31.functional.shaders.opaque_type",
        "_indexing.sampler.uniform.compute.sampler2d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003561,
        "dEQP-GLES31.functional.shaders.opaque_type_",
        "indexing.sampler.uniform.compute.samplercube");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003562,
        "dEQP-GLES31.functional.shaders.opaque_type_in",
        "dexing.sampler.uniform.compute.sampler2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003563,
        "dEQP-GLES31.functional.shaders.opaque_type",
        "_indexing.sampler.uniform.compute.sampler3d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003564,
        "dEQP-GLES31.functional.shaders.opaque_type_in",
        "dexing.sampler.uniform.compute.sampler2dshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003565,
        "dEQP-GLES31.functional.shaders.opaque_type_ind",
        "exing.sampler.uniform.compute.samplercubeshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003566,
        "dEQP-GLES31.functional.shaders.opaque_type_index",
        "ing.sampler.uniform.compute.sampler2darrayshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003567,
        "dEQP-GLES31.functional.shaders.opaque_type_",
        "indexing.sampler.uniform.compute.isampler2d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003568,
        "dEQP-GLES31.functional.shaders.opaque_type_i",
        "ndexing.sampler.uniform.compute.isamplercube");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003569,
        "dEQP-GLES31.functional.shaders.opaque_type_in",
        "dexing.sampler.uniform.compute.isampler2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003570,
        "dEQP-GLES31.functional.shaders.opaque_type_",
        "indexing.sampler.uniform.compute.isampler3d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003571,
        "dEQP-GLES31.functional.shaders.opaque_type_",
        "indexing.sampler.uniform.compute.usampler2d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003572,
        "dEQP-GLES31.functional.shaders.opaque_type_i",
        "ndexing.sampler.uniform.compute.usamplercube");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003573,
        "dEQP-GLES31.functional.shaders.opaque_type_in",
        "dexing.sampler.uniform.compute.usampler2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003574,
        "dEQP-GLES31.functional.shaders.opaque_type_",
        "indexing.sampler.uniform.compute.usampler3d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003575,
        "dEQP-GLES31.functional.shaders.opaque_type_ind",
        "exing.sampler.uniform.compute.samplercubearray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003576,
        "dEQP-GLES31.functional.shaders.opaque_type_indexi",
        "ng.sampler.uniform.compute.samplercubearrayshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003577,
        "dEQP-GLES31.functional.shaders.opaque_type_ind",
        "exing.sampler.uniform.compute.isamplercubearray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003578,
        "dEQP-GLES31.functional.shaders.opaque_type_ind",
        "exing.sampler.uniform.compute.usamplercubearray");
