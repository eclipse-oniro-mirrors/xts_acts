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

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003579,
        "dEQP-GLES31.functional.shaders.opaque_type_",
        "indexing.sampler.uniform.geometry.sampler2d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003580,
        "dEQP-GLES31.functional.shaders.opaque_type_i",
        "ndexing.sampler.uniform.geometry.samplercube");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003581,
        "dEQP-GLES31.functional.shaders.opaque_type_in",
        "dexing.sampler.uniform.geometry.sampler2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003582,
        "dEQP-GLES31.functional.shaders.opaque_type_",
        "indexing.sampler.uniform.geometry.sampler3d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003583,
        "dEQP-GLES31.functional.shaders.opaque_type_ind",
        "exing.sampler.uniform.geometry.sampler2dshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003584,
        "dEQP-GLES31.functional.shaders.opaque_type_inde",
        "xing.sampler.uniform.geometry.samplercubeshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003585,
        "dEQP-GLES31.functional.shaders.opaque_type_index",
        "ing.sampler.uniform.geometry.sampler2darrayshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003586,
        "dEQP-GLES31.functional.shaders.opaque_type_",
        "indexing.sampler.uniform.geometry.isampler2d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003587,
        "dEQP-GLES31.functional.shaders.opaque_type_i",
        "ndexing.sampler.uniform.geometry.isamplercube");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003588,
        "dEQP-GLES31.functional.shaders.opaque_type_ind",
        "exing.sampler.uniform.geometry.isampler2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003589,
        "dEQP-GLES31.functional.shaders.opaque_type_",
        "indexing.sampler.uniform.geometry.isampler3d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003590,
        "dEQP-GLES31.functional.shaders.opaque_type_",
        "indexing.sampler.uniform.geometry.usampler2d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003591,
        "dEQP-GLES31.functional.shaders.opaque_type_i",
        "ndexing.sampler.uniform.geometry.usamplercube");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003592,
        "dEQP-GLES31.functional.shaders.opaque_type_ind",
        "exing.sampler.uniform.geometry.usampler2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003593,
        "dEQP-GLES31.functional.shaders.opaque_type_",
        "indexing.sampler.uniform.geometry.usampler3d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003594,
        "dEQP-GLES31.functional.shaders.opaque_type_ind",
        "exing.sampler.uniform.geometry.samplercubearray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003595,
        "dEQP-GLES31.functional.shaders.opaque_type_indexi",
        "ng.sampler.uniform.geometry.samplercubearrayshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003596,
        "dEQP-GLES31.functional.shaders.opaque_type_inde",
        "xing.sampler.uniform.geometry.isamplercubearray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003597,
        "dEQP-GLES31.functional.shaders.opaque_type_inde",
        "xing.sampler.uniform.geometry.usamplercubearray");
