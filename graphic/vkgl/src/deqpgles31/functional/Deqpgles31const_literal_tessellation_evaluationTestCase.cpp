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

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003389,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.s",
        "ampler.const_literal.tessellation_evaluation.sampler2d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003390,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sa",
        "mpler.const_literal.tessellation_evaluation.samplercube");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003391,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.samp",
        "ler.const_literal.tessellation_evaluation.sampler2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003392,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.s",
        "ampler.const_literal.tessellation_evaluation.sampler3d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003393,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.samp",
        "ler.const_literal.tessellation_evaluation.sampler2dshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003394,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sampl",
        "er.const_literal.tessellation_evaluation.samplercubeshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003395,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sampler",
        ".const_literal.tessellation_evaluation.sampler2darrayshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003396,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sa",
        "mpler.const_literal.tessellation_evaluation.isampler2d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003397,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sam",
        "pler.const_literal.tessellation_evaluation.isamplercube");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003398,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.samp",
        "ler.const_literal.tessellation_evaluation.isampler2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003399,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sa",
        "mpler.const_literal.tessellation_evaluation.isampler3d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003400,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sa",
        "mpler.const_literal.tessellation_evaluation.usampler2d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003401,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sam",
        "pler.const_literal.tessellation_evaluation.usamplercube");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003402,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.samp",
        "ler.const_literal.tessellation_evaluation.usampler2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003403,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sa",
        "mpler.const_literal.tessellation_evaluation.usampler3d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003404,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sampl",
        "er.const_literal.tessellation_evaluation.samplercubearray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003405,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sampler.",
        "const_literal.tessellation_evaluation.samplercubearrayshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003406,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sampl",
        "er.const_literal.tessellation_evaluation.isamplercubearray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003407,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sampl",
        "er.const_literal.tessellation_evaluation.usamplercubearray");
