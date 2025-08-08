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
#include "../ActsDeqpgles310005TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004414,
        "dEQP-GLES31.functional.shaders.linkage.es31.declarations",
        ".unspecified_precision.float_partially_specified_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004415,
        "dEQP-GLES31.functional.shaders.linkage.es31.de",
        "clarations.unspecified_precision.float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004416,
        "dEQP-GLES31.functional.shaders.linkage.es31.de",
        "clarations.unspecified_precision.vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004417,
        "dEQP-GLES31.functional.shaders.linkage.es31.de",
        "clarations.unspecified_precision.vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004418,
        "dEQP-GLES31.functional.shaders.linkage.es31.de",
        "clarations.unspecified_precision.vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004419,
        "dEQP-GLES31.functional.shaders.linkage.es31.dec",
        "larations.unspecified_precision.sampler3D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004420,
        "dEQP-GLES31.functional.shaders.linkage.es31.decl",
        "arations.unspecified_precision.sampler3D_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004421,
        "dEQP-GLES31.functional.shaders.linkage.es31.declara",
        "tions.unspecified_precision.samplerCubeShadow_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004422,
        "dEQP-GLES31.functional.shaders.linkage.es31.declarat",
        "ions.unspecified_precision.samplerCubeShadow_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004423,
        "dEQP-GLES31.functional.shaders.linkage.es31.declar",
        "ations.unspecified_precision.sampler2DShadow_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004424,
        "dEQP-GLES31.functional.shaders.linkage.es31.declara",
        "tions.unspecified_precision.sampler2DShadow_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004425,
        "dEQP-GLES31.functional.shaders.linkage.es31.declar",
        "ations.unspecified_precision.sampler2DArray_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004426,
        "dEQP-GLES31.functional.shaders.linkage.es31.declara",
        "tions.unspecified_precision.sampler2DArray_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004427,
        "dEQP-GLES31.functional.shaders.linkage.es31.declarati",
        "ons.unspecified_precision.sampler2DArrayShadow_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004428,
        "dEQP-GLES31.functional.shaders.linkage.es31.declaratio",
        "ns.unspecified_precision.sampler2DArrayShadow_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004429,
        "dEQP-GLES31.functional.shaders.linkage.es31.decl",
        "arations.unspecified_precision.isampler2D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004430,
        "dEQP-GLES31.functional.shaders.linkage.es31.decla",
        "rations.unspecified_precision.isampler2D_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004431,
        "dEQP-GLES31.functional.shaders.linkage.es31.decl",
        "arations.unspecified_precision.isampler3D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004432,
        "dEQP-GLES31.functional.shaders.linkage.es31.decla",
        "rations.unspecified_precision.isampler3D_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004433,
        "dEQP-GLES31.functional.shaders.linkage.es31.decla",
        "rations.unspecified_precision.isamplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004434,
        "dEQP-GLES31.functional.shaders.linkage.es31.declar",
        "ations.unspecified_precision.isamplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004435,
        "dEQP-GLES31.functional.shaders.linkage.es31.declar",
        "ations.unspecified_precision.isampler2DArray_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004436,
        "dEQP-GLES31.functional.shaders.linkage.es31.declara",
        "tions.unspecified_precision.isampler2DArray_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004437,
        "dEQP-GLES31.functional.shaders.linkage.es31.decl",
        "arations.unspecified_precision.usampler2D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004438,
        "dEQP-GLES31.functional.shaders.linkage.es31.decla",
        "rations.unspecified_precision.usampler2D_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004439,
        "dEQP-GLES31.functional.shaders.linkage.es31.decl",
        "arations.unspecified_precision.usampler3D_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004440,
        "dEQP-GLES31.functional.shaders.linkage.es31.decla",
        "rations.unspecified_precision.usampler3D_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004441,
        "dEQP-GLES31.functional.shaders.linkage.es31.decla",
        "rations.unspecified_precision.usamplerCube_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004442,
        "dEQP-GLES31.functional.shaders.linkage.es31.declar",
        "ations.unspecified_precision.usamplerCube_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004443,
        "dEQP-GLES31.functional.shaders.linkage.es31.declar",
        "ations.unspecified_precision.usampler2DArray_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004444,
        "dEQP-GLES31.functional.shaders.linkage.es31.declara",
        "tions.unspecified_precision.usampler2DArray_fragment");
