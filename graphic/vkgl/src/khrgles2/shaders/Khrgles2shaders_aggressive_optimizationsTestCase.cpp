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
#include "../Khrgles2BaseFunc.h"
#include "../ActsKhrgles20001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000003,
        "KHR-GLES2.shaders.aggressive",
        "_optimizations.sin_float_vert");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000004,
        "KHR-GLES2.shaders.aggressive",
        "_optimizations.sin_float_frag");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000005,
        "KHR-GLES2.shaders.aggressive",
        "_optimizations.sin_vec2_vert");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000006,
        "KHR-GLES2.shaders.aggressive",
        "_optimizations.sin_vec2_frag");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000007,
        "KHR-GLES2.shaders.aggressive",
        "_optimizations.sin_vec3_vert");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000008,
        "KHR-GLES2.shaders.aggressive",
        "_optimizations.sin_vec3_frag");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000009,
        "KHR-GLES2.shaders.aggressive",
        "_optimizations.cos_float_vert");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000010,
        "KHR-GLES2.shaders.aggressive",
        "_optimizations.cos_float_frag");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000011,
        "KHR-GLES2.shaders.aggressive",
        "_optimizations.cos_vec2_vert");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000012,
        "KHR-GLES2.shaders.aggressive",
        "_optimizations.cos_vec2_frag");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000013,
        "KHR-GLES2.shaders.aggressive",
        "_optimizations.cos_vec3_vert");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000014,
        "KHR-GLES2.shaders.aggressive",
        "_optimizations.cos_vec3_frag");
