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
#include "../ActsDeqpgles310037TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310037TestSuite, TestCase_036289,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_b",
        "its_mixed.signed_rg11_eac_rgba32i.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310037TestSuite, TestCase_036290,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_b",
        "its_mixed.signed_rg11_eac_rgba32i.texture2d_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310037TestSuite, TestCase_036291,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_",
        "bits_mixed.signed_rg11_eac_rgba32i.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310037TestSuite, TestCase_036292,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bits",
        "_mixed.signed_rg11_eac_rgba32i.texture2d_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310037TestSuite, TestCase_036293,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bit",
        "s_mixed.signed_rg11_eac_rgba32i.texture2d_to_renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310037TestSuite, TestCase_036294,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_",
        "bits_mixed.signed_rg11_eac_rgba32i.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310037TestSuite, TestCase_036295,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_",
        "bits_mixed.signed_rg11_eac_rgba32i.cubemap_to_texture3d");

static SHRINK_HWTEST_F(ActsDeqpgles310037TestSuite, TestCase_036296,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128",
        "_bits_mixed.signed_rg11_eac_rgba32i.cubemap_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310037TestSuite, TestCase_036297,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bit",
        "s_mixed.signed_rg11_eac_rgba32i.cubemap_to_texture2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310037TestSuite, TestCase_036298,
        "dEQP-GLES31.functional.copy_image.mixed.viewclass_128_bi",
        "ts_mixed.signed_rg11_eac_rgba32i.cubemap_to_renderbuffer");
