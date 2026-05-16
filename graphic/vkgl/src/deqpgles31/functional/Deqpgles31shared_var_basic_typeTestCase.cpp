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
#include "../ActsDeqpgles310008TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007551,
        "dEQP-GLES31.functional.compute.",
        "shared_var.basic_type.float_lowp");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007552,
        "dEQP-GLES31.functional.compute.sh",
        "ared_var.basic_type.float_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007553,
        "dEQP-GLES31.functional.compute.s",
        "hared_var.basic_type.float_highp");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007554,
        "dEQP-GLES31.functional.compute.",
        "shared_var.basic_type.vec2_lowp");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007555,
        "dEQP-GLES31.functional.compute.s",
        "hared_var.basic_type.vec2_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007556,
        "dEQP-GLES31.functional.compute.",
        "shared_var.basic_type.vec2_highp");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007557,
        "dEQP-GLES31.functional.compute.",
        "shared_var.basic_type.vec3_lowp");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007558,
        "dEQP-GLES31.functional.compute.s",
        "hared_var.basic_type.vec3_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007559,
        "dEQP-GLES31.functional.compute.",
        "shared_var.basic_type.vec3_highp");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007560,
        "dEQP-GLES31.functional.compute.",
        "shared_var.basic_type.vec4_lowp");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007561,
        "dEQP-GLES31.functional.compute.s",
        "hared_var.basic_type.vec4_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007562,
        "dEQP-GLES31.functional.compute.",
        "shared_var.basic_type.vec4_highp");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007563,
        "dEQP-GLES31.functional.compute.",
        "shared_var.basic_type.mat2_lowp");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007564,
        "dEQP-GLES31.functional.compute.s",
        "hared_var.basic_type.mat2_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007565,
        "dEQP-GLES31.functional.compute.",
        "shared_var.basic_type.mat2_highp");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007566,
        "dEQP-GLES31.functional.compute.s",
        "hared_var.basic_type.mat2x3_lowp");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007567,
        "dEQP-GLES31.functional.compute.sh",
        "ared_var.basic_type.mat2x3_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007568,
        "dEQP-GLES31.functional.compute.s",
        "hared_var.basic_type.mat2x3_highp");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007569,
        "dEQP-GLES31.functional.compute.s",
        "hared_var.basic_type.mat2x4_lowp");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007570,
        "dEQP-GLES31.functional.compute.sh",
        "ared_var.basic_type.mat2x4_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007571,
        "dEQP-GLES31.functional.compute.s",
        "hared_var.basic_type.mat2x4_highp");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007572,
        "dEQP-GLES31.functional.compute.s",
        "hared_var.basic_type.mat3x2_lowp");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007573,
        "dEQP-GLES31.functional.compute.sh",
        "ared_var.basic_type.mat3x2_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007574,
        "dEQP-GLES31.functional.compute.s",
        "hared_var.basic_type.mat3x2_highp");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007575,
        "dEQP-GLES31.functional.compute.",
        "shared_var.basic_type.mat3_lowp");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007576,
        "dEQP-GLES31.functional.compute.s",
        "hared_var.basic_type.mat3_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007577,
        "dEQP-GLES31.functional.compute.",
        "shared_var.basic_type.mat3_highp");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007578,
        "dEQP-GLES31.functional.compute.s",
        "hared_var.basic_type.mat3x4_lowp");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007579,
        "dEQP-GLES31.functional.compute.sh",
        "ared_var.basic_type.mat3x4_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007580,
        "dEQP-GLES31.functional.compute.s",
        "hared_var.basic_type.mat3x4_highp");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007581,
        "dEQP-GLES31.functional.compute.s",
        "hared_var.basic_type.mat4x2_lowp");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007582,
        "dEQP-GLES31.functional.compute.sh",
        "ared_var.basic_type.mat4x2_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007583,
        "dEQP-GLES31.functional.compute.s",
        "hared_var.basic_type.mat4x2_highp");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007584,
        "dEQP-GLES31.functional.compute.s",
        "hared_var.basic_type.mat4x3_lowp");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007585,
        "dEQP-GLES31.functional.compute.sh",
        "ared_var.basic_type.mat4x3_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007586,
        "dEQP-GLES31.functional.compute.s",
        "hared_var.basic_type.mat4x3_highp");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007587,
        "dEQP-GLES31.functional.compute.",
        "shared_var.basic_type.mat4_lowp");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007588,
        "dEQP-GLES31.functional.compute.s",
        "hared_var.basic_type.mat4_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007589,
        "dEQP-GLES31.functional.compute.",
        "shared_var.basic_type.mat4_highp");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007590,
        "dEQP-GLES31.functional.compute",
        ".shared_var.basic_type.int_lowp");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007591,
        "dEQP-GLES31.functional.compute.s",
        "hared_var.basic_type.int_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007592,
        "dEQP-GLES31.functional.compute.",
        "shared_var.basic_type.int_highp");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007593,
        "dEQP-GLES31.functional.compute.",
        "shared_var.basic_type.ivec2_lowp");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007594,
        "dEQP-GLES31.functional.compute.sh",
        "ared_var.basic_type.ivec2_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007595,
        "dEQP-GLES31.functional.compute.s",
        "hared_var.basic_type.ivec2_highp");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007596,
        "dEQP-GLES31.functional.compute.",
        "shared_var.basic_type.ivec3_lowp");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007597,
        "dEQP-GLES31.functional.compute.sh",
        "ared_var.basic_type.ivec3_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007598,
        "dEQP-GLES31.functional.compute.s",
        "hared_var.basic_type.ivec3_highp");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007599,
        "dEQP-GLES31.functional.compute.",
        "shared_var.basic_type.ivec4_lowp");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007600,
        "dEQP-GLES31.functional.compute.sh",
        "ared_var.basic_type.ivec4_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007601,
        "dEQP-GLES31.functional.compute.s",
        "hared_var.basic_type.ivec4_highp");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007602,
        "dEQP-GLES31.functional.compute.",
        "shared_var.basic_type.uint_lowp");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007603,
        "dEQP-GLES31.functional.compute.s",
        "hared_var.basic_type.uint_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007604,
        "dEQP-GLES31.functional.compute.",
        "shared_var.basic_type.uint_highp");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007605,
        "dEQP-GLES31.functional.compute.",
        "shared_var.basic_type.uvec2_lowp");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007606,
        "dEQP-GLES31.functional.compute.sh",
        "ared_var.basic_type.uvec2_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007607,
        "dEQP-GLES31.functional.compute.s",
        "hared_var.basic_type.uvec2_highp");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007608,
        "dEQP-GLES31.functional.compute.",
        "shared_var.basic_type.uvec3_lowp");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007609,
        "dEQP-GLES31.functional.compute.sh",
        "ared_var.basic_type.uvec3_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007610,
        "dEQP-GLES31.functional.compute.s",
        "hared_var.basic_type.uvec3_highp");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007611,
        "dEQP-GLES31.functional.compute.",
        "shared_var.basic_type.uvec4_lowp");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007612,
        "dEQP-GLES31.functional.compute.sh",
        "ared_var.basic_type.uvec4_mediump");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007613,
        "dEQP-GLES31.functional.compute.s",
        "hared_var.basic_type.uvec4_highp");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007614,
        "dEQP-GLES31.functional.compu",
        "te.shared_var.basic_type.bool");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007615,
        "dEQP-GLES31.functional.comput",
        "e.shared_var.basic_type.bvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007616,
        "dEQP-GLES31.functional.comput",
        "e.shared_var.basic_type.bvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007617,
        "dEQP-GLES31.functional.comput",
        "e.shared_var.basic_type.bvec4");
