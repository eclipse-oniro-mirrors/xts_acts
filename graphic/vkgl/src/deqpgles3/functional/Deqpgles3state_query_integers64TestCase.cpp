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
#include "../Deqpgles3BaseFunc.h"
#include "../ActsDeqpgles30043TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042966,
        "dEQP-GLES3.functional.state_query.in",
        "tegers64.max_element_index_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042967,
        "dEQP-GLES3.functional.state_query.in",
        "tegers64.max_element_index_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042968,
        "dEQP-GLES3.functional.state_query.i",
        "ntegers64.max_element_index_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042969,
        "dEQP-GLES3.functional.state_query.integ",
        "ers64.max_server_wait_timeout_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042970,
        "dEQP-GLES3.functional.state_query.integ",
        "ers64.max_server_wait_timeout_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042971,
        "dEQP-GLES3.functional.state_query.inte",
        "gers64.max_server_wait_timeout_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042972,
        "dEQP-GLES3.functional.state_query.integ",
        "ers64.max_uniform_block_size_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042973,
        "dEQP-GLES3.functional.state_query.integ",
        "ers64.max_uniform_block_size_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042974,
        "dEQP-GLES3.functional.state_query.inte",
        "gers64.max_uniform_block_size_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042975,
        "dEQP-GLES3.functional.state_query.integers64.ma",
        "x_combined_vertex_uniform_components_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042976,
        "dEQP-GLES3.functional.state_query.integers64.ma",
        "x_combined_vertex_uniform_components_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042977,
        "dEQP-GLES3.functional.state_query.integers64.m",
        "ax_combined_vertex_uniform_components_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042978,
        "dEQP-GLES3.functional.state_query.integers64.max",
        "_combined_fragment_uniform_components_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042979,
        "dEQP-GLES3.functional.state_query.integers64.max",
        "_combined_fragment_uniform_components_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles30043TestSuite, TestCase_042980,
        "dEQP-GLES3.functional.state_query.integers64.ma",
        "x_combined_fragment_uniform_components_getfloat");
