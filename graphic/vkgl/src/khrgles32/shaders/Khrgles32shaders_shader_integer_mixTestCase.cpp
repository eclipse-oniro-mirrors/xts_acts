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

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000007,
        "KHR-GLES32.shaders.sha",
        "der_integer_mix.define");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000008,
        "KHR-GLES32.shaders.shader_int",
        "eger_mix.prototypes-extension");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000009,
        "KHR-GLES32.shaders.shade",
        "r_integer_mix.prototypes");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000010,
        "KHR-GLES32.shaders.shader_in",
        "teger_mix.prototypes-negative");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000011,
        "KHR-GLES32.shaders.shad",
        "er_integer_mix.mix-ivec4");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000012,
        "KHR-GLES32.shaders.shad",
        "er_integer_mix.mix-uvec4");

static SHRINK_HWTEST_F(ActsKhrgles320001TestSuite, TestCase_000013,
        "KHR-GLES32.shaders.shad",
        "er_integer_mix.mix-bvec4");
