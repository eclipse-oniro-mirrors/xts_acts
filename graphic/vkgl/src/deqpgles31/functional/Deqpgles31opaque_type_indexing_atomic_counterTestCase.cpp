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

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003786,
        "dEQP-GLES31.functional.shaders.opaque_type_",
        "indexing.atomic_counter.const_literal_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003787,
        "dEQP-GLES31.functional.shaders.opaque_type_i",
        "ndexing.atomic_counter.const_literal_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003788,
        "dEQP-GLES31.functional.shaders.opaque_type_i",
        "ndexing.atomic_counter.const_literal_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003789,
        "dEQP-GLES31.functional.shaders.opaque_type_i",
        "ndexing.atomic_counter.const_literal_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003790,
        "dEQP-GLES31.functional.shaders.opaque_type_indexin",
        "g.atomic_counter.const_literal_tessellation_control");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003791,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.",
        "atomic_counter.const_literal_tessellation_evaluation");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003792,
        "dEQP-GLES31.functional.shaders.opaque_type_in",
        "dexing.atomic_counter.const_expression_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003793,
        "dEQP-GLES31.functional.shaders.opaque_type_ind",
        "exing.atomic_counter.const_expression_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003794,
        "dEQP-GLES31.functional.shaders.opaque_type_in",
        "dexing.atomic_counter.const_expression_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003795,
        "dEQP-GLES31.functional.shaders.opaque_type_ind",
        "exing.atomic_counter.const_expression_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003796,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.",
        "atomic_counter.const_expression_tessellation_control");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003797,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.a",
        "tomic_counter.const_expression_tessellation_evaluation");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003798,
        "dEQP-GLES31.functional.shaders.opaque_ty",
        "pe_indexing.atomic_counter.uniform_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003799,
        "dEQP-GLES31.functional.shaders.opaque_typ",
        "e_indexing.atomic_counter.uniform_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003800,
        "dEQP-GLES31.functional.shaders.opaque_typ",
        "e_indexing.atomic_counter.uniform_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003801,
        "dEQP-GLES31.functional.shaders.opaque_typ",
        "e_indexing.atomic_counter.uniform_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003802,
        "dEQP-GLES31.functional.shaders.opaque_type_inde",
        "xing.atomic_counter.uniform_tessellation_control");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003803,
        "dEQP-GLES31.functional.shaders.opaque_type_indexi",
        "ng.atomic_counter.uniform_tessellation_evaluation");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003804,
        "dEQP-GLES31.functional.shaders.opaque_type_ind",
        "exing.atomic_counter.dynamically_uniform_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003805,
        "dEQP-GLES31.functional.shaders.opaque_type_inde",
        "xing.atomic_counter.dynamically_uniform_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003806,
        "dEQP-GLES31.functional.shaders.opaque_type_inde",
        "xing.atomic_counter.dynamically_uniform_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003807,
        "dEQP-GLES31.functional.shaders.opaque_type_inde",
        "xing.atomic_counter.dynamically_uniform_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003808,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.a",
        "tomic_counter.dynamically_uniform_tessellation_control");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003809,
        "dEQP-GLES31.functional.shaders.opaque_type_indexing.ato",
        "mic_counter.dynamically_uniform_tessellation_evaluation");
