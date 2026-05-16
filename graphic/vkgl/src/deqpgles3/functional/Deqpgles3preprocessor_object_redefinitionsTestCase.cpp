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
#include "../Deqpgles3BaseFunc.h"
#include "../ActsDeqpgles30001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000822,
        "dEQP-GLES3.functional.shaders.preprocessor.ob",
        "ject_redefinitions.invalid_object_ident_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000823,
        "dEQP-GLES3.functional.shaders.preprocessor.obj",
        "ect_redefinitions.invalid_object_ident_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000824,
        "dEQP-GLES3.functional.shaders.preprocessor.objec",
        "t_redefinitions.invalid_object_whitespace_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000825,
        "dEQP-GLES3.functional.shaders.preprocessor.object",
        "_redefinitions.invalid_object_whitespace_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000826,
        "dEQP-GLES3.functional.shaders.preprocessor.o",
        "bject_redefinitions.invalid_object_op_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000827,
        "dEQP-GLES3.functional.shaders.preprocessor.ob",
        "ject_redefinitions.invalid_object_op_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000828,
        "dEQP-GLES3.functional.shaders.preprocessor.objec",
        "t_redefinitions.invalid_object_floatval_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000829,
        "dEQP-GLES3.functional.shaders.preprocessor.object",
        "_redefinitions.invalid_object_floatval_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000830,
        "dEQP-GLES3.functional.shaders.preprocessor.objec",
        "t_redefinitions.invalid_object_floatval_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000831,
        "dEQP-GLES3.functional.shaders.preprocessor.object",
        "_redefinitions.invalid_object_floatval_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000832,
        "dEQP-GLES3.functional.shaders.preprocessor.obje",
        "ct_redefinitions.invalid_object_intval_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000833,
        "dEQP-GLES3.functional.shaders.preprocessor.objec",
        "t_redefinitions.invalid_object_intval_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000834,
        "dEQP-GLES3.functional.shaders.preprocessor.obje",
        "ct_redefinitions.invalid_object_intval_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000835,
        "dEQP-GLES3.functional.shaders.preprocessor.objec",
        "t_redefinitions.invalid_object_intval_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000836,
        "dEQP-GLES3.functional.shaders.preprocessor.o",
        "bject_redefinitions.redefine_object_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000837,
        "dEQP-GLES3.functional.shaders.preprocessor.ob",
        "ject_redefinitions.redefine_object_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000838,
        "dEQP-GLES3.functional.shaders.preprocessor.obj",
        "ect_redefinitions.redefine_object_ifdef_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000839,
        "dEQP-GLES3.functional.shaders.preprocessor.obje",
        "ct_redefinitions.redefine_object_ifdef_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000840,
        "dEQP-GLES3.functional.shaders.preprocessor.object",
        "_redefinitions.redefine_object_undef_ifdef_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000841,
        "dEQP-GLES3.functional.shaders.preprocessor.object_",
        "redefinitions.redefine_object_undef_ifdef_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000842,
        "dEQP-GLES3.functional.shaders.preprocessor.obj",
        "ect_redefinitions.redefine_object_ifndef_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000843,
        "dEQP-GLES3.functional.shaders.preprocessor.obje",
        "ct_redefinitions.redefine_object_ifndef_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000844,
        "dEQP-GLES3.functional.shaders.preprocessor.objec",
        "t_redefinitions.redefine_object_defined_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000845,
        "dEQP-GLES3.functional.shaders.preprocessor.object",
        "_redefinitions.redefine_object_defined_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000846,
        "dEQP-GLES3.functional.shaders.preprocessor.objec",
        "t_redefinitions.redefine_object_defined_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000847,
        "dEQP-GLES3.functional.shaders.preprocessor.object",
        "_redefinitions.redefine_object_defined_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000848,
        "dEQP-GLES3.functional.shaders.preprocessor.obje",
        "ct_redefinitions.redefine_object_comment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000849,
        "dEQP-GLES3.functional.shaders.preprocessor.objec",
        "t_redefinitions.redefine_object_comment_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000850,
        "dEQP-GLES3.functional.shaders.preprocessor.object_re",
        "definitions.redefine_object_multiline_comment_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000851,
        "dEQP-GLES3.functional.shaders.preprocessor.object_red",
        "efinitions.redefine_object_multiline_comment_fragment");
