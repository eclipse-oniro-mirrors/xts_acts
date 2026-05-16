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
#include "../Deqpgles31BaseFunc.h"
#include "../ActsDeqpgles310019TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018892,
        "dEQP-GLES31.functional.debug.negativ",
        "e_coverage.log.texture.activetexture");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018893,
        "dEQP-GLES31.functional.debug.negati",
        "ve_coverage.log.texture.bindtexture");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018894,
        "dEQP-GLES31.functional.debug.negative_coverage.",
        "log.texture.compressedteximage2d_invalid_target");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018895,
        "dEQP-GLES31.functional.debug.negative_coverage.",
        "log.texture.compressedteximage2d_invalid_format");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018896,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.log.texture.compressedteximage2d_neg_level");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018897,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.log.texture.compressedteximage2d_max_level");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018898,
        "dEQP-GLES31.functional.debug.negative_coverage.l",
        "og.texture.compressedteximage2d_neg_width_height");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018899,
        "dEQP-GLES31.functional.debug.negative_coverage.l",
        "og.texture.compressedteximage2d_max_width_height");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018900,
        "dEQP-GLES31.functional.debug.negative_coverage.",
        "log.texture.compressedteximage2d_invalid_border");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018901,
        "dEQP-GLES31.functional.debug.negative_coverage",
        ".log.texture.compressedteximage2d_invalid_size");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018902,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.log.texture.compressedteximage2d_neg_size");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018903,
        "dEQP-GLES31.functional.debug.negative_coverage.log",
        ".texture.compressedteximage2d_invalid_width_height");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018904,
        "dEQP-GLES31.functional.debug.negative_coverage.log",
        ".texture.compressedteximage2d_invalid_buffer_target");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018905,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.log.texture.copyteximage2d_invalid_target");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018906,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.log.texture.copyteximage2d_invalid_format");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018907,
        "dEQP-GLES31.functional.debug.negative_coverage.lo",
        "g.texture.copyteximage2d_inequal_width_height_cube");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018908,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.log.texture.copyteximage2d_neg_level");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018909,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.log.texture.copyteximage2d_max_level");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018910,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.log.texture.copyteximage2d_neg_width_height");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018911,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.log.texture.copyteximage2d_max_width_height");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018912,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.log.texture.copyteximage2d_invalid_border");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018913,
        "dEQP-GLES31.functional.debug.negative_coverage.l",
        "og.texture.copyteximage2d_incomplete_framebuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018914,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.log.texture.copytexsubimage2d_invalid_target");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018915,
        "dEQP-GLES31.functional.debug.negative_coverage.l",
        "og.texture.copytexsubimage2d_read_buffer_is_none");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018916,
        "dEQP-GLES31.functional.debug.negative_coverage.lo",
        "g.texture.copytexsubimage2d_texture_internalformat");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018917,
        "dEQP-GLES31.functional.debug.negative_cover",
        "age.log.texture.copytexsubimage2d_neg_level");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018918,
        "dEQP-GLES31.functional.debug.negative_cover",
        "age.log.texture.copytexsubimage2d_max_level");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018919,
        "dEQP-GLES31.functional.debug.negative_cover",
        "age.log.texture.copytexsubimage2d_neg_offset");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018920,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.log.texture.copytexsubimage2d_invalid_offset");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018921,
        "dEQP-GLES31.functional.debug.negative_coverage",
        ".log.texture.copytexsubimage2d_neg_width_height");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018922,
        "dEQP-GLES31.functional.debug.negative_coverage.lo",
        "g.texture.copytexsubimage2d_incomplete_framebuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018923,
        "dEQP-GLES31.functional.debug.negativ",
        "e_coverage.log.texture.deletetextures");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018924,
        "dEQP-GLES31.functional.debug.negativ",
        "e_coverage.log.texture.generatemipmap");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018925,
        "dEQP-GLES31.functional.debug.negati",
        "ve_coverage.log.texture.gentextures");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018926,
        "dEQP-GLES31.functional.debug.negati",
        "ve_coverage.log.texture.pixelstorei");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018927,
        "dEQP-GLES31.functional.debug.negat",
        "ive_coverage.log.texture.teximage2d");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018928,
        "dEQP-GLES31.functional.debug.negative_coverage.",
        "log.texture.teximage2d_inequal_width_height_cube");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018929,
        "dEQP-GLES31.functional.debug.negative_c",
        "overage.log.texture.teximage2d_neg_level");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018930,
        "dEQP-GLES31.functional.debug.negative_c",
        "overage.log.texture.teximage2d_max_level");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018931,
        "dEQP-GLES31.functional.debug.negative_cover",
        "age.log.texture.teximage2d_neg_width_height");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018932,
        "dEQP-GLES31.functional.debug.negative_cover",
        "age.log.texture.teximage2d_max_width_height");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018933,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.log.texture.teximage2d_invalid_border");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018934,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.log.texture.teximage2d_invalid_buffer_target");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018935,
        "dEQP-GLES31.functional.debug.negativ",
        "e_coverage.log.texture.texsubimage2d");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018936,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.log.texture.texsubimage2d_neg_level");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018937,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.log.texture.texsubimage2d_max_level");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018938,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.log.texture.texsubimage2d_neg_offset");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018939,
        "dEQP-GLES31.functional.debug.negative_cover",
        "age.log.texture.texsubimage2d_invalid_offset");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018940,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.log.texture.texsubimage2d_neg_width_height");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018941,
        "dEQP-GLES31.functional.debug.negative_coverage.",
        "log.texture.texsubimage2d_invalid_buffer_target");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018942,
        "dEQP-GLES31.functional.debug.negativ",
        "e_coverage.log.texture.texparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018943,
        "dEQP-GLES31.functional.debug.negativ",
        "e_coverage.log.texture.texparameterf");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018944,
        "dEQP-GLES31.functional.debug.negativ",
        "e_coverage.log.texture.texparameteriv");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018945,
        "dEQP-GLES31.functional.debug.negativ",
        "e_coverage.log.texture.texparameterfv");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018946,
        "dEQP-GLES31.functional.debug.negative",
        "_coverage.log.texture.texparameterIiv");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018947,
        "dEQP-GLES31.functional.debug.negative",
        "_coverage.log.texture.texparameterIuiv");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018948,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.log.texture.compressedtexsubimage2d");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018949,
        "dEQP-GLES31.functional.debug.negative_coverage",
        ".log.texture.compressedtexsubimage2d_neg_level");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018950,
        "dEQP-GLES31.functional.debug.negative_coverage",
        ".log.texture.compressedtexsubimage2d_max_level");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018951,
        "dEQP-GLES31.functional.debug.negative_coverage",
        ".log.texture.compressedtexsubimage2d_neg_offset");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018952,
        "dEQP-GLES31.functional.debug.negative_coverage.l",
        "og.texture.compressedtexsubimage2d_invalid_offset");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018953,
        "dEQP-GLES31.functional.debug.negative_coverage.lo",
        "g.texture.compressedtexsubimage2d_neg_width_height");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018954,
        "dEQP-GLES31.functional.debug.negative_coverage.",
        "log.texture.compressedtexsubimage2d_invalid_size");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018955,
        "dEQP-GLES31.functional.debug.negative_coverage.log.t",
        "exture.compressedtexsubimage2d_invalid_buffer_target");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018956,
        "dEQP-GLES31.functional.debug.negat",
        "ive_coverage.log.texture.teximage3d");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018957,
        "dEQP-GLES31.functional.debug.negative_c",
        "overage.log.texture.teximage3d_neg_level");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018958,
        "dEQP-GLES31.functional.debug.negative_c",
        "overage.log.texture.teximage3d_max_level");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018959,
        "dEQP-GLES31.functional.debug.negative_coverage",
        ".log.texture.teximage3d_neg_width_height_depth");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018960,
        "dEQP-GLES31.functional.debug.negative_coverage",
        ".log.texture.teximage3d_max_width_height_depth");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018961,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.log.texture.teximage3d_invalid_border");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018962,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.log.texture.teximage3d_invalid_buffer_target");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018963,
        "dEQP-GLES31.functional.debug.negativ",
        "e_coverage.log.texture.texsubimage3d");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018964,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.log.texture.texsubimage3d_neg_level");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018965,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.log.texture.texsubimage3d_max_level");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018966,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.log.texture.texsubimage3d_neg_offset");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018967,
        "dEQP-GLES31.functional.debug.negative_cover",
        "age.log.texture.texsubimage3d_invalid_offset");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018968,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.log.texture.texsubimage3d_neg_width_height");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018969,
        "dEQP-GLES31.functional.debug.negative_coverage.",
        "log.texture.texsubimage3d_invalid_buffer_target");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018970,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.log.texture.copytexsubimage3d");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018971,
        "dEQP-GLES31.functional.debug.negative_cover",
        "age.log.texture.copytexsubimage3d_neg_level");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018972,
        "dEQP-GLES31.functional.debug.negative_cover",
        "age.log.texture.copytexsubimage3d_max_level");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018973,
        "dEQP-GLES31.functional.debug.negative_cover",
        "age.log.texture.copytexsubimage3d_neg_offset");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018974,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.log.texture.copytexsubimage3d_invalid_offset");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018975,
        "dEQP-GLES31.functional.debug.negative_coverage",
        ".log.texture.copytexsubimage3d_neg_width_height");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018976,
        "dEQP-GLES31.functional.debug.negative_coverage.lo",
        "g.texture.copytexsubimage3d_incomplete_framebuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018977,
        "dEQP-GLES31.functional.debug.negative_c",
        "overage.log.texture.compressedteximage3d");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018978,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.log.texture.compressedteximage3d_neg_level");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018979,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.log.texture.compressedteximage3d_max_level");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018980,
        "dEQP-GLES31.functional.debug.negative_coverage.log.",
        "texture.compressedteximage3d_neg_width_height_depth");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018981,
        "dEQP-GLES31.functional.debug.negative_coverage.log.",
        "texture.compressedteximage3d_max_width_height_depth");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018982,
        "dEQP-GLES31.functional.debug.negative_coverage.",
        "log.texture.compressedteximage3d_invalid_border");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018983,
        "dEQP-GLES31.functional.debug.negative_coverage",
        ".log.texture.compressedteximage3d_invalid_size");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018984,
        "dEQP-GLES31.functional.debug.negative_coverage.log",
        ".texture.compressedteximage3d_invalid_width_height");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018985,
        "dEQP-GLES31.functional.debug.negative_coverage.log",
        ".texture.compressedteximage3d_invalid_buffer_target");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018986,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.log.texture.compressedtexsubimage3d");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018987,
        "dEQP-GLES31.functional.debug.negative_coverage",
        ".log.texture.compressedtexsubimage3d_neg_level");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018988,
        "dEQP-GLES31.functional.debug.negative_coverage",
        ".log.texture.compressedtexsubimage3d_max_level");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018989,
        "dEQP-GLES31.functional.debug.negative_coverage",
        ".log.texture.compressedtexsubimage3d_neg_offset");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018990,
        "dEQP-GLES31.functional.debug.negative_coverage.l",
        "og.texture.compressedtexsubimage3d_invalid_offset");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018991,
        "dEQP-GLES31.functional.debug.negative_coverage.log.t",
        "exture.compressedtexsubimage3d_neg_width_height_depth");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018992,
        "dEQP-GLES31.functional.debug.negative_coverage.",
        "log.texture.compressedtexsubimage3d_invalid_size");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018993,
        "dEQP-GLES31.functional.debug.negative_coverage.log.t",
        "exture.compressedtexsubimage3d_invalid_buffer_target");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018994,
        "dEQP-GLES31.functional.debug.negati",
        "ve_coverage.log.texture.texstorage2d");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018995,
        "dEQP-GLES31.functional.debug.negative_cover",
        "age.log.texture.texstorage2d_invalid_binding");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018996,
        "dEQP-GLES31.functional.debug.negative_cover",
        "age.log.texture.texstorage2d_invalid_levels");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018997,
        "dEQP-GLES31.functional.debug.negati",
        "ve_coverage.log.texture.texstorage3d");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018998,
        "dEQP-GLES31.functional.debug.negative_cover",
        "age.log.texture.texstorage3d_invalid_binding");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018999,
        "dEQP-GLES31.functional.debug.negative_cover",
        "age.log.texture.texstorage3d_invalid_levels");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_019000,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.log.texture.srgb_decode_texparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_019001,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.log.texture.srgb_decode_texparameterf");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_019002,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.log.texture.srgb_decode_texparameteriv");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_019003,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.log.texture.srgb_decode_texparameterfv");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_019004,
        "dEQP-GLES31.functional.debug.negative_cover",
        "age.log.texture.srgb_decode_texparameterIiv");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_019005,
        "dEQP-GLES31.functional.debug.negative_cover",
        "age.log.texture.srgb_decode_texparameterIuiv");
