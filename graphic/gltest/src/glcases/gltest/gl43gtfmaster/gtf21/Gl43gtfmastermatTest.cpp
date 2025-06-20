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
#include "../Gl43gtfmasterBaseFunc.h"
#include "../ActsGl43gtfmaster0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000558,
    "GTF-GL43.gtf21.GL.mat.const_mat2_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000559,
    "GTF-GL43.gtf21.GL.mat.const_mat2_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000560,
    "GTF-GL43.gtf21.GL.mat.const_mat3_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000561,
    "GTF-GL43.gtf21.GL.mat.const_mat3_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000562,
    "GTF-GL43.gtf21.GL.mat.const_mat4_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000563,
    "GTF-GL43.gtf21.GL.mat.const_mat4_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000564,
    "GTF-GL43.gtf21.GL.mat.const_mat2_copy_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000565,
    "GTF-GL43.gtf21.GL.mat.const_mat2_copy_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000566,
    "GTF-GL43.gtf21.GL.mat.const_mat3_copy_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000567,
    "GTF-GL43.gtf21.GL.mat.const_mat3_copy_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000568,
    "GTF-GL43.gtf21.GL.mat.const_mat4_copy_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000569,
    "GTF-GL43.gtf21.GL.mat.const_mat4_copy_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000570,
    "GTF-GL43.gtf21.GL.mat.mat2_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000571,
    "GTF-GL43.gtf21.GL.mat.mat2_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000572,
    "GTF-GL43.gtf21.GL.mat.mat3_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000573,
    "GTF-GL43.gtf21.GL.mat.mat3_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000574,
    "GTF-GL43.gtf21.GL.mat.mat4_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000575,
    "GTF-GL43.gtf21.GL.mat.mat4_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000576,
    "GTF-GL43.gtf21.GL.mat.mat2_copy_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000577,
    "GTF-GL43.gtf21.GL.mat.mat2_copy_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000578,
    "GTF-GL43.gtf21.GL.mat.mat3_copy_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000579,
    "GTF-GL43.gtf21.GL.mat.mat3_copy_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000580,
    "GTF-GL43.gtf21.GL.mat.mat4_copy_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000581,
    "GTF-GL43.gtf21.GL.mat.mat4_copy_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000582,
    "GTF-GL43.gtf21.GL.mat.mat2_float_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000583,
    "GTF-GL43.gtf21.GL.mat.mat2_float_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000584,
    "GTF-GL43.gtf21.GL.mat.mat2_4float_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000585,
    "GTF-GL43.gtf21.GL.mat.mat2_4float_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000586,
    "GTF-GL43.gtf21.GL.mat.mat2_2vec2_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000587,
    "GTF-GL43.gtf21.GL.mat.mat2_2vec2_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000588,
    "GTF-GL43.gtf21.GL.mat.mat3_float_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000589,
    "GTF-GL43.gtf21.GL.mat.mat3_float_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000590,
    "GTF-GL43.gtf21.GL.mat.mat3_9float_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000591,
    "GTF-GL43.gtf21.GL.mat.mat3_9float_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000592,
    "GTF-GL43.gtf21.GL.mat.mat3_3vec3_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000593,
    "GTF-GL43.gtf21.GL.mat.mat3_3vec3_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000594,
    "GTF-GL43.gtf21.GL.mat.mat4_4vec4_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000595,
    "GTF-GL43.gtf21.GL.mat.mat4_4vec4_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000596,
    "GTF-GL43.gtf21.GL.mat.mat4_16float_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000597,
    "GTF-GL43.gtf21.GL.mat.mat4_16float_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000598,
    "GTF-GL43.gtf21.GL.mat.array_const_mat2_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000599,
    "GTF-GL43.gtf21.GL.mat.array_const_mat2_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000600,
    "GTF-GL43.gtf21.GL.mat.array_const_mat3_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000601,
    "GTF-GL43.gtf21.GL.mat.array_const_mat3_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000602,
    "GTF-GL43.gtf21.GL.mat.array_const_mat4_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000603,
    "GTF-GL43.gtf21.GL.mat.array_const_mat4_vert");
