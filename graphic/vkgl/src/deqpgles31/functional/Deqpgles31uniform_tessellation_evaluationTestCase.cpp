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

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003617,
        "dEQP-GLES31.functional.shaders.opaque_type_indexin",
        "g.sampler.uniform.tessellation_evaluation.sampler2d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003618,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing",
        ".sampler.uniform.tessellation_evaluation.samplercube");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003619,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.s",
        "ampler.uniform.tessellation_evaluation.sampler2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003620,
        "dEQP-GLES31.functional.shaders.opaque_type_indexin",
        "g.sampler.uniform.tessellation_evaluation.sampler3d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003621,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.s",
        "ampler.uniform.tessellation_evaluation.sampler2dshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003622,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sa",
        "mpler.uniform.tessellation_evaluation.samplercubeshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003623,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.samp",
        "ler.uniform.tessellation_evaluation.sampler2darrayshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003624,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing",
        ".sampler.uniform.tessellation_evaluation.isampler2d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003625,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.",
        "sampler.uniform.tessellation_evaluation.isamplercube");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003626,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.s",
        "ampler.uniform.tessellation_evaluation.isampler2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003627,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing",
        ".sampler.uniform.tessellation_evaluation.isampler3d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003628,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing",
        ".sampler.uniform.tessellation_evaluation.usampler2d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003629,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.",
        "sampler.uniform.tessellation_evaluation.usamplercube");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003630,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.s",
        "ampler.uniform.tessellation_evaluation.usampler2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003631,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing",
        ".sampler.uniform.tessellation_evaluation.usampler3d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003632,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sa",
        "mpler.uniform.tessellation_evaluation.samplercubearray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003633,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sampl",
        "er.uniform.tessellation_evaluation.samplercubearrayshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003634,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sa",
        "mpler.uniform.tessellation_evaluation.isamplercubearray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003635,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sa",
        "mpler.uniform.tessellation_evaluation.usamplercubearray");
