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
#include "../Khrgles3BaseFunc.h"
#include "../ActsGles3MainUncover0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000203,
        "dEQP-GLES3.functional.texture.f",
        "iltering.2d.formats.bgra_nearest");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000204,
        "dEQP-GLES3.functional.texture.f",
        "iltering.2d.formats.bgra_linear");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000205,
        "dEQP-GLES3.functional.texture.filtering",
        ".2d.formats.bgra_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000206,
        "dEQP-GLES3.functional.texture.filterin",
        "g.2d.formats.bgra_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000207,
        "dEQP-GLES3.functional.texture.filterin",
        "g.2d.formats.bgra_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000208,
        "dEQP-GLES3.functional.texture.filterin",
        "g.2d.formats.bgra_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000209,
        "dEQP-GLES3.functional.texture.fi",
        "ltering.2d.formats.bgra8_nearest");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000210,
        "dEQP-GLES3.functional.texture.f",
        "iltering.2d.formats.bgra8_linear");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000211,
        "dEQP-GLES3.functional.texture.filtering",
        ".2d.formats.bgra8_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000212,
        "dEQP-GLES3.functional.texture.filtering",
        ".2d.formats.bgra8_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000213,
        "dEQP-GLES3.functional.texture.filtering",
        ".2d.formats.bgra8_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000214,
        "dEQP-GLES3.functional.texture.filterin",
        "g.2d.formats.bgra8_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000215,
        "dEQP-GLES3.functional.texture.fi",
        "ltering.cube.formats.bgra_nearest");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000216,
        "dEQP-GLES3.functional.texture.fi",
        "ltering.cube.formats.bgra_linear");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000217,
        "dEQP-GLES3.functional.texture.filtering.",
        "cube.formats.bgra_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000218,
        "dEQP-GLES3.functional.texture.filtering",
        ".cube.formats.bgra_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000219,
        "dEQP-GLES3.functional.texture.filtering",
        ".cube.formats.bgra_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000220,
        "dEQP-GLES3.functional.texture.filtering",
        ".cube.formats.bgra_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000221,
        "dEQP-GLES3.functional.texture.fil",
        "tering.cube.formats.bgra8_nearest");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000222,
        "dEQP-GLES3.functional.texture.fi",
        "ltering.cube.formats.bgra8_linear");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000223,
        "dEQP-GLES3.functional.texture.filtering.",
        "cube.formats.bgra8_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000224,
        "dEQP-GLES3.functional.texture.filtering.",
        "cube.formats.bgra8_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000225,
        "dEQP-GLES3.functional.texture.filtering.",
        "cube.formats.bgra8_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000226,
        "dEQP-GLES3.functional.texture.filtering",
        ".cube.formats.bgra8_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000227,
        "dEQP-GLES3.functional.texture.filt",
        "ering.2d_array.formats.bgra_nearest");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000228,
        "dEQP-GLES3.functional.texture.filt",
        "ering.2d_array.formats.bgra_linear");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000229,
        "dEQP-GLES3.functional.texture.filtering.2d",
        "_array.formats.bgra_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000230,
        "dEQP-GLES3.functional.texture.filtering.2",
        "d_array.formats.bgra_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000231,
        "dEQP-GLES3.functional.texture.filtering.2",
        "d_array.formats.bgra_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000232,
        "dEQP-GLES3.functional.texture.filtering.2",
        "d_array.formats.bgra_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000233,
        "dEQP-GLES3.functional.texture.filte",
        "ring.2d_array.formats.bgra8_nearest");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000234,
        "dEQP-GLES3.functional.texture.filt",
        "ering.2d_array.formats.bgra8_linear");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000235,
        "dEQP-GLES3.functional.texture.filtering.2d",
        "_array.formats.bgra8_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000236,
        "dEQP-GLES3.functional.texture.filtering.2d",
        "_array.formats.bgra8_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000237,
        "dEQP-GLES3.functional.texture.filtering.2d",
        "_array.formats.bgra8_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000238,
        "dEQP-GLES3.functional.texture.filtering.2",
        "d_array.formats.bgra8_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000239,
        "dEQP-GLES3.functional.texture.f",
        "iltering.3d.formats.bgra_nearest");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000240,
        "dEQP-GLES3.functional.texture.f",
        "iltering.3d.formats.bgra_linear");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000241,
        "dEQP-GLES3.functional.texture.filtering",
        ".3d.formats.bgra_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000242,
        "dEQP-GLES3.functional.texture.filterin",
        "g.3d.formats.bgra_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000243,
        "dEQP-GLES3.functional.texture.filterin",
        "g.3d.formats.bgra_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000244,
        "dEQP-GLES3.functional.texture.filterin",
        "g.3d.formats.bgra_linear_mipmap_linear");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000245,
        "dEQP-GLES3.functional.texture.fi",
        "ltering.3d.formats.bgra8_nearest");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000246,
        "dEQP-GLES3.functional.texture.f",
        "iltering.3d.formats.bgra8_linear");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000247,
        "dEQP-GLES3.functional.texture.filtering",
        ".3d.formats.bgra8_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000248,
        "dEQP-GLES3.functional.texture.filtering",
        ".3d.formats.bgra8_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000249,
        "dEQP-GLES3.functional.texture.filtering",
        ".3d.formats.bgra8_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000250,
        "dEQP-GLES3.functional.texture.filterin",
        "g.3d.formats.bgra8_linear_mipmap_linear");
