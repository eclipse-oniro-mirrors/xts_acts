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

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026149,
        "dEQP-GLES3.functional.texture.specification",
        ".texsubimage2d_unpack_params.rgb8_alignment");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026150,
        "dEQP-GLES3.functional.texture.specification",
        ".texsubimage2d_unpack_params.rgb8_row_length");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026151,
        "dEQP-GLES3.functional.texture.specification",
        ".texsubimage2d_unpack_params.rgb8_skip_rows");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026152,
        "dEQP-GLES3.functional.texture.specification.",
        "texsubimage2d_unpack_params.rgb8_skip_pixels");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026153,
        "dEQP-GLES3.functional.texture.specificati",
        "on.texsubimage2d_unpack_params.r8_complex1");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026154,
        "dEQP-GLES3.functional.texture.specificati",
        "on.texsubimage2d_unpack_params.r8_complex2");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026155,
        "dEQP-GLES3.functional.texture.specificati",
        "on.texsubimage2d_unpack_params.r8_complex3");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026156,
        "dEQP-GLES3.functional.texture.specificati",
        "on.texsubimage2d_unpack_params.r8_complex4");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026157,
        "dEQP-GLES3.functional.texture.specification",
        ".texsubimage2d_unpack_params.rgba8_complex1");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026158,
        "dEQP-GLES3.functional.texture.specification",
        ".texsubimage2d_unpack_params.rgba8_complex2");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026159,
        "dEQP-GLES3.functional.texture.specification",
        ".texsubimage2d_unpack_params.rgba8_complex3");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026160,
        "dEQP-GLES3.functional.texture.specification",
        ".texsubimage2d_unpack_params.rgba8_complex4");

static SHRINK_HWTEST_F(ActsDeqpgles30027TestSuite, TestCase_026161,
        "dEQP-GLES3.functional.texture.specification",
        ".texsubimage2d_unpack_params.rgba32f_complex");
