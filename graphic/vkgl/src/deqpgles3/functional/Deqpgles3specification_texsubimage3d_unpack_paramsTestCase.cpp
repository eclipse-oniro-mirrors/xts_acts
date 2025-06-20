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

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026579,
        "dEQP-GLES3.functional.texture.specification.",
        "texsubimage3d_unpack_params.rgb8_image_height");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026580,
        "dEQP-GLES3.functional.texture.specification",
        ".texsubimage3d_unpack_params.rgb8_row_length");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026581,
        "dEQP-GLES3.functional.texture.specification.",
        "texsubimage3d_unpack_params.rgb8_skip_images");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026582,
        "dEQP-GLES3.functional.texture.specification",
        ".texsubimage3d_unpack_params.rgb8_skip_rows");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026583,
        "dEQP-GLES3.functional.texture.specification.",
        "texsubimage3d_unpack_params.rgb8_skip_pixels");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026584,
        "dEQP-GLES3.functional.texture.specificati",
        "on.texsubimage3d_unpack_params.r8_complex1");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026585,
        "dEQP-GLES3.functional.texture.specificati",
        "on.texsubimage3d_unpack_params.r8_complex2");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026586,
        "dEQP-GLES3.functional.texture.specificati",
        "on.texsubimage3d_unpack_params.r8_complex3");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026587,
        "dEQP-GLES3.functional.texture.specificati",
        "on.texsubimage3d_unpack_params.r8_complex4");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026588,
        "dEQP-GLES3.functional.texture.specification",
        ".texsubimage3d_unpack_params.rgba8_complex1");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026589,
        "dEQP-GLES3.functional.texture.specification",
        ".texsubimage3d_unpack_params.rgba8_complex2");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026590,
        "dEQP-GLES3.functional.texture.specification",
        ".texsubimage3d_unpack_params.rgba8_complex3");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026591,
        "dEQP-GLES3.functional.texture.specification",
        ".texsubimage3d_unpack_params.rgba8_complex4");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026592,
        "dEQP-GLES3.functional.texture.specification",
        ".texsubimage3d_unpack_params.rgba32f_complex");
