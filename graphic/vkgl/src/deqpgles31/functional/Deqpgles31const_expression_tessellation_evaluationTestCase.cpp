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

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003503,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sam",
        "pler.const_expression.tessellation_evaluation.sampler2d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003504,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.samp",
        "ler.const_expression.tessellation_evaluation.samplercube");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003505,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sampl",
        "er.const_expression.tessellation_evaluation.sampler2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003506,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sam",
        "pler.const_expression.tessellation_evaluation.sampler3d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003507,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sample",
        "r.const_expression.tessellation_evaluation.sampler2dshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003508,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sampler",
        ".const_expression.tessellation_evaluation.samplercubeshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003509,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sampler.",
        "const_expression.tessellation_evaluation.sampler2darrayshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003510,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sam",
        "pler.const_expression.tessellation_evaluation.isampler2d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003511,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.samp",
        "ler.const_expression.tessellation_evaluation.isamplercube");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003512,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sample",
        "r.const_expression.tessellation_evaluation.isampler2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003513,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sam",
        "pler.const_expression.tessellation_evaluation.isampler3d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003514,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sam",
        "pler.const_expression.tessellation_evaluation.usampler2d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003515,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.samp",
        "ler.const_expression.tessellation_evaluation.usamplercube");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003516,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sample",
        "r.const_expression.tessellation_evaluation.usampler2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003517,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sam",
        "pler.const_expression.tessellation_evaluation.usampler3d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003518,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sample",
        "r.const_expression.tessellation_evaluation.samplercubearray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003519,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sampler.c",
        "onst_expression.tessellation_evaluation.samplercubearrayshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003520,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sampler",
        ".const_expression.tessellation_evaluation.isamplercubearray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003521,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sampler",
        ".const_expression.tessellation_evaluation.usamplercubearray");
