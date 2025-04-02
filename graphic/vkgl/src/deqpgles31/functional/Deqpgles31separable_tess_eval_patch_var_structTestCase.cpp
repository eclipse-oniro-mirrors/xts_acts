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
#include "../ActsDeqpgles310023TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022110,
        "dEQP-GLES31.functional.program_interface_query.program",
        "_input.type.separable_tess_eval.patch_var_struct.float");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022111,
        "dEQP-GLES31.functional.program_interface_query.progra",
        "m_input.type.separable_tess_eval.patch_var_struct.int");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022112,
        "dEQP-GLES31.functional.program_interface_query.progra",
        "m_input.type.separable_tess_eval.patch_var_struct.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022113,
        "dEQP-GLES31.functional.program_interface_query.progra",
        "m_input.type.separable_tess_eval.patch_var_struct.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022114,
        "dEQP-GLES31.functional.program_interface_query.program",
        "_input.type.separable_tess_eval.patch_var_struct.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022115,
        "dEQP-GLES31.functional.program_interface_query.program",
        "_input.type.separable_tess_eval.patch_var_struct.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022116,
        "dEQP-GLES31.functional.program_interface_query.program",
        "_input.type.separable_tess_eval.patch_var_struct.mat3x2");
