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

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003484,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.s",
        "ampler.const_expression.tessellation_control.sampler2d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003485,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sa",
        "mpler.const_expression.tessellation_control.samplercube");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003486,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.samp",
        "ler.const_expression.tessellation_control.sampler2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003487,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.s",
        "ampler.const_expression.tessellation_control.sampler3d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003488,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.samp",
        "ler.const_expression.tessellation_control.sampler2dshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003489,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sampl",
        "er.const_expression.tessellation_control.samplercubeshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003490,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sampler",
        ".const_expression.tessellation_control.sampler2darrayshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003491,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sa",
        "mpler.const_expression.tessellation_control.isampler2d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003492,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sam",
        "pler.const_expression.tessellation_control.isamplercube");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003493,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.samp",
        "ler.const_expression.tessellation_control.isampler2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003494,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sa",
        "mpler.const_expression.tessellation_control.isampler3d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003495,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sa",
        "mpler.const_expression.tessellation_control.usampler2d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003496,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sam",
        "pler.const_expression.tessellation_control.usamplercube");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003497,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.samp",
        "ler.const_expression.tessellation_control.usampler2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003498,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sa",
        "mpler.const_expression.tessellation_control.usampler3d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003499,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sampl",
        "er.const_expression.tessellation_control.samplercubearray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003500,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sampler.",
        "const_expression.tessellation_control.samplercubearrayshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003501,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sampl",
        "er.const_expression.tessellation_control.isamplercubearray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003502,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sampl",
        "er.const_expression.tessellation_control.usamplercubearray");
