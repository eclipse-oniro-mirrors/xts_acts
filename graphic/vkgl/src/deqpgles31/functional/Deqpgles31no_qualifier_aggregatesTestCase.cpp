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
#include "../ActsDeqpgles310021TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020645,
        "dEQP-GLES31.functional.program_interface_query.uniform.m",
        "atrix_row_major.default_block.no_qualifier.aggregates.var");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020646,
        "dEQP-GLES31.functional.program_interface_query.uniform.matri",
        "x_row_major.default_block.no_qualifier.aggregates.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020647,
        "dEQP-GLES31.functional.program_interface_query.uniform.matr",
        "ix_row_major.default_block.no_qualifier.aggregates.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020660,
        "dEQP-GLES31.functional.program_interface_query.uniform.",
        "matrix_row_major.named_block.no_qualifier.aggregates.var");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020661,
        "dEQP-GLES31.functional.program_interface_query.uniform.matr",
        "ix_row_major.named_block.no_qualifier.aggregates.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020662,
        "dEQP-GLES31.functional.program_interface_query.uniform.mat",
        "rix_row_major.named_block.no_qualifier.aggregates.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020739,
        "dEQP-GLES31.functional.program_interface_query.uniform.",
        "matrix_stride.default_block.no_qualifier.aggregates.var");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020740,
        "dEQP-GLES31.functional.program_interface_query.uniform.mat",
        "rix_stride.default_block.no_qualifier.aggregates.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020741,
        "dEQP-GLES31.functional.program_interface_query.uniform.mat",
        "rix_stride.default_block.no_qualifier.aggregates.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020754,
        "dEQP-GLES31.functional.program_interface_query.uniform",
        ".matrix_stride.named_block.no_qualifier.aggregates.var");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020755,
        "dEQP-GLES31.functional.program_interface_query.uniform.ma",
        "trix_stride.named_block.no_qualifier.aggregates.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020756,
        "dEQP-GLES31.functional.program_interface_query.uniform.ma",
        "trix_stride.named_block.no_qualifier.aggregates.var_array");
