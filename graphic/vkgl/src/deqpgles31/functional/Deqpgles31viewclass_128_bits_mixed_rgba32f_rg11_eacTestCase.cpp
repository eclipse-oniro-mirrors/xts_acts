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
#include "../ActsDeqpgles310035TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034091,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_12",
        "8_bits_mixed.rgba32f_rg11_eac.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034092,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_1",
        "28_bits_mixed.rgba32f_rg11_eac.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034093,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_12",
        "8_bits_mixed.rgba32f_rg11_eac.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034094,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_1",
        "28_bits_mixed.rgba32f_rg11_eac.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034095,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_1",
        "28_bits_mixed.rgba32f_rg11_eac.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034096,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_",
        "128_bits_mixed.rgba32f_rg11_eac.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034097,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_b",
        "its_mixed.rgba32f_rg11_eac.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310035TestSuite, TestCase_034098,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_",
        "bits_mixed.rgba32f_rg11_eac.texture2d_array_to_cubemap");