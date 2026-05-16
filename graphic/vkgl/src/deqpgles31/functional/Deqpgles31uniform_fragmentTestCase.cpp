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

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003541,
        "dEQP-GLES31.functional.shaders.opaque_type_",
        "indexing.sampler.uniform.fragment.sampler2d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003542,
        "dEQP-GLES31.functional.shaders.opaque_type_i",
        "ndexing.sampler.uniform.fragment.samplercube");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003543,
        "dEQP-GLES31.functional.shaders.opaque_type_in",
        "dexing.sampler.uniform.fragment.sampler2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003544,
        "dEQP-GLES31.functional.shaders.opaque_type_",
        "indexing.sampler.uniform.fragment.sampler3d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003545,
        "dEQP-GLES31.functional.shaders.opaque_type_ind",
        "exing.sampler.uniform.fragment.sampler2dshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003546,
        "dEQP-GLES31.functional.shaders.opaque_type_inde",
        "xing.sampler.uniform.fragment.samplercubeshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003547,
        "dEQP-GLES31.functional.shaders.opaque_type_index",
        "ing.sampler.uniform.fragment.sampler2darrayshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003548,
        "dEQP-GLES31.functional.shaders.opaque_type_",
        "indexing.sampler.uniform.fragment.isampler2d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003549,
        "dEQP-GLES31.functional.shaders.opaque_type_i",
        "ndexing.sampler.uniform.fragment.isamplercube");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003550,
        "dEQP-GLES31.functional.shaders.opaque_type_ind",
        "exing.sampler.uniform.fragment.isampler2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003551,
        "dEQP-GLES31.functional.shaders.opaque_type_",
        "indexing.sampler.uniform.fragment.isampler3d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003552,
        "dEQP-GLES31.functional.shaders.opaque_type_",
        "indexing.sampler.uniform.fragment.usampler2d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003553,
        "dEQP-GLES31.functional.shaders.opaque_type_i",
        "ndexing.sampler.uniform.fragment.usamplercube");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003554,
        "dEQP-GLES31.functional.shaders.opaque_type_ind",
        "exing.sampler.uniform.fragment.usampler2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003555,
        "dEQP-GLES31.functional.shaders.opaque_type_",
        "indexing.sampler.uniform.fragment.usampler3d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003556,
        "dEQP-GLES31.functional.shaders.opaque_type_ind",
        "exing.sampler.uniform.fragment.samplercubearray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003557,
        "dEQP-GLES31.functional.shaders.opaque_type_indexi",
        "ng.sampler.uniform.fragment.samplercubearrayshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003558,
        "dEQP-GLES31.functional.shaders.opaque_type_inde",
        "xing.sampler.uniform.fragment.isamplercubearray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003559,
        "dEQP-GLES31.functional.shaders.opaque_type_inde",
        "xing.sampler.uniform.fragment.usamplercubearray");
