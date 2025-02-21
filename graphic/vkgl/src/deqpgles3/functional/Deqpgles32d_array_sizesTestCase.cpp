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
#include "../ActsDeqpgles30025TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024399,
        "dEQP-GLES3.functional.texture.filt",
        "ering.2d_array.sizes.4x8x8_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024400,
        "dEQP-GLES3.functional.texture.fil",
        "tering.2d_array.sizes.4x8x8_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024401,
        "dEQP-GLES3.functional.texture.filtering.2",
        "d_array.sizes.4x8x8_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024402,
        "dEQP-GLES3.functional.texture.filtering.2",
        "d_array.sizes.4x8x8_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024403,
        "dEQP-GLES3.functional.texture.filtering.2",
        "d_array.sizes.4x8x8_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024404,
        "dEQP-GLES3.functional.texture.filtering.",
        "2d_array.sizes.4x8x8_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024405,
        "dEQP-GLES3.functional.texture.filte",
        "ring.2d_array.sizes.32x64x16_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024406,
        "dEQP-GLES3.functional.texture.filte",
        "ring.2d_array.sizes.32x64x16_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024407,
        "dEQP-GLES3.functional.texture.filtering.2d_",
        "array.sizes.32x64x16_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024408,
        "dEQP-GLES3.functional.texture.filtering.2d",
        "_array.sizes.32x64x16_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024409,
        "dEQP-GLES3.functional.texture.filtering.2d",
        "_array.sizes.32x64x16_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024410,
        "dEQP-GLES3.functional.texture.filtering.2d",
        "_array.sizes.32x64x16_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024411,
        "dEQP-GLES3.functional.texture.filter",
        "ing.2d_array.sizes.128x32x64_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024412,
        "dEQP-GLES3.functional.texture.filte",
        "ring.2d_array.sizes.128x32x64_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024413,
        "dEQP-GLES3.functional.texture.filtering.2d_",
        "array.sizes.128x32x64_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024414,
        "dEQP-GLES3.functional.texture.filtering.2d_",
        "array.sizes.128x32x64_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024415,
        "dEQP-GLES3.functional.texture.filtering.2d_",
        "array.sizes.128x32x64_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024416,
        "dEQP-GLES3.functional.texture.filtering.2d",
        "_array.sizes.128x32x64_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024417,
        "dEQP-GLES3.functional.texture.filt",
        "ering.2d_array.sizes.3x7x5_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024418,
        "dEQP-GLES3.functional.texture.fil",
        "tering.2d_array.sizes.3x7x5_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024419,
        "dEQP-GLES3.functional.texture.filtering.2",
        "d_array.sizes.3x7x5_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024420,
        "dEQP-GLES3.functional.texture.filtering.2",
        "d_array.sizes.3x7x5_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024421,
        "dEQP-GLES3.functional.texture.filtering.2",
        "d_array.sizes.3x7x5_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024422,
        "dEQP-GLES3.functional.texture.filtering.",
        "2d_array.sizes.3x7x5_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024423,
        "dEQP-GLES3.functional.texture.filte",
        "ring.2d_array.sizes.63x63x63_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024424,
        "dEQP-GLES3.functional.texture.filte",
        "ring.2d_array.sizes.63x63x63_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024425,
        "dEQP-GLES3.functional.texture.filtering.2d_",
        "array.sizes.63x63x63_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024426,
        "dEQP-GLES3.functional.texture.filtering.2d",
        "_array.sizes.63x63x63_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024427,
        "dEQP-GLES3.functional.texture.filtering.2d",
        "_array.sizes.63x63x63_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024428,
        "dEQP-GLES3.functional.texture.filtering.2d",
        "_array.sizes.63x63x63_linear_mipmap_linear");
