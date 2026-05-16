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
#include "../Deqpgles2BaseFunc.h"
#include "../ActsDeqpgles20001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000165,
        "dEQP-GLES2.functional.shaders.preprocessor.ob",
        "ject_redefinitions.invalid_object_ident_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000166,
        "dEQP-GLES2.functional.shaders.preprocessor.obj",
        "ect_redefinitions.invalid_object_ident_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000167,
        "dEQP-GLES2.functional.shaders.preprocessor.objec",
        "t_redefinitions.invalid_object_whitespace_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000168,
        "dEQP-GLES2.functional.shaders.preprocessor.object",
        "_redefinitions.invalid_object_whitespace_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000169,
        "dEQP-GLES2.functional.shaders.preprocessor.o",
        "bject_redefinitions.invalid_object_op_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000170,
        "dEQP-GLES2.functional.shaders.preprocessor.ob",
        "ject_redefinitions.invalid_object_op_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000171,
        "dEQP-GLES2.functional.shaders.preprocessor.objec",
        "t_redefinitions.invalid_object_floatval_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000172,
        "dEQP-GLES2.functional.shaders.preprocessor.object",
        "_redefinitions.invalid_object_floatval_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000173,
        "dEQP-GLES2.functional.shaders.preprocessor.objec",
        "t_redefinitions.invalid_object_floatval_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000174,
        "dEQP-GLES2.functional.shaders.preprocessor.object",
        "_redefinitions.invalid_object_floatval_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000175,
        "dEQP-GLES2.functional.shaders.preprocessor.obje",
        "ct_redefinitions.invalid_object_intval_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000176,
        "dEQP-GLES2.functional.shaders.preprocessor.objec",
        "t_redefinitions.invalid_object_intval_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000177,
        "dEQP-GLES2.functional.shaders.preprocessor.obje",
        "ct_redefinitions.invalid_object_intval_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000178,
        "dEQP-GLES2.functional.shaders.preprocessor.objec",
        "t_redefinitions.invalid_object_intval_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000179,
        "dEQP-GLES2.functional.shaders.preprocessor.o",
        "bject_redefinitions.redefine_object_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000180,
        "dEQP-GLES2.functional.shaders.preprocessor.ob",
        "ject_redefinitions.redefine_object_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000181,
        "dEQP-GLES2.functional.shaders.preprocessor.obj",
        "ect_redefinitions.redefine_object_ifdef_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000182,
        "dEQP-GLES2.functional.shaders.preprocessor.obje",
        "ct_redefinitions.redefine_object_ifdef_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000183,
        "dEQP-GLES2.functional.shaders.preprocessor.object",
        "_redefinitions.redefine_object_undef_ifdef_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000184,
        "dEQP-GLES2.functional.shaders.preprocessor.object_",
        "redefinitions.redefine_object_undef_ifdef_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000185,
        "dEQP-GLES2.functional.shaders.preprocessor.obj",
        "ect_redefinitions.redefine_object_ifndef_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000186,
        "dEQP-GLES2.functional.shaders.preprocessor.obje",
        "ct_redefinitions.redefine_object_ifndef_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000187,
        "dEQP-GLES2.functional.shaders.preprocessor.objec",
        "t_redefinitions.redefine_object_defined_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000188,
        "dEQP-GLES2.functional.shaders.preprocessor.object",
        "_redefinitions.redefine_object_defined_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000189,
        "dEQP-GLES2.functional.shaders.preprocessor.objec",
        "t_redefinitions.redefine_object_defined_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000190,
        "dEQP-GLES2.functional.shaders.preprocessor.object",
        "_redefinitions.redefine_object_defined_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000191,
        "dEQP-GLES2.functional.shaders.preprocessor.obje",
        "ct_redefinitions.redefine_object_comment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000192,
        "dEQP-GLES2.functional.shaders.preprocessor.objec",
        "t_redefinitions.redefine_object_comment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000193,
        "dEQP-GLES2.functional.shaders.preprocessor.object_re",
        "definitions.redefine_object_multiline_comment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000194,
        "dEQP-GLES2.functional.shaders.preprocessor.object_red",
        "efinitions.redefine_object_multiline_comment_fragment");
