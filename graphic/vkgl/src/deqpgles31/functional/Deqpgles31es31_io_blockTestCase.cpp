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
#include "../ActsDeqpgles310005TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004661,
        "dEQP-GLES31.functional.shaders.linkage.es3",
        "1.io_block.mismatch_number_of_declarations");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004662,
        "dEQP-GLES31.functional.shaders.li",
        "nkage.es31.io_block.mismatch_order");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004663,
        "dEQP-GLES31.functional.shaders.li",
        "nkage.es31.io_block.mismatch_type");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004664,
        "dEQP-GLES31.functional.shaders.linka",
        "ge.es31.io_block.mismatch_member_name");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004665,
        "dEQP-GLES31.functional.shaders.linkage.",
        "es31.io_block.mismatch_member_array_size");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004666,
        "dEQP-GLES31.functional.shaders.linkage.es",
        "31.io_block.with_and_without_instance_name");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004667,
        "dEQP-GLES31.functional.shaders.linkage.",
        "es31.io_block.mismatch_block_array_size");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004668,
        "dEQP-GLES31.functional.shaders.linka",
        "ge.es31.io_block.missing_output_block");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004669,
        "dEQP-GLES31.functional.shaders.linkage.",
        "es31.io_block.ambiguous_variable_name_1");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004670,
        "dEQP-GLES31.functional.shaders.linkage.",
        "es31.io_block.ambiguous_variable_name_2");
