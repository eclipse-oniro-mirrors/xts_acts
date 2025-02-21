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

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037435,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_64_b",
        "its_mixed.rgba16f_signed_r11_eac.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037436,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_64_",
        "bits_mixed.rgba16f_signed_r11_eac.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037437,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_64_b",
        "its_mixed.rgba16f_signed_r11_eac.texture3d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037438,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_64_",
        "bits_mixed.rgba16f_signed_r11_eac.texture3d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037439,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_64_",
        "bits_mixed.rgba16f_signed_r11_eac.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037440,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_64",
        "_bits_mixed.rgba16f_signed_r11_eac.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037441,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_64_bits",
        "_mixed.rgba16f_signed_r11_eac.texture2d_array_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310038TestSuite, TestCase_037442,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_64_bit",
        "s_mixed.rgba16f_signed_r11_eac.texture2d_array_to_cubemap");
