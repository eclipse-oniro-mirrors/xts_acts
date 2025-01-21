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
#include "../Khrgles31BaseFunc.h"
#include "../ActsKhrgles310001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000561,
        "KHR-GLES31.core.shader_bitfie",
        "ld_operation.findMSB.uint_zero");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000562,
        "KHR-GLES31.core.shader_bitfi",
        "eld_operation.findMSB.uint_0");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000563,
        "KHR-GLES31.core.shader_bitfi",
        "eld_operation.findMSB.uint_1");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000564,
        "KHR-GLES31.core.shader_bitfi",
        "eld_operation.findMSB.uint_2");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000565,
        "KHR-GLES31.core.shader_bitfi",
        "eld_operation.findMSB.uint_3");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000566,
        "KHR-GLES31.core.shader_bitfi",
        "eld_operation.findMSB.uvec2_0");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000567,
        "KHR-GLES31.core.shader_bitfi",
        "eld_operation.findMSB.uvec2_1");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000568,
        "KHR-GLES31.core.shader_bitfi",
        "eld_operation.findMSB.uvec2_2");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000569,
        "KHR-GLES31.core.shader_bitfi",
        "eld_operation.findMSB.uvec2_3");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000570,
        "KHR-GLES31.core.shader_bitfi",
        "eld_operation.findMSB.uvec3_0");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000571,
        "KHR-GLES31.core.shader_bitfi",
        "eld_operation.findMSB.uvec3_1");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000572,
        "KHR-GLES31.core.shader_bitfi",
        "eld_operation.findMSB.uvec3_2");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000573,
        "KHR-GLES31.core.shader_bitfi",
        "eld_operation.findMSB.uvec3_3");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000574,
        "KHR-GLES31.core.shader_bitfi",
        "eld_operation.findMSB.uvec4_0");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000575,
        "KHR-GLES31.core.shader_bitfi",
        "eld_operation.findMSB.uvec4_1");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000576,
        "KHR-GLES31.core.shader_bitfi",
        "eld_operation.findMSB.uvec4_2");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000577,
        "KHR-GLES31.core.shader_bitfi",
        "eld_operation.findMSB.uvec4_3");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000578,
        "KHR-GLES31.core.shader_bitfie",
        "ld_operation.findMSB.int_zero");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000579,
        "KHR-GLES31.core.shader_bitfield",
        "_operation.findMSB.int_minus_one");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000580,
        "KHR-GLES31.core.shader_bitf",
        "ield_operation.findMSB.int_0");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000581,
        "KHR-GLES31.core.shader_bitf",
        "ield_operation.findMSB.int_1");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000582,
        "KHR-GLES31.core.shader_bitf",
        "ield_operation.findMSB.int_2");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000583,
        "KHR-GLES31.core.shader_bitf",
        "ield_operation.findMSB.int_3");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000584,
        "KHR-GLES31.core.shader_bitfi",
        "eld_operation.findMSB.ivec2_0");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000585,
        "KHR-GLES31.core.shader_bitfi",
        "eld_operation.findMSB.ivec2_1");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000586,
        "KHR-GLES31.core.shader_bitfi",
        "eld_operation.findMSB.ivec2_2");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000587,
        "KHR-GLES31.core.shader_bitfi",
        "eld_operation.findMSB.ivec2_3");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000588,
        "KHR-GLES31.core.shader_bitfi",
        "eld_operation.findMSB.ivec3_0");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000589,
        "KHR-GLES31.core.shader_bitfi",
        "eld_operation.findMSB.ivec3_1");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000590,
        "KHR-GLES31.core.shader_bitfi",
        "eld_operation.findMSB.ivec3_2");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000591,
        "KHR-GLES31.core.shader_bitfi",
        "eld_operation.findMSB.ivec3_3");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000592,
        "KHR-GLES31.core.shader_bitfi",
        "eld_operation.findMSB.ivec4_0");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000593,
        "KHR-GLES31.core.shader_bitfi",
        "eld_operation.findMSB.ivec4_1");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000594,
        "KHR-GLES31.core.shader_bitfi",
        "eld_operation.findMSB.ivec4_2");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000595,
        "KHR-GLES31.core.shader_bitfi",
        "eld_operation.findMSB.ivec4_3");
