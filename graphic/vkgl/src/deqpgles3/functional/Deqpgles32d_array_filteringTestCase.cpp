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
#include "../Deqpgles3BaseFunc.h"
#include "../ActsDeqpgles30028TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027038,
        "dEQP-GLES3.functional.texture.vertex.2",
        "d_array.filtering.nearest_nearest_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027039,
        "dEQP-GLES3.functional.texture.vertex.2d",
        "_array.filtering.nearest_nearest_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027040,
        "dEQP-GLES3.functional.texture.vertex.2d",
        "_array.filtering.nearest_nearest_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027041,
        "dEQP-GLES3.functional.texture.vertex.2",
        "d_array.filtering.nearest_linear_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027042,
        "dEQP-GLES3.functional.texture.vertex.2",
        "d_array.filtering.nearest_linear_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027043,
        "dEQP-GLES3.functional.texture.vertex.2",
        "d_array.filtering.nearest_linear_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027044,
        "dEQP-GLES3.functional.texture.vertex.2",
        "d_array.filtering.linear_nearest_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027045,
        "dEQP-GLES3.functional.texture.vertex.2",
        "d_array.filtering.linear_nearest_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027046,
        "dEQP-GLES3.functional.texture.vertex.2",
        "d_array.filtering.linear_nearest_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027047,
        "dEQP-GLES3.functional.texture.vertex.",
        "2d_array.filtering.linear_linear_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027048,
        "dEQP-GLES3.functional.texture.vertex.2",
        "d_array.filtering.linear_linear_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027049,
        "dEQP-GLES3.functional.texture.vertex.2",
        "d_array.filtering.linear_linear_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027050,
        "dEQP-GLES3.functional.texture.vertex.2d_array.",
        "filtering.nearest_mipmap_nearest_nearest_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027051,
        "dEQP-GLES3.functional.texture.vertex.2d_array.",
        "filtering.nearest_mipmap_nearest_nearest_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027052,
        "dEQP-GLES3.functional.texture.vertex.2d_array.",
        "filtering.nearest_mipmap_nearest_nearest_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027053,
        "dEQP-GLES3.functional.texture.vertex.2d_array",
        ".filtering.nearest_mipmap_nearest_linear_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027054,
        "dEQP-GLES3.functional.texture.vertex.2d_array.",
        "filtering.nearest_mipmap_nearest_linear_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027055,
        "dEQP-GLES3.functional.texture.vertex.2d_array.",
        "filtering.nearest_mipmap_nearest_linear_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027056,
        "dEQP-GLES3.functional.texture.vertex.2d_array",
        ".filtering.linear_mipmap_nearest_nearest_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027057,
        "dEQP-GLES3.functional.texture.vertex.2d_array.",
        "filtering.linear_mipmap_nearest_nearest_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027058,
        "dEQP-GLES3.functional.texture.vertex.2d_array.",
        "filtering.linear_mipmap_nearest_nearest_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027059,
        "dEQP-GLES3.functional.texture.vertex.2d_array",
        ".filtering.linear_mipmap_nearest_linear_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027060,
        "dEQP-GLES3.functional.texture.vertex.2d_array",
        ".filtering.linear_mipmap_nearest_linear_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027061,
        "dEQP-GLES3.functional.texture.vertex.2d_array",
        ".filtering.linear_mipmap_nearest_linear_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027062,
        "dEQP-GLES3.functional.texture.vertex.2d_array",
        ".filtering.nearest_mipmap_linear_nearest_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027063,
        "dEQP-GLES3.functional.texture.vertex.2d_array.",
        "filtering.nearest_mipmap_linear_nearest_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027064,
        "dEQP-GLES3.functional.texture.vertex.2d_array.",
        "filtering.nearest_mipmap_linear_nearest_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027065,
        "dEQP-GLES3.functional.texture.vertex.2d_array",
        ".filtering.nearest_mipmap_linear_linear_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027066,
        "dEQP-GLES3.functional.texture.vertex.2d_array",
        ".filtering.nearest_mipmap_linear_linear_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027067,
        "dEQP-GLES3.functional.texture.vertex.2d_array",
        ".filtering.nearest_mipmap_linear_linear_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027068,
        "dEQP-GLES3.functional.texture.vertex.2d_array",
        ".filtering.linear_mipmap_linear_nearest_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027069,
        "dEQP-GLES3.functional.texture.vertex.2d_array",
        ".filtering.linear_mipmap_linear_nearest_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027070,
        "dEQP-GLES3.functional.texture.vertex.2d_array",
        ".filtering.linear_mipmap_linear_nearest_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027071,
        "dEQP-GLES3.functional.texture.vertex.2d_arra",
        "y.filtering.linear_mipmap_linear_linear_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027072,
        "dEQP-GLES3.functional.texture.vertex.2d_array",
        ".filtering.linear_mipmap_linear_linear_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027073,
        "dEQP-GLES3.functional.texture.vertex.2d_array",
        ".filtering.linear_mipmap_linear_linear_mirror");
