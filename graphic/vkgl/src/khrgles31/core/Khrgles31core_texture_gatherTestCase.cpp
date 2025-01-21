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
#include "../Khrgles31BaseFunc.h"
#include "../ActsKhrgles310001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000089,
        "KHR-GLES31.core.text",
        "ure_gather.api-enums");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000090,
        "KHR-GLES31.core.texture_g",
        "ather.gather-glsl-compile");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000091,
        "KHR-GLES31.core.texture_ga",
        "ther.plain-gather-float-2d");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000092,
        "KHR-GLES31.core.texture_g",
        "ather.plain-gather-int-2d");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000093,
        "KHR-GLES31.core.texture_g",
        "ather.plain-gather-uint-2d");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000094,
        "KHR-GLES31.core.texture_ga",
        "ther.plain-gather-depth-2d");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000095,
        "KHR-GLES31.core.texture_gath",
        "er.plain-gather-float-2darray");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000096,
        "KHR-GLES31.core.texture_gat",
        "her.plain-gather-int-2darray");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000097,
        "KHR-GLES31.core.texture_gath",
        "er.plain-gather-uint-2darray");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000098,
        "KHR-GLES31.core.texture_gath",
        "er.plain-gather-depth-2darray");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000099,
        "KHR-GLES31.core.texture_gathe",
        "r.plain-gather-float-cube-rgba");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000100,
        "KHR-GLES31.core.texture_gath",
        "er.plain-gather-int-cube-rgba");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000101,
        "KHR-GLES31.core.texture_ga",
        "ther.plain-gather-uint-cube");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000102,
        "KHR-GLES31.core.texture_gat",
        "her.plain-gather-depth-cube");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000103,
        "KHR-GLES31.core.texture_ga",
        "ther.offset-gather-float-2d");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000104,
        "KHR-GLES31.core.texture_g",
        "ather.offset-gather-int-2d");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000105,
        "KHR-GLES31.core.texture_ga",
        "ther.offset-gather-uint-2d");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000106,
        "KHR-GLES31.core.texture_ga",
        "ther.offset-gather-depth-2d");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000107,
        "KHR-GLES31.core.texture_gathe",
        "r.offset-gather-float-2darray");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000108,
        "KHR-GLES31.core.texture_gath",
        "er.offset-gather-int-2darray");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000109,
        "KHR-GLES31.core.texture_gath",
        "er.offset-gather-uint-2darray");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000110,
        "KHR-GLES31.core.texture_gathe",
        "r.offset-gather-depth-2darray");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000111,
        "KHR-GLES31.core.tex",
        "ture_gather.swizzle");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000112,
        "KHR-GLES31.core.text",
        "ure_gather.base-level");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000113,
        "KHR-GLES31.core.texture_",
        "gather.incomplete-texture");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000114,
        "KHR-GLES31.core.texture_gathe",
        "r.incomplete-texture-last-comp");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000115,
        "KHR-GLES31.core.textur",
        "e_gather.triangle-draw");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000116,
        "KHR-GLES31.core.texture_gath",
        "er.plain-gather-float-2d-srgb");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000117,
        "KHR-GLES31.core.texture_gather.",
        "plain-gather-float-2d-srgb-alpha");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000118,
        "KHR-GLES31.core.texture_gath",
        "er.plain-gather-float-2d-rgb");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000119,
        "KHR-GLES31.core.texture_gat",
        "her.plain-gather-float-2d-rg");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000120,
        "KHR-GLES31.core.texture_gat",
        "her.plain-gather-float-2d-r");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000121,
        "KHR-GLES31.core.texture_gath",
        "er.offset-gather-float-2d-rgb");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000122,
        "KHR-GLES31.core.texture_gath",
        "er.offset-gather-float-2d-rg");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000123,
        "KHR-GLES31.core.texture_gat",
        "her.offset-gather-float-2d-r");
