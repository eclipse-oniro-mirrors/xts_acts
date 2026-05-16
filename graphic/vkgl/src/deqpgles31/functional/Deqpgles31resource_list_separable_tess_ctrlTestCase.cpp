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

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021778,
        "dEQP-GLES31.functional.program_interface_query.pro",
        "gram_input.resource_list.separable_tess_ctrl.empty");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021779,
        "dEQP-GLES31.functional.program_interface_query.pr",
        "ogram_input.resource_list.separable_tess_ctrl.var");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022358,
        "dEQP-GLES31.functional.program_interface_query.pro",
        "gram_output.resource_list.separable_tess_ctrl.empty");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022359,
        "dEQP-GLES31.functional.program_interface_query.pr",
        "ogram_output.resource_list.separable_tess_ctrl.var");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022360,
        "dEQP-GLES31.functional.program_interface_query.progr",
        "am_output.resource_list.separable_tess_ctrl.patch_var");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022361,
        "dEQP-GLES31.functional.program_interface_query.program_o",
        "utput.resource_list.separable_tess_ctrl.patch_var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022362,
        "dEQP-GLES31.functional.program_interface_query.program_",
        "output.resource_list.separable_tess_ctrl.patch_var_array");
