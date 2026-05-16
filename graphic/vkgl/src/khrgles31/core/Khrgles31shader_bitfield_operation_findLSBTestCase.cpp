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

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000526,
        "KHR-GLES31.core.shader_bitfie",
        "ld_operation.findLSB.uint_zero");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000527,
        "KHR-GLES31.core.shader_bitfi",
        "eld_operation.findLSB.uint_0");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000528,
        "KHR-GLES31.core.shader_bitfi",
        "eld_operation.findLSB.uint_1");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000529,
        "KHR-GLES31.core.shader_bitfi",
        "eld_operation.findLSB.uint_2");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000530,
        "KHR-GLES31.core.shader_bitfi",
        "eld_operation.findLSB.uint_3");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000531,
        "KHR-GLES31.core.shader_bitfi",
        "eld_operation.findLSB.uvec2_0");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000532,
        "KHR-GLES31.core.shader_bitfi",
        "eld_operation.findLSB.uvec2_1");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000533,
        "KHR-GLES31.core.shader_bitfi",
        "eld_operation.findLSB.uvec2_2");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000534,
        "KHR-GLES31.core.shader_bitfi",
        "eld_operation.findLSB.uvec2_3");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000535,
        "KHR-GLES31.core.shader_bitfi",
        "eld_operation.findLSB.uvec3_0");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000536,
        "KHR-GLES31.core.shader_bitfi",
        "eld_operation.findLSB.uvec3_1");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000537,
        "KHR-GLES31.core.shader_bitfi",
        "eld_operation.findLSB.uvec3_2");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000538,
        "KHR-GLES31.core.shader_bitfi",
        "eld_operation.findLSB.uvec3_3");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000539,
        "KHR-GLES31.core.shader_bitfi",
        "eld_operation.findLSB.uvec4_0");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000540,
        "KHR-GLES31.core.shader_bitfi",
        "eld_operation.findLSB.uvec4_1");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000541,
        "KHR-GLES31.core.shader_bitfi",
        "eld_operation.findLSB.uvec4_2");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000542,
        "KHR-GLES31.core.shader_bitfi",
        "eld_operation.findLSB.uvec4_3");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000543,
        "KHR-GLES31.core.shader_bitfie",
        "ld_operation.findLSB.int_zero");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000544,
        "KHR-GLES31.core.shader_bitfield",
        "_operation.findLSB.int_minus_one");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000545,
        "KHR-GLES31.core.shader_bitf",
        "ield_operation.findLSB.int_0");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000546,
        "KHR-GLES31.core.shader_bitf",
        "ield_operation.findLSB.int_1");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000547,
        "KHR-GLES31.core.shader_bitf",
        "ield_operation.findLSB.int_2");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000548,
        "KHR-GLES31.core.shader_bitf",
        "ield_operation.findLSB.int_3");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000549,
        "KHR-GLES31.core.shader_bitfi",
        "eld_operation.findLSB.ivec2_0");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000550,
        "KHR-GLES31.core.shader_bitfi",
        "eld_operation.findLSB.ivec2_1");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000551,
        "KHR-GLES31.core.shader_bitfi",
        "eld_operation.findLSB.ivec2_2");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000552,
        "KHR-GLES31.core.shader_bitfi",
        "eld_operation.findLSB.ivec2_3");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000553,
        "KHR-GLES31.core.shader_bitfi",
        "eld_operation.findLSB.ivec3_0");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000554,
        "KHR-GLES31.core.shader_bitfi",
        "eld_operation.findLSB.ivec3_1");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000555,
        "KHR-GLES31.core.shader_bitfi",
        "eld_operation.findLSB.ivec3_2");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000556,
        "KHR-GLES31.core.shader_bitfi",
        "eld_operation.findLSB.ivec3_3");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000557,
        "KHR-GLES31.core.shader_bitfi",
        "eld_operation.findLSB.ivec4_0");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000558,
        "KHR-GLES31.core.shader_bitfi",
        "eld_operation.findLSB.ivec4_1");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000559,
        "KHR-GLES31.core.shader_bitfi",
        "eld_operation.findLSB.ivec4_2");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000560,
        "KHR-GLES31.core.shader_bitfi",
        "eld_operation.findLSB.ivec4_3");
