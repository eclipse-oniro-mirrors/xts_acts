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
#include "../ActsDeqpgles30026TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025864,
        "dEQP-GLES3.functional.texture.specificati",
        "on.teximage2d_unpack_params.rgb8_alignment");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025865,
        "dEQP-GLES3.functional.texture.specificatio",
        "n.teximage2d_unpack_params.rgb8_row_length");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025866,
        "dEQP-GLES3.functional.texture.specificati",
        "on.teximage2d_unpack_params.rgb8_skip_rows");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025867,
        "dEQP-GLES3.functional.texture.specificatio",
        "n.teximage2d_unpack_params.rgb8_skip_pixels");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025868,
        "dEQP-GLES3.functional.texture.specificat",
        "ion.teximage2d_unpack_params.r8_complex1");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025869,
        "dEQP-GLES3.functional.texture.specificat",
        "ion.teximage2d_unpack_params.r8_complex2");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025870,
        "dEQP-GLES3.functional.texture.specificat",
        "ion.teximage2d_unpack_params.r8_complex3");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025871,
        "dEQP-GLES3.functional.texture.specificat",
        "ion.teximage2d_unpack_params.r8_complex4");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025872,
        "dEQP-GLES3.functional.texture.specificati",
        "on.teximage2d_unpack_params.rgba8_complex1");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025873,
        "dEQP-GLES3.functional.texture.specificati",
        "on.teximage2d_unpack_params.rgba8_complex2");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025874,
        "dEQP-GLES3.functional.texture.specificati",
        "on.teximage2d_unpack_params.rgba8_complex3");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025875,
        "dEQP-GLES3.functional.texture.specificati",
        "on.teximage2d_unpack_params.rgba8_complex4");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025876,
        "dEQP-GLES3.functional.texture.specificatio",
        "n.teximage2d_unpack_params.rgba32f_complex");
