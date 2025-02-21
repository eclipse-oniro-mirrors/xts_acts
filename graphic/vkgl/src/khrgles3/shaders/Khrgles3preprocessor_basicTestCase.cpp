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
#include "../ActsKhrgles30001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000878,
        "KHR-GLES3.shaders.preprocesso",
        "r.basic.correct_phases_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000879,
        "KHR-GLES3.shaders.preprocessor",
        ".basic.correct_phases_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000880,
        "KHR-GLES3.shaders.preprocessor.",
        "basic.invalid_identifier_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000881,
        "KHR-GLES3.shaders.preprocessor.b",
        "asic.invalid_identifier_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000882,
        "KHR-GLES3.shaders.preprocesso",
        "r.basic.null_directive_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000883,
        "KHR-GLES3.shaders.preprocessor",
        ".basic.null_directive_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000884,
        "KHR-GLES3.shaders.preprocessor",
        ".basic.invalid_directive_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000885,
        "KHR-GLES3.shaders.preprocessor.",
        "basic.invalid_directive_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000886,
        "KHR-GLES3.shaders.preprocessor.",
        "basic.missing_identifier_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000887,
        "KHR-GLES3.shaders.preprocessor.b",
        "asic.missing_identifier_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000888,
        "KHR-GLES3.shaders.preprocess",
        "or.basic.empty_object_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000889,
        "KHR-GLES3.shaders.preprocesso",
        "r.basic.empty_object_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000890,
        "KHR-GLES3.shaders.preprocesso",
        "r.basic.empty_function_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000891,
        "KHR-GLES3.shaders.preprocessor",
        ".basic.empty_function_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000892,
        "KHR-GLES3.shaders.preprocesso",
        "r.basic.empty_directive_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000893,
        "KHR-GLES3.shaders.preprocessor",
        ".basic.empty_directive_fragment");
