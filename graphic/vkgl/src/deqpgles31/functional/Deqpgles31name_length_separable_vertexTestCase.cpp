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

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021912,
        "dEQP-GLES31.functional.program_interface_query",
        ".program_input.name_length.separable_vertex.var");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022515,
        "dEQP-GLES31.functional.program_interface_query.",
        "program_output.name_length.separable_vertex.var");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022516,
        "dEQP-GLES31.functional.program_interface_query.pro",
        "gram_output.name_length.separable_vertex.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022517,
        "dEQP-GLES31.functional.program_interface_query.pro",
        "gram_output.name_length.separable_vertex.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_023062,
        "dEQP-GLES31.functional.program_interface_query.transform_feed",
        "back_varying.name_length.separable_vertex.builtin_gl_position");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_023063,
        "dEQP-GLES31.functional.program_interface_query.transform_feedba",
        "ck_varying.name_length.separable_vertex.default_block_basic_type");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_023064,
        "dEQP-GLES31.functional.program_interface_query.transform_feedback",
        "_varying.name_length.separable_vertex.default_block_struct_member");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_023065,
        "dEQP-GLES31.functional.program_interface_query.transform_feed",
        "back_varying.name_length.separable_vertex.default_block_array");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_023066,
        "dEQP-GLES31.functional.program_interface_query.transform_feedback",
        "_varying.name_length.separable_vertex.default_block_array_element");
