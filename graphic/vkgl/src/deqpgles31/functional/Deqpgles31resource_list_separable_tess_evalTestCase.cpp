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

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021780,
        "dEQP-GLES31.functional.program_interface_query.pro",
        "gram_input.resource_list.separable_tess_eval.empty");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021781,
        "dEQP-GLES31.functional.program_interface_query.pr",
        "ogram_input.resource_list.separable_tess_eval.var");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021782,
        "dEQP-GLES31.functional.program_interface_query.progr",
        "am_input.resource_list.separable_tess_eval.patch_var");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021783,
        "dEQP-GLES31.functional.program_interface_query.program_",
        "input.resource_list.separable_tess_eval.patch_var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021784,
        "dEQP-GLES31.functional.program_interface_query.program_",
        "input.resource_list.separable_tess_eval.patch_var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022363,
        "dEQP-GLES31.functional.program_interface_query.pro",
        "gram_output.resource_list.separable_tess_eval.empty");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022364,
        "dEQP-GLES31.functional.program_interface_query.pr",
        "ogram_output.resource_list.separable_tess_eval.var");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022365,
        "dEQP-GLES31.functional.program_interface_query.progra",
        "m_output.resource_list.separable_tess_eval.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022366,
        "dEQP-GLES31.functional.program_interface_query.progr",
        "am_output.resource_list.separable_tess_eval.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022997,
        "dEQP-GLES31.functional.program_interface_query.transform_feedba",
        "ck_varying.resource_list.separable_tess_eval.builtin_gl_position");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022998,
        "dEQP-GLES31.functional.program_interface_query.transform_feedback_",
        "varying.resource_list.separable_tess_eval.default_block_basic_type");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022999,
        "dEQP-GLES31.functional.program_interface_query.transform_feedback_v",
        "arying.resource_list.separable_tess_eval.default_block_struct_member");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_023000,
        "dEQP-GLES31.functional.program_interface_query.transform_feedba",
        "ck_varying.resource_list.separable_tess_eval.default_block_array");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_023001,
        "dEQP-GLES31.functional.program_interface_query.transform_feedback_v",
        "arying.resource_list.separable_tess_eval.default_block_array_element");
