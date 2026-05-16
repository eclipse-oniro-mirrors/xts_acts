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

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004498,
        "dEQP-GLES31.functional.shaders.linka",
        "ge.es31.geometry.uniform.types.float");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004499,
        "dEQP-GLES31.functional.shaders.link",
        "age.es31.geometry.uniform.types.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004500,
        "dEQP-GLES31.functional.shaders.link",
        "age.es31.geometry.uniform.types.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004501,
        "dEQP-GLES31.functional.shaders.link",
        "age.es31.geometry.uniform.types.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004502,
        "dEQP-GLES31.functional.shaders.link",
        "age.es31.geometry.uniform.types.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004503,
        "dEQP-GLES31.functional.shaders.linka",
        "ge.es31.geometry.uniform.types.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004504,
        "dEQP-GLES31.functional.shaders.linka",
        "ge.es31.geometry.uniform.types.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004505,
        "dEQP-GLES31.functional.shaders.linka",
        "ge.es31.geometry.uniform.types.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004506,
        "dEQP-GLES31.functional.shaders.link",
        "age.es31.geometry.uniform.types.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004507,
        "dEQP-GLES31.functional.shaders.linka",
        "ge.es31.geometry.uniform.types.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004508,
        "dEQP-GLES31.functional.shaders.linka",
        "ge.es31.geometry.uniform.types.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004509,
        "dEQP-GLES31.functional.shaders.linka",
        "ge.es31.geometry.uniform.types.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004510,
        "dEQP-GLES31.functional.shaders.link",
        "age.es31.geometry.uniform.types.mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004511,
        "dEQP-GLES31.functional.shaders.link",
        "age.es31.geometry.uniform.types.int");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004512,
        "dEQP-GLES31.functional.shaders.linka",
        "ge.es31.geometry.uniform.types.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004513,
        "dEQP-GLES31.functional.shaders.linka",
        "ge.es31.geometry.uniform.types.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004514,
        "dEQP-GLES31.functional.shaders.linka",
        "ge.es31.geometry.uniform.types.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004515,
        "dEQP-GLES31.functional.shaders.link",
        "age.es31.geometry.uniform.types.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004516,
        "dEQP-GLES31.functional.shaders.linka",
        "ge.es31.geometry.uniform.types.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004517,
        "dEQP-GLES31.functional.shaders.linka",
        "ge.es31.geometry.uniform.types.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004518,
        "dEQP-GLES31.functional.shaders.linka",
        "ge.es31.geometry.uniform.types.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004519,
        "dEQP-GLES31.functional.shaders.linkage.",
        "es31.geometry.uniform.types.float_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004588,
        "dEQP-GLES31.functional.shaders.linkage",
        ".es31.tessellation.uniform.types.float");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004589,
        "dEQP-GLES31.functional.shaders.linkag",
        "e.es31.tessellation.uniform.types.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004590,
        "dEQP-GLES31.functional.shaders.linkag",
        "e.es31.tessellation.uniform.types.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004591,
        "dEQP-GLES31.functional.shaders.linkag",
        "e.es31.tessellation.uniform.types.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004592,
        "dEQP-GLES31.functional.shaders.linkag",
        "e.es31.tessellation.uniform.types.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004593,
        "dEQP-GLES31.functional.shaders.linkage",
        ".es31.tessellation.uniform.types.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004594,
        "dEQP-GLES31.functional.shaders.linkage",
        ".es31.tessellation.uniform.types.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004595,
        "dEQP-GLES31.functional.shaders.linkage",
        ".es31.tessellation.uniform.types.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004596,
        "dEQP-GLES31.functional.shaders.linkag",
        "e.es31.tessellation.uniform.types.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004597,
        "dEQP-GLES31.functional.shaders.linkage",
        ".es31.tessellation.uniform.types.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004598,
        "dEQP-GLES31.functional.shaders.linkage",
        ".es31.tessellation.uniform.types.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004599,
        "dEQP-GLES31.functional.shaders.linkage",
        ".es31.tessellation.uniform.types.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004600,
        "dEQP-GLES31.functional.shaders.linkag",
        "e.es31.tessellation.uniform.types.mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004601,
        "dEQP-GLES31.functional.shaders.linkag",
        "e.es31.tessellation.uniform.types.int");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004602,
        "dEQP-GLES31.functional.shaders.linkage",
        ".es31.tessellation.uniform.types.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004603,
        "dEQP-GLES31.functional.shaders.linkage",
        ".es31.tessellation.uniform.types.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004604,
        "dEQP-GLES31.functional.shaders.linkage",
        ".es31.tessellation.uniform.types.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004605,
        "dEQP-GLES31.functional.shaders.linkag",
        "e.es31.tessellation.uniform.types.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004606,
        "dEQP-GLES31.functional.shaders.linkage",
        ".es31.tessellation.uniform.types.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004607,
        "dEQP-GLES31.functional.shaders.linkage",
        ".es31.tessellation.uniform.types.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004608,
        "dEQP-GLES31.functional.shaders.linkage",
        ".es31.tessellation.uniform.types.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004609,
        "dEQP-GLES31.functional.shaders.linkage.es",
        "31.tessellation.uniform.types.float_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004769,
        "dEQP-GLES31.functional.shaders.linka",
        "ge.es32.geometry.uniform.types.float");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004770,
        "dEQP-GLES31.functional.shaders.link",
        "age.es32.geometry.uniform.types.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004771,
        "dEQP-GLES31.functional.shaders.link",
        "age.es32.geometry.uniform.types.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004772,
        "dEQP-GLES31.functional.shaders.link",
        "age.es32.geometry.uniform.types.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004773,
        "dEQP-GLES31.functional.shaders.link",
        "age.es32.geometry.uniform.types.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004774,
        "dEQP-GLES31.functional.shaders.linka",
        "ge.es32.geometry.uniform.types.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004775,
        "dEQP-GLES31.functional.shaders.linka",
        "ge.es32.geometry.uniform.types.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004776,
        "dEQP-GLES31.functional.shaders.linka",
        "ge.es32.geometry.uniform.types.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004777,
        "dEQP-GLES31.functional.shaders.link",
        "age.es32.geometry.uniform.types.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004778,
        "dEQP-GLES31.functional.shaders.linka",
        "ge.es32.geometry.uniform.types.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004779,
        "dEQP-GLES31.functional.shaders.linka",
        "ge.es32.geometry.uniform.types.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004780,
        "dEQP-GLES31.functional.shaders.linka",
        "ge.es32.geometry.uniform.types.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004781,
        "dEQP-GLES31.functional.shaders.link",
        "age.es32.geometry.uniform.types.mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004782,
        "dEQP-GLES31.functional.shaders.link",
        "age.es32.geometry.uniform.types.int");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004783,
        "dEQP-GLES31.functional.shaders.linka",
        "ge.es32.geometry.uniform.types.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004784,
        "dEQP-GLES31.functional.shaders.linka",
        "ge.es32.geometry.uniform.types.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004785,
        "dEQP-GLES31.functional.shaders.linka",
        "ge.es32.geometry.uniform.types.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004786,
        "dEQP-GLES31.functional.shaders.link",
        "age.es32.geometry.uniform.types.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004787,
        "dEQP-GLES31.functional.shaders.linka",
        "ge.es32.geometry.uniform.types.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004788,
        "dEQP-GLES31.functional.shaders.linka",
        "ge.es32.geometry.uniform.types.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004789,
        "dEQP-GLES31.functional.shaders.linka",
        "ge.es32.geometry.uniform.types.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004790,
        "dEQP-GLES31.functional.shaders.linkage.",
        "es32.geometry.uniform.types.float_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004854,
        "dEQP-GLES31.functional.shaders.linkage",
        ".es32.tessellation.uniform.types.float");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004855,
        "dEQP-GLES31.functional.shaders.linkag",
        "e.es32.tessellation.uniform.types.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004856,
        "dEQP-GLES31.functional.shaders.linkag",
        "e.es32.tessellation.uniform.types.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004857,
        "dEQP-GLES31.functional.shaders.linkag",
        "e.es32.tessellation.uniform.types.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004858,
        "dEQP-GLES31.functional.shaders.linkag",
        "e.es32.tessellation.uniform.types.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004859,
        "dEQP-GLES31.functional.shaders.linkage",
        ".es32.tessellation.uniform.types.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004860,
        "dEQP-GLES31.functional.shaders.linkage",
        ".es32.tessellation.uniform.types.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004861,
        "dEQP-GLES31.functional.shaders.linkage",
        ".es32.tessellation.uniform.types.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004862,
        "dEQP-GLES31.functional.shaders.linkag",
        "e.es32.tessellation.uniform.types.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004863,
        "dEQP-GLES31.functional.shaders.linkage",
        ".es32.tessellation.uniform.types.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004864,
        "dEQP-GLES31.functional.shaders.linkage",
        ".es32.tessellation.uniform.types.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004865,
        "dEQP-GLES31.functional.shaders.linkage",
        ".es32.tessellation.uniform.types.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004866,
        "dEQP-GLES31.functional.shaders.linkag",
        "e.es32.tessellation.uniform.types.mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004867,
        "dEQP-GLES31.functional.shaders.linkag",
        "e.es32.tessellation.uniform.types.int");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004868,
        "dEQP-GLES31.functional.shaders.linkage",
        ".es32.tessellation.uniform.types.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004869,
        "dEQP-GLES31.functional.shaders.linkage",
        ".es32.tessellation.uniform.types.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004870,
        "dEQP-GLES31.functional.shaders.linkage",
        ".es32.tessellation.uniform.types.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004871,
        "dEQP-GLES31.functional.shaders.linkag",
        "e.es32.tessellation.uniform.types.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004872,
        "dEQP-GLES31.functional.shaders.linkage",
        ".es32.tessellation.uniform.types.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004873,
        "dEQP-GLES31.functional.shaders.linkage",
        ".es32.tessellation.uniform.types.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004874,
        "dEQP-GLES31.functional.shaders.linkage",
        ".es32.tessellation.uniform.types.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004875,
        "dEQP-GLES31.functional.shaders.linkage.es",
        "32.tessellation.uniform.types.float_struct");
