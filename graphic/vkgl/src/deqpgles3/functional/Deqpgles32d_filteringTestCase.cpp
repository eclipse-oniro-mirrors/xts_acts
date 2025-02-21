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
#include "../ActsDeqpgles30027TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026948,
        "dEQP-GLES3.functional.texture.verte",
        "x.2d.filtering.nearest_nearest_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026949,
        "dEQP-GLES3.functional.texture.vertex",
        ".2d.filtering.nearest_nearest_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026950,
        "dEQP-GLES3.functional.texture.vertex",
        ".2d.filtering.nearest_nearest_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026951,
        "dEQP-GLES3.functional.texture.verte",
        "x.2d.filtering.nearest_linear_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026952,
        "dEQP-GLES3.functional.texture.verte",
        "x.2d.filtering.nearest_linear_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026953,
        "dEQP-GLES3.functional.texture.verte",
        "x.2d.filtering.nearest_linear_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026954,
        "dEQP-GLES3.functional.texture.verte",
        "x.2d.filtering.linear_nearest_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026955,
        "dEQP-GLES3.functional.texture.verte",
        "x.2d.filtering.linear_nearest_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026956,
        "dEQP-GLES3.functional.texture.verte",
        "x.2d.filtering.linear_nearest_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026957,
        "dEQP-GLES3.functional.texture.vert",
        "ex.2d.filtering.linear_linear_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026958,
        "dEQP-GLES3.functional.texture.verte",
        "x.2d.filtering.linear_linear_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026959,
        "dEQP-GLES3.functional.texture.verte",
        "x.2d.filtering.linear_linear_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026960,
        "dEQP-GLES3.functional.texture.vertex.2d.fil",
        "tering.nearest_mipmap_nearest_nearest_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026961,
        "dEQP-GLES3.functional.texture.vertex.2d.fil",
        "tering.nearest_mipmap_nearest_nearest_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026962,
        "dEQP-GLES3.functional.texture.vertex.2d.fil",
        "tering.nearest_mipmap_nearest_nearest_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026963,
        "dEQP-GLES3.functional.texture.vertex.2d.fi",
        "ltering.nearest_mipmap_nearest_linear_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026964,
        "dEQP-GLES3.functional.texture.vertex.2d.fil",
        "tering.nearest_mipmap_nearest_linear_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026965,
        "dEQP-GLES3.functional.texture.vertex.2d.fil",
        "tering.nearest_mipmap_nearest_linear_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026966,
        "dEQP-GLES3.functional.texture.vertex.2d.fi",
        "ltering.linear_mipmap_nearest_nearest_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026967,
        "dEQP-GLES3.functional.texture.vertex.2d.fil",
        "tering.linear_mipmap_nearest_nearest_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026968,
        "dEQP-GLES3.functional.texture.vertex.2d.fil",
        "tering.linear_mipmap_nearest_nearest_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026969,
        "dEQP-GLES3.functional.texture.vertex.2d.fi",
        "ltering.linear_mipmap_nearest_linear_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026970,
        "dEQP-GLES3.functional.texture.vertex.2d.fi",
        "ltering.linear_mipmap_nearest_linear_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026971,
        "dEQP-GLES3.functional.texture.vertex.2d.fi",
        "ltering.linear_mipmap_nearest_linear_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026972,
        "dEQP-GLES3.functional.texture.vertex.2d.fi",
        "ltering.nearest_mipmap_linear_nearest_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026973,
        "dEQP-GLES3.functional.texture.vertex.2d.fil",
        "tering.nearest_mipmap_linear_nearest_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026974,
        "dEQP-GLES3.functional.texture.vertex.2d.fil",
        "tering.nearest_mipmap_linear_nearest_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026975,
        "dEQP-GLES3.functional.texture.vertex.2d.fi",
        "ltering.nearest_mipmap_linear_linear_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026976,
        "dEQP-GLES3.functional.texture.vertex.2d.fi",
        "ltering.nearest_mipmap_linear_linear_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026977,
        "dEQP-GLES3.functional.texture.vertex.2d.fi",
        "ltering.nearest_mipmap_linear_linear_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026978,
        "dEQP-GLES3.functional.texture.vertex.2d.fi",
        "ltering.linear_mipmap_linear_nearest_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026979,
        "dEQP-GLES3.functional.texture.vertex.2d.fi",
        "ltering.linear_mipmap_linear_nearest_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026980,
        "dEQP-GLES3.functional.texture.vertex.2d.fi",
        "ltering.linear_mipmap_linear_nearest_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026981,
        "dEQP-GLES3.functional.texture.vertex.2d.f",
        "iltering.linear_mipmap_linear_linear_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026982,
        "dEQP-GLES3.functional.texture.vertex.2d.fi",
        "ltering.linear_mipmap_linear_linear_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026983,
        "dEQP-GLES3.functional.texture.vertex.2d.fi",
        "ltering.linear_mipmap_linear_linear_mirror");
