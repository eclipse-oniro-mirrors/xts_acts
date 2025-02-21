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
#include "../Khrgles3BaseFunc.h"
#include "../ActsKhrgles30003TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002953,
        "KHR-GLES3.shaders.sha",
        "der_integer_mix.define");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002954,
        "KHR-GLES3.shaders.shader_int",
        "eger_mix.prototypes-extension");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002955,
        "KHR-GLES3.shaders.shade",
        "r_integer_mix.prototypes");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002956,
        "KHR-GLES3.shaders.shader_int",
        "eger_mix.prototypes-negative");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002957,
        "KHR-GLES3.shaders.shade",
        "r_integer_mix.mix-ivec4");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002958,
        "KHR-GLES3.shaders.shade",
        "r_integer_mix.mix-uvec4");

static SHRINK_HWTEST_F(ActsKhrgles30003TestSuite, TestCase_002959,
        "KHR-GLES3.shaders.shade",
        "r_integer_mix.mix-bvec4");
