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
#include "../ActsKhrgles30002TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001388,
        "KHR-GLES3.shaders.literal_pars",
        "ing.correct_int_literal_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001389,
        "KHR-GLES3.shaders.literal_parsi",
        "ng.correct_int_literal_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001390,
        "KHR-GLES3.shaders.literal_p",
        "arsing.int_overflow_1_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001391,
        "KHR-GLES3.shaders.literal_pa",
        "rsing.int_overflow_1_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001392,
        "KHR-GLES3.shaders.literal_p",
        "arsing.int_overflow_2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001393,
        "KHR-GLES3.shaders.literal_pa",
        "rsing.int_overflow_2_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001394,
        "KHR-GLES3.shaders.lite",
        "ral_parsing.int_wrap_1");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001395,
        "KHR-GLES3.shaders.lite",
        "ral_parsing.int_wrap_2");
