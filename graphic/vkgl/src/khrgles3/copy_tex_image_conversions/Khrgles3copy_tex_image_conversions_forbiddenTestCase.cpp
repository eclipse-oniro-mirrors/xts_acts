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

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003922,
        "KHR-GLES3.copy_tex_image_conversi",
        "ons.forbidden.texture2d_texture2d");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003923,
        "KHR-GLES3.copy_tex_image_conversio",
        "ns.forbidden.texture2d_cubemap_negx");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003924,
        "KHR-GLES3.copy_tex_image_conversio",
        "ns.forbidden.texture2d_cubemap_negy");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003925,
        "KHR-GLES3.copy_tex_image_conversio",
        "ns.forbidden.texture2d_cubemap_negz");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003926,
        "KHR-GLES3.copy_tex_image_conversio",
        "ns.forbidden.texture2d_cubemap_posx");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003927,
        "KHR-GLES3.copy_tex_image_conversio",
        "ns.forbidden.texture2d_cubemap_posy");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003928,
        "KHR-GLES3.copy_tex_image_conversio",
        "ns.forbidden.texture2d_cubemap_posz");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003929,
        "KHR-GLES3.copy_tex_image_conversio",
        "ns.forbidden.cubemap_negx_texture2d");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003930,
        "KHR-GLES3.copy_tex_image_conversions",
        ".forbidden.cubemap_negx_cubemap_negx");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003931,
        "KHR-GLES3.copy_tex_image_conversions",
        ".forbidden.cubemap_negx_cubemap_negy");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003932,
        "KHR-GLES3.copy_tex_image_conversions",
        ".forbidden.cubemap_negx_cubemap_negz");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003933,
        "KHR-GLES3.copy_tex_image_conversions",
        ".forbidden.cubemap_negx_cubemap_posx");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003934,
        "KHR-GLES3.copy_tex_image_conversions",
        ".forbidden.cubemap_negx_cubemap_posy");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003935,
        "KHR-GLES3.copy_tex_image_conversions",
        ".forbidden.cubemap_negx_cubemap_posz");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003936,
        "KHR-GLES3.copy_tex_image_conversio",
        "ns.forbidden.cubemap_negy_texture2d");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003937,
        "KHR-GLES3.copy_tex_image_conversions",
        ".forbidden.cubemap_negy_cubemap_negx");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003938,
        "KHR-GLES3.copy_tex_image_conversions",
        ".forbidden.cubemap_negy_cubemap_negy");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003939,
        "KHR-GLES3.copy_tex_image_conversions",
        ".forbidden.cubemap_negy_cubemap_negz");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003940,
        "KHR-GLES3.copy_tex_image_conversions",
        ".forbidden.cubemap_negy_cubemap_posx");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003941,
        "KHR-GLES3.copy_tex_image_conversions",
        ".forbidden.cubemap_negy_cubemap_posy");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003942,
        "KHR-GLES3.copy_tex_image_conversions",
        ".forbidden.cubemap_negy_cubemap_posz");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003943,
        "KHR-GLES3.copy_tex_image_conversio",
        "ns.forbidden.cubemap_negz_texture2d");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003944,
        "KHR-GLES3.copy_tex_image_conversions",
        ".forbidden.cubemap_negz_cubemap_negx");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003945,
        "KHR-GLES3.copy_tex_image_conversions",
        ".forbidden.cubemap_negz_cubemap_negy");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003946,
        "KHR-GLES3.copy_tex_image_conversions",
        ".forbidden.cubemap_negz_cubemap_negz");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003947,
        "KHR-GLES3.copy_tex_image_conversions",
        ".forbidden.cubemap_negz_cubemap_posx");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003948,
        "KHR-GLES3.copy_tex_image_conversions",
        ".forbidden.cubemap_negz_cubemap_posy");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003949,
        "KHR-GLES3.copy_tex_image_conversions",
        ".forbidden.cubemap_negz_cubemap_posz");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003950,
        "KHR-GLES3.copy_tex_image_conversio",
        "ns.forbidden.cubemap_posx_texture2d");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003951,
        "KHR-GLES3.copy_tex_image_conversions",
        ".forbidden.cubemap_posx_cubemap_negx");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003952,
        "KHR-GLES3.copy_tex_image_conversions",
        ".forbidden.cubemap_posx_cubemap_negy");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003953,
        "KHR-GLES3.copy_tex_image_conversions",
        ".forbidden.cubemap_posx_cubemap_negz");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003954,
        "KHR-GLES3.copy_tex_image_conversions",
        ".forbidden.cubemap_posx_cubemap_posx");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003955,
        "KHR-GLES3.copy_tex_image_conversions",
        ".forbidden.cubemap_posx_cubemap_posy");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003956,
        "KHR-GLES3.copy_tex_image_conversions",
        ".forbidden.cubemap_posx_cubemap_posz");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003957,
        "KHR-GLES3.copy_tex_image_conversio",
        "ns.forbidden.cubemap_posy_texture2d");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003958,
        "KHR-GLES3.copy_tex_image_conversions",
        ".forbidden.cubemap_posy_cubemap_negx");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003959,
        "KHR-GLES3.copy_tex_image_conversions",
        ".forbidden.cubemap_posy_cubemap_negy");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003960,
        "KHR-GLES3.copy_tex_image_conversions",
        ".forbidden.cubemap_posy_cubemap_negz");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003961,
        "KHR-GLES3.copy_tex_image_conversions",
        ".forbidden.cubemap_posy_cubemap_posx");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003962,
        "KHR-GLES3.copy_tex_image_conversions",
        ".forbidden.cubemap_posy_cubemap_posy");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003963,
        "KHR-GLES3.copy_tex_image_conversions",
        ".forbidden.cubemap_posy_cubemap_posz");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003964,
        "KHR-GLES3.copy_tex_image_conversio",
        "ns.forbidden.cubemap_posz_texture2d");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003965,
        "KHR-GLES3.copy_tex_image_conversions",
        ".forbidden.cubemap_posz_cubemap_negx");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003966,
        "KHR-GLES3.copy_tex_image_conversions",
        ".forbidden.cubemap_posz_cubemap_negy");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003967,
        "KHR-GLES3.copy_tex_image_conversions",
        ".forbidden.cubemap_posz_cubemap_negz");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003968,
        "KHR-GLES3.copy_tex_image_conversions",
        ".forbidden.cubemap_posz_cubemap_posx");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003969,
        "KHR-GLES3.copy_tex_image_conversions",
        ".forbidden.cubemap_posz_cubemap_posy");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003970,
        "KHR-GLES3.copy_tex_image_conversions",
        ".forbidden.cubemap_posz_cubemap_posz");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003971,
        "KHR-GLES3.copy_tex_image_conversion",
        "s.forbidden.texture_array_texture2d");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003972,
        "KHR-GLES3.copy_tex_image_conversions",
        ".forbidden.texture_array_cubemap_negx");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003973,
        "KHR-GLES3.copy_tex_image_conversions",
        ".forbidden.texture_array_cubemap_negy");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003974,
        "KHR-GLES3.copy_tex_image_conversions",
        ".forbidden.texture_array_cubemap_negz");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003975,
        "KHR-GLES3.copy_tex_image_conversions",
        ".forbidden.texture_array_cubemap_posx");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003976,
        "KHR-GLES3.copy_tex_image_conversions",
        ".forbidden.texture_array_cubemap_posy");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003977,
        "KHR-GLES3.copy_tex_image_conversions",
        ".forbidden.texture_array_cubemap_posz");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003978,
        "KHR-GLES3.copy_tex_image_conversi",
        "ons.forbidden.texture3d_texture2d");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003979,
        "KHR-GLES3.copy_tex_image_conversio",
        "ns.forbidden.texture3d_cubemap_negx");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003980,
        "KHR-GLES3.copy_tex_image_conversio",
        "ns.forbidden.texture3d_cubemap_negy");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003981,
        "KHR-GLES3.copy_tex_image_conversio",
        "ns.forbidden.texture3d_cubemap_negz");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003982,
        "KHR-GLES3.copy_tex_image_conversio",
        "ns.forbidden.texture3d_cubemap_posx");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003983,
        "KHR-GLES3.copy_tex_image_conversio",
        "ns.forbidden.texture3d_cubemap_posy");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003984,
        "KHR-GLES3.copy_tex_image_conversio",
        "ns.forbidden.texture3d_cubemap_posz");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003985,
        "KHR-GLES3.copy_tex_image_conversio",
        "ns.forbidden.renderbuffer_texture2d");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003986,
        "KHR-GLES3.copy_tex_image_conversions",
        ".forbidden.renderbuffer_cubemap_negx");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003987,
        "KHR-GLES3.copy_tex_image_conversions",
        ".forbidden.renderbuffer_cubemap_negy");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003988,
        "KHR-GLES3.copy_tex_image_conversions",
        ".forbidden.renderbuffer_cubemap_negz");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003989,
        "KHR-GLES3.copy_tex_image_conversions",
        ".forbidden.renderbuffer_cubemap_posx");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003990,
        "KHR-GLES3.copy_tex_image_conversions",
        ".forbidden.renderbuffer_cubemap_posy");

static SHRINK_HWTEST_F(ActsKhrgles30004TestSuite, TestCase_003991,
        "KHR-GLES3.copy_tex_image_conversions",
        ".forbidden.renderbuffer_cubemap_posz");
