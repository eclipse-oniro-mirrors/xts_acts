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
#include "../Khrgles3BaseFunc.h"
#include "../ActsKhrgles30004TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003992,
        "KHR-GLES3.copy_tex_image_convers",
        "ions.required.texture2d_texture2d");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003993,
        "KHR-GLES3.copy_tex_image_conversio",
        "ns.required.texture2d_cubemap_negx");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003994,
        "KHR-GLES3.copy_tex_image_conversio",
        "ns.required.texture2d_cubemap_negy");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003995,
        "KHR-GLES3.copy_tex_image_conversio",
        "ns.required.texture2d_cubemap_negz");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003996,
        "KHR-GLES3.copy_tex_image_conversio",
        "ns.required.texture2d_cubemap_posx");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003997,
        "KHR-GLES3.copy_tex_image_conversio",
        "ns.required.texture2d_cubemap_posy");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003998,
        "KHR-GLES3.copy_tex_image_conversio",
        "ns.required.texture2d_cubemap_posz");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003999,
        "KHR-GLES3.copy_tex_image_conversio",
        "ns.required.cubemap_negx_texture2d");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_004000,
        "KHR-GLES3.copy_tex_image_conversion",
        "s.required.cubemap_negx_cubemap_negx");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_004001,
        "KHR-GLES3.copy_tex_image_conversion",
        "s.required.cubemap_negx_cubemap_negy");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_004002,
        "KHR-GLES3.copy_tex_image_conversion",
        "s.required.cubemap_negx_cubemap_negz");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_004003,
        "KHR-GLES3.copy_tex_image_conversion",
        "s.required.cubemap_negx_cubemap_posx");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_004004,
        "KHR-GLES3.copy_tex_image_conversion",
        "s.required.cubemap_negx_cubemap_posy");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_004005,
        "KHR-GLES3.copy_tex_image_conversion",
        "s.required.cubemap_negx_cubemap_posz");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_004006,
        "KHR-GLES3.copy_tex_image_conversio",
        "ns.required.cubemap_negy_texture2d");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_004007,
        "KHR-GLES3.copy_tex_image_conversion",
        "s.required.cubemap_negy_cubemap_negx");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_004008,
        "KHR-GLES3.copy_tex_image_conversion",
        "s.required.cubemap_negy_cubemap_negy");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_004009,
        "KHR-GLES3.copy_tex_image_conversion",
        "s.required.cubemap_negy_cubemap_negz");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_004010,
        "KHR-GLES3.copy_tex_image_conversion",
        "s.required.cubemap_negy_cubemap_posx");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_004011,
        "KHR-GLES3.copy_tex_image_conversion",
        "s.required.cubemap_negy_cubemap_posy");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_004012,
        "KHR-GLES3.copy_tex_image_conversion",
        "s.required.cubemap_negy_cubemap_posz");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_004013,
        "KHR-GLES3.copy_tex_image_conversio",
        "ns.required.cubemap_negz_texture2d");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_004014,
        "KHR-GLES3.copy_tex_image_conversion",
        "s.required.cubemap_negz_cubemap_negx");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_004015,
        "KHR-GLES3.copy_tex_image_conversion",
        "s.required.cubemap_negz_cubemap_negy");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_004016,
        "KHR-GLES3.copy_tex_image_conversion",
        "s.required.cubemap_negz_cubemap_negz");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_004017,
        "KHR-GLES3.copy_tex_image_conversion",
        "s.required.cubemap_negz_cubemap_posx");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_004018,
        "KHR-GLES3.copy_tex_image_conversion",
        "s.required.cubemap_negz_cubemap_posy");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_004019,
        "KHR-GLES3.copy_tex_image_conversion",
        "s.required.cubemap_negz_cubemap_posz");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_004020,
        "KHR-GLES3.copy_tex_image_conversio",
        "ns.required.cubemap_posx_texture2d");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_004021,
        "KHR-GLES3.copy_tex_image_conversion",
        "s.required.cubemap_posx_cubemap_negx");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_004022,
        "KHR-GLES3.copy_tex_image_conversion",
        "s.required.cubemap_posx_cubemap_negy");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_004023,
        "KHR-GLES3.copy_tex_image_conversion",
        "s.required.cubemap_posx_cubemap_negz");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_004024,
        "KHR-GLES3.copy_tex_image_conversion",
        "s.required.cubemap_posx_cubemap_posx");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_004025,
        "KHR-GLES3.copy_tex_image_conversion",
        "s.required.cubemap_posx_cubemap_posy");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_004026,
        "KHR-GLES3.copy_tex_image_conversion",
        "s.required.cubemap_posx_cubemap_posz");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_004027,
        "KHR-GLES3.copy_tex_image_conversio",
        "ns.required.cubemap_posy_texture2d");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_004028,
        "KHR-GLES3.copy_tex_image_conversion",
        "s.required.cubemap_posy_cubemap_negx");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_004029,
        "KHR-GLES3.copy_tex_image_conversion",
        "s.required.cubemap_posy_cubemap_negy");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_004030,
        "KHR-GLES3.copy_tex_image_conversion",
        "s.required.cubemap_posy_cubemap_negz");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_004031,
        "KHR-GLES3.copy_tex_image_conversion",
        "s.required.cubemap_posy_cubemap_posx");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_004032,
        "KHR-GLES3.copy_tex_image_conversion",
        "s.required.cubemap_posy_cubemap_posy");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_004033,
        "KHR-GLES3.copy_tex_image_conversion",
        "s.required.cubemap_posy_cubemap_posz");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_004034,
        "KHR-GLES3.copy_tex_image_conversio",
        "ns.required.cubemap_posz_texture2d");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_004035,
        "KHR-GLES3.copy_tex_image_conversion",
        "s.required.cubemap_posz_cubemap_negx");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_004036,
        "KHR-GLES3.copy_tex_image_conversion",
        "s.required.cubemap_posz_cubemap_negy");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_004037,
        "KHR-GLES3.copy_tex_image_conversion",
        "s.required.cubemap_posz_cubemap_negz");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_004038,
        "KHR-GLES3.copy_tex_image_conversion",
        "s.required.cubemap_posz_cubemap_posx");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_004039,
        "KHR-GLES3.copy_tex_image_conversion",
        "s.required.cubemap_posz_cubemap_posy");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_004040,
        "KHR-GLES3.copy_tex_image_conversion",
        "s.required.cubemap_posz_cubemap_posz");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_004041,
        "KHR-GLES3.copy_tex_image_conversio",
        "ns.required.texture_array_texture2d");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_004042,
        "KHR-GLES3.copy_tex_image_conversions",
        ".required.texture_array_cubemap_negx");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_004043,
        "KHR-GLES3.copy_tex_image_conversions",
        ".required.texture_array_cubemap_negy");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_004044,
        "KHR-GLES3.copy_tex_image_conversions",
        ".required.texture_array_cubemap_negz");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_004045,
        "KHR-GLES3.copy_tex_image_conversions",
        ".required.texture_array_cubemap_posx");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_004046,
        "KHR-GLES3.copy_tex_image_conversions",
        ".required.texture_array_cubemap_posy");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_004047,
        "KHR-GLES3.copy_tex_image_conversions",
        ".required.texture_array_cubemap_posz");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_004048,
        "KHR-GLES3.copy_tex_image_convers",
        "ions.required.texture3d_texture2d");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_004049,
        "KHR-GLES3.copy_tex_image_conversio",
        "ns.required.texture3d_cubemap_negx");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_004050,
        "KHR-GLES3.copy_tex_image_conversio",
        "ns.required.texture3d_cubemap_negy");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_004051,
        "KHR-GLES3.copy_tex_image_conversio",
        "ns.required.texture3d_cubemap_negz");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_004052,
        "KHR-GLES3.copy_tex_image_conversio",
        "ns.required.texture3d_cubemap_posx");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_004053,
        "KHR-GLES3.copy_tex_image_conversio",
        "ns.required.texture3d_cubemap_posy");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_004054,
        "KHR-GLES3.copy_tex_image_conversio",
        "ns.required.texture3d_cubemap_posz");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_004055,
        "KHR-GLES3.copy_tex_image_conversio",
        "ns.required.renderbuffer_texture2d");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_004056,
        "KHR-GLES3.copy_tex_image_conversion",
        "s.required.renderbuffer_cubemap_negx");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_004057,
        "KHR-GLES3.copy_tex_image_conversion",
        "s.required.renderbuffer_cubemap_negy");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_004058,
        "KHR-GLES3.copy_tex_image_conversion",
        "s.required.renderbuffer_cubemap_negz");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_004059,
        "KHR-GLES3.copy_tex_image_conversion",
        "s.required.renderbuffer_cubemap_posx");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_004060,
        "KHR-GLES3.copy_tex_image_conversion",
        "s.required.renderbuffer_cubemap_posy");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_004061,
        "KHR-GLES3.copy_tex_image_conversion",
        "s.required.renderbuffer_cubemap_posz");
