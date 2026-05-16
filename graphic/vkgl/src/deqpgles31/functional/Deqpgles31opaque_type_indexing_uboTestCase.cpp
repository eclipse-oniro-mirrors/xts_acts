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
#include "../Deqpgles31BaseFunc.h"
#include "../ActsDeqpgles310004TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003750,
        "dEQP-GLES31.functional.shaders.opaque_",
        "type_indexing.ubo.const_literal_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003751,
        "dEQP-GLES31.functional.shaders.opaque_t",
        "ype_indexing.ubo.const_literal_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003752,
        "dEQP-GLES31.functional.shaders.opaque_",
        "type_indexing.ubo.const_literal_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003753,
        "dEQP-GLES31.functional.shaders.opaque_t",
        "ype_indexing.ubo.const_literal_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003754,
        "dEQP-GLES31.functional.shaders.opaque_type_in",
        "dexing.ubo.const_literal_tessellation_control");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003755,
        "dEQP-GLES31.functional.shaders.opaque_type_ind",
        "exing.ubo.const_literal_tessellation_evaluation");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003756,
        "dEQP-GLES31.functional.shaders.opaque_t",
        "ype_indexing.ubo.const_expression_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003757,
        "dEQP-GLES31.functional.shaders.opaque_ty",
        "pe_indexing.ubo.const_expression_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003758,
        "dEQP-GLES31.functional.shaders.opaque_ty",
        "pe_indexing.ubo.const_expression_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003759,
        "dEQP-GLES31.functional.shaders.opaque_ty",
        "pe_indexing.ubo.const_expression_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003760,
        "dEQP-GLES31.functional.shaders.opaque_type_ind",
        "exing.ubo.const_expression_tessellation_control");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003761,
        "dEQP-GLES31.functional.shaders.opaque_type_index",
        "ing.ubo.const_expression_tessellation_evaluation");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003762,
        "dEQP-GLES31.functional.shaders.opaq",
        "ue_type_indexing.ubo.uniform_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003763,
        "dEQP-GLES31.functional.shaders.opaqu",
        "e_type_indexing.ubo.uniform_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003764,
        "dEQP-GLES31.functional.shaders.opaq",
        "ue_type_indexing.ubo.uniform_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003765,
        "dEQP-GLES31.functional.shaders.opaqu",
        "e_type_indexing.ubo.uniform_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003766,
        "dEQP-GLES31.functional.shaders.opaque_type",
        "_indexing.ubo.uniform_tessellation_control");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003767,
        "dEQP-GLES31.functional.shaders.opaque_type_",
        "indexing.ubo.uniform_tessellation_evaluation");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003768,
        "dEQP-GLES31.functional.shaders.opaque_typ",
        "e_indexing.ubo.dynamically_uniform_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003769,
        "dEQP-GLES31.functional.shaders.opaque_type",
        "_indexing.ubo.dynamically_uniform_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003770,
        "dEQP-GLES31.functional.shaders.opaque_typ",
        "e_indexing.ubo.dynamically_uniform_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003771,
        "dEQP-GLES31.functional.shaders.opaque_type",
        "_indexing.ubo.dynamically_uniform_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003772,
        "dEQP-GLES31.functional.shaders.opaque_type_index",
        "ing.ubo.dynamically_uniform_tessellation_control");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003773,
        "dEQP-GLES31.functional.shaders.opaque_type_indexi",
        "ng.ubo.dynamically_uniform_tessellation_evaluation");
