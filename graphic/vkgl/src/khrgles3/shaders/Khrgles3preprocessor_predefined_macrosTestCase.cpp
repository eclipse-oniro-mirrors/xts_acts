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

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001032,
        "KHR-GLES3.shaders.preprocessor.",
        "predefined_macros.version_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001033,
        "KHR-GLES3.shaders.preprocessor.p",
        "redefined_macros.version_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001034,
        "KHR-GLES3.shaders.preprocessor.",
        "predefined_macros.gl_es_1_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001035,
        "KHR-GLES3.shaders.preprocessor.p",
        "redefined_macros.gl_es_1_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001036,
        "KHR-GLES3.shaders.preprocessor.",
        "predefined_macros.gl_es_2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001037,
        "KHR-GLES3.shaders.preprocessor.p",
        "redefined_macros.gl_es_2_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001038,
        "KHR-GLES3.shaders.preprocessor.",
        "predefined_macros.line_1_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001039,
        "KHR-GLES3.shaders.preprocessor.p",
        "redefined_macros.line_1_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001040,
        "KHR-GLES3.shaders.preprocessor",
        ".predefined_macros.file_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001041,
        "KHR-GLES3.shaders.preprocessor.",
        "predefined_macros.file_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001042,
        "KHR-GLES3.shaders.preprocessor.p",
        "redefined_macros.if_gl_es_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001043,
        "KHR-GLES3.shaders.preprocessor.pr",
        "edefined_macros.if_gl_es_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001044,
        "KHR-GLES3.shaders.preprocessor.pr",
        "edefined_macros.if_version_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001045,
        "KHR-GLES3.shaders.preprocessor.pre",
        "defined_macros.if_version_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001046,
        "KHR-GLES3.shaders.preprocessor.predefi",
        "ned_macros.invalid_token_pasting_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001047,
        "KHR-GLES3.shaders.preprocessor.predefin",
        "ed_macros.invalid_token_pasting_fragment");
