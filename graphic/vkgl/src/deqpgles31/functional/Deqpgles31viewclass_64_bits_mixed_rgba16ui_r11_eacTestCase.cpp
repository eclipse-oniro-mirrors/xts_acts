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
#include "../ActsDeqpgles310038TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037451,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_6",
        "4_bits_mixed.rgba16ui_r11_eac.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037452,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_",
        "64_bits_mixed.rgba16ui_r11_eac.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037453,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_6",
        "4_bits_mixed.rgba16ui_r11_eac.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037454,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_",
        "64_bits_mixed.rgba16ui_r11_eac.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037455,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_",
        "64_bits_mixed.rgba16ui_r11_eac.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037456,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass",
        "_64_bits_mixed.rgba16ui_r11_eac.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037457,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_64_b",
        "its_mixed.rgba16ui_r11_eac.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037458,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_64_",
        "bits_mixed.rgba16ui_r11_eac.texture2d_array_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037459,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_64_",
        "bits_mixed.rgba16ui_r11_eac.renderbuffer_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037460,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_64",
        "_bits_mixed.rgba16ui_r11_eac.renderbuffer_to_cubemap");
