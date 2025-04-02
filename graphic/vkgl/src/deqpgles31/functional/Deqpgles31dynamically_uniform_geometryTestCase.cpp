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

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003693,
        "dEQP-GLES31.functional.shaders.opaque_type_indexi",
        "ng.sampler.dynamically_uniform.geometry.sampler2d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003694,
        "dEQP-GLES31.functional.shaders.opaque_type_indexin",
        "g.sampler.dynamically_uniform.geometry.samplercube");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003695,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing",
        ".sampler.dynamically_uniform.geometry.sampler2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003696,
        "dEQP-GLES31.functional.shaders.opaque_type_indexi",
        "ng.sampler.dynamically_uniform.geometry.sampler3d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003697,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.",
        "sampler.dynamically_uniform.geometry.sampler2dshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003698,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.s",
        "ampler.dynamically_uniform.geometry.samplercubeshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003699,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sa",
        "mpler.dynamically_uniform.geometry.sampler2darrayshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003700,
        "dEQP-GLES31.functional.shaders.opaque_type_indexi",
        "ng.sampler.dynamically_uniform.geometry.isampler2d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003701,
        "dEQP-GLES31.functional.shaders.opaque_type_indexin",
        "g.sampler.dynamically_uniform.geometry.isamplercube");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003702,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.",
        "sampler.dynamically_uniform.geometry.isampler2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003703,
        "dEQP-GLES31.functional.shaders.opaque_type_indexi",
        "ng.sampler.dynamically_uniform.geometry.isampler3d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003704,
        "dEQP-GLES31.functional.shaders.opaque_type_indexi",
        "ng.sampler.dynamically_uniform.geometry.usampler2d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003705,
        "dEQP-GLES31.functional.shaders.opaque_type_indexin",
        "g.sampler.dynamically_uniform.geometry.usamplercube");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003706,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.",
        "sampler.dynamically_uniform.geometry.usampler2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003707,
        "dEQP-GLES31.functional.shaders.opaque_type_indexi",
        "ng.sampler.dynamically_uniform.geometry.usampler3d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003708,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.",
        "sampler.dynamically_uniform.geometry.samplercubearray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003709,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sam",
        "pler.dynamically_uniform.geometry.samplercubearrayshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003710,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.s",
        "ampler.dynamically_uniform.geometry.isamplercubearray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003711,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.s",
        "ampler.dynamically_uniform.geometry.usamplercubearray");
