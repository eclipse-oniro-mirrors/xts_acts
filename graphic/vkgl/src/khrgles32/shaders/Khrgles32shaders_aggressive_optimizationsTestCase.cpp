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
#include "../ActsKhrgles320001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000017,
        "KHR-GLES32.shaders.aggressive",
        "_optimizations.sin_float_vert");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000018,
        "KHR-GLES32.shaders.aggressive",
        "_optimizations.sin_float_frag");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000019,
        "KHR-GLES32.shaders.aggressiv",
        "e_optimizations.sin_vec2_vert");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000020,
        "KHR-GLES32.shaders.aggressiv",
        "e_optimizations.sin_vec2_frag");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000021,
        "KHR-GLES32.shaders.aggressiv",
        "e_optimizations.sin_vec3_vert");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000022,
        "KHR-GLES32.shaders.aggressiv",
        "e_optimizations.sin_vec3_frag");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000023,
        "KHR-GLES32.shaders.aggressive",
        "_optimizations.cos_float_vert");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000024,
        "KHR-GLES32.shaders.aggressive",
        "_optimizations.cos_float_frag");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000025,
        "KHR-GLES32.shaders.aggressiv",
        "e_optimizations.cos_vec2_vert");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000026,
        "KHR-GLES32.shaders.aggressiv",
        "e_optimizations.cos_vec2_frag");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000027,
        "KHR-GLES32.shaders.aggressiv",
        "e_optimizations.cos_vec3_vert");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000028,
        "KHR-GLES32.shaders.aggressiv",
        "e_optimizations.cos_vec3_frag");
