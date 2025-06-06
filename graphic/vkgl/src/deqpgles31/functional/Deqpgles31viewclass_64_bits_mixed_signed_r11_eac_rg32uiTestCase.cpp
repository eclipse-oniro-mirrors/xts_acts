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

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037593,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_64_b",
        "its_mixed.signed_r11_eac_rg32ui.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037594,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_64_b",
        "its_mixed.signed_r11_eac_rg32ui.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037595,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_64_",
        "bits_mixed.signed_r11_eac_rg32ui.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037596,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_64_bits",
        "_mixed.signed_r11_eac_rg32ui.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037597,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_64_bi",
        "ts_mixed.signed_r11_eac_rg32ui.texture2d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037598,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_64_",
        "bits_mixed.signed_r11_eac_rg32ui.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037599,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_64_",
        "bits_mixed.signed_r11_eac_rg32ui.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037600,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_64",
        "_bits_mixed.signed_r11_eac_rg32ui.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037601,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_64_bit",
        "s_mixed.signed_r11_eac_rg32ui.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037602,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_64_b",
        "its_mixed.signed_r11_eac_rg32ui.cubemap_to_renderbuffer");
