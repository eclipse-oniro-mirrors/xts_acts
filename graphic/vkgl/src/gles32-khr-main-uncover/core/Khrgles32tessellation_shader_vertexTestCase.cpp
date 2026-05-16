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
#include "../Khrgles32BaseFunc.h"
#include "../ActsGles32KhrMainUncover0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000090,
        "KHR-GLES32.core.tessellation_shader.vertex.vertex_s",
        "pacing_primitive_mode_isolines_vs_mode_equal_spacing");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000091,
        "KHR-GLES32.core.tessellation_shader.vertex.vertex_spacin",
        "g_primitive_mode_isolines_vs_mode_fractional_even_spacing");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000092,
        "KHR-GLES32.core.tessellation_shader.vertex.vertex_spacin",
        "g_primitive_mode_isolines_vs_mode_fractional_odd_spacing");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000093,
        "KHR-GLES32.core.tessellation_shader.vertex.ve",
        "rtex_spacing_primitive_mode_isolines_vs_mode_");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000094,
        "KHR-GLES32.core.tessellation_shader.vertex.vertex_sp",
        "acing_primitive_mode_triangles_vs_mode_equal_spacing");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000095,
        "KHR-GLES32.core.tessellation_shader.vertex.vertex_spacing",
        "_primitive_mode_triangles_vs_mode_fractional_even_spacing");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000096,
        "KHR-GLES32.core.tessellation_shader.vertex.vertex_spacin",
        "g_primitive_mode_triangles_vs_mode_fractional_odd_spacing");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000097,
        "KHR-GLES32.core.tessellation_shader.vertex.ve",
        "rtex_spacing_primitive_mode_triangles_vs_mode_");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000098,
        "KHR-GLES32.core.tessellation_shader.vertex.vertex_",
        "spacing_primitive_mode_quads_vs_mode_equal_spacing");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000099,
        "KHR-GLES32.core.tessellation_shader.vertex.vertex_spaci",
        "ng_primitive_mode_quads_vs_mode_fractional_even_spacing");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000100,
        "KHR-GLES32.core.tessellation_shader.vertex.vertex_spac",
        "ing_primitive_mode_quads_vs_mode_fractional_odd_spacing");

static SHRINK_HWTEST_F(ActsGles32KhrMainUncover0001TestSuite, TestCase_000101,
        "KHR-GLES32.core.tessellation_shader.vertex.",
        "vertex_spacing_primitive_mode_quads_vs_mode_");
