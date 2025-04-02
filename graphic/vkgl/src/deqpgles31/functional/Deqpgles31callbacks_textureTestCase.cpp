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

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018394,
        "dEQP-GLES31.functional.debug.negative_c",
        "overage.callbacks.texture.activetexture");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018395,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.callbacks.texture.bindtexture");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018396,
        "dEQP-GLES31.functional.debug.negative_coverage.cal",
        "lbacks.texture.compressedteximage2d_invalid_target");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018397,
        "dEQP-GLES31.functional.debug.negative_coverage.cal",
        "lbacks.texture.compressedteximage2d_invalid_format");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018398,
        "dEQP-GLES31.functional.debug.negative_coverage.",
        "callbacks.texture.compressedteximage2d_neg_level");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018399,
        "dEQP-GLES31.functional.debug.negative_coverage.",
        "callbacks.texture.compressedteximage2d_max_level");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018400,
        "dEQP-GLES31.functional.debug.negative_coverage.call",
        "backs.texture.compressedteximage2d_neg_width_height");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018401,
        "dEQP-GLES31.functional.debug.negative_coverage.call",
        "backs.texture.compressedteximage2d_max_width_height");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018402,
        "dEQP-GLES31.functional.debug.negative_coverage.cal",
        "lbacks.texture.compressedteximage2d_invalid_border");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018403,
        "dEQP-GLES31.functional.debug.negative_coverage.ca",
        "llbacks.texture.compressedteximage2d_invalid_size");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018404,
        "dEQP-GLES31.functional.debug.negative_coverage.",
        "callbacks.texture.compressedteximage2d_neg_size");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018405,
        "dEQP-GLES31.functional.debug.negative_coverage.callba",
        "cks.texture.compressedteximage2d_invalid_width_height");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018406,
        "dEQP-GLES31.functional.debug.negative_coverage.callba",
        "cks.texture.compressedteximage2d_invalid_buffer_target");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018407,
        "dEQP-GLES31.functional.debug.negative_coverage.",
        "callbacks.texture.copyteximage2d_invalid_target");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018408,
        "dEQP-GLES31.functional.debug.negative_coverage.",
        "callbacks.texture.copyteximage2d_invalid_format");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018409,
        "dEQP-GLES31.functional.debug.negative_coverage.callb",
        "acks.texture.copyteximage2d_inequal_width_height_cube");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018410,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.callbacks.texture.copyteximage2d_neg_level");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018411,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.callbacks.texture.copyteximage2d_max_level");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018412,
        "dEQP-GLES31.functional.debug.negative_coverage.c",
        "allbacks.texture.copyteximage2d_neg_width_height");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018413,
        "dEQP-GLES31.functional.debug.negative_coverage.c",
        "allbacks.texture.copyteximage2d_max_width_height");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018414,
        "dEQP-GLES31.functional.debug.negative_coverage.",
        "callbacks.texture.copyteximage2d_invalid_border");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018415,
        "dEQP-GLES31.functional.debug.negative_coverage.call",
        "backs.texture.copyteximage2d_incomplete_framebuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018416,
        "dEQP-GLES31.functional.debug.negative_coverage.c",
        "allbacks.texture.copytexsubimage2d_invalid_target");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018417,
        "dEQP-GLES31.functional.debug.negative_coverage.call",
        "backs.texture.copytexsubimage2d_read_buffer_is_none");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018418,
        "dEQP-GLES31.functional.debug.negative_coverage.callb",
        "acks.texture.copytexsubimage2d_texture_internalformat");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018419,
        "dEQP-GLES31.functional.debug.negative_coverage",
        ".callbacks.texture.copytexsubimage2d_neg_level");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018420,
        "dEQP-GLES31.functional.debug.negative_coverage",
        ".callbacks.texture.copytexsubimage2d_max_level");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018421,
        "dEQP-GLES31.functional.debug.negative_coverage",
        ".callbacks.texture.copytexsubimage2d_neg_offset");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018422,
        "dEQP-GLES31.functional.debug.negative_coverage.c",
        "allbacks.texture.copytexsubimage2d_invalid_offset");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018423,
        "dEQP-GLES31.functional.debug.negative_coverage.ca",
        "llbacks.texture.copytexsubimage2d_neg_width_height");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018424,
        "dEQP-GLES31.functional.debug.negative_coverage.callb",
        "acks.texture.copytexsubimage2d_incomplete_framebuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018425,
        "dEQP-GLES31.functional.debug.negative_c",
        "overage.callbacks.texture.deletetextures");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018426,
        "dEQP-GLES31.functional.debug.negative_c",
        "overage.callbacks.texture.generatemipmap");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018427,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.callbacks.texture.gentextures");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018428,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.callbacks.texture.pixelstorei");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018429,
        "dEQP-GLES31.functional.debug.negative",
        "_coverage.callbacks.texture.teximage2d");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018430,
        "dEQP-GLES31.functional.debug.negative_coverage.cal",
        "lbacks.texture.teximage2d_inequal_width_height_cube");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018431,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.callbacks.texture.teximage2d_neg_level");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018432,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.callbacks.texture.teximage2d_max_level");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018433,
        "dEQP-GLES31.functional.debug.negative_coverage",
        ".callbacks.texture.teximage2d_neg_width_height");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018434,
        "dEQP-GLES31.functional.debug.negative_coverage",
        ".callbacks.texture.teximage2d_max_width_height");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018435,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.callbacks.texture.teximage2d_invalid_border");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018436,
        "dEQP-GLES31.functional.debug.negative_coverage.c",
        "allbacks.texture.teximage2d_invalid_buffer_target");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018437,
        "dEQP-GLES31.functional.debug.negative_c",
        "overage.callbacks.texture.texsubimage2d");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018438,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.callbacks.texture.texsubimage2d_neg_level");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018439,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.callbacks.texture.texsubimage2d_max_level");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018440,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.callbacks.texture.texsubimage2d_neg_offset");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018441,
        "dEQP-GLES31.functional.debug.negative_coverage",
        ".callbacks.texture.texsubimage2d_invalid_offset");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018442,
        "dEQP-GLES31.functional.debug.negative_coverage.",
        "callbacks.texture.texsubimage2d_neg_width_height");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018443,
        "dEQP-GLES31.functional.debug.negative_coverage.cal",
        "lbacks.texture.texsubimage2d_invalid_buffer_target");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018444,
        "dEQP-GLES31.functional.debug.negative_c",
        "overage.callbacks.texture.texparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018445,
        "dEQP-GLES31.functional.debug.negative_c",
        "overage.callbacks.texture.texparameterf");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018446,
        "dEQP-GLES31.functional.debug.negative_c",
        "overage.callbacks.texture.texparameteriv");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018447,
        "dEQP-GLES31.functional.debug.negative_c",
        "overage.callbacks.texture.texparameterfv");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018448,
        "dEQP-GLES31.functional.debug.negative_co",
        "verage.callbacks.texture.texparameterIiv");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018449,
        "dEQP-GLES31.functional.debug.negative_co",
        "verage.callbacks.texture.texparameterIuiv");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018450,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.callbacks.texture.compressedtexsubimage2d");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018451,
        "dEQP-GLES31.functional.debug.negative_coverage.ca",
        "llbacks.texture.compressedtexsubimage2d_neg_level");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018452,
        "dEQP-GLES31.functional.debug.negative_coverage.ca",
        "llbacks.texture.compressedtexsubimage2d_max_level");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018453,
        "dEQP-GLES31.functional.debug.negative_coverage.ca",
        "llbacks.texture.compressedtexsubimage2d_neg_offset");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018454,
        "dEQP-GLES31.functional.debug.negative_coverage.call",
        "backs.texture.compressedtexsubimage2d_invalid_offset");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018455,
        "dEQP-GLES31.functional.debug.negative_coverage.callb",
        "acks.texture.compressedtexsubimage2d_neg_width_height");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018456,
        "dEQP-GLES31.functional.debug.negative_coverage.cal",
        "lbacks.texture.compressedtexsubimage2d_invalid_size");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018457,
        "dEQP-GLES31.functional.debug.negative_coverage.callback",
        "s.texture.compressedtexsubimage2d_invalid_buffer_target");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018458,
        "dEQP-GLES31.functional.debug.negative",
        "_coverage.callbacks.texture.teximage3d");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018459,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.callbacks.texture.teximage3d_neg_level");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018460,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.callbacks.texture.teximage3d_max_level");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018461,
        "dEQP-GLES31.functional.debug.negative_coverage.ca",
        "llbacks.texture.teximage3d_neg_width_height_depth");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018462,
        "dEQP-GLES31.functional.debug.negative_coverage.ca",
        "llbacks.texture.teximage3d_max_width_height_depth");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018463,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.callbacks.texture.teximage3d_invalid_border");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018464,
        "dEQP-GLES31.functional.debug.negative_coverage.c",
        "allbacks.texture.teximage3d_invalid_buffer_target");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018465,
        "dEQP-GLES31.functional.debug.negative_c",
        "overage.callbacks.texture.texsubimage3d");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018466,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.callbacks.texture.texsubimage3d_neg_level");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018467,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.callbacks.texture.texsubimage3d_max_level");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018468,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.callbacks.texture.texsubimage3d_neg_offset");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018469,
        "dEQP-GLES31.functional.debug.negative_coverage",
        ".callbacks.texture.texsubimage3d_invalid_offset");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018470,
        "dEQP-GLES31.functional.debug.negative_coverage.",
        "callbacks.texture.texsubimage3d_neg_width_height");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018471,
        "dEQP-GLES31.functional.debug.negative_coverage.cal",
        "lbacks.texture.texsubimage3d_invalid_buffer_target");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018472,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.callbacks.texture.copytexsubimage3d");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018473,
        "dEQP-GLES31.functional.debug.negative_coverage",
        ".callbacks.texture.copytexsubimage3d_neg_level");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018474,
        "dEQP-GLES31.functional.debug.negative_coverage",
        ".callbacks.texture.copytexsubimage3d_max_level");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018475,
        "dEQP-GLES31.functional.debug.negative_coverage",
        ".callbacks.texture.copytexsubimage3d_neg_offset");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018476,
        "dEQP-GLES31.functional.debug.negative_coverage.c",
        "allbacks.texture.copytexsubimage3d_invalid_offset");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018477,
        "dEQP-GLES31.functional.debug.negative_coverage.ca",
        "llbacks.texture.copytexsubimage3d_neg_width_height");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018478,
        "dEQP-GLES31.functional.debug.negative_coverage.callb",
        "acks.texture.copytexsubimage3d_incomplete_framebuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018479,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.callbacks.texture.compressedteximage3d");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018480,
        "dEQP-GLES31.functional.debug.negative_coverage.",
        "callbacks.texture.compressedteximage3d_neg_level");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018481,
        "dEQP-GLES31.functional.debug.negative_coverage.",
        "callbacks.texture.compressedteximage3d_max_level");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018482,
        "dEQP-GLES31.functional.debug.negative_coverage.callbac",
        "ks.texture.compressedteximage3d_neg_width_height_depth");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018483,
        "dEQP-GLES31.functional.debug.negative_coverage.callbac",
        "ks.texture.compressedteximage3d_max_width_height_depth");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018484,
        "dEQP-GLES31.functional.debug.negative_coverage.cal",
        "lbacks.texture.compressedteximage3d_invalid_border");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018485,
        "dEQP-GLES31.functional.debug.negative_coverage.ca",
        "llbacks.texture.compressedteximage3d_invalid_size");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018486,
        "dEQP-GLES31.functional.debug.negative_coverage.callba",
        "cks.texture.compressedteximage3d_invalid_width_height");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018487,
        "dEQP-GLES31.functional.debug.negative_coverage.callba",
        "cks.texture.compressedteximage3d_invalid_buffer_target");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018488,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.callbacks.texture.compressedtexsubimage3d");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018489,
        "dEQP-GLES31.functional.debug.negative_coverage.ca",
        "llbacks.texture.compressedtexsubimage3d_neg_level");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018490,
        "dEQP-GLES31.functional.debug.negative_coverage.ca",
        "llbacks.texture.compressedtexsubimage3d_max_level");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018491,
        "dEQP-GLES31.functional.debug.negative_coverage.ca",
        "llbacks.texture.compressedtexsubimage3d_neg_offset");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018492,
        "dEQP-GLES31.functional.debug.negative_coverage.call",
        "backs.texture.compressedtexsubimage3d_invalid_offset");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018493,
        "dEQP-GLES31.functional.debug.negative_coverage.callback",
        "s.texture.compressedtexsubimage3d_neg_width_height_depth");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018494,
        "dEQP-GLES31.functional.debug.negative_coverage.cal",
        "lbacks.texture.compressedtexsubimage3d_invalid_size");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018495,
        "dEQP-GLES31.functional.debug.negative_coverage.callback",
        "s.texture.compressedtexsubimage3d_invalid_buffer_target");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018496,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.callbacks.texture.texstorage2d");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018497,
        "dEQP-GLES31.functional.debug.negative_coverage",
        ".callbacks.texture.texstorage2d_invalid_binding");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018498,
        "dEQP-GLES31.functional.debug.negative_coverage",
        ".callbacks.texture.texstorage2d_invalid_levels");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018499,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.callbacks.texture.texstorage3d");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018500,
        "dEQP-GLES31.functional.debug.negative_coverage",
        ".callbacks.texture.texstorage3d_invalid_binding");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018501,
        "dEQP-GLES31.functional.debug.negative_coverage",
        ".callbacks.texture.texstorage3d_invalid_levels");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018502,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.callbacks.texture.srgb_decode_texparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018503,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.callbacks.texture.srgb_decode_texparameterf");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018504,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.callbacks.texture.srgb_decode_texparameteriv");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018505,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.callbacks.texture.srgb_decode_texparameterfv");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018506,
        "dEQP-GLES31.functional.debug.negative_coverage",
        ".callbacks.texture.srgb_decode_texparameterIiv");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018507,
        "dEQP-GLES31.functional.debug.negative_coverage",
        ".callbacks.texture.srgb_decode_texparameterIuiv");
