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

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022703,
        "dEQP-GLES31.functional.program_interface_query.program",
        "_output.type.separable_tess_ctrl.patch_var_struct.float");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022704,
        "dEQP-GLES31.functional.program_interface_query.progra",
        "m_output.type.separable_tess_ctrl.patch_var_struct.int");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022705,
        "dEQP-GLES31.functional.program_interface_query.program",
        "_output.type.separable_tess_ctrl.patch_var_struct.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022706,
        "dEQP-GLES31.functional.program_interface_query.program",
        "_output.type.separable_tess_ctrl.patch_var_struct.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022707,
        "dEQP-GLES31.functional.program_interface_query.program",
        "_output.type.separable_tess_ctrl.patch_var_struct.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022708,
        "dEQP-GLES31.functional.program_interface_query.program",
        "_output.type.separable_tess_ctrl.patch_var_struct.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022709,
        "dEQP-GLES31.functional.program_interface_query.program_",
        "output.type.separable_tess_ctrl.patch_var_struct.mat3x2");
