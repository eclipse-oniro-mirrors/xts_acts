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
#include "../Khrgles32BaseFunc.h"
#include "../ActsGles32KhrSingleUncover0003TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002522,
        "KHR-Single-GLES32.subgroups.clustered.fr",
        "amebuffer.subgroupclusteredadd_int_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002523,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredadd_int_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002524,
        "KHR-Single-GLES32.subgroups.clustered.frame",
        "buffer.subgroupclusteredadd_int_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002525,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredadd_int_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002526,
        "KHR-Single-GLES32.subgroups.clustered.fr",
        "amebuffer.subgroupclusteredmul_int_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002527,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredmul_int_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002528,
        "KHR-Single-GLES32.subgroups.clustered.frame",
        "buffer.subgroupclusteredmul_int_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002529,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredmul_int_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002530,
        "KHR-Single-GLES32.subgroups.clustered.fr",
        "amebuffer.subgroupclusteredmin_int_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002531,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredmin_int_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002532,
        "KHR-Single-GLES32.subgroups.clustered.frame",
        "buffer.subgroupclusteredmin_int_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002533,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredmin_int_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002534,
        "KHR-Single-GLES32.subgroups.clustered.fr",
        "amebuffer.subgroupclusteredmax_int_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002535,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredmax_int_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002536,
        "KHR-Single-GLES32.subgroups.clustered.frame",
        "buffer.subgroupclusteredmax_int_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002537,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredmax_int_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002538,
        "KHR-Single-GLES32.subgroups.clustered.fr",
        "amebuffer.subgroupclusteredand_int_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002539,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredand_int_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002540,
        "KHR-Single-GLES32.subgroups.clustered.frame",
        "buffer.subgroupclusteredand_int_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002541,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredand_int_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002542,
        "KHR-Single-GLES32.subgroups.clustered.fr",
        "amebuffer.subgroupclusteredor_int_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002543,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredor_int_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002544,
        "KHR-Single-GLES32.subgroups.clustered.frame",
        "buffer.subgroupclusteredor_int_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002545,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredor_int_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002546,
        "KHR-Single-GLES32.subgroups.clustered.fr",
        "amebuffer.subgroupclusteredxor_int_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002547,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredxor_int_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002548,
        "KHR-Single-GLES32.subgroups.clustered.frame",
        "buffer.subgroupclusteredxor_int_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002549,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredxor_int_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002550,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredadd_ivec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002551,
        "KHR-Single-GLES32.subgroups.clustered.frame",
        "buffer.subgroupclusteredadd_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002552,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredadd_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002553,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredadd_ivec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002554,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredmul_ivec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002555,
        "KHR-Single-GLES32.subgroups.clustered.frame",
        "buffer.subgroupclusteredmul_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002556,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredmul_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002557,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredmul_ivec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002558,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredmin_ivec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002559,
        "KHR-Single-GLES32.subgroups.clustered.frame",
        "buffer.subgroupclusteredmin_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002560,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredmin_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002561,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredmin_ivec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002562,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredmax_ivec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002563,
        "KHR-Single-GLES32.subgroups.clustered.frame",
        "buffer.subgroupclusteredmax_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002564,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredmax_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002565,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredmax_ivec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002566,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredand_ivec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002567,
        "KHR-Single-GLES32.subgroups.clustered.frame",
        "buffer.subgroupclusteredand_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002568,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredand_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002569,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredand_ivec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002570,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredor_ivec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002571,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredor_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002572,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredor_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002573,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredor_ivec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002574,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredxor_ivec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002575,
        "KHR-Single-GLES32.subgroups.clustered.frame",
        "buffer.subgroupclusteredxor_ivec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002576,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredxor_ivec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002577,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredxor_ivec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002578,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredadd_ivec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002579,
        "KHR-Single-GLES32.subgroups.clustered.frame",
        "buffer.subgroupclusteredadd_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002580,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredadd_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002581,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredadd_ivec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002582,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredmul_ivec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002583,
        "KHR-Single-GLES32.subgroups.clustered.frame",
        "buffer.subgroupclusteredmul_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002584,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredmul_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002585,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredmul_ivec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002586,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredmin_ivec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002587,
        "KHR-Single-GLES32.subgroups.clustered.frame",
        "buffer.subgroupclusteredmin_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002588,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredmin_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002589,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredmin_ivec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002590,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredmax_ivec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002591,
        "KHR-Single-GLES32.subgroups.clustered.frame",
        "buffer.subgroupclusteredmax_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002592,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredmax_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002593,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredmax_ivec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002594,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredand_ivec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002595,
        "KHR-Single-GLES32.subgroups.clustered.frame",
        "buffer.subgroupclusteredand_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002596,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredand_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002597,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredand_ivec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002598,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredor_ivec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002599,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredor_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002600,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredor_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002601,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredor_ivec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002602,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredxor_ivec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002603,
        "KHR-Single-GLES32.subgroups.clustered.frame",
        "buffer.subgroupclusteredxor_ivec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002604,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredxor_ivec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002605,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredxor_ivec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002606,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredadd_ivec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002607,
        "KHR-Single-GLES32.subgroups.clustered.frame",
        "buffer.subgroupclusteredadd_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002608,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredadd_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002609,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredadd_ivec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002610,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredmul_ivec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002611,
        "KHR-Single-GLES32.subgroups.clustered.frame",
        "buffer.subgroupclusteredmul_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002612,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredmul_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002613,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredmul_ivec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002614,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredmin_ivec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002615,
        "KHR-Single-GLES32.subgroups.clustered.frame",
        "buffer.subgroupclusteredmin_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002616,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredmin_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002617,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredmin_ivec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002618,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredmax_ivec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002619,
        "KHR-Single-GLES32.subgroups.clustered.frame",
        "buffer.subgroupclusteredmax_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002620,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredmax_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002621,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredmax_ivec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002622,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredand_ivec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002623,
        "KHR-Single-GLES32.subgroups.clustered.frame",
        "buffer.subgroupclusteredand_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002624,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredand_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002625,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredand_ivec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002626,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredor_ivec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002627,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredor_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002628,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredor_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002629,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredor_ivec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002630,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredxor_ivec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002631,
        "KHR-Single-GLES32.subgroups.clustered.frame",
        "buffer.subgroupclusteredxor_ivec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002632,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredxor_ivec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002633,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredxor_ivec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002634,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredadd_uint_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002635,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredadd_uint_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002636,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredadd_uint_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002637,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredadd_uint_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002638,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredmul_uint_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002639,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredmul_uint_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002640,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredmul_uint_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002641,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredmul_uint_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002642,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredmin_uint_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002643,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredmin_uint_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002644,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredmin_uint_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002645,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredmin_uint_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002646,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredmax_uint_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002647,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredmax_uint_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002648,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredmax_uint_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002649,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredmax_uint_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002650,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredand_uint_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002651,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredand_uint_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002652,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredand_uint_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002653,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredand_uint_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002654,
        "KHR-Single-GLES32.subgroups.clustered.fr",
        "amebuffer.subgroupclusteredor_uint_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002655,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredor_uint_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002656,
        "KHR-Single-GLES32.subgroups.clustered.frame",
        "buffer.subgroupclusteredor_uint_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002657,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredor_uint_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002658,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredxor_uint_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002659,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredxor_uint_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002660,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredxor_uint_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002661,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredxor_uint_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002662,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredadd_uvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002663,
        "KHR-Single-GLES32.subgroups.clustered.frame",
        "buffer.subgroupclusteredadd_uvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002664,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredadd_uvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002665,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredadd_uvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002666,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredmul_uvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002667,
        "KHR-Single-GLES32.subgroups.clustered.frame",
        "buffer.subgroupclusteredmul_uvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002668,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredmul_uvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002669,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredmul_uvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002670,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredmin_uvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002671,
        "KHR-Single-GLES32.subgroups.clustered.frame",
        "buffer.subgroupclusteredmin_uvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002672,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredmin_uvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002673,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredmin_uvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002674,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredmax_uvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002675,
        "KHR-Single-GLES32.subgroups.clustered.frame",
        "buffer.subgroupclusteredmax_uvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002676,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredmax_uvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002677,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredmax_uvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002678,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredand_uvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002679,
        "KHR-Single-GLES32.subgroups.clustered.frame",
        "buffer.subgroupclusteredand_uvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002680,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredand_uvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002681,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredand_uvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002682,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredor_uvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002683,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredor_uvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002684,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredor_uvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002685,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredor_uvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002686,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredxor_uvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002687,
        "KHR-Single-GLES32.subgroups.clustered.frame",
        "buffer.subgroupclusteredxor_uvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002688,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredxor_uvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002689,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredxor_uvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002690,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredadd_uvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002691,
        "KHR-Single-GLES32.subgroups.clustered.frame",
        "buffer.subgroupclusteredadd_uvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002692,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredadd_uvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002693,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredadd_uvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002694,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredmul_uvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002695,
        "KHR-Single-GLES32.subgroups.clustered.frame",
        "buffer.subgroupclusteredmul_uvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002696,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredmul_uvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002697,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredmul_uvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002698,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredmin_uvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002699,
        "KHR-Single-GLES32.subgroups.clustered.frame",
        "buffer.subgroupclusteredmin_uvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002700,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredmin_uvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002701,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredmin_uvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002702,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredmax_uvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002703,
        "KHR-Single-GLES32.subgroups.clustered.frame",
        "buffer.subgroupclusteredmax_uvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002704,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredmax_uvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002705,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredmax_uvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002706,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredand_uvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002707,
        "KHR-Single-GLES32.subgroups.clustered.frame",
        "buffer.subgroupclusteredand_uvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002708,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredand_uvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002709,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredand_uvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002710,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredor_uvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002711,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredor_uvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002712,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredor_uvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002713,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredor_uvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002714,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredxor_uvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002715,
        "KHR-Single-GLES32.subgroups.clustered.frame",
        "buffer.subgroupclusteredxor_uvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002716,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredxor_uvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002717,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredxor_uvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002718,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredadd_uvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002719,
        "KHR-Single-GLES32.subgroups.clustered.frame",
        "buffer.subgroupclusteredadd_uvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002720,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredadd_uvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002721,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredadd_uvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002722,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredmul_uvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002723,
        "KHR-Single-GLES32.subgroups.clustered.frame",
        "buffer.subgroupclusteredmul_uvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002724,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredmul_uvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002725,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredmul_uvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002726,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredmin_uvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002727,
        "KHR-Single-GLES32.subgroups.clustered.frame",
        "buffer.subgroupclusteredmin_uvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002728,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredmin_uvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002729,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredmin_uvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002730,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredmax_uvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002731,
        "KHR-Single-GLES32.subgroups.clustered.frame",
        "buffer.subgroupclusteredmax_uvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002732,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredmax_uvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002733,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredmax_uvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002734,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredand_uvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002735,
        "KHR-Single-GLES32.subgroups.clustered.frame",
        "buffer.subgroupclusteredand_uvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002736,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredand_uvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002737,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredand_uvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002738,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredor_uvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002739,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredor_uvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002740,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredor_uvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002741,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredor_uvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002742,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredxor_uvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002743,
        "KHR-Single-GLES32.subgroups.clustered.frame",
        "buffer.subgroupclusteredxor_uvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002744,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredxor_uvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002745,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredxor_uvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002746,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredadd_float_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002747,
        "KHR-Single-GLES32.subgroups.clustered.frame",
        "buffer.subgroupclusteredadd_float_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002748,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredadd_float_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002749,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredadd_float_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002750,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredmul_float_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002751,
        "KHR-Single-GLES32.subgroups.clustered.frame",
        "buffer.subgroupclusteredmul_float_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002752,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredmul_float_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002753,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredmul_float_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002754,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredmin_float_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002755,
        "KHR-Single-GLES32.subgroups.clustered.frame",
        "buffer.subgroupclusteredmin_float_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002756,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredmin_float_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002757,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredmin_float_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002758,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredmax_float_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002759,
        "KHR-Single-GLES32.subgroups.clustered.frame",
        "buffer.subgroupclusteredmax_float_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002760,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredmax_float_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002761,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredmax_float_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002762,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredadd_vec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002763,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredadd_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002764,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredadd_vec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002765,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredadd_vec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002766,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredmul_vec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002767,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredmul_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002768,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredmul_vec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002769,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredmul_vec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002770,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredmin_vec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002771,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredmin_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002772,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredmin_vec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002773,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredmin_vec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002774,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredmax_vec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002775,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredmax_vec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002776,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredmax_vec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002777,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredmax_vec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002778,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredadd_vec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002779,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredadd_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002780,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredadd_vec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002781,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredadd_vec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002782,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredmul_vec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002783,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredmul_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002784,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredmul_vec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002785,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredmul_vec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002786,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredmin_vec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002787,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredmin_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002788,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredmin_vec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002789,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredmin_vec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002790,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredmax_vec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002791,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredmax_vec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002792,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredmax_vec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002793,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredmax_vec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002794,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredadd_vec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002795,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredadd_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002796,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredadd_vec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002797,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredadd_vec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002798,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredmul_vec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002799,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredmul_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002800,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredmul_vec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002801,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredmul_vec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002802,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredmin_vec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002803,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredmin_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002804,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredmin_vec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002805,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredmin_vec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002806,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredmax_vec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002807,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredmax_vec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002808,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredmax_vec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002809,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredmax_vec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002810,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredadd_double_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002811,
        "KHR-Single-GLES32.subgroups.clustered.frame",
        "buffer.subgroupclusteredadd_double_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002812,
        "KHR-Single-GLES32.subgroups.clustered.framebu",
        "ffer.subgroupclusteredadd_double_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002813,
        "KHR-Single-GLES32.subgroups.clustered.frame",
        "buffer.subgroupclusteredadd_double_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002814,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredmul_double_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002815,
        "KHR-Single-GLES32.subgroups.clustered.frame",
        "buffer.subgroupclusteredmul_double_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002816,
        "KHR-Single-GLES32.subgroups.clustered.framebu",
        "ffer.subgroupclusteredmul_double_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002817,
        "KHR-Single-GLES32.subgroups.clustered.frame",
        "buffer.subgroupclusteredmul_double_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002818,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredmin_double_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002819,
        "KHR-Single-GLES32.subgroups.clustered.frame",
        "buffer.subgroupclusteredmin_double_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002820,
        "KHR-Single-GLES32.subgroups.clustered.framebu",
        "ffer.subgroupclusteredmin_double_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002821,
        "KHR-Single-GLES32.subgroups.clustered.frame",
        "buffer.subgroupclusteredmin_double_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002822,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredmax_double_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002823,
        "KHR-Single-GLES32.subgroups.clustered.frame",
        "buffer.subgroupclusteredmax_double_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002824,
        "KHR-Single-GLES32.subgroups.clustered.framebu",
        "ffer.subgroupclusteredmax_double_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002825,
        "KHR-Single-GLES32.subgroups.clustered.frame",
        "buffer.subgroupclusteredmax_double_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002826,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredadd_dvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002827,
        "KHR-Single-GLES32.subgroups.clustered.frame",
        "buffer.subgroupclusteredadd_dvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002828,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredadd_dvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002829,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredadd_dvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002830,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredmul_dvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002831,
        "KHR-Single-GLES32.subgroups.clustered.frame",
        "buffer.subgroupclusteredmul_dvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002832,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredmul_dvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002833,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredmul_dvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002834,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredmin_dvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002835,
        "KHR-Single-GLES32.subgroups.clustered.frame",
        "buffer.subgroupclusteredmin_dvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002836,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredmin_dvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002837,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredmin_dvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002838,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredmax_dvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002839,
        "KHR-Single-GLES32.subgroups.clustered.frame",
        "buffer.subgroupclusteredmax_dvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002840,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredmax_dvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002841,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredmax_dvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002842,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredadd_dvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002843,
        "KHR-Single-GLES32.subgroups.clustered.frame",
        "buffer.subgroupclusteredadd_dvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002844,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredadd_dvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002845,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredadd_dvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002846,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredmul_dvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002847,
        "KHR-Single-GLES32.subgroups.clustered.frame",
        "buffer.subgroupclusteredmul_dvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002848,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredmul_dvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002849,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredmul_dvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002850,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredmin_dvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002851,
        "KHR-Single-GLES32.subgroups.clustered.frame",
        "buffer.subgroupclusteredmin_dvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002852,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredmin_dvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002853,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredmin_dvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002854,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredmax_dvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002855,
        "KHR-Single-GLES32.subgroups.clustered.frame",
        "buffer.subgroupclusteredmax_dvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002856,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredmax_dvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002857,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredmax_dvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002858,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredadd_dvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002859,
        "KHR-Single-GLES32.subgroups.clustered.frame",
        "buffer.subgroupclusteredadd_dvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002860,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredadd_dvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002861,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredadd_dvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002862,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredmul_dvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002863,
        "KHR-Single-GLES32.subgroups.clustered.frame",
        "buffer.subgroupclusteredmul_dvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002864,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredmul_dvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002865,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredmul_dvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002866,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredmin_dvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002867,
        "KHR-Single-GLES32.subgroups.clustered.frame",
        "buffer.subgroupclusteredmin_dvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002868,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredmin_dvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002869,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredmin_dvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002870,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredmax_dvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002871,
        "KHR-Single-GLES32.subgroups.clustered.frame",
        "buffer.subgroupclusteredmax_dvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002872,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredmax_dvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002873,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredmax_dvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002874,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredand_bool_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002875,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredand_bool_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002876,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredand_bool_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002877,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredand_bool_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002878,
        "KHR-Single-GLES32.subgroups.clustered.fr",
        "amebuffer.subgroupclusteredor_bool_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002879,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredor_bool_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002880,
        "KHR-Single-GLES32.subgroups.clustered.frame",
        "buffer.subgroupclusteredor_bool_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002881,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredor_bool_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002882,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredxor_bool_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002883,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredxor_bool_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002884,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredxor_bool_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002885,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredxor_bool_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002886,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredand_bvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002887,
        "KHR-Single-GLES32.subgroups.clustered.frame",
        "buffer.subgroupclusteredand_bvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002888,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredand_bvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002889,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredand_bvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002890,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredor_bvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002891,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredor_bvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002892,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredor_bvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002893,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredor_bvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002894,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredxor_bvec2_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002895,
        "KHR-Single-GLES32.subgroups.clustered.frame",
        "buffer.subgroupclusteredxor_bvec2_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002896,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredxor_bvec2_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002897,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredxor_bvec2_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002898,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredand_bvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002899,
        "KHR-Single-GLES32.subgroups.clustered.frame",
        "buffer.subgroupclusteredand_bvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002900,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredand_bvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002901,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredand_bvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002902,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredor_bvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002903,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredor_bvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002904,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredor_bvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002905,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredor_bvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002906,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredxor_bvec3_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002907,
        "KHR-Single-GLES32.subgroups.clustered.frame",
        "buffer.subgroupclusteredxor_bvec3_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002908,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredxor_bvec3_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002909,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredxor_bvec3_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002910,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredand_bvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002911,
        "KHR-Single-GLES32.subgroups.clustered.frame",
        "buffer.subgroupclusteredand_bvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002912,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredand_bvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002913,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredand_bvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002914,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredor_bvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002915,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredor_bvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002916,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredor_bvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002917,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredor_bvec4_geometry");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002918,
        "KHR-Single-GLES32.subgroups.clustered.fra",
        "mebuffer.subgroupclusteredxor_bvec4_vertex");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002919,
        "KHR-Single-GLES32.subgroups.clustered.frame",
        "buffer.subgroupclusteredxor_bvec4_tess_eval");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002920,
        "KHR-Single-GLES32.subgroups.clustered.frameb",
        "uffer.subgroupclusteredxor_bvec4_tess_control");

static SHRINK_HWTEST_F(ActsGles32KhrSingleUncover0003TestSuite, TestCase_002921,
        "KHR-Single-GLES32.subgroups.clustered.fram",
        "ebuffer.subgroupclusteredxor_bvec4_geometry");
