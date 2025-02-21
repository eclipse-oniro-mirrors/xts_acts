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

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037613,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_",
        "64_bits_mixed.r11_eac_rg32i.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037614,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_",
        "64_bits_mixed.r11_eac_rg32i.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037615,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass",
        "_64_bits_mixed.r11_eac_rg32i.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037616,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_64_",
        "bits_mixed.r11_eac_rg32i.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037617,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_6",
        "4_bits_mixed.r11_eac_rg32i.texture2d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037618,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass",
        "_64_bits_mixed.r11_eac_rg32i.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037619,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass",
        "_64_bits_mixed.r11_eac_rg32i.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037620,
        "dEQP-GLES31.functional.copy_image.mixed.viewclas",
        "s_64_bits_mixed.r11_eac_rg32i.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037621,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_64",
        "_bits_mixed.r11_eac_rg32i.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037622,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_",
        "64_bits_mixed.r11_eac_rg32i.cubemap_to_renderbuffer");
