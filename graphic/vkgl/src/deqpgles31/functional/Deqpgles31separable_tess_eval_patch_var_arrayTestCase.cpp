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

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022117,
        "dEQP-GLES31.functional.program_interface_query.progra",
        "m_input.type.separable_tess_eval.patch_var_array.float");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022118,
        "dEQP-GLES31.functional.program_interface_query.progr",
        "am_input.type.separable_tess_eval.patch_var_array.int");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022119,
        "dEQP-GLES31.functional.program_interface_query.progra",
        "m_input.type.separable_tess_eval.patch_var_array.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022120,
        "dEQP-GLES31.functional.program_interface_query.progra",
        "m_input.type.separable_tess_eval.patch_var_array.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022121,
        "dEQP-GLES31.functional.program_interface_query.progra",
        "m_input.type.separable_tess_eval.patch_var_array.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022122,
        "dEQP-GLES31.functional.program_interface_query.progra",
        "m_input.type.separable_tess_eval.patch_var_array.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022123,
        "dEQP-GLES31.functional.program_interface_query.program",
        "_input.type.separable_tess_eval.patch_var_array.mat3x2");
