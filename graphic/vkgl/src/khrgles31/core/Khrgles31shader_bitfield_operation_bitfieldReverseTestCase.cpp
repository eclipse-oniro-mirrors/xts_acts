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

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000456,
        "KHR-GLES31.core.shader_bitfield_o",
        "peration.bitfieldReverse.uint_zero");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000457,
        "KHR-GLES31.core.shader_bitfield_",
        "operation.bitfieldReverse.uint_0");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000458,
        "KHR-GLES31.core.shader_bitfield_",
        "operation.bitfieldReverse.uint_1");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000459,
        "KHR-GLES31.core.shader_bitfield_",
        "operation.bitfieldReverse.uint_2");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000460,
        "KHR-GLES31.core.shader_bitfield_",
        "operation.bitfieldReverse.uint_3");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000461,
        "KHR-GLES31.core.shader_bitfield_",
        "operation.bitfieldReverse.uvec2_0");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000462,
        "KHR-GLES31.core.shader_bitfield_",
        "operation.bitfieldReverse.uvec2_1");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000463,
        "KHR-GLES31.core.shader_bitfield_",
        "operation.bitfieldReverse.uvec2_2");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000464,
        "KHR-GLES31.core.shader_bitfield_",
        "operation.bitfieldReverse.uvec2_3");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000465,
        "KHR-GLES31.core.shader_bitfield_",
        "operation.bitfieldReverse.uvec3_0");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000466,
        "KHR-GLES31.core.shader_bitfield_",
        "operation.bitfieldReverse.uvec3_1");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000467,
        "KHR-GLES31.core.shader_bitfield_",
        "operation.bitfieldReverse.uvec3_2");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000468,
        "KHR-GLES31.core.shader_bitfield_",
        "operation.bitfieldReverse.uvec3_3");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000469,
        "KHR-GLES31.core.shader_bitfield_",
        "operation.bitfieldReverse.uvec4_0");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000470,
        "KHR-GLES31.core.shader_bitfield_",
        "operation.bitfieldReverse.uvec4_1");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000471,
        "KHR-GLES31.core.shader_bitfield_",
        "operation.bitfieldReverse.uvec4_2");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000472,
        "KHR-GLES31.core.shader_bitfield_",
        "operation.bitfieldReverse.uvec4_3");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000473,
        "KHR-GLES31.core.shader_bitfield_o",
        "peration.bitfieldReverse.int_zero");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000474,
        "KHR-GLES31.core.shader_bitfield_ope",
        "ration.bitfieldReverse.int_minus_one");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000475,
        "KHR-GLES31.core.shader_bitfield",
        "_operation.bitfieldReverse.int_0");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000476,
        "KHR-GLES31.core.shader_bitfield",
        "_operation.bitfieldReverse.int_1");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000477,
        "KHR-GLES31.core.shader_bitfield",
        "_operation.bitfieldReverse.int_2");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000478,
        "KHR-GLES31.core.shader_bitfield",
        "_operation.bitfieldReverse.int_3");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000479,
        "KHR-GLES31.core.shader_bitfield_",
        "operation.bitfieldReverse.ivec2_0");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000480,
        "KHR-GLES31.core.shader_bitfield_",
        "operation.bitfieldReverse.ivec2_1");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000481,
        "KHR-GLES31.core.shader_bitfield_",
        "operation.bitfieldReverse.ivec2_2");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000482,
        "KHR-GLES31.core.shader_bitfield_",
        "operation.bitfieldReverse.ivec2_3");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000483,
        "KHR-GLES31.core.shader_bitfield_",
        "operation.bitfieldReverse.ivec3_0");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000484,
        "KHR-GLES31.core.shader_bitfield_",
        "operation.bitfieldReverse.ivec3_1");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000485,
        "KHR-GLES31.core.shader_bitfield_",
        "operation.bitfieldReverse.ivec3_2");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000486,
        "KHR-GLES31.core.shader_bitfield_",
        "operation.bitfieldReverse.ivec3_3");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000487,
        "KHR-GLES31.core.shader_bitfield_",
        "operation.bitfieldReverse.ivec4_0");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000488,
        "KHR-GLES31.core.shader_bitfield_",
        "operation.bitfieldReverse.ivec4_1");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000489,
        "KHR-GLES31.core.shader_bitfield_",
        "operation.bitfieldReverse.ivec4_2");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000490,
        "KHR-GLES31.core.shader_bitfield_",
        "operation.bitfieldReverse.ivec4_3");
