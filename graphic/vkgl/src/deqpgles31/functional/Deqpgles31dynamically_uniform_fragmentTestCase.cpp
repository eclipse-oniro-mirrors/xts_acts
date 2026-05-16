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

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003655,
        "dEQP-GLES31.functional.shaders.opaque_type_indexi",
        "ng.sampler.dynamically_uniform.fragment.sampler2d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003656,
        "dEQP-GLES31.functional.shaders.opaque_type_indexin",
        "g.sampler.dynamically_uniform.fragment.samplercube");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003657,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing",
        ".sampler.dynamically_uniform.fragment.sampler2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003658,
        "dEQP-GLES31.functional.shaders.opaque_type_indexi",
        "ng.sampler.dynamically_uniform.fragment.sampler3d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003659,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.",
        "sampler.dynamically_uniform.fragment.sampler2dshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003660,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.s",
        "ampler.dynamically_uniform.fragment.samplercubeshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003661,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sa",
        "mpler.dynamically_uniform.fragment.sampler2darrayshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003662,
        "dEQP-GLES31.functional.shaders.opaque_type_indexi",
        "ng.sampler.dynamically_uniform.fragment.isampler2d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003663,
        "dEQP-GLES31.functional.shaders.opaque_type_indexin",
        "g.sampler.dynamically_uniform.fragment.isamplercube");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003664,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.",
        "sampler.dynamically_uniform.fragment.isampler2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003665,
        "dEQP-GLES31.functional.shaders.opaque_type_indexi",
        "ng.sampler.dynamically_uniform.fragment.isampler3d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003666,
        "dEQP-GLES31.functional.shaders.opaque_type_indexi",
        "ng.sampler.dynamically_uniform.fragment.usampler2d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003667,
        "dEQP-GLES31.functional.shaders.opaque_type_indexin",
        "g.sampler.dynamically_uniform.fragment.usamplercube");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003668,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.",
        "sampler.dynamically_uniform.fragment.usampler2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003669,
        "dEQP-GLES31.functional.shaders.opaque_type_indexi",
        "ng.sampler.dynamically_uniform.fragment.usampler3d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003670,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.",
        "sampler.dynamically_uniform.fragment.samplercubearray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003671,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sam",
        "pler.dynamically_uniform.fragment.samplercubearrayshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003672,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.s",
        "ampler.dynamically_uniform.fragment.isamplercubearray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003673,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.s",
        "ampler.dynamically_uniform.fragment.usamplercubearray");
