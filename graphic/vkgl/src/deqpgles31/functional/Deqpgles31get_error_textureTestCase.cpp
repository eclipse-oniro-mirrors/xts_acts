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
#include "../ActsDeqpgles310020TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019390,
        "dEQP-GLES31.functional.debug.negative_c",
        "overage.get_error.texture.activetexture");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019391,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.get_error.texture.bindtexture");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019392,
        "dEQP-GLES31.functional.debug.negative_coverage.get",
        "_error.texture.compressedteximage2d_invalid_target");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019393,
        "dEQP-GLES31.functional.debug.negative_coverage.get",
        "_error.texture.compressedteximage2d_invalid_format");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019394,
        "dEQP-GLES31.functional.debug.negative_coverage.",
        "get_error.texture.compressedteximage2d_neg_level");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019395,
        "dEQP-GLES31.functional.debug.negative_coverage.",
        "get_error.texture.compressedteximage2d_max_level");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019396,
        "dEQP-GLES31.functional.debug.negative_coverage.get_",
        "error.texture.compressedteximage2d_neg_width_height");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019397,
        "dEQP-GLES31.functional.debug.negative_coverage.get_",
        "error.texture.compressedteximage2d_max_width_height");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019398,
        "dEQP-GLES31.functional.debug.negative_coverage.get",
        "_error.texture.compressedteximage2d_invalid_border");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019399,
        "dEQP-GLES31.functional.debug.negative_coverage.ge",
        "t_error.texture.compressedteximage2d_invalid_size");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019400,
        "dEQP-GLES31.functional.debug.negative_coverage.",
        "get_error.texture.compressedteximage2d_neg_size");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019401,
        "dEQP-GLES31.functional.debug.negative_coverage.get_er",
        "ror.texture.compressedteximage2d_invalid_width_height");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019402,
        "dEQP-GLES31.functional.debug.negative_coverage.get_er",
        "ror.texture.compressedteximage2d_invalid_buffer_target");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019403,
        "dEQP-GLES31.functional.debug.negative_coverage.",
        "get_error.texture.copyteximage2d_invalid_target");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019404,
        "dEQP-GLES31.functional.debug.negative_coverage.",
        "get_error.texture.copyteximage2d_invalid_format");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019405,
        "dEQP-GLES31.functional.debug.negative_coverage.get_e",
        "rror.texture.copyteximage2d_inequal_width_height_cube");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019406,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.get_error.texture.copyteximage2d_neg_level");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019407,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.get_error.texture.copyteximage2d_max_level");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019408,
        "dEQP-GLES31.functional.debug.negative_coverage.g",
        "et_error.texture.copyteximage2d_neg_width_height");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019409,
        "dEQP-GLES31.functional.debug.negative_coverage.g",
        "et_error.texture.copyteximage2d_max_width_height");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019410,
        "dEQP-GLES31.functional.debug.negative_coverage.",
        "get_error.texture.copyteximage2d_invalid_border");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019411,
        "dEQP-GLES31.functional.debug.negative_coverage.get_",
        "error.texture.copyteximage2d_incomplete_framebuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019412,
        "dEQP-GLES31.functional.debug.negative_coverage.g",
        "et_error.texture.copytexsubimage2d_invalid_target");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019413,
        "dEQP-GLES31.functional.debug.negative_coverage.get_",
        "error.texture.copytexsubimage2d_read_buffer_is_none");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019414,
        "dEQP-GLES31.functional.debug.negative_coverage.get_e",
        "rror.texture.copytexsubimage2d_texture_internalformat");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019415,
        "dEQP-GLES31.functional.debug.negative_coverage",
        ".get_error.texture.copytexsubimage2d_neg_level");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019416,
        "dEQP-GLES31.functional.debug.negative_coverage",
        ".get_error.texture.copytexsubimage2d_max_level");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019417,
        "dEQP-GLES31.functional.debug.negative_coverage",
        ".get_error.texture.copytexsubimage2d_neg_offset");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019418,
        "dEQP-GLES31.functional.debug.negative_coverage.g",
        "et_error.texture.copytexsubimage2d_invalid_offset");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019419,
        "dEQP-GLES31.functional.debug.negative_coverage.ge",
        "t_error.texture.copytexsubimage2d_neg_width_height");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019420,
        "dEQP-GLES31.functional.debug.negative_coverage.get_e",
        "rror.texture.copytexsubimage2d_incomplete_framebuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019421,
        "dEQP-GLES31.functional.debug.negative_c",
        "overage.get_error.texture.deletetextures");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019422,
        "dEQP-GLES31.functional.debug.negative_c",
        "overage.get_error.texture.generatemipmap");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019423,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.get_error.texture.gentextures");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019424,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.get_error.texture.pixelstorei");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019425,
        "dEQP-GLES31.functional.debug.negative",
        "_coverage.get_error.texture.teximage2d");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019426,
        "dEQP-GLES31.functional.debug.negative_coverage.get",
        "_error.texture.teximage2d_inequal_width_height_cube");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019427,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.get_error.texture.teximage2d_neg_level");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019428,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.get_error.texture.teximage2d_max_level");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019429,
        "dEQP-GLES31.functional.debug.negative_coverage",
        ".get_error.texture.teximage2d_neg_width_height");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019430,
        "dEQP-GLES31.functional.debug.negative_coverage",
        ".get_error.texture.teximage2d_max_width_height");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019431,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.get_error.texture.teximage2d_invalid_border");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019432,
        "dEQP-GLES31.functional.debug.negative_coverage.g",
        "et_error.texture.teximage2d_invalid_buffer_target");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019433,
        "dEQP-GLES31.functional.debug.negative_c",
        "overage.get_error.texture.texsubimage2d");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019434,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.get_error.texture.texsubimage2d_neg_level");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019435,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.get_error.texture.texsubimage2d_max_level");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019436,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.get_error.texture.texsubimage2d_neg_offset");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019437,
        "dEQP-GLES31.functional.debug.negative_coverage",
        ".get_error.texture.texsubimage2d_invalid_offset");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019438,
        "dEQP-GLES31.functional.debug.negative_coverage.",
        "get_error.texture.texsubimage2d_neg_width_height");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019439,
        "dEQP-GLES31.functional.debug.negative_coverage.get",
        "_error.texture.texsubimage2d_invalid_buffer_target");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019440,
        "dEQP-GLES31.functional.debug.negative_c",
        "overage.get_error.texture.texparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019441,
        "dEQP-GLES31.functional.debug.negative_c",
        "overage.get_error.texture.texparameterf");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019442,
        "dEQP-GLES31.functional.debug.negative_c",
        "overage.get_error.texture.texparameteriv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019443,
        "dEQP-GLES31.functional.debug.negative_c",
        "overage.get_error.texture.texparameterfv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019444,
        "dEQP-GLES31.functional.debug.negative_co",
        "verage.get_error.texture.texparameterIiv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019445,
        "dEQP-GLES31.functional.debug.negative_co",
        "verage.get_error.texture.texparameterIuiv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019446,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.get_error.texture.compressedtexsubimage2d");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019447,
        "dEQP-GLES31.functional.debug.negative_coverage.ge",
        "t_error.texture.compressedtexsubimage2d_neg_level");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019448,
        "dEQP-GLES31.functional.debug.negative_coverage.ge",
        "t_error.texture.compressedtexsubimage2d_max_level");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019449,
        "dEQP-GLES31.functional.debug.negative_coverage.ge",
        "t_error.texture.compressedtexsubimage2d_neg_offset");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019450,
        "dEQP-GLES31.functional.debug.negative_coverage.get_",
        "error.texture.compressedtexsubimage2d_invalid_offset");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019451,
        "dEQP-GLES31.functional.debug.negative_coverage.get_e",
        "rror.texture.compressedtexsubimage2d_neg_width_height");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019452,
        "dEQP-GLES31.functional.debug.negative_coverage.get",
        "_error.texture.compressedtexsubimage2d_invalid_size");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019453,
        "dEQP-GLES31.functional.debug.negative_coverage.get_erro",
        "r.texture.compressedtexsubimage2d_invalid_buffer_target");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019454,
        "dEQP-GLES31.functional.debug.negative",
        "_coverage.get_error.texture.teximage3d");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019455,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.get_error.texture.teximage3d_neg_level");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019456,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.get_error.texture.teximage3d_max_level");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019457,
        "dEQP-GLES31.functional.debug.negative_coverage.ge",
        "t_error.texture.teximage3d_neg_width_height_depth");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019458,
        "dEQP-GLES31.functional.debug.negative_coverage.ge",
        "t_error.texture.teximage3d_max_width_height_depth");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019459,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.get_error.texture.teximage3d_invalid_border");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019460,
        "dEQP-GLES31.functional.debug.negative_coverage.g",
        "et_error.texture.teximage3d_invalid_buffer_target");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019461,
        "dEQP-GLES31.functional.debug.negative_c",
        "overage.get_error.texture.texsubimage3d");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019462,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.get_error.texture.texsubimage3d_neg_level");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019463,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.get_error.texture.texsubimage3d_max_level");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019464,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.get_error.texture.texsubimage3d_neg_offset");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019465,
        "dEQP-GLES31.functional.debug.negative_coverage",
        ".get_error.texture.texsubimage3d_invalid_offset");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019466,
        "dEQP-GLES31.functional.debug.negative_coverage.",
        "get_error.texture.texsubimage3d_neg_width_height");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019467,
        "dEQP-GLES31.functional.debug.negative_coverage.get",
        "_error.texture.texsubimage3d_invalid_buffer_target");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019468,
        "dEQP-GLES31.functional.debug.negative_cov",
        "erage.get_error.texture.copytexsubimage3d");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019469,
        "dEQP-GLES31.functional.debug.negative_coverage",
        ".get_error.texture.copytexsubimage3d_neg_level");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019470,
        "dEQP-GLES31.functional.debug.negative_coverage",
        ".get_error.texture.copytexsubimage3d_max_level");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019471,
        "dEQP-GLES31.functional.debug.negative_coverage",
        ".get_error.texture.copytexsubimage3d_neg_offset");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019472,
        "dEQP-GLES31.functional.debug.negative_coverage.g",
        "et_error.texture.copytexsubimage3d_invalid_offset");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019473,
        "dEQP-GLES31.functional.debug.negative_coverage.ge",
        "t_error.texture.copytexsubimage3d_neg_width_height");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019474,
        "dEQP-GLES31.functional.debug.negative_coverage.get_e",
        "rror.texture.copytexsubimage3d_incomplete_framebuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019475,
        "dEQP-GLES31.functional.debug.negative_cove",
        "rage.get_error.texture.compressedteximage3d");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019476,
        "dEQP-GLES31.functional.debug.negative_coverage.",
        "get_error.texture.compressedteximage3d_neg_level");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019477,
        "dEQP-GLES31.functional.debug.negative_coverage.",
        "get_error.texture.compressedteximage3d_max_level");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019478,
        "dEQP-GLES31.functional.debug.negative_coverage.get_err",
        "or.texture.compressedteximage3d_neg_width_height_depth");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019479,
        "dEQP-GLES31.functional.debug.negative_coverage.get_err",
        "or.texture.compressedteximage3d_max_width_height_depth");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019480,
        "dEQP-GLES31.functional.debug.negative_coverage.get",
        "_error.texture.compressedteximage3d_invalid_border");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019481,
        "dEQP-GLES31.functional.debug.negative_coverage.ge",
        "t_error.texture.compressedteximage3d_invalid_size");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019482,
        "dEQP-GLES31.functional.debug.negative_coverage.get_er",
        "ror.texture.compressedteximage3d_invalid_buffer_target");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019483,
        "dEQP-GLES31.functional.debug.negative_covera",
        "ge.get_error.texture.compressedtexsubimage3d");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019484,
        "dEQP-GLES31.functional.debug.negative_coverage.ge",
        "t_error.texture.compressedtexsubimage3d_neg_level");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019485,
        "dEQP-GLES31.functional.debug.negative_coverage.ge",
        "t_error.texture.compressedtexsubimage3d_max_level");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019486,
        "dEQP-GLES31.functional.debug.negative_coverage.ge",
        "t_error.texture.compressedtexsubimage3d_neg_offset");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019487,
        "dEQP-GLES31.functional.debug.negative_coverage.get_",
        "error.texture.compressedtexsubimage3d_invalid_offset");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019488,
        "dEQP-GLES31.functional.debug.negative_coverage.get_erro",
        "r.texture.compressedtexsubimage3d_neg_width_height_depth");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019489,
        "dEQP-GLES31.functional.debug.negative_coverage.get",
        "_error.texture.compressedtexsubimage3d_invalid_size");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019490,
        "dEQP-GLES31.functional.debug.negative_coverage.get_erro",
        "r.texture.compressedtexsubimage3d_invalid_buffer_target");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019491,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.get_error.texture.texstorage2d");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019492,
        "dEQP-GLES31.functional.debug.negative_coverage",
        ".get_error.texture.texstorage2d_invalid_binding");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019493,
        "dEQP-GLES31.functional.debug.negative_coverage",
        ".get_error.texture.texstorage2d_invalid_levels");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019494,
        "dEQP-GLES31.functional.debug.negative_",
        "coverage.get_error.texture.texstorage3d");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019495,
        "dEQP-GLES31.functional.debug.negative_coverage",
        ".get_error.texture.texstorage3d_invalid_binding");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019496,
        "dEQP-GLES31.functional.debug.negative_coverage",
        ".get_error.texture.texstorage3d_invalid_levels");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019497,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.get_error.texture.srgb_decode_texparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019498,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.get_error.texture.srgb_decode_texparameterf");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019499,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.get_error.texture.srgb_decode_texparameteriv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019500,
        "dEQP-GLES31.functional.debug.negative_coverag",
        "e.get_error.texture.srgb_decode_texparameterfv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019501,
        "dEQP-GLES31.functional.debug.negative_coverage",
        ".get_error.texture.srgb_decode_texparameterIiv");

static SHRINK_HWTEST_F(ActsDeqpgles310020TestSuite, TestCase_019502,
        "dEQP-GLES31.functional.debug.negative_coverage",
        ".get_error.texture.srgb_decode_texparameterIuiv");
