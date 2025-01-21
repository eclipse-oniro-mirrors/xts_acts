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

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026993,
        "dEQP-GLES3.functional.texture.vertex",
        ".cube.filtering.nearest_nearest_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026994,
        "dEQP-GLES3.functional.texture.vertex.",
        "cube.filtering.nearest_nearest_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026995,
        "dEQP-GLES3.functional.texture.vertex.",
        "cube.filtering.nearest_nearest_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026996,
        "dEQP-GLES3.functional.texture.vertex",
        ".cube.filtering.nearest_linear_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026997,
        "dEQP-GLES3.functional.texture.vertex",
        ".cube.filtering.nearest_linear_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026998,
        "dEQP-GLES3.functional.texture.vertex",
        ".cube.filtering.nearest_linear_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026999,
        "dEQP-GLES3.functional.texture.vertex",
        ".cube.filtering.linear_nearest_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_027000,
        "dEQP-GLES3.functional.texture.vertex",
        ".cube.filtering.linear_nearest_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_027001,
        "dEQP-GLES3.functional.texture.vertex",
        ".cube.filtering.linear_nearest_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_027002,
        "dEQP-GLES3.functional.texture.verte",
        "x.cube.filtering.linear_linear_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_027003,
        "dEQP-GLES3.functional.texture.vertex",
        ".cube.filtering.linear_linear_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_027004,
        "dEQP-GLES3.functional.texture.vertex",
        ".cube.filtering.linear_linear_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_027005,
        "dEQP-GLES3.functional.texture.vertex.cube.fi",
        "ltering.nearest_mipmap_nearest_nearest_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_027006,
        "dEQP-GLES3.functional.texture.vertex.cube.fi",
        "ltering.nearest_mipmap_nearest_nearest_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_027007,
        "dEQP-GLES3.functional.texture.vertex.cube.fi",
        "ltering.nearest_mipmap_nearest_nearest_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_027008,
        "dEQP-GLES3.functional.texture.vertex.cube.f",
        "iltering.nearest_mipmap_nearest_linear_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_027009,
        "dEQP-GLES3.functional.texture.vertex.cube.fi",
        "ltering.nearest_mipmap_nearest_linear_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_027010,
        "dEQP-GLES3.functional.texture.vertex.cube.fi",
        "ltering.nearest_mipmap_nearest_linear_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_027011,
        "dEQP-GLES3.functional.texture.vertex.cube.f",
        "iltering.linear_mipmap_nearest_nearest_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_027012,
        "dEQP-GLES3.functional.texture.vertex.cube.fi",
        "ltering.linear_mipmap_nearest_nearest_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_027013,
        "dEQP-GLES3.functional.texture.vertex.cube.fi",
        "ltering.linear_mipmap_nearest_nearest_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_027014,
        "dEQP-GLES3.functional.texture.vertex.cube.f",
        "iltering.linear_mipmap_nearest_linear_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_027015,
        "dEQP-GLES3.functional.texture.vertex.cube.f",
        "iltering.linear_mipmap_nearest_linear_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_027016,
        "dEQP-GLES3.functional.texture.vertex.cube.f",
        "iltering.linear_mipmap_nearest_linear_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_027017,
        "dEQP-GLES3.functional.texture.vertex.cube.f",
        "iltering.nearest_mipmap_linear_nearest_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_027018,
        "dEQP-GLES3.functional.texture.vertex.cube.fi",
        "ltering.nearest_mipmap_linear_nearest_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_027019,
        "dEQP-GLES3.functional.texture.vertex.cube.fi",
        "ltering.nearest_mipmap_linear_nearest_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_027020,
        "dEQP-GLES3.functional.texture.vertex.cube.f",
        "iltering.nearest_mipmap_linear_linear_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_027021,
        "dEQP-GLES3.functional.texture.vertex.cube.f",
        "iltering.nearest_mipmap_linear_linear_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_027022,
        "dEQP-GLES3.functional.texture.vertex.cube.f",
        "iltering.nearest_mipmap_linear_linear_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_027023,
        "dEQP-GLES3.functional.texture.vertex.cube.f",
        "iltering.linear_mipmap_linear_nearest_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_027024,
        "dEQP-GLES3.functional.texture.vertex.cube.f",
        "iltering.linear_mipmap_linear_nearest_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_027025,
        "dEQP-GLES3.functional.texture.vertex.cube.f",
        "iltering.linear_mipmap_linear_nearest_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_027026,
        "dEQP-GLES3.functional.texture.vertex.cube.",
        "filtering.linear_mipmap_linear_linear_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_027027,
        "dEQP-GLES3.functional.texture.vertex.cube.f",
        "iltering.linear_mipmap_linear_linear_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_027028,
        "dEQP-GLES3.functional.texture.vertex.cube.f",
        "iltering.linear_mipmap_linear_linear_mirror");
