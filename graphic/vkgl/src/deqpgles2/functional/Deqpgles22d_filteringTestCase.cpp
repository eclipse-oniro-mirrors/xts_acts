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
#include "../Deqpgles2BaseFunc.h"
#include "../ActsDeqpgles20011TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010911,
        "dEQP-GLES2.functional.texture.verte",
        "x.2d.filtering.nearest_nearest_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010912,
        "dEQP-GLES2.functional.texture.vertex",
        ".2d.filtering.nearest_nearest_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010913,
        "dEQP-GLES2.functional.texture.vertex",
        ".2d.filtering.nearest_nearest_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010914,
        "dEQP-GLES2.functional.texture.verte",
        "x.2d.filtering.nearest_linear_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010915,
        "dEQP-GLES2.functional.texture.verte",
        "x.2d.filtering.nearest_linear_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010916,
        "dEQP-GLES2.functional.texture.verte",
        "x.2d.filtering.nearest_linear_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010917,
        "dEQP-GLES2.functional.texture.verte",
        "x.2d.filtering.linear_nearest_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010918,
        "dEQP-GLES2.functional.texture.verte",
        "x.2d.filtering.linear_nearest_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010919,
        "dEQP-GLES2.functional.texture.verte",
        "x.2d.filtering.linear_nearest_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010920,
        "dEQP-GLES2.functional.texture.vert",
        "ex.2d.filtering.linear_linear_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010921,
        "dEQP-GLES2.functional.texture.verte",
        "x.2d.filtering.linear_linear_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010922,
        "dEQP-GLES2.functional.texture.verte",
        "x.2d.filtering.linear_linear_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010923,
        "dEQP-GLES2.functional.texture.vertex.2d.fil",
        "tering.nearest_mipmap_nearest_nearest_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010924,
        "dEQP-GLES2.functional.texture.vertex.2d.fil",
        "tering.nearest_mipmap_nearest_nearest_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010925,
        "dEQP-GLES2.functional.texture.vertex.2d.fil",
        "tering.nearest_mipmap_nearest_nearest_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010926,
        "dEQP-GLES2.functional.texture.vertex.2d.fi",
        "ltering.nearest_mipmap_nearest_linear_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010927,
        "dEQP-GLES2.functional.texture.vertex.2d.fil",
        "tering.nearest_mipmap_nearest_linear_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010928,
        "dEQP-GLES2.functional.texture.vertex.2d.fil",
        "tering.nearest_mipmap_nearest_linear_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010929,
        "dEQP-GLES2.functional.texture.vertex.2d.fi",
        "ltering.linear_mipmap_nearest_nearest_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010930,
        "dEQP-GLES2.functional.texture.vertex.2d.fil",
        "tering.linear_mipmap_nearest_nearest_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010931,
        "dEQP-GLES2.functional.texture.vertex.2d.fil",
        "tering.linear_mipmap_nearest_nearest_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010932,
        "dEQP-GLES2.functional.texture.vertex.2d.fi",
        "ltering.linear_mipmap_nearest_linear_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010933,
        "dEQP-GLES2.functional.texture.vertex.2d.fi",
        "ltering.linear_mipmap_nearest_linear_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010934,
        "dEQP-GLES2.functional.texture.vertex.2d.fi",
        "ltering.linear_mipmap_nearest_linear_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010935,
        "dEQP-GLES2.functional.texture.vertex.2d.fi",
        "ltering.nearest_mipmap_linear_nearest_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010936,
        "dEQP-GLES2.functional.texture.vertex.2d.fil",
        "tering.nearest_mipmap_linear_nearest_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010937,
        "dEQP-GLES2.functional.texture.vertex.2d.fil",
        "tering.nearest_mipmap_linear_nearest_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010938,
        "dEQP-GLES2.functional.texture.vertex.2d.fi",
        "ltering.nearest_mipmap_linear_linear_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010939,
        "dEQP-GLES2.functional.texture.vertex.2d.fi",
        "ltering.nearest_mipmap_linear_linear_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010940,
        "dEQP-GLES2.functional.texture.vertex.2d.fi",
        "ltering.nearest_mipmap_linear_linear_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010941,
        "dEQP-GLES2.functional.texture.vertex.2d.fi",
        "ltering.linear_mipmap_linear_nearest_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010942,
        "dEQP-GLES2.functional.texture.vertex.2d.fi",
        "ltering.linear_mipmap_linear_nearest_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010943,
        "dEQP-GLES2.functional.texture.vertex.2d.fi",
        "ltering.linear_mipmap_linear_nearest_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010944,
        "dEQP-GLES2.functional.texture.vertex.2d.f",
        "iltering.linear_mipmap_linear_linear_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010945,
        "dEQP-GLES2.functional.texture.vertex.2d.fi",
        "ltering.linear_mipmap_linear_linear_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010946,
        "dEQP-GLES2.functional.texture.vertex.2d.fi",
        "ltering.linear_mipmap_linear_linear_mirror");
