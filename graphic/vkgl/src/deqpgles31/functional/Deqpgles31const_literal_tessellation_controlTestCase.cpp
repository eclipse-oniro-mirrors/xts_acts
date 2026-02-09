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

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003370,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.",
        "sampler.const_literal.tessellation_control.sampler2d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003371,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.s",
        "ampler.const_literal.tessellation_control.samplercube");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003372,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sa",
        "mpler.const_literal.tessellation_control.sampler2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003373,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.",
        "sampler.const_literal.tessellation_control.sampler3d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003374,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sam",
        "pler.const_literal.tessellation_control.sampler2dshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003375,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.samp",
        "ler.const_literal.tessellation_control.samplercubeshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003376,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sampl",
        "er.const_literal.tessellation_control.sampler2darrayshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003377,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.",
        "sampler.const_literal.tessellation_control.isampler2d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003378,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.s",
        "ampler.const_literal.tessellation_control.isamplercube");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003379,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sam",
        "pler.const_literal.tessellation_control.isampler2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003380,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.",
        "sampler.const_literal.tessellation_control.isampler3d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003381,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.",
        "sampler.const_literal.tessellation_control.usampler2d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003382,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.s",
        "ampler.const_literal.tessellation_control.usamplercube");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003383,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sam",
        "pler.const_literal.tessellation_control.usampler2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003384,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.",
        "sampler.const_literal.tessellation_control.usampler3d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003385,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sam",
        "pler.const_literal.tessellation_control.samplercubearray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003386,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sample",
        "r.const_literal.tessellation_control.samplercubearrayshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003387,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.samp",
        "ler.const_literal.tessellation_control.isamplercubearray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003388,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.samp",
        "ler.const_literal.tessellation_control.usamplercubearray");
