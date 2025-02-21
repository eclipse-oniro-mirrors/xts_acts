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

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001048,
        "KHR-GLES3.shaders.preprocessor.co",
        "nditional_inclusion.basic_1_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001049,
        "KHR-GLES3.shaders.preprocessor.con",
        "ditional_inclusion.basic_1_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001050,
        "KHR-GLES3.shaders.preprocessor.co",
        "nditional_inclusion.basic_2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001051,
        "KHR-GLES3.shaders.preprocessor.con",
        "ditional_inclusion.basic_2_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001052,
        "KHR-GLES3.shaders.preprocessor.co",
        "nditional_inclusion.basic_3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001053,
        "KHR-GLES3.shaders.preprocessor.con",
        "ditional_inclusion.basic_3_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001054,
        "KHR-GLES3.shaders.preprocessor.co",
        "nditional_inclusion.basic_4_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001055,
        "KHR-GLES3.shaders.preprocessor.con",
        "ditional_inclusion.basic_4_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001056,
        "KHR-GLES3.shaders.preprocessor.co",
        "nditional_inclusion.basic_5_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001057,
        "KHR-GLES3.shaders.preprocessor.con",
        "ditional_inclusion.basic_5_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001058,
        "KHR-GLES3.shaders.preprocessor.cond",
        "itional_inclusion.expression_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001059,
        "KHR-GLES3.shaders.preprocessor.condi",
        "tional_inclusion.expression_fragment");
