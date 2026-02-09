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

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017905,
        "dEQP-GLES31.functional.separate_shader.",
        "validation.es32.io_blocks.missing_input");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017906,
        "dEQP-GLES31.functional.separate_shader.",
        "validation.es32.io_blocks.missing_output");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017907,
        "dEQP-GLES31.functional.separate_shader.validatio",
        "n.es32.io_blocks.mismatch_number_of_declarations");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017908,
        "dEQP-GLES31.functional.separate_shader.vali",
        "dation.es32.io_blocks.mismatch_member_order");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017909,
        "dEQP-GLES31.functional.separate_shader.val",
        "idation.es32.io_blocks.mismatch_member_type");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017910,
        "dEQP-GLES31.functional.separate_shader.val",
        "idation.es32.io_blocks.mismatch_member_name");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017911,
        "dEQP-GLES31.functional.separate_shader.valida",
        "tion.es32.io_blocks.mismatch_member_precision");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017912,
        "dEQP-GLES31.functional.separate_shader.validation.es",
        "32.io_blocks.mismatch_different_member_interpolation");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017913,
        "dEQP-GLES31.functional.separate_shader.valida",
        "tion.es32.io_blocks.mismatch_member_array_size");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017914,
        "dEQP-GLES31.functional.separate_shader.validation.",
        "es32.io_blocks.match_different_member_struct_names");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017915,
        "dEQP-GLES31.functional.separate_shader.validation",
        ".es32.io_blocks.mismatch_member_struct_member_name");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017916,
        "dEQP-GLES31.functional.separate_shader.validation",
        ".es32.io_blocks.mismatch_member_struct_member_type");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017917,
        "dEQP-GLES31.functional.separate_shader.validation.es",
        "32.io_blocks.mismatch_member_struct_member_precision");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017918,
        "dEQP-GLES31.functional.separate_shader.validation.",
        "es32.io_blocks.mismatch_member_struct_member_order");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017919,
        "dEQP-GLES31.functional.separate_shader.val",
        "idation.es32.io_blocks.mismatch_array_size");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017920,
        "dEQP-GLES31.functional.separate_shader.validation.",
        "es32.io_blocks.mismatch_variable_and_block_member_1");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017921,
        "dEQP-GLES31.functional.separate_shader.validation.",
        "es32.io_blocks.mismatch_variable_and_block_member_2");
