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

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003712,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sam",
        "pler.dynamically_uniform.tessellation_control.sampler2d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003713,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.samp",
        "ler.dynamically_uniform.tessellation_control.samplercube");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003714,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sampl",
        "er.dynamically_uniform.tessellation_control.sampler2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003715,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sam",
        "pler.dynamically_uniform.tessellation_control.sampler3d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003716,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sample",
        "r.dynamically_uniform.tessellation_control.sampler2dshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003717,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sampler",
        ".dynamically_uniform.tessellation_control.samplercubeshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003718,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sampler.",
        "dynamically_uniform.tessellation_control.sampler2darrayshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003719,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sam",
        "pler.dynamically_uniform.tessellation_control.isampler2d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003720,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.samp",
        "ler.dynamically_uniform.tessellation_control.isamplercube");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003721,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sample",
        "r.dynamically_uniform.tessellation_control.isampler2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003722,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sam",
        "pler.dynamically_uniform.tessellation_control.isampler3d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003723,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sam",
        "pler.dynamically_uniform.tessellation_control.usampler2d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003724,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.samp",
        "ler.dynamically_uniform.tessellation_control.usamplercube");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003725,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sample",
        "r.dynamically_uniform.tessellation_control.usampler2darray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003726,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sam",
        "pler.dynamically_uniform.tessellation_control.usampler3d");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003727,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sample",
        "r.dynamically_uniform.tessellation_control.samplercubearray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003728,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sampler.d",
        "ynamically_uniform.tessellation_control.samplercubearrayshadow");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003729,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sampler",
        ".dynamically_uniform.tessellation_control.isamplercubearray");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003730,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.sampler",
        ".dynamically_uniform.tessellation_control.usamplercubearray");
