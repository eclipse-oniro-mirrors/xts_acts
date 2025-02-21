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

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003522,
        "dEQP-GLES31.functional.shaders.opaque_type",
        "_indexing.sampler.uniform.vertex.sampler2d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003523,
        "dEQP-GLES31.functional.shaders.opaque_type_",
        "indexing.sampler.uniform.vertex.samplercube");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003524,
        "dEQP-GLES31.functional.shaders.opaque_type_i",
        "ndexing.sampler.uniform.vertex.sampler2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003525,
        "dEQP-GLES31.functional.shaders.opaque_type",
        "_indexing.sampler.uniform.vertex.sampler3d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003526,
        "dEQP-GLES31.functional.shaders.opaque_type_in",
        "dexing.sampler.uniform.vertex.sampler2dshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003527,
        "dEQP-GLES31.functional.shaders.opaque_type_ind",
        "exing.sampler.uniform.vertex.samplercubeshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003528,
        "dEQP-GLES31.functional.shaders.opaque_type_inde",
        "xing.sampler.uniform.vertex.sampler2darrayshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003529,
        "dEQP-GLES31.functional.shaders.opaque_type",
        "_indexing.sampler.uniform.vertex.isampler2d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003530,
        "dEQP-GLES31.functional.shaders.opaque_type_",
        "indexing.sampler.uniform.vertex.isamplercube");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003531,
        "dEQP-GLES31.functional.shaders.opaque_type_in",
        "dexing.sampler.uniform.vertex.isampler2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003532,
        "dEQP-GLES31.functional.shaders.opaque_type",
        "_indexing.sampler.uniform.vertex.isampler3d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003533,
        "dEQP-GLES31.functional.shaders.opaque_type",
        "_indexing.sampler.uniform.vertex.usampler2d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003534,
        "dEQP-GLES31.functional.shaders.opaque_type_",
        "indexing.sampler.uniform.vertex.usamplercube");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003535,
        "dEQP-GLES31.functional.shaders.opaque_type_in",
        "dexing.sampler.uniform.vertex.usampler2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003536,
        "dEQP-GLES31.functional.shaders.opaque_type",
        "_indexing.sampler.uniform.vertex.usampler3d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003537,
        "dEQP-GLES31.functional.shaders.opaque_type_in",
        "dexing.sampler.uniform.vertex.samplercubearray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003538,
        "dEQP-GLES31.functional.shaders.opaque_type_index",
        "ing.sampler.uniform.vertex.samplercubearrayshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003539,
        "dEQP-GLES31.functional.shaders.opaque_type_ind",
        "exing.sampler.uniform.vertex.isamplercubearray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003540,
        "dEQP-GLES31.functional.shaders.opaque_type_ind",
        "exing.sampler.uniform.vertex.usamplercubearray");
