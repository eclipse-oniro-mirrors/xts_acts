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

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003731,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.samp",
        "ler.dynamically_uniform.tessellation_evaluation.sampler2d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003732,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sampl",
        "er.dynamically_uniform.tessellation_evaluation.samplercube");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003733,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sampler",
        ".dynamically_uniform.tessellation_evaluation.sampler2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003734,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.samp",
        "ler.dynamically_uniform.tessellation_evaluation.sampler3d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003735,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sampler",
        ".dynamically_uniform.tessellation_evaluation.sampler2dshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003736,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sampler.",
        "dynamically_uniform.tessellation_evaluation.samplercubeshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003737,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sampler.dy",
        "namically_uniform.tessellation_evaluation.sampler2darrayshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003738,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sampl",
        "er.dynamically_uniform.tessellation_evaluation.isampler2d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003739,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sample",
        "r.dynamically_uniform.tessellation_evaluation.isamplercube");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003740,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sampler",
        ".dynamically_uniform.tessellation_evaluation.isampler2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003741,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sampl",
        "er.dynamically_uniform.tessellation_evaluation.isampler3d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003742,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sampl",
        "er.dynamically_uniform.tessellation_evaluation.usampler2d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003743,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sample",
        "r.dynamically_uniform.tessellation_evaluation.usamplercube");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003744,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sampler",
        ".dynamically_uniform.tessellation_evaluation.usampler2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003745,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sampl",
        "er.dynamically_uniform.tessellation_evaluation.usampler3d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003746,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sampler.",
        "dynamically_uniform.tessellation_evaluation.samplercubearray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003747,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sampler.dyn",
        "amically_uniform.tessellation_evaluation.samplercubearrayshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003748,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sampler.",
        "dynamically_uniform.tessellation_evaluation.isamplercubearray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003749,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sampler.",
        "dynamically_uniform.tessellation_evaluation.usamplercubearray");
