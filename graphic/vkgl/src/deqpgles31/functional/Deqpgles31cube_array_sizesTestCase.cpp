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
#include "../Deqpgles31BaseFunc.h"
#include "../ActsDeqpgles310013TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012351,
        "dEQP-GLES31.functional.texture.filt",
        "ering.cube_array.sizes.8x8x6_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012352,
        "dEQP-GLES31.functional.texture.filt",
        "ering.cube_array.sizes.8x8x6_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012353,
        "dEQP-GLES31.functional.texture.filtering.cu",
        "be_array.sizes.8x8x6_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012354,
        "dEQP-GLES31.functional.texture.filtering.c",
        "ube_array.sizes.8x8x6_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012355,
        "dEQP-GLES31.functional.texture.filtering.c",
        "ube_array.sizes.8x8x6_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012356,
        "dEQP-GLES31.functional.texture.filtering.c",
        "ube_array.sizes.8x8x6_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012357,
        "dEQP-GLES31.functional.texture.filter",
        "ing.cube_array.sizes.64x64x12_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012358,
        "dEQP-GLES31.functional.texture.filte",
        "ring.cube_array.sizes.64x64x12_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012359,
        "dEQP-GLES31.functional.texture.filtering.cub",
        "e_array.sizes.64x64x12_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012360,
        "dEQP-GLES31.functional.texture.filtering.cub",
        "e_array.sizes.64x64x12_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012361,
        "dEQP-GLES31.functional.texture.filtering.cub",
        "e_array.sizes.64x64x12_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012362,
        "dEQP-GLES31.functional.texture.filtering.cu",
        "be_array.sizes.64x64x12_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012363,
        "dEQP-GLES31.functional.texture.filteri",
        "ng.cube_array.sizes.128x128x12_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012364,
        "dEQP-GLES31.functional.texture.filter",
        "ing.cube_array.sizes.128x128x12_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012365,
        "dEQP-GLES31.functional.texture.filtering.cube",
        "_array.sizes.128x128x12_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012366,
        "dEQP-GLES31.functional.texture.filtering.cube",
        "_array.sizes.128x128x12_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012367,
        "dEQP-GLES31.functional.texture.filtering.cube",
        "_array.sizes.128x128x12_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012368,
        "dEQP-GLES31.functional.texture.filtering.cub",
        "e_array.sizes.128x128x12_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012369,
        "dEQP-GLES31.functional.texture.filte",
        "ring.cube_array.sizes.7x7x12_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012370,
        "dEQP-GLES31.functional.texture.filt",
        "ering.cube_array.sizes.7x7x12_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012371,
        "dEQP-GLES31.functional.texture.filtering.cu",
        "be_array.sizes.7x7x12_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012372,
        "dEQP-GLES31.functional.texture.filtering.cu",
        "be_array.sizes.7x7x12_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012373,
        "dEQP-GLES31.functional.texture.filtering.cu",
        "be_array.sizes.7x7x12_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012374,
        "dEQP-GLES31.functional.texture.filtering.c",
        "ube_array.sizes.7x7x12_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012375,
        "dEQP-GLES31.functional.texture.filter",
        "ing.cube_array.sizes.63x63x18_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012376,
        "dEQP-GLES31.functional.texture.filte",
        "ring.cube_array.sizes.63x63x18_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012377,
        "dEQP-GLES31.functional.texture.filtering.cub",
        "e_array.sizes.63x63x18_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012378,
        "dEQP-GLES31.functional.texture.filtering.cub",
        "e_array.sizes.63x63x18_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012379,
        "dEQP-GLES31.functional.texture.filtering.cub",
        "e_array.sizes.63x63x18_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles310013TestSuite, TestCase_012380,
        "dEQP-GLES31.functional.texture.filtering.cu",
        "be_array.sizes.63x63x18_linear_mipmap_linear");
