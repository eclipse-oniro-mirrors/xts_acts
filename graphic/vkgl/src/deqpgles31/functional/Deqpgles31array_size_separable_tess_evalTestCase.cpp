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

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021818,
        "dEQP-GLES31.functional.program_interface_query.",
        "program_input.array_size.separable_tess_eval.var");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021819,
        "dEQP-GLES31.functional.program_interface_query.pro",
        "gram_input.array_size.separable_tess_eval.patch_var");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021820,
        "dEQP-GLES31.functional.program_interface_query.program",
        "_input.array_size.separable_tess_eval.patch_var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021821,
        "dEQP-GLES31.functional.program_interface_query.progra",
        "m_input.array_size.separable_tess_eval.patch_var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022407,
        "dEQP-GLES31.functional.program_interface_query.p",
        "rogram_output.array_size.separable_tess_eval.var");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022408,
        "dEQP-GLES31.functional.program_interface_query.prog",
        "ram_output.array_size.separable_tess_eval.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022409,
        "dEQP-GLES31.functional.program_interface_query.prog",
        "ram_output.array_size.separable_tess_eval.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_023032,
        "dEQP-GLES31.functional.program_interface_query.transform_feedb",
        "ack_varying.array_size.separable_tess_eval.builtin_gl_position");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_023033,
        "dEQP-GLES31.functional.program_interface_query.transform_feedbac",
        "k_varying.array_size.separable_tess_eval.default_block_basic_type");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_023034,
        "dEQP-GLES31.functional.program_interface_query.transform_feedback_",
        "varying.array_size.separable_tess_eval.default_block_struct_member");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_023035,
        "dEQP-GLES31.functional.program_interface_query.transform_feedb",
        "ack_varying.array_size.separable_tess_eval.default_block_array");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_023036,
        "dEQP-GLES31.functional.program_interface_query.transform_feedback_",
        "varying.array_size.separable_tess_eval.default_block_array_element");
