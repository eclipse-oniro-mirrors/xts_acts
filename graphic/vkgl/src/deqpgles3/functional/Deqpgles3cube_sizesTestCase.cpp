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

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024187,
        "dEQP-GLES3.functional.texture.f",
        "iltering.cube.sizes.8x8_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024188,
        "dEQP-GLES3.functional.texture.",
        "filtering.cube.sizes.8x8_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024189,
        "dEQP-GLES3.functional.texture.filterin",
        "g.cube.sizes.8x8_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024190,
        "dEQP-GLES3.functional.texture.filterin",
        "g.cube.sizes.8x8_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024191,
        "dEQP-GLES3.functional.texture.filterin",
        "g.cube.sizes.8x8_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024192,
        "dEQP-GLES3.functional.texture.filteri",
        "ng.cube.sizes.8x8_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024193,
        "dEQP-GLES3.functional.texture.fi",
        "ltering.cube.sizes.64x64_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024194,
        "dEQP-GLES3.functional.texture.f",
        "iltering.cube.sizes.64x64_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024195,
        "dEQP-GLES3.functional.texture.filtering",
        ".cube.sizes.64x64_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024196,
        "dEQP-GLES3.functional.texture.filtering",
        ".cube.sizes.64x64_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024197,
        "dEQP-GLES3.functional.texture.filtering",
        ".cube.sizes.64x64_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024198,
        "dEQP-GLES3.functional.texture.filterin",
        "g.cube.sizes.64x64_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024199,
        "dEQP-GLES3.functional.texture.fil",
        "tering.cube.sizes.128x128_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024200,
        "dEQP-GLES3.functional.texture.fi",
        "ltering.cube.sizes.128x128_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024201,
        "dEQP-GLES3.functional.texture.filtering.",
        "cube.sizes.128x128_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024202,
        "dEQP-GLES3.functional.texture.filtering.",
        "cube.sizes.128x128_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024203,
        "dEQP-GLES3.functional.texture.filtering.",
        "cube.sizes.128x128_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024204,
        "dEQP-GLES3.functional.texture.filtering",
        ".cube.sizes.128x128_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024205,
        "dEQP-GLES3.functional.texture.f",
        "iltering.cube.sizes.7x7_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024206,
        "dEQP-GLES3.functional.texture.",
        "filtering.cube.sizes.7x7_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024207,
        "dEQP-GLES3.functional.texture.filterin",
        "g.cube.sizes.7x7_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024208,
        "dEQP-GLES3.functional.texture.filterin",
        "g.cube.sizes.7x7_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024209,
        "dEQP-GLES3.functional.texture.filterin",
        "g.cube.sizes.7x7_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024210,
        "dEQP-GLES3.functional.texture.filteri",
        "ng.cube.sizes.7x7_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024211,
        "dEQP-GLES3.functional.texture.fi",
        "ltering.cube.sizes.63x63_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024212,
        "dEQP-GLES3.functional.texture.f",
        "iltering.cube.sizes.63x63_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024213,
        "dEQP-GLES3.functional.texture.filtering",
        ".cube.sizes.63x63_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024214,
        "dEQP-GLES3.functional.texture.filtering",
        ".cube.sizes.63x63_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024215,
        "dEQP-GLES3.functional.texture.filtering",
        ".cube.sizes.63x63_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024216,
        "dEQP-GLES3.functional.texture.filterin",
        "g.cube.sizes.63x63_linear_mipmap_linear");
