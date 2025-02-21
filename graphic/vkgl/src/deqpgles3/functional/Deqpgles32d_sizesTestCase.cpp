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
#include "../ActsDeqpgles30024TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023965,
        "dEQP-GLES3.functional.texture.",
        "filtering.2d.sizes.4x8_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023966,
        "dEQP-GLES3.functional.texture",
        ".filtering.2d.sizes.4x8_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023967,
        "dEQP-GLES3.functional.texture.filteri",
        "ng.2d.sizes.4x8_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023968,
        "dEQP-GLES3.functional.texture.filteri",
        "ng.2d.sizes.4x8_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023969,
        "dEQP-GLES3.functional.texture.filteri",
        "ng.2d.sizes.4x8_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023970,
        "dEQP-GLES3.functional.texture.filter",
        "ing.2d.sizes.4x8_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023971,
        "dEQP-GLES3.functional.texture.f",
        "iltering.2d.sizes.32x64_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023972,
        "dEQP-GLES3.functional.texture.",
        "filtering.2d.sizes.32x64_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023973,
        "dEQP-GLES3.functional.texture.filterin",
        "g.2d.sizes.32x64_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023974,
        "dEQP-GLES3.functional.texture.filterin",
        "g.2d.sizes.32x64_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023975,
        "dEQP-GLES3.functional.texture.filterin",
        "g.2d.sizes.32x64_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023976,
        "dEQP-GLES3.functional.texture.filteri",
        "ng.2d.sizes.32x64_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023977,
        "dEQP-GLES3.functional.texture.fi",
        "ltering.2d.sizes.128x128_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023978,
        "dEQP-GLES3.functional.texture.f",
        "iltering.2d.sizes.128x128_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023979,
        "dEQP-GLES3.functional.texture.filtering",
        ".2d.sizes.128x128_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023980,
        "dEQP-GLES3.functional.texture.filtering",
        ".2d.sizes.128x128_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023981,
        "dEQP-GLES3.functional.texture.filtering",
        ".2d.sizes.128x128_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023982,
        "dEQP-GLES3.functional.texture.filterin",
        "g.2d.sizes.128x128_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023983,
        "dEQP-GLES3.functional.texture.",
        "filtering.2d.sizes.3x7_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023984,
        "dEQP-GLES3.functional.texture",
        ".filtering.2d.sizes.3x7_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023985,
        "dEQP-GLES3.functional.texture.filteri",
        "ng.2d.sizes.3x7_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023986,
        "dEQP-GLES3.functional.texture.filteri",
        "ng.2d.sizes.3x7_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023987,
        "dEQP-GLES3.functional.texture.filteri",
        "ng.2d.sizes.3x7_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023988,
        "dEQP-GLES3.functional.texture.filter",
        "ing.2d.sizes.3x7_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023989,
        "dEQP-GLES3.functional.texture.f",
        "iltering.2d.sizes.31x55_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023990,
        "dEQP-GLES3.functional.texture.",
        "filtering.2d.sizes.31x55_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023991,
        "dEQP-GLES3.functional.texture.filterin",
        "g.2d.sizes.31x55_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023992,
        "dEQP-GLES3.functional.texture.filterin",
        "g.2d.sizes.31x55_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023993,
        "dEQP-GLES3.functional.texture.filterin",
        "g.2d.sizes.31x55_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023994,
        "dEQP-GLES3.functional.texture.filteri",
        "ng.2d.sizes.31x55_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023995,
        "dEQP-GLES3.functional.texture.f",
        "iltering.2d.sizes.127x99_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023996,
        "dEQP-GLES3.functional.texture.f",
        "iltering.2d.sizes.127x99_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023997,
        "dEQP-GLES3.functional.texture.filtering",
        ".2d.sizes.127x99_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023998,
        "dEQP-GLES3.functional.texture.filterin",
        "g.2d.sizes.127x99_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_023999,
        "dEQP-GLES3.functional.texture.filterin",
        "g.2d.sizes.127x99_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30024TestSuite, TestCase_024000,
        "dEQP-GLES3.functional.texture.filterin",
        "g.2d.sizes.127x99_linear_mipmap_linear");
