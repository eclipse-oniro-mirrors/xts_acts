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

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001748,
        "KHR-GLES31.core.blend_equation_advance",
        "d.mismatching_qualifier.GL_MULTIPLY_KHR");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001749,
        "KHR-GLES31.core.blend_equation_advanc",
        "ed.mismatching_qualifier.GL_SCREEN_KHR");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001750,
        "KHR-GLES31.core.blend_equation_advance",
        "d.mismatching_qualifier.GL_OVERLAY_KHR");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001751,
        "KHR-GLES31.core.blend_equation_advanc",
        "ed.mismatching_qualifier.GL_DARKEN_KHR");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001752,
        "KHR-GLES31.core.blend_equation_advance",
        "d.mismatching_qualifier.GL_LIGHTEN_KHR");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001753,
        "KHR-GLES31.core.blend_equation_advanced",
        ".mismatching_qualifier.GL_COLORDODGE_KHR");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001754,
        "KHR-GLES31.core.blend_equation_advanced",
        ".mismatching_qualifier.GL_COLORBURN_KHR");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001755,
        "KHR-GLES31.core.blend_equation_advanced",
        ".mismatching_qualifier.GL_HARDLIGHT_KHR");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001756,
        "KHR-GLES31.core.blend_equation_advanced",
        ".mismatching_qualifier.GL_SOFTLIGHT_KHR");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001757,
        "KHR-GLES31.core.blend_equation_advanced",
        ".mismatching_qualifier.GL_DIFFERENCE_KHR");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001758,
        "KHR-GLES31.core.blend_equation_advanced",
        ".mismatching_qualifier.GL_EXCLUSION_KHR");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001759,
        "KHR-GLES31.core.blend_equation_advance",
        "d.mismatching_qualifier.GL_HSL_HUE_KHR");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001760,
        "KHR-GLES31.core.blend_equation_advanced.m",
        "ismatching_qualifier.GL_HSL_SATURATION_KHR");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001761,
        "KHR-GLES31.core.blend_equation_advanced",
        ".mismatching_qualifier.GL_HSL_COLOR_KHR");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001762,
        "KHR-GLES31.core.blend_equation_advanced.m",
        "ismatching_qualifier.GL_HSL_LUMINOSITY_KHR");
