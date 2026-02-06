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
#include "../ActsDeqpgles30007TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006679,
        "dEQP-GLES3.functional.shaders.index",
        "ing.moredynamic.matrix_twice_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006680,
        "dEQP-GLES3.functional.shaders.indexi",
        "ng.moredynamic.matrix_twice_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006681,
        "dEQP-GLES3.functional.shaders.indexing.moredyn",
        "amic.with_value_from_indexing_expression_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006682,
        "dEQP-GLES3.functional.shaders.indexing.moredyna",
        "mic.with_value_from_indexing_expression_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006683,
        "dEQP-GLES3.functional.shaders.in",
        "dexing.moredynamic.lvalue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006684,
        "dEQP-GLES3.functional.shaders.ind",
        "exing.moredynamic.lvalue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006685,
        "dEQP-GLES3.functional.shaders.indexing.moredynamic",
        ".lvalue_with_value_from_indexing_expression_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006686,
        "dEQP-GLES3.functional.shaders.indexing.moredynamic.",
        "lvalue_with_value_from_indexing_expression_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006687,
        "dEQP-GLES3.functional.shaders.indexing.more",
        "dynamic.builtin_fncall_out_parameter_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006688,
        "dEQP-GLES3.functional.shaders.indexing.mored",
        "ynamic.builtin_fncall_out_parameter_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006689,
        "dEQP-GLES3.functional.shaders.indexing.moredy",
        "namic.user_defined_fncall_out_parameter_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006690,
        "dEQP-GLES3.functional.shaders.indexing.moredyn",
        "amic.user_defined_fncall_out_parameter_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006691,
        "dEQP-GLES3.functional.shaders.indexing.moredyn",
        "amic.user_defined_fncall_inout_parameter_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006692,
        "dEQP-GLES3.functional.shaders.indexing.moredyna",
        "mic.user_defined_fncall_inout_parameter_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006693,
        "dEQP-GLES3.functional.shaders.indexin",
        "g.moredynamic.with_side_effects_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006694,
        "dEQP-GLES3.functional.shaders.indexing",
        ".moredynamic.with_side_effects_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006695,
        "dEQP-GLES3.functional.shaders.indexing.m",
        "oredynamic.inout_with_side_effects_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006696,
        "dEQP-GLES3.functional.shaders.indexing.mo",
        "redynamic.inout_with_side_effects_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006697,
        "dEQP-GLES3.functional.shaders.indexing.moredynamic.user_defin",
        "ed_fncall_inout_parameter_with_index_with_side_effects_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006698,
        "dEQP-GLES3.functional.shaders.indexing.moredynamic.user_define",
        "d_fncall_inout_parameter_with_index_with_side_effects_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006699,
        "dEQP-GLES3.functional.shaders.indexin",
        "g.moredynamic.lvalue_with_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006700,
        "dEQP-GLES3.functional.shaders.indexing",
        ".moredynamic.lvalue_with_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006701,
        "dEQP-GLES3.functional.shaders.in",
        "dexing.moredynamic.uniform_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006702,
        "dEQP-GLES3.functional.shaders.ind",
        "exing.moredynamic.uniform_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006703,
        "dEQP-GLES3.functional.shaders.indexing.m",
        "oredynamic.sequence_vector_lvalue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006704,
        "dEQP-GLES3.functional.shaders.indexing.mo",
        "redynamic.sequence_vector_lvalue_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006705,
        "dEQP-GLES3.functional.shaders.indexing.m",
        "oredynamic.matrix_twice_in_lvalue_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30007TestSuite, TestCase_006706,
        "dEQP-GLES3.functional.shaders.indexing.mo",
        "redynamic.matrix_twice_in_lvalue_fragment");
