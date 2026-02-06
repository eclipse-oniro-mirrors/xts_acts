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

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000914,
        "KHR-GLES3.shaders.preprocessor.object_r",
        "edefinitions.invalid_object_ident_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000915,
        "KHR-GLES3.shaders.preprocessor.object_re",
        "definitions.invalid_object_ident_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000916,
        "KHR-GLES3.shaders.preprocessor.object_rede",
        "finitions.invalid_object_whitespace_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000917,
        "KHR-GLES3.shaders.preprocessor.object_redef",
        "initions.invalid_object_whitespace_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000918,
        "KHR-GLES3.shaders.preprocessor.object_",
        "redefinitions.invalid_object_op_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000919,
        "KHR-GLES3.shaders.preprocessor.object_r",
        "edefinitions.invalid_object_op_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000920,
        "KHR-GLES3.shaders.preprocessor.object_rede",
        "finitions.invalid_object_floatval_1_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000921,
        "KHR-GLES3.shaders.preprocessor.object_redef",
        "initions.invalid_object_floatval_1_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000922,
        "KHR-GLES3.shaders.preprocessor.object_rede",
        "finitions.invalid_object_floatval_2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000923,
        "KHR-GLES3.shaders.preprocessor.object_redef",
        "initions.invalid_object_floatval_2_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000924,
        "KHR-GLES3.shaders.preprocessor.object_red",
        "efinitions.invalid_object_intval_1_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000925,
        "KHR-GLES3.shaders.preprocessor.object_rede",
        "finitions.invalid_object_intval_1_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000926,
        "KHR-GLES3.shaders.preprocessor.object_red",
        "efinitions.invalid_object_intval_2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000927,
        "KHR-GLES3.shaders.preprocessor.object_rede",
        "finitions.invalid_object_intval_2_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000928,
        "KHR-GLES3.shaders.preprocessor.object_",
        "redefinitions.redefine_object_1_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000929,
        "KHR-GLES3.shaders.preprocessor.object_r",
        "edefinitions.redefine_object_1_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000930,
        "KHR-GLES3.shaders.preprocessor.object_re",
        "definitions.redefine_object_ifdef_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000931,
        "KHR-GLES3.shaders.preprocessor.object_red",
        "efinitions.redefine_object_ifdef_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000932,
        "KHR-GLES3.shaders.preprocessor.object_redef",
        "initions.redefine_object_undef_ifdef_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000933,
        "KHR-GLES3.shaders.preprocessor.object_redefi",
        "nitions.redefine_object_undef_ifdef_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000934,
        "KHR-GLES3.shaders.preprocessor.object_re",
        "definitions.redefine_object_ifndef_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000935,
        "KHR-GLES3.shaders.preprocessor.object_red",
        "efinitions.redefine_object_ifndef_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000936,
        "KHR-GLES3.shaders.preprocessor.object_rede",
        "finitions.redefine_object_defined_1_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000937,
        "KHR-GLES3.shaders.preprocessor.object_redef",
        "initions.redefine_object_defined_1_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000938,
        "KHR-GLES3.shaders.preprocessor.object_rede",
        "finitions.redefine_object_defined_2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000939,
        "KHR-GLES3.shaders.preprocessor.object_redef",
        "initions.redefine_object_defined_2_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000940,
        "KHR-GLES3.shaders.preprocessor.object_red",
        "efinitions.redefine_object_comment_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000941,
        "KHR-GLES3.shaders.preprocessor.object_rede",
        "finitions.redefine_object_comment_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000942,
        "KHR-GLES3.shaders.preprocessor.object_redefini",
        "tions.redefine_object_multiline_comment_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000943,
        "KHR-GLES3.shaders.preprocessor.object_redefinit",
        "ions.redefine_object_multiline_comment_fragment");
