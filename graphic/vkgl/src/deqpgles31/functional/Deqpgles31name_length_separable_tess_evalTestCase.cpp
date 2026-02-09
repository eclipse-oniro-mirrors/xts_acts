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

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021917,
        "dEQP-GLES31.functional.program_interface_query.p",
        "rogram_input.name_length.separable_tess_eval.var");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021918,
        "dEQP-GLES31.functional.program_interface_query.prog",
        "ram_input.name_length.separable_tess_eval.patch_var");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021919,
        "dEQP-GLES31.functional.program_interface_query.program",
        "_input.name_length.separable_tess_eval.patch_var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021920,
        "dEQP-GLES31.functional.program_interface_query.program",
        "_input.name_length.separable_tess_eval.patch_var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022524,
        "dEQP-GLES31.functional.program_interface_query.p",
        "rogram_output.name_length.separable_tess_eval.var");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022525,
        "dEQP-GLES31.functional.program_interface_query.progr",
        "am_output.name_length.separable_tess_eval.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022526,
        "dEQP-GLES31.functional.program_interface_query.prog",
        "ram_output.name_length.separable_tess_eval.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_023067,
        "dEQP-GLES31.functional.program_interface_query.transform_feedb",
        "ack_varying.name_length.separable_tess_eval.builtin_gl_position");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_023068,
        "dEQP-GLES31.functional.program_interface_query.transform_feedback",
        "_varying.name_length.separable_tess_eval.default_block_basic_type");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_023069,
        "dEQP-GLES31.functional.program_interface_query.transform_feedback_",
        "varying.name_length.separable_tess_eval.default_block_struct_member");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_023070,
        "dEQP-GLES31.functional.program_interface_query.transform_feedb",
        "ack_varying.name_length.separable_tess_eval.default_block_array");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_023071,
        "dEQP-GLES31.functional.program_interface_query.transform_feedback_",
        "varying.name_length.separable_tess_eval.default_block_array_element");
