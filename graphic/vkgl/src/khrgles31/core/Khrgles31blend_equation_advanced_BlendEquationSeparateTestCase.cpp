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

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001731,
        "KHR-GLES31.core.blend_equation_advance",
        "d.BlendEquationSeparate.GL_MULTIPLY_KHR");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001732,
        "KHR-GLES31.core.blend_equation_advanc",
        "ed.BlendEquationSeparate.GL_SCREEN_KHR");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001733,
        "KHR-GLES31.core.blend_equation_advance",
        "d.BlendEquationSeparate.GL_OVERLAY_KHR");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001734,
        "KHR-GLES31.core.blend_equation_advanc",
        "ed.BlendEquationSeparate.GL_DARKEN_KHR");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001735,
        "KHR-GLES31.core.blend_equation_advance",
        "d.BlendEquationSeparate.GL_LIGHTEN_KHR");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001736,
        "KHR-GLES31.core.blend_equation_advanced",
        ".BlendEquationSeparate.GL_COLORDODGE_KHR");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001737,
        "KHR-GLES31.core.blend_equation_advanced",
        ".BlendEquationSeparate.GL_COLORBURN_KHR");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001738,
        "KHR-GLES31.core.blend_equation_advanced",
        ".BlendEquationSeparate.GL_HARDLIGHT_KHR");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001739,
        "KHR-GLES31.core.blend_equation_advanced",
        ".BlendEquationSeparate.GL_SOFTLIGHT_KHR");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001740,
        "KHR-GLES31.core.blend_equation_advanced",
        ".BlendEquationSeparate.GL_DIFFERENCE_KHR");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001741,
        "KHR-GLES31.core.blend_equation_advanced",
        ".BlendEquationSeparate.GL_EXCLUSION_KHR");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001742,
        "KHR-GLES31.core.blend_equation_advance",
        "d.BlendEquationSeparate.GL_HSL_HUE_KHR");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001743,
        "KHR-GLES31.core.blend_equation_advanced.B",
        "lendEquationSeparate.GL_HSL_SATURATION_KHR");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001744,
        "KHR-GLES31.core.blend_equation_advanced",
        ".BlendEquationSeparate.GL_HSL_COLOR_KHR");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001745,
        "KHR-GLES31.core.blend_equation_advanced.B",
        "lendEquationSeparate.GL_HSL_LUMINOSITY_KHR");
