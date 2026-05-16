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
#include "../ActsDeqpgles30027TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026093,
        "dEQP-GLES3.functional.texture.specification.t",
        "exsubimage2d_empty_tex.alpha_unsigned_byte_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026094,
        "dEQP-GLES3.functional.texture.specification.te",
        "xsubimage2d_empty_tex.alpha_unsigned_byte_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026095,
        "dEQP-GLES3.functional.texture.specification.tex",
        "subimage2d_empty_tex.luminance_unsigned_byte_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026096,
        "dEQP-GLES3.functional.texture.specification.texs",
        "ubimage2d_empty_tex.luminance_unsigned_byte_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026097,
        "dEQP-GLES3.functional.texture.specification.texsub",
        "image2d_empty_tex.luminance_alpha_unsigned_byte_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026098,
        "dEQP-GLES3.functional.texture.specification.texsubi",
        "mage2d_empty_tex.luminance_alpha_unsigned_byte_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026099,
        "dEQP-GLES3.functional.texture.specification.tex",
        "subimage2d_empty_tex.rgb_unsigned_short_5_6_5_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026100,
        "dEQP-GLES3.functional.texture.specification.texs",
        "ubimage2d_empty_tex.rgb_unsigned_short_5_6_5_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026101,
        "dEQP-GLES3.functional.texture.specification.",
        "texsubimage2d_empty_tex.rgb_unsigned_byte_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026102,
        "dEQP-GLES3.functional.texture.specification.t",
        "exsubimage2d_empty_tex.rgb_unsigned_byte_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026103,
        "dEQP-GLES3.functional.texture.specification.texsu",
        "bimage2d_empty_tex.rgba_unsigned_short_4_4_4_4_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026104,
        "dEQP-GLES3.functional.texture.specification.texsub",
        "image2d_empty_tex.rgba_unsigned_short_4_4_4_4_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026105,
        "dEQP-GLES3.functional.texture.specification.texsu",
        "bimage2d_empty_tex.rgba_unsigned_short_5_5_5_1_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026106,
        "dEQP-GLES3.functional.texture.specification.texsub",
        "image2d_empty_tex.rgba_unsigned_short_5_5_5_1_cube");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026107,
        "dEQP-GLES3.functional.texture.specification.",
        "texsubimage2d_empty_tex.rgba_unsigned_byte_2d");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026108,
        "dEQP-GLES3.functional.texture.specification.t",
        "exsubimage2d_empty_tex.rgba_unsigned_byte_cube");
