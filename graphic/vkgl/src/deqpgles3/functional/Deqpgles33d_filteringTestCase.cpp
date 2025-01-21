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

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027083,
        "dEQP-GLES3.functional.texture.verte",
        "x.3d.filtering.nearest_nearest_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027084,
        "dEQP-GLES3.functional.texture.vertex",
        ".3d.filtering.nearest_nearest_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027085,
        "dEQP-GLES3.functional.texture.vertex",
        ".3d.filtering.nearest_nearest_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027086,
        "dEQP-GLES3.functional.texture.verte",
        "x.3d.filtering.nearest_linear_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027087,
        "dEQP-GLES3.functional.texture.verte",
        "x.3d.filtering.nearest_linear_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027088,
        "dEQP-GLES3.functional.texture.verte",
        "x.3d.filtering.nearest_linear_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027089,
        "dEQP-GLES3.functional.texture.verte",
        "x.3d.filtering.linear_nearest_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027090,
        "dEQP-GLES3.functional.texture.verte",
        "x.3d.filtering.linear_nearest_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027091,
        "dEQP-GLES3.functional.texture.verte",
        "x.3d.filtering.linear_nearest_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027092,
        "dEQP-GLES3.functional.texture.vert",
        "ex.3d.filtering.linear_linear_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027093,
        "dEQP-GLES3.functional.texture.verte",
        "x.3d.filtering.linear_linear_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027094,
        "dEQP-GLES3.functional.texture.verte",
        "x.3d.filtering.linear_linear_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027095,
        "dEQP-GLES3.functional.texture.vertex.3d.fil",
        "tering.nearest_mipmap_nearest_nearest_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027096,
        "dEQP-GLES3.functional.texture.vertex.3d.fil",
        "tering.nearest_mipmap_nearest_nearest_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027097,
        "dEQP-GLES3.functional.texture.vertex.3d.fil",
        "tering.nearest_mipmap_nearest_nearest_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027098,
        "dEQP-GLES3.functional.texture.vertex.3d.fi",
        "ltering.nearest_mipmap_nearest_linear_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027099,
        "dEQP-GLES3.functional.texture.vertex.3d.fil",
        "tering.nearest_mipmap_nearest_linear_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027100,
        "dEQP-GLES3.functional.texture.vertex.3d.fil",
        "tering.nearest_mipmap_nearest_linear_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027101,
        "dEQP-GLES3.functional.texture.vertex.3d.fi",
        "ltering.linear_mipmap_nearest_nearest_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027102,
        "dEQP-GLES3.functional.texture.vertex.3d.fil",
        "tering.linear_mipmap_nearest_nearest_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027103,
        "dEQP-GLES3.functional.texture.vertex.3d.fil",
        "tering.linear_mipmap_nearest_nearest_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027104,
        "dEQP-GLES3.functional.texture.vertex.3d.fi",
        "ltering.linear_mipmap_nearest_linear_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027105,
        "dEQP-GLES3.functional.texture.vertex.3d.fi",
        "ltering.linear_mipmap_nearest_linear_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027106,
        "dEQP-GLES3.functional.texture.vertex.3d.fi",
        "ltering.linear_mipmap_nearest_linear_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027107,
        "dEQP-GLES3.functional.texture.vertex.3d.fi",
        "ltering.nearest_mipmap_linear_nearest_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027108,
        "dEQP-GLES3.functional.texture.vertex.3d.fil",
        "tering.nearest_mipmap_linear_nearest_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027109,
        "dEQP-GLES3.functional.texture.vertex.3d.fil",
        "tering.nearest_mipmap_linear_nearest_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027110,
        "dEQP-GLES3.functional.texture.vertex.3d.fi",
        "ltering.nearest_mipmap_linear_linear_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027111,
        "dEQP-GLES3.functional.texture.vertex.3d.fi",
        "ltering.nearest_mipmap_linear_linear_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027112,
        "dEQP-GLES3.functional.texture.vertex.3d.fi",
        "ltering.nearest_mipmap_linear_linear_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027113,
        "dEQP-GLES3.functional.texture.vertex.3d.fi",
        "ltering.linear_mipmap_linear_nearest_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027114,
        "dEQP-GLES3.functional.texture.vertex.3d.fi",
        "ltering.linear_mipmap_linear_nearest_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027115,
        "dEQP-GLES3.functional.texture.vertex.3d.fi",
        "ltering.linear_mipmap_linear_nearest_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027116,
        "dEQP-GLES3.functional.texture.vertex.3d.f",
        "iltering.linear_mipmap_linear_linear_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027117,
        "dEQP-GLES3.functional.texture.vertex.3d.fi",
        "ltering.linear_mipmap_linear_linear_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30028TestSuite, TestCase_027118,
        "dEQP-GLES3.functional.texture.vertex.3d.fi",
        "ltering.linear_mipmap_linear_linear_mirror");
