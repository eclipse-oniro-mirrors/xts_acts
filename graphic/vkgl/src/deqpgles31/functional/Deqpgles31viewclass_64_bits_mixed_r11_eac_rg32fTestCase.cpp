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

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037539,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_",
        "64_bits_mixed.r11_eac_rg32f.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037540,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_",
        "64_bits_mixed.r11_eac_rg32f.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037541,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass",
        "_64_bits_mixed.r11_eac_rg32f.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037542,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_64_",
        "bits_mixed.r11_eac_rg32f.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037543,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass",
        "_64_bits_mixed.r11_eac_rg32f.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037544,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass",
        "_64_bits_mixed.r11_eac_rg32f.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037545,
        "dEQP-GLES31.functional.copy_image.mixed.viewclas",
        "s_64_bits_mixed.r11_eac_rg32f.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037546,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_64",
        "_bits_mixed.r11_eac_rg32f.cubemap_to_texture2d_array");
