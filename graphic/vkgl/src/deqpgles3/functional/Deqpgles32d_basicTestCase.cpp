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

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024963,
        "dEQP-GLES3.functional.texture.mip",
        "map.2d.basic.nearest_nearest_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024964,
        "dEQP-GLES3.functional.texture.mipmap",
        ".2d.basic.nearest_nearest_clamp_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024965,
        "dEQP-GLES3.functional.texture.mipmap.2d",
        ".basic.nearest_nearest_clamp_non_square");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024966,
        "dEQP-GLES3.functional.texture.mipm",
        "ap.2d.basic.nearest_nearest_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024967,
        "dEQP-GLES3.functional.texture.mipmap",
        ".2d.basic.nearest_nearest_repeat_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024968,
        "dEQP-GLES3.functional.texture.mipmap.2d",
        ".basic.nearest_nearest_repeat_non_square");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024969,
        "dEQP-GLES3.functional.texture.mipm",
        "ap.2d.basic.nearest_nearest_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024970,
        "dEQP-GLES3.functional.texture.mipmap",
        ".2d.basic.nearest_nearest_mirror_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024971,
        "dEQP-GLES3.functional.texture.mipmap.2d",
        ".basic.nearest_nearest_mirror_non_square");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024972,
        "dEQP-GLES3.functional.texture.mip",
        "map.2d.basic.linear_nearest_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024973,
        "dEQP-GLES3.functional.texture.mipma",
        "p.2d.basic.linear_nearest_clamp_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024974,
        "dEQP-GLES3.functional.texture.mipmap.2",
        "d.basic.linear_nearest_clamp_non_square");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024975,
        "dEQP-GLES3.functional.texture.mip",
        "map.2d.basic.linear_nearest_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024976,
        "dEQP-GLES3.functional.texture.mipmap",
        ".2d.basic.linear_nearest_repeat_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024977,
        "dEQP-GLES3.functional.texture.mipmap.2d",
        ".basic.linear_nearest_repeat_non_square");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024978,
        "dEQP-GLES3.functional.texture.mip",
        "map.2d.basic.linear_nearest_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024979,
        "dEQP-GLES3.functional.texture.mipmap",
        ".2d.basic.linear_nearest_mirror_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024980,
        "dEQP-GLES3.functional.texture.mipmap.2d",
        ".basic.linear_nearest_mirror_non_square");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024981,
        "dEQP-GLES3.functional.texture.mip",
        "map.2d.basic.nearest_linear_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024982,
        "dEQP-GLES3.functional.texture.mipma",
        "p.2d.basic.nearest_linear_clamp_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024983,
        "dEQP-GLES3.functional.texture.mipmap.2",
        "d.basic.nearest_linear_clamp_non_square");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024984,
        "dEQP-GLES3.functional.texture.mip",
        "map.2d.basic.nearest_linear_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024985,
        "dEQP-GLES3.functional.texture.mipmap",
        ".2d.basic.nearest_linear_repeat_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024986,
        "dEQP-GLES3.functional.texture.mipmap.2d",
        ".basic.nearest_linear_repeat_non_square");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024987,
        "dEQP-GLES3.functional.texture.mip",
        "map.2d.basic.nearest_linear_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024988,
        "dEQP-GLES3.functional.texture.mipmap",
        ".2d.basic.nearest_linear_mirror_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024989,
        "dEQP-GLES3.functional.texture.mipmap.2d",
        ".basic.nearest_linear_mirror_non_square");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024990,
        "dEQP-GLES3.functional.texture.mi",
        "pmap.2d.basic.linear_linear_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024991,
        "dEQP-GLES3.functional.texture.mipma",
        "p.2d.basic.linear_linear_clamp_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024992,
        "dEQP-GLES3.functional.texture.mipmap.2",
        "d.basic.linear_linear_clamp_non_square");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024993,
        "dEQP-GLES3.functional.texture.mip",
        "map.2d.basic.linear_linear_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024994,
        "dEQP-GLES3.functional.texture.mipma",
        "p.2d.basic.linear_linear_repeat_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024995,
        "dEQP-GLES3.functional.texture.mipmap.2",
        "d.basic.linear_linear_repeat_non_square");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024996,
        "dEQP-GLES3.functional.texture.mip",
        "map.2d.basic.linear_linear_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024997,
        "dEQP-GLES3.functional.texture.mipma",
        "p.2d.basic.linear_linear_mirror_npot");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024998,
        "dEQP-GLES3.functional.texture.mipmap.2",
        "d.basic.linear_linear_mirror_non_square");
