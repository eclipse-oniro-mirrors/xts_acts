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

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010956,
        "dEQP-GLES2.functional.texture.vertex",
        ".cube.filtering.nearest_nearest_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010957,
        "dEQP-GLES2.functional.texture.vertex.",
        "cube.filtering.nearest_nearest_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010958,
        "dEQP-GLES2.functional.texture.vertex.",
        "cube.filtering.nearest_nearest_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010959,
        "dEQP-GLES2.functional.texture.vertex",
        ".cube.filtering.nearest_linear_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010960,
        "dEQP-GLES2.functional.texture.vertex",
        ".cube.filtering.nearest_linear_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010961,
        "dEQP-GLES2.functional.texture.vertex",
        ".cube.filtering.nearest_linear_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010962,
        "dEQP-GLES2.functional.texture.vertex",
        ".cube.filtering.linear_nearest_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010963,
        "dEQP-GLES2.functional.texture.vertex",
        ".cube.filtering.linear_nearest_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010964,
        "dEQP-GLES2.functional.texture.vertex",
        ".cube.filtering.linear_nearest_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010965,
        "dEQP-GLES2.functional.texture.verte",
        "x.cube.filtering.linear_linear_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010966,
        "dEQP-GLES2.functional.texture.vertex",
        ".cube.filtering.linear_linear_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010967,
        "dEQP-GLES2.functional.texture.vertex",
        ".cube.filtering.linear_linear_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010968,
        "dEQP-GLES2.functional.texture.vertex.cube.fi",
        "ltering.nearest_mipmap_nearest_nearest_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010969,
        "dEQP-GLES2.functional.texture.vertex.cube.fi",
        "ltering.nearest_mipmap_nearest_nearest_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010970,
        "dEQP-GLES2.functional.texture.vertex.cube.fi",
        "ltering.nearest_mipmap_nearest_nearest_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010971,
        "dEQP-GLES2.functional.texture.vertex.cube.f",
        "iltering.nearest_mipmap_nearest_linear_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010972,
        "dEQP-GLES2.functional.texture.vertex.cube.fi",
        "ltering.nearest_mipmap_nearest_linear_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010973,
        "dEQP-GLES2.functional.texture.vertex.cube.fi",
        "ltering.nearest_mipmap_nearest_linear_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010974,
        "dEQP-GLES2.functional.texture.vertex.cube.f",
        "iltering.linear_mipmap_nearest_nearest_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010975,
        "dEQP-GLES2.functional.texture.vertex.cube.fi",
        "ltering.linear_mipmap_nearest_nearest_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010976,
        "dEQP-GLES2.functional.texture.vertex.cube.fi",
        "ltering.linear_mipmap_nearest_nearest_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010977,
        "dEQP-GLES2.functional.texture.vertex.cube.f",
        "iltering.linear_mipmap_nearest_linear_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010978,
        "dEQP-GLES2.functional.texture.vertex.cube.f",
        "iltering.linear_mipmap_nearest_linear_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010979,
        "dEQP-GLES2.functional.texture.vertex.cube.f",
        "iltering.linear_mipmap_nearest_linear_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010980,
        "dEQP-GLES2.functional.texture.vertex.cube.f",
        "iltering.nearest_mipmap_linear_nearest_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010981,
        "dEQP-GLES2.functional.texture.vertex.cube.fi",
        "ltering.nearest_mipmap_linear_nearest_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010982,
        "dEQP-GLES2.functional.texture.vertex.cube.fi",
        "ltering.nearest_mipmap_linear_nearest_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010983,
        "dEQP-GLES2.functional.texture.vertex.cube.f",
        "iltering.nearest_mipmap_linear_linear_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010984,
        "dEQP-GLES2.functional.texture.vertex.cube.f",
        "iltering.nearest_mipmap_linear_linear_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010985,
        "dEQP-GLES2.functional.texture.vertex.cube.f",
        "iltering.nearest_mipmap_linear_linear_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010986,
        "dEQP-GLES2.functional.texture.vertex.cube.f",
        "iltering.linear_mipmap_linear_nearest_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010987,
        "dEQP-GLES2.functional.texture.vertex.cube.f",
        "iltering.linear_mipmap_linear_nearest_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010988,
        "dEQP-GLES2.functional.texture.vertex.cube.f",
        "iltering.linear_mipmap_linear_nearest_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010989,
        "dEQP-GLES2.functional.texture.vertex.cube.",
        "filtering.linear_mipmap_linear_linear_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010990,
        "dEQP-GLES2.functional.texture.vertex.cube.f",
        "iltering.linear_mipmap_linear_linear_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010991,
        "dEQP-GLES2.functional.texture.vertex.cube.f",
        "iltering.linear_mipmap_linear_linear_mirror");
