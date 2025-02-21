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
#include "../ActsDeqpgles310018TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017865,
        "dEQP-GLES31.functional.separate_shader.",
        "validation.es31.io_blocks.missing_input");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017866,
        "dEQP-GLES31.functional.separate_shader.",
        "validation.es31.io_blocks.missing_output");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017867,
        "dEQP-GLES31.functional.separate_shader.validatio",
        "n.es31.io_blocks.mismatch_number_of_declarations");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017868,
        "dEQP-GLES31.functional.separate_shader.vali",
        "dation.es31.io_blocks.mismatch_member_order");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017869,
        "dEQP-GLES31.functional.separate_shader.val",
        "idation.es31.io_blocks.mismatch_member_type");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017870,
        "dEQP-GLES31.functional.separate_shader.val",
        "idation.es31.io_blocks.mismatch_member_name");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017871,
        "dEQP-GLES31.functional.separate_shader.valida",
        "tion.es31.io_blocks.mismatch_member_precision");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017872,
        "dEQP-GLES31.functional.separate_shader.validation.es",
        "31.io_blocks.mismatch_different_member_interpolation");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017873,
        "dEQP-GLES31.functional.separate_shader.valida",
        "tion.es31.io_blocks.mismatch_member_array_size");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017874,
        "dEQP-GLES31.functional.separate_shader.validation.e",
        "s31.io_blocks.mismatch_different_member_struct_names");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017875,
        "dEQP-GLES31.functional.separate_shader.validation",
        ".es31.io_blocks.mismatch_member_struct_member_name");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017876,
        "dEQP-GLES31.functional.separate_shader.validation",
        ".es31.io_blocks.mismatch_member_struct_member_type");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017877,
        "dEQP-GLES31.functional.separate_shader.validation.es",
        "31.io_blocks.mismatch_member_struct_member_precision");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017878,
        "dEQP-GLES31.functional.separate_shader.validation.",
        "es31.io_blocks.mismatch_member_struct_member_order");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017879,
        "dEQP-GLES31.functional.separate_shader.val",
        "idation.es31.io_blocks.mismatch_array_size");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017880,
        "dEQP-GLES31.functional.separate_shader.validation.",
        "es31.io_blocks.mismatch_variable_and_block_member_1");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017881,
        "dEQP-GLES31.functional.separate_shader.validation.",
        "es31.io_blocks.mismatch_variable_and_block_member_2");
