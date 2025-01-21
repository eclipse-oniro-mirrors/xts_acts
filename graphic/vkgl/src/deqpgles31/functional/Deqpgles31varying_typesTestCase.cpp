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

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004466,
        "dEQP-GLES31.functional.shaders.linka",
        "ge.es31.geometry.varying.types.float");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004467,
        "dEQP-GLES31.functional.shaders.link",
        "age.es31.geometry.varying.types.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004468,
        "dEQP-GLES31.functional.shaders.link",
        "age.es31.geometry.varying.types.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004469,
        "dEQP-GLES31.functional.shaders.link",
        "age.es31.geometry.varying.types.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004470,
        "dEQP-GLES31.functional.shaders.link",
        "age.es31.geometry.varying.types.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004471,
        "dEQP-GLES31.functional.shaders.linka",
        "ge.es31.geometry.varying.types.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004472,
        "dEQP-GLES31.functional.shaders.linka",
        "ge.es31.geometry.varying.types.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004473,
        "dEQP-GLES31.functional.shaders.linka",
        "ge.es31.geometry.varying.types.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004474,
        "dEQP-GLES31.functional.shaders.link",
        "age.es31.geometry.varying.types.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004475,
        "dEQP-GLES31.functional.shaders.linka",
        "ge.es31.geometry.varying.types.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004476,
        "dEQP-GLES31.functional.shaders.linka",
        "ge.es31.geometry.varying.types.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004477,
        "dEQP-GLES31.functional.shaders.linka",
        "ge.es31.geometry.varying.types.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004478,
        "dEQP-GLES31.functional.shaders.link",
        "age.es31.geometry.varying.types.mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004479,
        "dEQP-GLES31.functional.shaders.link",
        "age.es31.geometry.varying.types.int");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004480,
        "dEQP-GLES31.functional.shaders.linka",
        "ge.es31.geometry.varying.types.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004481,
        "dEQP-GLES31.functional.shaders.linka",
        "ge.es31.geometry.varying.types.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004482,
        "dEQP-GLES31.functional.shaders.linka",
        "ge.es31.geometry.varying.types.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004483,
        "dEQP-GLES31.functional.shaders.link",
        "age.es31.geometry.varying.types.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004484,
        "dEQP-GLES31.functional.shaders.linka",
        "ge.es31.geometry.varying.types.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004485,
        "dEQP-GLES31.functional.shaders.linka",
        "ge.es31.geometry.varying.types.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004486,
        "dEQP-GLES31.functional.shaders.linka",
        "ge.es31.geometry.varying.types.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004487,
        "dEQP-GLES31.functional.shaders.linkage.",
        "es31.geometry.varying.types.float_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004488,
        "dEQP-GLES31.functional.shaders.linkage.",
        "es31.geometry.varying.types.float_array");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004557,
        "dEQP-GLES31.functional.shaders.linkage",
        ".es31.tessellation.varying.types.float");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004558,
        "dEQP-GLES31.functional.shaders.linkag",
        "e.es31.tessellation.varying.types.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004559,
        "dEQP-GLES31.functional.shaders.linkag",
        "e.es31.tessellation.varying.types.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004560,
        "dEQP-GLES31.functional.shaders.linkag",
        "e.es31.tessellation.varying.types.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004561,
        "dEQP-GLES31.functional.shaders.linkag",
        "e.es31.tessellation.varying.types.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004562,
        "dEQP-GLES31.functional.shaders.linkage",
        ".es31.tessellation.varying.types.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004563,
        "dEQP-GLES31.functional.shaders.linkage",
        ".es31.tessellation.varying.types.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004564,
        "dEQP-GLES31.functional.shaders.linkage",
        ".es31.tessellation.varying.types.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004565,
        "dEQP-GLES31.functional.shaders.linkag",
        "e.es31.tessellation.varying.types.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004566,
        "dEQP-GLES31.functional.shaders.linkage",
        ".es31.tessellation.varying.types.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004567,
        "dEQP-GLES31.functional.shaders.linkage",
        ".es31.tessellation.varying.types.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004568,
        "dEQP-GLES31.functional.shaders.linkage",
        ".es31.tessellation.varying.types.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004569,
        "dEQP-GLES31.functional.shaders.linkag",
        "e.es31.tessellation.varying.types.mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004570,
        "dEQP-GLES31.functional.shaders.linkag",
        "e.es31.tessellation.varying.types.int");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004571,
        "dEQP-GLES31.functional.shaders.linkage",
        ".es31.tessellation.varying.types.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004572,
        "dEQP-GLES31.functional.shaders.linkage",
        ".es31.tessellation.varying.types.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004573,
        "dEQP-GLES31.functional.shaders.linkage",
        ".es31.tessellation.varying.types.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004574,
        "dEQP-GLES31.functional.shaders.linkag",
        "e.es31.tessellation.varying.types.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004575,
        "dEQP-GLES31.functional.shaders.linkage",
        ".es31.tessellation.varying.types.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004576,
        "dEQP-GLES31.functional.shaders.linkage",
        ".es31.tessellation.varying.types.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004577,
        "dEQP-GLES31.functional.shaders.linkage",
        ".es31.tessellation.varying.types.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004578,
        "dEQP-GLES31.functional.shaders.linkage.es",
        "31.tessellation.varying.types.float_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004579,
        "dEQP-GLES31.functional.shaders.linkage.es",
        "31.tessellation.varying.types.float_array");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004624,
        "dEQP-GLES31.functional.shaders.linkage.es3",
        "1.tessellation_geometry.varying.types.float");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004625,
        "dEQP-GLES31.functional.shaders.linkage.es3",
        "1.tessellation_geometry.varying.types.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004626,
        "dEQP-GLES31.functional.shaders.linkage.es3",
        "1.tessellation_geometry.varying.types.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004627,
        "dEQP-GLES31.functional.shaders.linkage.es3",
        "1.tessellation_geometry.varying.types.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004628,
        "dEQP-GLES31.functional.shaders.linkage.es3",
        "1.tessellation_geometry.varying.types.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004629,
        "dEQP-GLES31.functional.shaders.linkage.es31",
        ".tessellation_geometry.varying.types.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004630,
        "dEQP-GLES31.functional.shaders.linkage.es31",
        ".tessellation_geometry.varying.types.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004631,
        "dEQP-GLES31.functional.shaders.linkage.es31",
        ".tessellation_geometry.varying.types.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004632,
        "dEQP-GLES31.functional.shaders.linkage.es3",
        "1.tessellation_geometry.varying.types.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004633,
        "dEQP-GLES31.functional.shaders.linkage.es31",
        ".tessellation_geometry.varying.types.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004634,
        "dEQP-GLES31.functional.shaders.linkage.es31",
        ".tessellation_geometry.varying.types.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004635,
        "dEQP-GLES31.functional.shaders.linkage.es31",
        ".tessellation_geometry.varying.types.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004636,
        "dEQP-GLES31.functional.shaders.linkage.es3",
        "1.tessellation_geometry.varying.types.mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004637,
        "dEQP-GLES31.functional.shaders.linkage.es",
        "31.tessellation_geometry.varying.types.int");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004638,
        "dEQP-GLES31.functional.shaders.linkage.es3",
        "1.tessellation_geometry.varying.types.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004639,
        "dEQP-GLES31.functional.shaders.linkage.es3",
        "1.tessellation_geometry.varying.types.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004640,
        "dEQP-GLES31.functional.shaders.linkage.es3",
        "1.tessellation_geometry.varying.types.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004641,
        "dEQP-GLES31.functional.shaders.linkage.es3",
        "1.tessellation_geometry.varying.types.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004642,
        "dEQP-GLES31.functional.shaders.linkage.es3",
        "1.tessellation_geometry.varying.types.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004643,
        "dEQP-GLES31.functional.shaders.linkage.es3",
        "1.tessellation_geometry.varying.types.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004644,
        "dEQP-GLES31.functional.shaders.linkage.es3",
        "1.tessellation_geometry.varying.types.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004645,
        "dEQP-GLES31.functional.shaders.linkage.es31.te",
        "ssellation_geometry.varying.types.float_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004646,
        "dEQP-GLES31.functional.shaders.linkage.es31.t",
        "essellation_geometry.varying.types.float_array");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004737,
        "dEQP-GLES31.functional.shaders.linka",
        "ge.es32.geometry.varying.types.float");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004738,
        "dEQP-GLES31.functional.shaders.link",
        "age.es32.geometry.varying.types.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004739,
        "dEQP-GLES31.functional.shaders.link",
        "age.es32.geometry.varying.types.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004740,
        "dEQP-GLES31.functional.shaders.link",
        "age.es32.geometry.varying.types.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004741,
        "dEQP-GLES31.functional.shaders.link",
        "age.es32.geometry.varying.types.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004742,
        "dEQP-GLES31.functional.shaders.linka",
        "ge.es32.geometry.varying.types.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004743,
        "dEQP-GLES31.functional.shaders.linka",
        "ge.es32.geometry.varying.types.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004744,
        "dEQP-GLES31.functional.shaders.linka",
        "ge.es32.geometry.varying.types.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004745,
        "dEQP-GLES31.functional.shaders.link",
        "age.es32.geometry.varying.types.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004746,
        "dEQP-GLES31.functional.shaders.linka",
        "ge.es32.geometry.varying.types.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004747,
        "dEQP-GLES31.functional.shaders.linka",
        "ge.es32.geometry.varying.types.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004748,
        "dEQP-GLES31.functional.shaders.linka",
        "ge.es32.geometry.varying.types.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004749,
        "dEQP-GLES31.functional.shaders.link",
        "age.es32.geometry.varying.types.mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004750,
        "dEQP-GLES31.functional.shaders.link",
        "age.es32.geometry.varying.types.int");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004751,
        "dEQP-GLES31.functional.shaders.linka",
        "ge.es32.geometry.varying.types.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004752,
        "dEQP-GLES31.functional.shaders.linka",
        "ge.es32.geometry.varying.types.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004753,
        "dEQP-GLES31.functional.shaders.linka",
        "ge.es32.geometry.varying.types.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004754,
        "dEQP-GLES31.functional.shaders.link",
        "age.es32.geometry.varying.types.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004755,
        "dEQP-GLES31.functional.shaders.linka",
        "ge.es32.geometry.varying.types.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004756,
        "dEQP-GLES31.functional.shaders.linka",
        "ge.es32.geometry.varying.types.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004757,
        "dEQP-GLES31.functional.shaders.linka",
        "ge.es32.geometry.varying.types.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004758,
        "dEQP-GLES31.functional.shaders.linkage.",
        "es32.geometry.varying.types.float_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004759,
        "dEQP-GLES31.functional.shaders.linkage.",
        "es32.geometry.varying.types.float_array");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004823,
        "dEQP-GLES31.functional.shaders.linkage",
        ".es32.tessellation.varying.types.float");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004824,
        "dEQP-GLES31.functional.shaders.linkag",
        "e.es32.tessellation.varying.types.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004825,
        "dEQP-GLES31.functional.shaders.linkag",
        "e.es32.tessellation.varying.types.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004826,
        "dEQP-GLES31.functional.shaders.linkag",
        "e.es32.tessellation.varying.types.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004827,
        "dEQP-GLES31.functional.shaders.linkag",
        "e.es32.tessellation.varying.types.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004828,
        "dEQP-GLES31.functional.shaders.linkage",
        ".es32.tessellation.varying.types.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004829,
        "dEQP-GLES31.functional.shaders.linkage",
        ".es32.tessellation.varying.types.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004830,
        "dEQP-GLES31.functional.shaders.linkage",
        ".es32.tessellation.varying.types.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004831,
        "dEQP-GLES31.functional.shaders.linkag",
        "e.es32.tessellation.varying.types.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004832,
        "dEQP-GLES31.functional.shaders.linkage",
        ".es32.tessellation.varying.types.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004833,
        "dEQP-GLES31.functional.shaders.linkage",
        ".es32.tessellation.varying.types.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004834,
        "dEQP-GLES31.functional.shaders.linkage",
        ".es32.tessellation.varying.types.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004835,
        "dEQP-GLES31.functional.shaders.linkag",
        "e.es32.tessellation.varying.types.mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004836,
        "dEQP-GLES31.functional.shaders.linkag",
        "e.es32.tessellation.varying.types.int");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004837,
        "dEQP-GLES31.functional.shaders.linkage",
        ".es32.tessellation.varying.types.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004838,
        "dEQP-GLES31.functional.shaders.linkage",
        ".es32.tessellation.varying.types.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004839,
        "dEQP-GLES31.functional.shaders.linkage",
        ".es32.tessellation.varying.types.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004840,
        "dEQP-GLES31.functional.shaders.linkag",
        "e.es32.tessellation.varying.types.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004841,
        "dEQP-GLES31.functional.shaders.linkage",
        ".es32.tessellation.varying.types.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004842,
        "dEQP-GLES31.functional.shaders.linkage",
        ".es32.tessellation.varying.types.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004843,
        "dEQP-GLES31.functional.shaders.linkage",
        ".es32.tessellation.varying.types.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004844,
        "dEQP-GLES31.functional.shaders.linkage.es",
        "32.tessellation.varying.types.float_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004845,
        "dEQP-GLES31.functional.shaders.linkage.es",
        "32.tessellation.varying.types.float_array");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004884,
        "dEQP-GLES31.functional.shaders.linkage.es3",
        "2.tessellation_geometry.varying.types.float");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004885,
        "dEQP-GLES31.functional.shaders.linkage.es3",
        "2.tessellation_geometry.varying.types.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004886,
        "dEQP-GLES31.functional.shaders.linkage.es3",
        "2.tessellation_geometry.varying.types.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004887,
        "dEQP-GLES31.functional.shaders.linkage.es3",
        "2.tessellation_geometry.varying.types.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004888,
        "dEQP-GLES31.functional.shaders.linkage.es3",
        "2.tessellation_geometry.varying.types.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004889,
        "dEQP-GLES31.functional.shaders.linkage.es32",
        ".tessellation_geometry.varying.types.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004890,
        "dEQP-GLES31.functional.shaders.linkage.es32",
        ".tessellation_geometry.varying.types.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004891,
        "dEQP-GLES31.functional.shaders.linkage.es32",
        ".tessellation_geometry.varying.types.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004892,
        "dEQP-GLES31.functional.shaders.linkage.es3",
        "2.tessellation_geometry.varying.types.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004893,
        "dEQP-GLES31.functional.shaders.linkage.es32",
        ".tessellation_geometry.varying.types.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004894,
        "dEQP-GLES31.functional.shaders.linkage.es32",
        ".tessellation_geometry.varying.types.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004895,
        "dEQP-GLES31.functional.shaders.linkage.es32",
        ".tessellation_geometry.varying.types.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004896,
        "dEQP-GLES31.functional.shaders.linkage.es3",
        "2.tessellation_geometry.varying.types.mat4");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004897,
        "dEQP-GLES31.functional.shaders.linkage.es",
        "32.tessellation_geometry.varying.types.int");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004898,
        "dEQP-GLES31.functional.shaders.linkage.es3",
        "2.tessellation_geometry.varying.types.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004899,
        "dEQP-GLES31.functional.shaders.linkage.es3",
        "2.tessellation_geometry.varying.types.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004900,
        "dEQP-GLES31.functional.shaders.linkage.es3",
        "2.tessellation_geometry.varying.types.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004901,
        "dEQP-GLES31.functional.shaders.linkage.es3",
        "2.tessellation_geometry.varying.types.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004902,
        "dEQP-GLES31.functional.shaders.linkage.es3",
        "2.tessellation_geometry.varying.types.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004903,
        "dEQP-GLES31.functional.shaders.linkage.es3",
        "2.tessellation_geometry.varying.types.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004904,
        "dEQP-GLES31.functional.shaders.linkage.es3",
        "2.tessellation_geometry.varying.types.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004905,
        "dEQP-GLES31.functional.shaders.linkage.es32.te",
        "ssellation_geometry.varying.types.float_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004906,
        "dEQP-GLES31.functional.shaders.linkage.es32.t",
        "essellation_geometry.varying.types.float_array");
