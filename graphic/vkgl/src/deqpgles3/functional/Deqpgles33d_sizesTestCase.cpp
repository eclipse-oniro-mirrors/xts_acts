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

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024609,
        "dEQP-GLES3.functional.texture.f",
        "iltering.3d.sizes.4x8x8_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024610,
        "dEQP-GLES3.functional.texture.",
        "filtering.3d.sizes.4x8x8_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024611,
        "dEQP-GLES3.functional.texture.filterin",
        "g.3d.sizes.4x8x8_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024612,
        "dEQP-GLES3.functional.texture.filterin",
        "g.3d.sizes.4x8x8_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024613,
        "dEQP-GLES3.functional.texture.filterin",
        "g.3d.sizes.4x8x8_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024614,
        "dEQP-GLES3.functional.texture.filteri",
        "ng.3d.sizes.4x8x8_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024615,
        "dEQP-GLES3.functional.texture.fi",
        "ltering.3d.sizes.32x64x16_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024616,
        "dEQP-GLES3.functional.texture.fi",
        "ltering.3d.sizes.32x64x16_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024617,
        "dEQP-GLES3.functional.texture.filtering.",
        "3d.sizes.32x64x16_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024618,
        "dEQP-GLES3.functional.texture.filtering",
        ".3d.sizes.32x64x16_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024619,
        "dEQP-GLES3.functional.texture.filtering",
        ".3d.sizes.32x64x16_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024620,
        "dEQP-GLES3.functional.texture.filtering",
        ".3d.sizes.32x64x16_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024621,
        "dEQP-GLES3.functional.texture.fil",
        "tering.3d.sizes.128x32x64_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024622,
        "dEQP-GLES3.functional.texture.fi",
        "ltering.3d.sizes.128x32x64_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024623,
        "dEQP-GLES3.functional.texture.filtering.",
        "3d.sizes.128x32x64_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024624,
        "dEQP-GLES3.functional.texture.filtering.",
        "3d.sizes.128x32x64_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024625,
        "dEQP-GLES3.functional.texture.filtering.",
        "3d.sizes.128x32x64_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024626,
        "dEQP-GLES3.functional.texture.filtering",
        ".3d.sizes.128x32x64_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024627,
        "dEQP-GLES3.functional.texture.f",
        "iltering.3d.sizes.3x7x5_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024628,
        "dEQP-GLES3.functional.texture.",
        "filtering.3d.sizes.3x7x5_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024629,
        "dEQP-GLES3.functional.texture.filterin",
        "g.3d.sizes.3x7x5_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024630,
        "dEQP-GLES3.functional.texture.filterin",
        "g.3d.sizes.3x7x5_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024631,
        "dEQP-GLES3.functional.texture.filterin",
        "g.3d.sizes.3x7x5_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024632,
        "dEQP-GLES3.functional.texture.filteri",
        "ng.3d.sizes.3x7x5_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024633,
        "dEQP-GLES3.functional.texture.fi",
        "ltering.3d.sizes.63x63x63_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024634,
        "dEQP-GLES3.functional.texture.fi",
        "ltering.3d.sizes.63x63x63_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024635,
        "dEQP-GLES3.functional.texture.filtering.",
        "3d.sizes.63x63x63_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024636,
        "dEQP-GLES3.functional.texture.filtering",
        ".3d.sizes.63x63x63_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024637,
        "dEQP-GLES3.functional.texture.filtering",
        ".3d.sizes.63x63x63_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024638,
        "dEQP-GLES3.functional.texture.filtering",
        ".3d.sizes.63x63x63_linear_mipmap_linear");
