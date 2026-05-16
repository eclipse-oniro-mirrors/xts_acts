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

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003774,
        "dEQP-GLES31.functional.shaders.opaque_",
        "type_indexing.ssbo.const_literal_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003775,
        "dEQP-GLES31.functional.shaders.opaque_t",
        "ype_indexing.ssbo.const_literal_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003776,
        "dEQP-GLES31.functional.shaders.opaque_t",
        "ype_indexing.ssbo.const_literal_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003777,
        "dEQP-GLES31.functional.shaders.opaque_t",
        "ype_indexing.ssbo.const_literal_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003778,
        "dEQP-GLES31.functional.shaders.opaque_type_in",
        "dexing.ssbo.const_literal_tessellation_control");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003779,
        "dEQP-GLES31.functional.shaders.opaque_type_inde",
        "xing.ssbo.const_literal_tessellation_evaluation");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003780,
        "dEQP-GLES31.functional.shaders.opaque_ty",
        "pe_indexing.ssbo.const_expression_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003781,
        "dEQP-GLES31.functional.shaders.opaque_typ",
        "e_indexing.ssbo.const_expression_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003782,
        "dEQP-GLES31.functional.shaders.opaque_ty",
        "pe_indexing.ssbo.const_expression_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003783,
        "dEQP-GLES31.functional.shaders.opaque_typ",
        "e_indexing.ssbo.const_expression_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003784,
        "dEQP-GLES31.functional.shaders.opaque_type_inde",
        "xing.ssbo.const_expression_tessellation_control");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003785,
        "dEQP-GLES31.functional.shaders.opaque_type_index",
        "ing.ssbo.const_expression_tessellation_evaluation");
