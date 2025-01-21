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
#include "../ActsKhrgles310002TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001796,
        "KHR-GLES31.core.blend_equation_adva",
        "nced.blend_specific.GL_MULTIPLY_KHR");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001797,
        "KHR-GLES31.core.blend_equation_adv",
        "anced.blend_specific.GL_SCREEN_KHR");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001798,
        "KHR-GLES31.core.blend_equation_adv",
        "anced.blend_specific.GL_OVERLAY_KHR");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001799,
        "KHR-GLES31.core.blend_equation_adv",
        "anced.blend_specific.GL_DARKEN_KHR");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001800,
        "KHR-GLES31.core.blend_equation_adv",
        "anced.blend_specific.GL_LIGHTEN_KHR");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001801,
        "KHR-GLES31.core.blend_equation_advan",
        "ced.blend_specific.GL_COLORDODGE_KHR");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001802,
        "KHR-GLES31.core.blend_equation_adva",
        "nced.blend_specific.GL_COLORBURN_KHR");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001803,
        "KHR-GLES31.core.blend_equation_adva",
        "nced.blend_specific.GL_HARDLIGHT_KHR");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001804,
        "KHR-GLES31.core.blend_equation_adva",
        "nced.blend_specific.GL_SOFTLIGHT_KHR");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001805,
        "KHR-GLES31.core.blend_equation_advan",
        "ced.blend_specific.GL_DIFFERENCE_KHR");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001806,
        "KHR-GLES31.core.blend_equation_adva",
        "nced.blend_specific.GL_EXCLUSION_KHR");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001807,
        "KHR-GLES31.core.blend_equation_adv",
        "anced.blend_specific.GL_HSL_HUE_KHR");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001808,
        "KHR-GLES31.core.blend_equation_advance",
        "d.blend_specific.GL_HSL_SATURATION_KHR");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001809,
        "KHR-GLES31.core.blend_equation_adva",
        "nced.blend_specific.GL_HSL_COLOR_KHR");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001810,
        "KHR-GLES31.core.blend_equation_advance",
        "d.blend_specific.GL_HSL_LUMINOSITY_KHR");
