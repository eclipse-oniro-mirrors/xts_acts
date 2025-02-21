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
#include "../ActsDeqpgles310008TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007913,
        "dEQP-GLES31.functional.draw_indire",
        "ct.negative.command_bad_alignment_1");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007914,
        "dEQP-GLES31.functional.draw_indire",
        "ct.negative.command_bad_alignment_2");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007915,
        "dEQP-GLES31.functional.draw_indire",
        "ct.negative.command_bad_alignment_3");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007916,
        "dEQP-GLES31.functional.draw_indirect.neg",
        "ative.command_offset_partially_in_buffer");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007917,
        "dEQP-GLES31.functional.draw_indirect.",
        "negative.command_offset_not_in_buffer");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007918,
        "dEQP-GLES31.functional.draw_indirect.negative",
        ".command_offset_not_in_buffer_unsigned32_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007919,
        "dEQP-GLES31.functional.draw_indirect.negativ",
        "e.command_offset_not_in_buffer_signed32_wrap");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007920,
        "dEQP-GLES31.functional.draw_indirect",
        ".negative.client_vertex_attrib_array");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007921,
        "dEQP-GLES31.functional.draw_indir",
        "ect.negative.client_command_array");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007922,
        "dEQP-GLES31.functional.draw_",
        "indirect.negative.default_vao");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007923,
        "dEQP-GLES31.functional.draw_indirec",
        "t.negative.invalid_mode_draw_arrays");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007924,
        "dEQP-GLES31.functional.draw_indirect",
        ".negative.invalid_mode_draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles310008TestSuite, TestCase_007925,
        "dEQP-GLES31.functional.draw_indirect",
        ".negative.invalid_type_draw_elements");
