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
#include "../Khrgles2BaseFunc.h"
#include "../ActsGles2MainUncover0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000005,
        "dEQP-GLES2.functional.texture.mip",
        "map.2d.basic.nearest_nearest_clamp");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000006,
        "dEQP-GLES2.functional.texture.mipmap.2d",
        ".basic.nearest_nearest_clamp_non_square");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000007,
        "dEQP-GLES2.functional.texture.mipm",
        "ap.2d.basic.nearest_nearest_repeat");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000008,
        "dEQP-GLES2.functional.texture.mipmap.2d",
        ".basic.nearest_nearest_repeat_non_square");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000009,
        "dEQP-GLES2.functional.texture.mipm",
        "ap.2d.basic.nearest_nearest_mirror");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000010,
        "dEQP-GLES2.functional.texture.mipmap.2d",
        ".basic.nearest_nearest_mirror_non_square");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000011,
        "dEQP-GLES2.functional.texture.mip",
        "map.2d.basic.linear_nearest_clamp");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000012,
        "dEQP-GLES2.functional.texture.mipmap.2",
        "d.basic.linear_nearest_clamp_non_square");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000013,
        "dEQP-GLES2.functional.texture.mip",
        "map.2d.basic.linear_nearest_repeat");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000014,
        "dEQP-GLES2.functional.texture.mipmap.2d",
        ".basic.linear_nearest_repeat_non_square");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000015,
        "dEQP-GLES2.functional.texture.mip",
        "map.2d.basic.linear_nearest_mirror");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000016,
        "dEQP-GLES2.functional.texture.mipmap.2d",
        ".basic.linear_nearest_mirror_non_square");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000017,
        "dEQP-GLES2.functional.texture.mi",
        "pmap.2d.basic.linear_linear_clamp");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000018,
        "dEQP-GLES2.functional.texture.mipmap.2",
        "d.basic.linear_linear_clamp_non_square");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000019,
        "dEQP-GLES2.functional.texture.mip",
        "map.2d.basic.linear_linear_mirror");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000020,
        "dEQP-GLES2.functional.texture.mipmap.2",
        "d.basic.linear_linear_mirror_non_square");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000021,
        "dEQP-GLES2.functional.texture.mip",
        "map.2d.affine.linear_linear_clamp");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000022,
        "dEQP-GLES2.functional.texture.mip",
        "map.2d.affine.linear_linear_mirror");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000023,
        "dEQP-GLES2.functional.texture.mipma",
        "p.2d.projected.nearest_nearest_clamp");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000024,
        "dEQP-GLES2.functional.texture.mipmap",
        ".2d.projected.nearest_nearest_repeat");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000025,
        "dEQP-GLES2.functional.texture.mipmap",
        ".2d.projected.nearest_nearest_mirror");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000026,
        "dEQP-GLES2.functional.texture.mipma",
        "p.2d.projected.linear_nearest_clamp");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000027,
        "dEQP-GLES2.functional.texture.mipma",
        "p.2d.projected.linear_nearest_repeat");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000028,
        "dEQP-GLES2.functional.texture.mipma",
        "p.2d.projected.linear_nearest_mirror");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000029,
        "dEQP-GLES2.functional.texture.mipm",
        "ap.2d.projected.linear_linear_clamp");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000030,
        "dEQP-GLES2.functional.texture.mipma",
        "p.2d.projected.linear_linear_mirror");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000031,
        "dEQP-GLES2.functional.texture.",
        "mipmap.2d.bias.nearest_nearest");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000032,
        "dEQP-GLES2.functional.texture",
        ".mipmap.2d.bias.linear_nearest");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000033,
        "dEQP-GLES2.functional.texture",
        ".mipmap.2d.bias.nearest_linear");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000034,
        "dEQP-GLES2.functional.texture",
        ".mipmap.2d.bias.linear_linear");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000035,
        "dEQP-GLES2.functional.texture.m",
        "ipmap.cube.basic.nearest_nearest");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000036,
        "dEQP-GLES2.functional.texture.m",
        "ipmap.cube.basic.nearest_linear");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000037,
        "dEQP-GLES2.functional.texture.mip",
        "map.cube.projected.nearest_nearest");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000038,
        "dEQP-GLES2.functional.texture.mip",
        "map.cube.projected.nearest_linear");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000039,
        "dEQP-GLES2.functional.texture.m",
        "ipmap.cube.bias.nearest_nearest");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000040,
        "dEQP-GLES2.functional.texture.",
        "mipmap.cube.bias.nearest_linear");
