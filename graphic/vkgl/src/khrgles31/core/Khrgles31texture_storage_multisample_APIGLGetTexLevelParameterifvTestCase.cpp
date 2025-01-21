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
#include "../Khrgles31BaseFunc.h"
#include "../ActsKhrgles310001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000030,
        "KHR-GLES31.core.texture_storage_multisample.",
        "APIGLGetTexLevelParameterifv.functional_test");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000031,
        "KHR-GLES31.core.texture_storage_multisample.APIGLGet",
        "TexLevelParameterifv.invalid_texture_target_rejected");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000032,
        "KHR-GLES31.core.texture_storage_multisample.APIGLGet",
        "TexLevelParameterifv.invalid_value_argument_rejected");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000033,
        "KHR-GLES31.core.texture_storage_multisample.APIGLGe",
        "tTexLevelParameterifv.negative_lod_is_rejected_test");

static SHRINK_HWTEST_F(ActsKhrgles310001TestSuite, TestCase_000034,
        "KHR-GLES31.core.texture_storage_multisample.APIG",
        "LGetTexLevelParameterifv.functional_max_lod_test");
