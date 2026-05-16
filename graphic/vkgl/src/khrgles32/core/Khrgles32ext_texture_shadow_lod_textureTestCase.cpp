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
#include "../Khrgles32BaseFunc.h"
#include "../ActsKhrgles320002TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001132,
        "KHR-GLES32.core.ext_texture_shadow_lod",
        ".texture.sampler2darrayshadow_fragment");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001133,
        "KHR-GLES32.core.ext_texture_shadow_lod.t",
        "exture.sampler2darrayshadow_bias_fragment");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001134,
        "KHR-GLES32.core.ext_texture_shadow_lod",
        ".texture.samplercubearrayshadow_vertex");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001135,
        "KHR-GLES32.core.ext_texture_shadow_lod.",
        "texture.samplercubearrayshadow_fragment");

static SHRINK_HWTEST_F(ActsKhrgles320002TestSuite, TestCase_001136,
        "KHR-GLES32.core.ext_texture_shadow_lod.te",
        "xture.samplercubearrayshadow_bias_fragment");
