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

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001781,
        "KHR-GLES31.core.blend_equation_advanced",
        ".blend_all.GL_MULTIPLY_KHR_all_qualifier");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001782,
        "KHR-GLES31.core.blend_equation_advance",
        "d.blend_all.GL_SCREEN_KHR_all_qualifier");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001783,
        "KHR-GLES31.core.blend_equation_advanced",
        ".blend_all.GL_OVERLAY_KHR_all_qualifier");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001784,
        "KHR-GLES31.core.blend_equation_advance",
        "d.blend_all.GL_DARKEN_KHR_all_qualifier");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001785,
        "KHR-GLES31.core.blend_equation_advanced",
        ".blend_all.GL_LIGHTEN_KHR_all_qualifier");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001786,
        "KHR-GLES31.core.blend_equation_advanced.",
        "blend_all.GL_COLORDODGE_KHR_all_qualifier");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001787,
        "KHR-GLES31.core.blend_equation_advanced.",
        "blend_all.GL_COLORBURN_KHR_all_qualifier");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001788,
        "KHR-GLES31.core.blend_equation_advanced.",
        "blend_all.GL_HARDLIGHT_KHR_all_qualifier");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001789,
        "KHR-GLES31.core.blend_equation_advanced.",
        "blend_all.GL_SOFTLIGHT_KHR_all_qualifier");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001790,
        "KHR-GLES31.core.blend_equation_advanced.",
        "blend_all.GL_DIFFERENCE_KHR_all_qualifier");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001791,
        "KHR-GLES31.core.blend_equation_advanced.",
        "blend_all.GL_EXCLUSION_KHR_all_qualifier");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001792,
        "KHR-GLES31.core.blend_equation_advanced",
        ".blend_all.GL_HSL_HUE_KHR_all_qualifier");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001793,
        "KHR-GLES31.core.blend_equation_advanced.bl",
        "end_all.GL_HSL_SATURATION_KHR_all_qualifier");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001794,
        "KHR-GLES31.core.blend_equation_advanced.",
        "blend_all.GL_HSL_COLOR_KHR_all_qualifier");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001795,
        "KHR-GLES31.core.blend_equation_advanced.bl",
        "end_all.GL_HSL_LUMINOSITY_KHR_all_qualifier");
