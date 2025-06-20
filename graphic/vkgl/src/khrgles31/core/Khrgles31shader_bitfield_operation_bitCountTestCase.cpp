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

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000491,
        "KHR-GLES31.core.shader_bitfiel",
        "d_operation.bitCount.uint_zero");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000492,
        "KHR-GLES31.core.shader_bitfi",
        "eld_operation.bitCount.uint_0");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000493,
        "KHR-GLES31.core.shader_bitfi",
        "eld_operation.bitCount.uint_1");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000494,
        "KHR-GLES31.core.shader_bitfi",
        "eld_operation.bitCount.uint_2");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000495,
        "KHR-GLES31.core.shader_bitfi",
        "eld_operation.bitCount.uint_3");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000496,
        "KHR-GLES31.core.shader_bitfie",
        "ld_operation.bitCount.uvec2_0");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000497,
        "KHR-GLES31.core.shader_bitfie",
        "ld_operation.bitCount.uvec2_1");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000498,
        "KHR-GLES31.core.shader_bitfie",
        "ld_operation.bitCount.uvec2_2");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000499,
        "KHR-GLES31.core.shader_bitfie",
        "ld_operation.bitCount.uvec2_3");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000500,
        "KHR-GLES31.core.shader_bitfie",
        "ld_operation.bitCount.uvec3_0");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000501,
        "KHR-GLES31.core.shader_bitfie",
        "ld_operation.bitCount.uvec3_1");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000502,
        "KHR-GLES31.core.shader_bitfie",
        "ld_operation.bitCount.uvec3_2");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000503,
        "KHR-GLES31.core.shader_bitfie",
        "ld_operation.bitCount.uvec3_3");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000504,
        "KHR-GLES31.core.shader_bitfie",
        "ld_operation.bitCount.uvec4_0");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000505,
        "KHR-GLES31.core.shader_bitfie",
        "ld_operation.bitCount.uvec4_1");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000506,
        "KHR-GLES31.core.shader_bitfie",
        "ld_operation.bitCount.uvec4_2");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000507,
        "KHR-GLES31.core.shader_bitfie",
        "ld_operation.bitCount.uvec4_3");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000508,
        "KHR-GLES31.core.shader_bitfie",
        "ld_operation.bitCount.int_zero");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000509,
        "KHR-GLES31.core.shader_bitfield_",
        "operation.bitCount.int_minus_one");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000510,
        "KHR-GLES31.core.shader_bitfi",
        "eld_operation.bitCount.int_0");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000511,
        "KHR-GLES31.core.shader_bitfi",
        "eld_operation.bitCount.int_1");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000512,
        "KHR-GLES31.core.shader_bitfi",
        "eld_operation.bitCount.int_2");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000513,
        "KHR-GLES31.core.shader_bitfi",
        "eld_operation.bitCount.int_3");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000514,
        "KHR-GLES31.core.shader_bitfie",
        "ld_operation.bitCount.ivec2_0");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000515,
        "KHR-GLES31.core.shader_bitfie",
        "ld_operation.bitCount.ivec2_1");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000516,
        "KHR-GLES31.core.shader_bitfie",
        "ld_operation.bitCount.ivec2_2");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000517,
        "KHR-GLES31.core.shader_bitfie",
        "ld_operation.bitCount.ivec2_3");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000518,
        "KHR-GLES31.core.shader_bitfie",
        "ld_operation.bitCount.ivec3_0");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000519,
        "KHR-GLES31.core.shader_bitfie",
        "ld_operation.bitCount.ivec3_1");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000520,
        "KHR-GLES31.core.shader_bitfie",
        "ld_operation.bitCount.ivec3_2");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000521,
        "KHR-GLES31.core.shader_bitfie",
        "ld_operation.bitCount.ivec3_3");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000522,
        "KHR-GLES31.core.shader_bitfie",
        "ld_operation.bitCount.ivec4_0");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000523,
        "KHR-GLES31.core.shader_bitfie",
        "ld_operation.bitCount.ivec4_1");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000524,
        "KHR-GLES31.core.shader_bitfie",
        "ld_operation.bitCount.ivec4_2");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000525,
        "KHR-GLES31.core.shader_bitfie",
        "ld_operation.bitCount.ivec4_3");
