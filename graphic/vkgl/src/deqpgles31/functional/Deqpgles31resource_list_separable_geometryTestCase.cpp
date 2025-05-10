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

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021785,
        "dEQP-GLES31.functional.program_interface_query.pr",
        "ogram_input.resource_list.separable_geometry.empty");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021786,
        "dEQP-GLES31.functional.program_interface_query.p",
        "rogram_input.resource_list.separable_geometry.var");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022367,
        "dEQP-GLES31.functional.program_interface_query.pro",
        "gram_output.resource_list.separable_geometry.empty");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022368,
        "dEQP-GLES31.functional.program_interface_query.pr",
        "ogram_output.resource_list.separable_geometry.var");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022369,
        "dEQP-GLES31.functional.program_interface_query.progr",
        "am_output.resource_list.separable_geometry.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022370,
        "dEQP-GLES31.functional.program_interface_query.progr",
        "am_output.resource_list.separable_geometry.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_023002,
        "dEQP-GLES31.functional.program_interface_query.transform_feedba",
        "ck_varying.resource_list.separable_geometry.builtin_gl_position");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_023003,
        "dEQP-GLES31.functional.program_interface_query.transform_feedback",
        "_varying.resource_list.separable_geometry.default_block_basic_type");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_023004,
        "dEQP-GLES31.functional.program_interface_query.transform_feedback_v",
        "arying.resource_list.separable_geometry.default_block_struct_member");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_023005,
        "dEQP-GLES31.functional.program_interface_query.transform_feedba",
        "ck_varying.resource_list.separable_geometry.default_block_array");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_023006,
        "dEQP-GLES31.functional.program_interface_query.transform_feedback_v",
        "arying.resource_list.separable_geometry.default_block_array_element");
