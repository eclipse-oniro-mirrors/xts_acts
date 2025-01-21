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
#include "../ActsDeqpgles310022TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021857,
        "dEQP-GLES31.functional.program_interface_query",
        ".program_input.location.separable_tess_ctrl.var");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021858,
        "dEQP-GLES31.functional.program_interface_query.program_",
        "input.location.separable_tess_ctrl.var_explicit_location");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022451,
        "dEQP-GLES31.functional.program_interface_query.",
        "program_output.location.separable_tess_ctrl.var");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022452,
        "dEQP-GLES31.functional.program_interface_query.program_o",
        "utput.location.separable_tess_ctrl.var_explicit_location");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022453,
        "dEQP-GLES31.functional.program_interface_query.pro",
        "gram_output.location.separable_tess_ctrl.patch_var");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022454,
        "dEQP-GLES31.functional.program_interface_query.program_outp",
        "ut.location.separable_tess_ctrl.patch_var_explicit_location");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022455,
        "dEQP-GLES31.functional.program_interface_query.progra",
        "m_output.location.separable_tess_ctrl.patch_var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022456,
        "dEQP-GLES31.functional.program_interface_query.program_output.",
        "location.separable_tess_ctrl.patch_var_struct_explicit_location");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022457,
        "dEQP-GLES31.functional.program_interface_query.progra",
        "m_output.location.separable_tess_ctrl.patch_var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022458,
        "dEQP-GLES31.functional.program_interface_query.program_output.",
        "location.separable_tess_ctrl.patch_var_array_explicit_location");
