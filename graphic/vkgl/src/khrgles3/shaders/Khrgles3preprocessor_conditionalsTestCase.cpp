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

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001164,
        "KHR-GLES3.shaders.preprocesso",
        "r.conditionals.ifdef_1_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001165,
        "KHR-GLES3.shaders.preprocessor",
        ".conditionals.ifdef_1_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001166,
        "KHR-GLES3.shaders.preprocesso",
        "r.conditionals.ifdef_2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001167,
        "KHR-GLES3.shaders.preprocessor",
        ".conditionals.ifdef_2_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001168,
        "KHR-GLES3.shaders.preprocesso",
        "r.conditionals.ifdef_3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001169,
        "KHR-GLES3.shaders.preprocessor",
        ".conditionals.ifdef_3_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001170,
        "KHR-GLES3.shaders.preprocesso",
        "r.conditionals.ifndef_1_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001171,
        "KHR-GLES3.shaders.preprocessor",
        ".conditionals.ifndef_1_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001172,
        "KHR-GLES3.shaders.preprocesso",
        "r.conditionals.ifndef_2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001173,
        "KHR-GLES3.shaders.preprocessor",
        ".conditionals.ifndef_2_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001174,
        "KHR-GLES3.shaders.preprocessor.conditio",
        "nals.mixed_conditional_inclusion_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001175,
        "KHR-GLES3.shaders.preprocessor.condition",
        "als.mixed_conditional_inclusion_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001176,
        "KHR-GLES3.shaders.preprocessor.",
        "conditionals.nested_if_1_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001177,
        "KHR-GLES3.shaders.preprocessor.c",
        "onditionals.nested_if_1_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001178,
        "KHR-GLES3.shaders.preprocessor.",
        "conditionals.nested_if_2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001179,
        "KHR-GLES3.shaders.preprocessor.c",
        "onditionals.nested_if_2_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001180,
        "KHR-GLES3.shaders.preprocessor.",
        "conditionals.nested_if_3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001181,
        "KHR-GLES3.shaders.preprocessor.c",
        "onditionals.nested_if_3_fragment");
