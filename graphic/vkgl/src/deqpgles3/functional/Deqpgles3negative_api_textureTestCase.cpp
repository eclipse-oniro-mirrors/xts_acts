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
#include "../Deqpgles3BaseFunc.h"
#include "../ActsDeqpgles30042TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041956,
        "dEQP-GLES3.functional.negati",
        "ve_api.texture.activetexture");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041957,
        "dEQP-GLES3.functional.negat",
        "ive_api.texture.bindtexture");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041958,
        "dEQP-GLES3.functional.negative_api.text",
        "ure.compressedteximage2d_invalid_target");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041959,
        "dEQP-GLES3.functional.negative_api.text",
        "ure.compressedteximage2d_invalid_format");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041960,
        "dEQP-GLES3.functional.negative_api.t",
        "exture.compressedteximage2d_neg_level");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041961,
        "dEQP-GLES3.functional.negative_api.t",
        "exture.compressedteximage2d_max_level");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041962,
        "dEQP-GLES3.functional.negative_api.textu",
        "re.compressedteximage2d_neg_width_height");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041963,
        "dEQP-GLES3.functional.negative_api.textu",
        "re.compressedteximage2d_max_width_height");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041964,
        "dEQP-GLES3.functional.negative_api.text",
        "ure.compressedteximage2d_invalid_border");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041965,
        "dEQP-GLES3.functional.negative_api.tex",
        "ture.compressedteximage2d_invalid_size");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041966,
        "dEQP-GLES3.functional.negative_api.texture",
        ".compressedteximage2d_invalid_buffer_target");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041967,
        "dEQP-GLES3.functional.negative_api.textur",
        "e.compressedteximage2d_invalid_astc_target");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041968,
        "dEQP-GLES3.functional.negative_api.t",
        "exture.copyteximage2d_invalid_target");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041969,
        "dEQP-GLES3.functional.negative_api.t",
        "exture.copyteximage2d_invalid_format");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041970,
        "dEQP-GLES3.functional.negative_api.textur",
        "e.copyteximage2d_inequal_width_height_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041971,
        "dEQP-GLES3.functional.negative_ap",
        "i.texture.copyteximage2d_neg_level");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041972,
        "dEQP-GLES3.functional.negative_ap",
        "i.texture.copyteximage2d_max_level");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041973,
        "dEQP-GLES3.functional.negative_api.te",
        "xture.copyteximage2d_neg_width_height");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041974,
        "dEQP-GLES3.functional.negative_api.te",
        "xture.copyteximage2d_max_width_height");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041975,
        "dEQP-GLES3.functional.negative_api.t",
        "exture.copyteximage2d_invalid_border");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041976,
        "dEQP-GLES3.functional.negative_api.textu",
        "re.copyteximage2d_incomplete_framebuffer");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041977,
        "dEQP-GLES3.functional.negative_api.te",
        "xture.copytexsubimage2d_invalid_target");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041978,
        "dEQP-GLES3.functional.negative_api.",
        "texture.copytexsubimage2d_neg_level");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041979,
        "dEQP-GLES3.functional.negative_api.",
        "texture.copytexsubimage2d_max_level");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041980,
        "dEQP-GLES3.functional.negative_api.",
        "texture.copytexsubimage2d_neg_offset");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041981,
        "dEQP-GLES3.functional.negative_api.te",
        "xture.copytexsubimage2d_invalid_offset");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041982,
        "dEQP-GLES3.functional.negative_api.tex",
        "ture.copytexsubimage2d_neg_width_height");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041983,
        "dEQP-GLES3.functional.negative_api.textur",
        "e.copytexsubimage2d_incomplete_framebuffer");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041984,
        "dEQP-GLES3.functional.negati",
        "ve_api.texture.deletetextures");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041985,
        "dEQP-GLES3.functional.negati",
        "ve_api.texture.generatemipmap");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041986,
        "dEQP-GLES3.functional.negat",
        "ive_api.texture.gentextures");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041987,
        "dEQP-GLES3.functional.negat",
        "ive_api.texture.pixelstorei");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041988,
        "dEQP-GLES3.functional.nega",
        "tive_api.texture.teximage2d");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041989,
        "dEQP-GLES3.functional.negative_api.text",
        "ure.teximage2d_inequal_width_height_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041990,
        "dEQP-GLES3.functional.negative_",
        "api.texture.teximage2d_neg_level");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041991,
        "dEQP-GLES3.functional.negative_",
        "api.texture.teximage2d_max_level");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041992,
        "dEQP-GLES3.functional.negative_api.",
        "texture.teximage2d_neg_width_height");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041993,
        "dEQP-GLES3.functional.negative_api.",
        "texture.teximage2d_max_width_height");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041994,
        "dEQP-GLES3.functional.negative_api",
        ".texture.teximage2d_invalid_border");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041995,
        "dEQP-GLES3.functional.negative_api.te",
        "xture.teximage2d_invalid_buffer_target");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041996,
        "dEQP-GLES3.functional.negati",
        "ve_api.texture.texsubimage2d");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041997,
        "dEQP-GLES3.functional.negative_ap",
        "i.texture.texsubimage2d_neg_level");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041998,
        "dEQP-GLES3.functional.negative_ap",
        "i.texture.texsubimage2d_max_level");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041999,
        "dEQP-GLES3.functional.negative_ap",
        "i.texture.texsubimage2d_neg_offset");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_042000,
        "dEQP-GLES3.functional.negative_api.",
        "texture.texsubimage2d_invalid_offset");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_042001,
        "dEQP-GLES3.functional.negative_api.t",
        "exture.texsubimage2d_neg_width_height");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_042002,
        "dEQP-GLES3.functional.negative_api.text",
        "ure.texsubimage2d_invalid_buffer_target");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_042003,
        "dEQP-GLES3.functional.negati",
        "ve_api.texture.texparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_042004,
        "dEQP-GLES3.functional.negati",
        "ve_api.texture.texparameterf");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_042005,
        "dEQP-GLES3.functional.negati",
        "ve_api.texture.texparameteriv");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_042006,
        "dEQP-GLES3.functional.negati",
        "ve_api.texture.texparameterfv");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_042007,
        "dEQP-GLES3.functional.negative_ap",
        "i.texture.compressedtexsubimage2d");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_042008,
        "dEQP-GLES3.functional.negative_api.tex",
        "ture.compressedtexsubimage2d_neg_level");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_042009,
        "dEQP-GLES3.functional.negative_api.tex",
        "ture.compressedtexsubimage2d_max_level");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_042010,
        "dEQP-GLES3.functional.negative_api.tex",
        "ture.compressedtexsubimage2d_neg_offset");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_042011,
        "dEQP-GLES3.functional.negative_api.textu",
        "re.compressedtexsubimage2d_invalid_offset");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_042012,
        "dEQP-GLES3.functional.negative_api.textur",
        "e.compressedtexsubimage2d_neg_width_height");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_042013,
        "dEQP-GLES3.functional.negative_api.text",
        "ure.compressedtexsubimage2d_invalid_size");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_042014,
        "dEQP-GLES3.functional.negative_api.texture.c",
        "ompressedtexsubimage2d_invalid_buffer_target");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_042015,
        "dEQP-GLES3.functional.nega",
        "tive_api.texture.teximage3d");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_042016,
        "dEQP-GLES3.functional.negative_",
        "api.texture.teximage3d_neg_level");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_042017,
        "dEQP-GLES3.functional.negative_",
        "api.texture.teximage3d_max_level");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_042018,
        "dEQP-GLES3.functional.negative_api.tex",
        "ture.teximage3d_neg_width_height_depth");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_042019,
        "dEQP-GLES3.functional.negative_api.tex",
        "ture.teximage3d_max_width_height_depth");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_042020,
        "dEQP-GLES3.functional.negative_api",
        ".texture.teximage3d_invalid_border");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_042021,
        "dEQP-GLES3.functional.negative_api.te",
        "xture.teximage3d_invalid_buffer_target");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_042022,
        "dEQP-GLES3.functional.negati",
        "ve_api.texture.texsubimage3d");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_042023,
        "dEQP-GLES3.functional.negative_ap",
        "i.texture.texsubimage3d_neg_level");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_042024,
        "dEQP-GLES3.functional.negative_ap",
        "i.texture.texsubimage3d_max_level");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_042025,
        "dEQP-GLES3.functional.negative_ap",
        "i.texture.texsubimage3d_neg_offset");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_042026,
        "dEQP-GLES3.functional.negative_api.",
        "texture.texsubimage3d_invalid_offset");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_042027,
        "dEQP-GLES3.functional.negative_api.t",
        "exture.texsubimage3d_neg_width_height");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_042028,
        "dEQP-GLES3.functional.negative_api.text",
        "ure.texsubimage3d_invalid_buffer_target");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_042029,
        "dEQP-GLES3.functional.negative",
        "_api.texture.copytexsubimage3d");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_042030,
        "dEQP-GLES3.functional.negative_api.",
        "texture.copytexsubimage3d_neg_level");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_042031,
        "dEQP-GLES3.functional.negative_api.",
        "texture.copytexsubimage3d_max_level");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_042032,
        "dEQP-GLES3.functional.negative_api.",
        "texture.copytexsubimage3d_neg_offset");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_042033,
        "dEQP-GLES3.functional.negative_api.te",
        "xture.copytexsubimage3d_invalid_offset");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_042034,
        "dEQP-GLES3.functional.negative_api.tex",
        "ture.copytexsubimage3d_neg_width_height");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_042035,
        "dEQP-GLES3.functional.negative_api.textur",
        "e.copytexsubimage3d_incomplete_framebuffer");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_042036,
        "dEQP-GLES3.functional.negative_",
        "api.texture.compressedteximage3d");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_042037,
        "dEQP-GLES3.functional.negative_api.t",
        "exture.compressedteximage3d_neg_level");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_042038,
        "dEQP-GLES3.functional.negative_api.t",
        "exture.compressedteximage3d_max_level");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_042039,
        "dEQP-GLES3.functional.negative_api.texture.",
        "compressedteximage3d_neg_width_height_depth");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_042040,
        "dEQP-GLES3.functional.negative_api.texture.",
        "compressedteximage3d_max_width_height_depth");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_042041,
        "dEQP-GLES3.functional.negative_api.text",
        "ure.compressedteximage3d_invalid_border");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_042042,
        "dEQP-GLES3.functional.negative_api.tex",
        "ture.compressedteximage3d_invalid_size");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_042043,
        "dEQP-GLES3.functional.negative_api.texture",
        ".compressedteximage3d_invalid_buffer_target");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_042044,
        "dEQP-GLES3.functional.negative_ap",
        "i.texture.compressedtexsubimage3d");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_042045,
        "dEQP-GLES3.functional.negative_api.tex",
        "ture.compressedtexsubimage3d_neg_level");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_042046,
        "dEQP-GLES3.functional.negative_api.tex",
        "ture.compressedtexsubimage3d_max_level");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_042047,
        "dEQP-GLES3.functional.negative_api.tex",
        "ture.compressedtexsubimage3d_neg_offset");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_042048,
        "dEQP-GLES3.functional.negative_api.textu",
        "re.compressedtexsubimage3d_invalid_offset");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_042049,
        "dEQP-GLES3.functional.negative_api.texture.c",
        "ompressedtexsubimage3d_neg_width_height_depth");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_042050,
        "dEQP-GLES3.functional.negative_api.text",
        "ure.compressedtexsubimage3d_invalid_size");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_042051,
        "dEQP-GLES3.functional.negative_api.texture.c",
        "ompressedtexsubimage3d_invalid_buffer_target");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_042052,
        "dEQP-GLES3.functional.negat",
        "ive_api.texture.texstorage2d");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_042053,
        "dEQP-GLES3.functional.negative_api.",
        "texture.texstorage2d_invalid_binding");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_042054,
        "dEQP-GLES3.functional.negative_api.",
        "texture.texstorage2d_invalid_levels");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_042055,
        "dEQP-GLES3.functional.negative_api.te",
        "xture.texstorage2d_invalid_astc_target");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_042056,
        "dEQP-GLES3.functional.negat",
        "ive_api.texture.texstorage3d");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_042057,
        "dEQP-GLES3.functional.negative_api.",
        "texture.texstorage3d_invalid_binding");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_042058,
        "dEQP-GLES3.functional.negative_api.",
        "texture.texstorage3d_invalid_levels");
