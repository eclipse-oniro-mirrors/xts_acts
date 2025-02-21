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

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000424,
        "KHR-GLES31.core.shader_bitfield",
        "_operation.bitfieldInsert.uint_0");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000425,
        "KHR-GLES31.core.shader_bitfield",
        "_operation.bitfieldInsert.uint_1");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000426,
        "KHR-GLES31.core.shader_bitfield",
        "_operation.bitfieldInsert.uint_2");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000427,
        "KHR-GLES31.core.shader_bitfield",
        "_operation.bitfieldInsert.uint_3");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000428,
        "KHR-GLES31.core.shader_bitfield_",
        "operation.bitfieldInsert.uvec2_0");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000429,
        "KHR-GLES31.core.shader_bitfield_",
        "operation.bitfieldInsert.uvec2_1");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000430,
        "KHR-GLES31.core.shader_bitfield_",
        "operation.bitfieldInsert.uvec2_2");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000431,
        "KHR-GLES31.core.shader_bitfield_",
        "operation.bitfieldInsert.uvec2_3");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000432,
        "KHR-GLES31.core.shader_bitfield_",
        "operation.bitfieldInsert.uvec3_0");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000433,
        "KHR-GLES31.core.shader_bitfield_",
        "operation.bitfieldInsert.uvec3_1");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000434,
        "KHR-GLES31.core.shader_bitfield_",
        "operation.bitfieldInsert.uvec3_2");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000435,
        "KHR-GLES31.core.shader_bitfield_",
        "operation.bitfieldInsert.uvec3_3");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000436,
        "KHR-GLES31.core.shader_bitfield_",
        "operation.bitfieldInsert.uvec4_0");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000437,
        "KHR-GLES31.core.shader_bitfield_",
        "operation.bitfieldInsert.uvec4_1");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000438,
        "KHR-GLES31.core.shader_bitfield_",
        "operation.bitfieldInsert.uvec4_2");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000439,
        "KHR-GLES31.core.shader_bitfield_",
        "operation.bitfieldInsert.uvec4_3");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000440,
        "KHR-GLES31.core.shader_bitfield",
        "_operation.bitfieldInsert.int_0");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000441,
        "KHR-GLES31.core.shader_bitfield",
        "_operation.bitfieldInsert.int_1");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000442,
        "KHR-GLES31.core.shader_bitfield",
        "_operation.bitfieldInsert.int_2");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000443,
        "KHR-GLES31.core.shader_bitfield",
        "_operation.bitfieldInsert.int_3");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000444,
        "KHR-GLES31.core.shader_bitfield_",
        "operation.bitfieldInsert.ivec2_0");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000445,
        "KHR-GLES31.core.shader_bitfield_",
        "operation.bitfieldInsert.ivec2_1");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000446,
        "KHR-GLES31.core.shader_bitfield_",
        "operation.bitfieldInsert.ivec2_2");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000447,
        "KHR-GLES31.core.shader_bitfield_",
        "operation.bitfieldInsert.ivec2_3");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000448,
        "KHR-GLES31.core.shader_bitfield_",
        "operation.bitfieldInsert.ivec3_0");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000449,
        "KHR-GLES31.core.shader_bitfield_",
        "operation.bitfieldInsert.ivec3_1");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000450,
        "KHR-GLES31.core.shader_bitfield_",
        "operation.bitfieldInsert.ivec3_2");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000451,
        "KHR-GLES31.core.shader_bitfield_",
        "operation.bitfieldInsert.ivec3_3");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000452,
        "KHR-GLES31.core.shader_bitfield_",
        "operation.bitfieldInsert.ivec4_0");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000453,
        "KHR-GLES31.core.shader_bitfield_",
        "operation.bitfieldInsert.ivec4_1");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000454,
        "KHR-GLES31.core.shader_bitfield_",
        "operation.bitfieldInsert.ivec4_2");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000455,
        "KHR-GLES31.core.shader_bitfield_",
        "operation.bitfieldInsert.ivec4_3");
