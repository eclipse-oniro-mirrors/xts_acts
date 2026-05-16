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
#include "../ActsGles31KhrMainUncover0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsGles31KhrMainUncover0001TestSuite, TestCase_000578,
        "KHR-GLES31.core.tessellation_shader.vertex.vertex_s",
        "pacing_primitive_mode_isolines_vs_mode_equal_spacing");

static SHRINK_HWTEST_F(ActsGles31KhrMainUncover0001TestSuite, TestCase_000579,
        "KHR-GLES31.core.tessellation_shader.vertex.vertex_spacin",
        "g_primitive_mode_isolines_vs_mode_fractional_even_spacing");

static SHRINK_HWTEST_F(ActsGles31KhrMainUncover0001TestSuite, TestCase_000580,
        "KHR-GLES31.core.tessellation_shader.vertex.vertex_spacin",
        "g_primitive_mode_isolines_vs_mode_fractional_odd_spacing");

static SHRINK_HWTEST_F(ActsGles31KhrMainUncover0001TestSuite, TestCase_000581,
        "KHR-GLES31.core.tessellation_shader.vertex.ve",
        "rtex_spacing_primitive_mode_isolines_vs_mode_");

static SHRINK_HWTEST_F(ActsGles31KhrMainUncover0001TestSuite, TestCase_000582,
        "KHR-GLES31.core.tessellation_shader.vertex.vertex_sp",
        "acing_primitive_mode_triangles_vs_mode_equal_spacing");

static SHRINK_HWTEST_F(ActsGles31KhrMainUncover0001TestSuite, TestCase_000583,
        "KHR-GLES31.core.tessellation_shader.vertex.vertex_spacing",
        "_primitive_mode_triangles_vs_mode_fractional_even_spacing");

static SHRINK_HWTEST_F(ActsGles31KhrMainUncover0001TestSuite, TestCase_000584,
        "KHR-GLES31.core.tessellation_shader.vertex.vertex_spacin",
        "g_primitive_mode_triangles_vs_mode_fractional_odd_spacing");

static SHRINK_HWTEST_F(ActsGles31KhrMainUncover0001TestSuite, TestCase_000585,
        "KHR-GLES31.core.tessellation_shader.vertex.ve",
        "rtex_spacing_primitive_mode_triangles_vs_mode_");

static SHRINK_HWTEST_F(ActsGles31KhrMainUncover0001TestSuite, TestCase_000586,
        "KHR-GLES31.core.tessellation_shader.vertex.vertex_",
        "spacing_primitive_mode_quads_vs_mode_equal_spacing");

static SHRINK_HWTEST_F(ActsGles31KhrMainUncover0001TestSuite, TestCase_000587,
        "KHR-GLES31.core.tessellation_shader.vertex.vertex_spaci",
        "ng_primitive_mode_quads_vs_mode_fractional_even_spacing");

static SHRINK_HWTEST_F(ActsGles31KhrMainUncover0001TestSuite, TestCase_000588,
        "KHR-GLES31.core.tessellation_shader.vertex.vertex_spac",
        "ing_primitive_mode_quads_vs_mode_fractional_odd_spacing");

static SHRINK_HWTEST_F(ActsGles31KhrMainUncover0001TestSuite, TestCase_000589,
        "KHR-GLES31.core.tessellation_shader.vertex.",
        "vertex_spacing_primitive_mode_quads_vs_mode_");
