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

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000392,
        "KHR-GLES31.core.shader_bitfield_",
        "operation.bitfieldExtract.uint_0");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000393,
        "KHR-GLES31.core.shader_bitfield_",
        "operation.bitfieldExtract.uint_1");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000394,
        "KHR-GLES31.core.shader_bitfield_",
        "operation.bitfieldExtract.uint_2");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000395,
        "KHR-GLES31.core.shader_bitfield_",
        "operation.bitfieldExtract.uint_3");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000396,
        "KHR-GLES31.core.shader_bitfield_",
        "operation.bitfieldExtract.uvec2_0");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000397,
        "KHR-GLES31.core.shader_bitfield_",
        "operation.bitfieldExtract.uvec2_1");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000398,
        "KHR-GLES31.core.shader_bitfield_",
        "operation.bitfieldExtract.uvec2_2");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000399,
        "KHR-GLES31.core.shader_bitfield_",
        "operation.bitfieldExtract.uvec2_3");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000400,
        "KHR-GLES31.core.shader_bitfield_",
        "operation.bitfieldExtract.uvec3_0");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000401,
        "KHR-GLES31.core.shader_bitfield_",
        "operation.bitfieldExtract.uvec3_1");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000402,
        "KHR-GLES31.core.shader_bitfield_",
        "operation.bitfieldExtract.uvec3_2");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000403,
        "KHR-GLES31.core.shader_bitfield_",
        "operation.bitfieldExtract.uvec3_3");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000404,
        "KHR-GLES31.core.shader_bitfield_",
        "operation.bitfieldExtract.uvec4_0");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000405,
        "KHR-GLES31.core.shader_bitfield_",
        "operation.bitfieldExtract.uvec4_1");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000406,
        "KHR-GLES31.core.shader_bitfield_",
        "operation.bitfieldExtract.uvec4_2");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000407,
        "KHR-GLES31.core.shader_bitfield_",
        "operation.bitfieldExtract.uvec4_3");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000408,
        "KHR-GLES31.core.shader_bitfield",
        "_operation.bitfieldExtract.int_0");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000409,
        "KHR-GLES31.core.shader_bitfield",
        "_operation.bitfieldExtract.int_1");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000410,
        "KHR-GLES31.core.shader_bitfield",
        "_operation.bitfieldExtract.int_2");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000411,
        "KHR-GLES31.core.shader_bitfield",
        "_operation.bitfieldExtract.int_3");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000412,
        "KHR-GLES31.core.shader_bitfield_",
        "operation.bitfieldExtract.ivec2_0");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000413,
        "KHR-GLES31.core.shader_bitfield_",
        "operation.bitfieldExtract.ivec2_1");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000414,
        "KHR-GLES31.core.shader_bitfield_",
        "operation.bitfieldExtract.ivec2_2");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000415,
        "KHR-GLES31.core.shader_bitfield_",
        "operation.bitfieldExtract.ivec2_3");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000416,
        "KHR-GLES31.core.shader_bitfield_",
        "operation.bitfieldExtract.ivec3_0");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000417,
        "KHR-GLES31.core.shader_bitfield_",
        "operation.bitfieldExtract.ivec3_1");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000418,
        "KHR-GLES31.core.shader_bitfield_",
        "operation.bitfieldExtract.ivec3_2");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000419,
        "KHR-GLES31.core.shader_bitfield_",
        "operation.bitfieldExtract.ivec3_3");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000420,
        "KHR-GLES31.core.shader_bitfield_",
        "operation.bitfieldExtract.ivec4_0");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000421,
        "KHR-GLES31.core.shader_bitfield_",
        "operation.bitfieldExtract.ivec4_1");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000422,
        "KHR-GLES31.core.shader_bitfield_",
        "operation.bitfieldExtract.ivec4_2");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000423,
        "KHR-GLES31.core.shader_bitfield_",
        "operation.bitfieldExtract.ivec4_3");
