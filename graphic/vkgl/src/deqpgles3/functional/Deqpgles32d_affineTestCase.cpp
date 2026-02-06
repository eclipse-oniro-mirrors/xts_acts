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

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_024999,
        "dEQP-GLES3.functional.texture.mipm",
        "ap.2d.affine.nearest_nearest_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_025000,
        "dEQP-GLES3.functional.texture.mipm",
        "ap.2d.affine.nearest_nearest_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_025001,
        "dEQP-GLES3.functional.texture.mipm",
        "ap.2d.affine.nearest_nearest_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_025002,
        "dEQP-GLES3.functional.texture.mip",
        "map.2d.affine.linear_nearest_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_025003,
        "dEQP-GLES3.functional.texture.mipm",
        "ap.2d.affine.linear_nearest_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_025004,
        "dEQP-GLES3.functional.texture.mipm",
        "ap.2d.affine.linear_nearest_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_025005,
        "dEQP-GLES3.functional.texture.mip",
        "map.2d.affine.nearest_linear_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_025006,
        "dEQP-GLES3.functional.texture.mipm",
        "ap.2d.affine.nearest_linear_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_025007,
        "dEQP-GLES3.functional.texture.mipm",
        "ap.2d.affine.nearest_linear_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_025008,
        "dEQP-GLES3.functional.texture.mip",
        "map.2d.affine.linear_linear_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_025009,
        "dEQP-GLES3.functional.texture.mip",
        "map.2d.affine.linear_linear_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles30025TestSuite, TestCase_025010,
        "dEQP-GLES3.functional.texture.mip",
        "map.2d.affine.linear_linear_mirror");
