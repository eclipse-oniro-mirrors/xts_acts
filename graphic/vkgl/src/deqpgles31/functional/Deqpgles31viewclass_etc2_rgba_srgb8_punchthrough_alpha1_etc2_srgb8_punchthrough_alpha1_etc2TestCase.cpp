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
#include "../ActsDeqpgles310034TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033143,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_etc2_rgba.srgb8_pun",
        "chthrough_alpha1_etc2_srgb8_punchthrough_alpha1_etc2.texture2d_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033144,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_etc2_rgba.srgb8_pu",
        "nchthrough_alpha1_etc2_srgb8_punchthrough_alpha1_etc2.texture2d_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033145,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_etc2_rgba.srgb8_pu",
        "nchthrough_alpha1_etc2_srgb8_punchthrough_alpha1_etc2.cubemap_to_texture2d");

static SHRINK_HWTEST_F(ActsDeqpgles310034TestSuite, TestCase_033146,
        "dEQP-GLES31.functional.copy_image.compressed.viewclass_etc2_rgba.srgb8_p",
        "unchthrough_alpha1_etc2_srgb8_punchthrough_alpha1_etc2.cubemap_to_cubemap");
