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
#include "../Gl42masterBaseFunc.h"
#include "../ActsGl42master0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005193,
    "KHR-GL42.texture_gather.api-enums");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005194,
    "KHR-GL42.texture_gather.gather-glsl-compile");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005195,
    "KHR-GL42.texture_gather.plain-gather-float-2d-rgba");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005196,
    "KHR-GL42.texture_gather.plain-gather-float-2d-rg");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005197,
    "KHR-GL42.texture_gather.plain-gather-unorm-2d");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005198,
    "KHR-GL42.texture_gather.plain-gather-int-2d-rgba");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005199,
    "KHR-GL42.texture_gather.plain-gather-int-2d-rg");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005200,
    "KHR-GL42.texture_gather.plain-gather-uint-2d");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005201,
    "KHR-GL42.texture_gather.plain-gather-depth-2d");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005202,
    "KHR-GL42.texture_gather.plain-gather-float-2darray");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005203,
    "KHR-GL42.texture_gather.plain-gather-unorm-2darray");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005204,
    "KHR-GL42.texture_gather.plain-gather-int-2darray");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005205,
    "KHR-GL42.texture_gather.plain-gather-uint-2darray");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005206,
    "KHR-GL42.texture_gather.plain-gather-depth-2darray");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005207,
    "KHR-GL42.texture_gather.plain-gather-float-cube-rgba");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005208,
    "KHR-GL42.texture_gather.plain-gather-float-cube-rg");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005209,
    "KHR-GL42.texture_gather.plain-gather-unorm-cube");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005210,
    "KHR-GL42.texture_gather.plain-gather-int-cube-rgba");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005211,
    "KHR-GL42.texture_gather.plain-gather-int-cube-rg");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005212,
    "KHR-GL42.texture_gather.plain-gather-uint-cube");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005213,
    "KHR-GL42.texture_gather.plain-gather-depth-cube");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005214,
    "KHR-GL42.texture_gather.plain-gather-float-cube-array");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005215,
    "KHR-GL42.texture_gather.plain-gather-unorm-cube-array");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005216,
    "KHR-GL42.texture_gather.plain-gather-int-cube-array");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005217,
    "KHR-GL42.texture_gather.plain-gather-uint-cube-array");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005218,
    "KHR-GL42.texture_gather.plain-gather-depth-cube-array");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005219,
    "KHR-GL42.texture_gather.plain-gather-float-2drect");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005220,
    "KHR-GL42.texture_gather.plain-gather-unorm-2drect");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005221,
    "KHR-GL42.texture_gather.plain-gather-int-2drect");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005222,
    "KHR-GL42.texture_gather.plain-gather-uint-2drect");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005223,
    "KHR-GL42.texture_gather.plain-gather-depth-2drect");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005224,
    "KHR-GL42.texture_gather.offset-gather-float-2d");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005225,
    "KHR-GL42.texture_gather.offset-gather-unorm-2d");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005226,
    "KHR-GL42.texture_gather.offset-gather-int-2d");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005227,
    "KHR-GL42.texture_gather.offset-gather-uint-2d");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005228,
    "KHR-GL42.texture_gather.offset-gather-depth-2d");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005229,
    "KHR-GL42.texture_gather.offset-gather-float-2darray");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005230,
    "KHR-GL42.texture_gather.offset-gather-unorm-2darray");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005231,
    "KHR-GL42.texture_gather.offset-gather-int-2darray");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005232,
    "KHR-GL42.texture_gather.offset-gather-uint-2darray");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005233,
    "KHR-GL42.texture_gather.offset-gather-depth-2darray");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005234,
    "KHR-GL42.texture_gather.offset-gather-float-2drect");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005235,
    "KHR-GL42.texture_gather.offset-gather-unorm-2drect");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005236,
    "KHR-GL42.texture_gather.offset-gather-int-2drect");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005237,
    "KHR-GL42.texture_gather.offset-gather-uint-2drect");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005238,
    "KHR-GL42.texture_gather.offset-gather-depth-2drect");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005239,
    "KHR-GL42.texture_gather.offsets-gather-float-2d");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005240,
    "KHR-GL42.texture_gather.offsets-gather-unorm-2d");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005241,
    "KHR-GL42.texture_gather.offsets-gather-int-2d");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005242,
    "KHR-GL42.texture_gather.offsets-gather-uint-2d");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005243,
    "KHR-GL42.texture_gather.offsets-gather-depth-2d");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005244,
    "KHR-GL42.texture_gather.offsets-gather-float-2darray");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005245,
    "KHR-GL42.texture_gather.offsets-gather-unorm-2darray");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005246,
    "KHR-GL42.texture_gather.offsets-gather-int-2darray");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005247,
    "KHR-GL42.texture_gather.offsets-gather-uint-2darray");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005248,
    "KHR-GL42.texture_gather.offsets-gather-depth-2darray");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005249,
    "KHR-GL42.texture_gather.offsets-gather-float-2drect");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005250,
    "KHR-GL42.texture_gather.offsets-gather-unorm-2drect");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005251,
    "KHR-GL42.texture_gather.offsets-gather-int-2drect");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005252,
    "KHR-GL42.texture_gather.offsets-gather-uint-2drect");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005253,
    "KHR-GL42.texture_gather.offsets-gather-depth-2drect");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005254,
    "KHR-GL42.texture_gather.swizzle");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005255,
    "KHR-GL42.texture_gather.base-level");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005256,
    "KHR-GL42.texture_gather.incomplete-texture");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005257,
    "KHR-GL42.texture_gather.incomplete-texture-last-comp");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005258,
    "KHR-GL42.texture_gather.triangle-draw");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005259,
    "KHR-GL42.texture_gather.plain-gather-float-2d-srgb");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005260,
    "KHR-GL42.texture_gather.plain-gather-float-2d-srgb-alpha");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005261,
    "KHR-GL42.texture_gather.gather-geometry-shader");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005262,
    "KHR-GL42.texture_gather.gather-tesselation-shader");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005263,
    "KHR-GL42.texture_gather.plain-gather-float-2d-rgb");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005264,
    "KHR-GL42.texture_gather.plain-gather-float-2d-r");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005265,
    "KHR-GL42.texture_gather.offset-gather-float-2d-rgb");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005266,
    "KHR-GL42.texture_gather.offset-gather-float-2d-rg");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005267,
    "KHR-GL42.texture_gather.offset-gather-float-2d-r");
