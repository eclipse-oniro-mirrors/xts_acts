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

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003598,
        "dEQP-GLES31.functional.shaders.opaque_type_indexi",
        "ng.sampler.uniform.tessellation_control.sampler2d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003599,
        "dEQP-GLES31.functional.shaders.opaque_type_indexin",
        "g.sampler.uniform.tessellation_control.samplercube");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003600,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing",
        ".sampler.uniform.tessellation_control.sampler2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003601,
        "dEQP-GLES31.functional.shaders.opaque_type_indexi",
        "ng.sampler.uniform.tessellation_control.sampler3d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003602,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.",
        "sampler.uniform.tessellation_control.sampler2dshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003603,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.s",
        "ampler.uniform.tessellation_control.samplercubeshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003604,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sa",
        "mpler.uniform.tessellation_control.sampler2darrayshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003605,
        "dEQP-GLES31.functional.shaders.opaque_type_indexi",
        "ng.sampler.uniform.tessellation_control.isampler2d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003606,
        "dEQP-GLES31.functional.shaders.opaque_type_indexin",
        "g.sampler.uniform.tessellation_control.isamplercube");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003607,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.",
        "sampler.uniform.tessellation_control.isampler2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003608,
        "dEQP-GLES31.functional.shaders.opaque_type_indexi",
        "ng.sampler.uniform.tessellation_control.isampler3d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003609,
        "dEQP-GLES31.functional.shaders.opaque_type_indexi",
        "ng.sampler.uniform.tessellation_control.usampler2d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003610,
        "dEQP-GLES31.functional.shaders.opaque_type_indexin",
        "g.sampler.uniform.tessellation_control.usamplercube");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003611,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.",
        "sampler.uniform.tessellation_control.usampler2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003612,
        "dEQP-GLES31.functional.shaders.opaque_type_indexi",
        "ng.sampler.uniform.tessellation_control.usampler3d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003613,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.",
        "sampler.uniform.tessellation_control.samplercubearray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003614,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sam",
        "pler.uniform.tessellation_control.samplercubearrayshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003615,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.s",
        "ampler.uniform.tessellation_control.isamplercubearray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003616,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.s",
        "ampler.uniform.tessellation_control.usamplercubearray");
