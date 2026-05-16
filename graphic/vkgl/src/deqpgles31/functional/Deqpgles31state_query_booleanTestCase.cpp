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
#include "../ActsDeqpgles310015TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014825,
        "dEQP-GLES31.functional.state_que",
        "ry.boolean.sample_mask_isenabled");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014826,
        "dEQP-GLES31.functional.state_que",
        "ry.boolean.sample_mask_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014827,
        "dEQP-GLES31.functional.state_que",
        "ry.boolean.sample_mask_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014828,
        "dEQP-GLES31.functional.state_quer",
        "y.boolean.sample_mask_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014829,
        "dEQP-GLES31.functional.state_qu",
        "ery.boolean.sample_mask_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014830,
        "dEQP-GLES31.functional.state_quer",
        "y.boolean.sample_shading_isenabled");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014831,
        "dEQP-GLES31.functional.state_query",
        ".boolean.sample_shading_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014832,
        "dEQP-GLES31.functional.state_query",
        ".boolean.sample_shading_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014833,
        "dEQP-GLES31.functional.state_query.",
        "boolean.sample_shading_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014834,
        "dEQP-GLES31.functional.state_quer",
        "y.boolean.sample_shading_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014835,
        "dEQP-GLES31.functional.state_que",
        "ry.boolean.debug_output_isenabled");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014836,
        "dEQP-GLES31.functional.state_quer",
        "y.boolean.debug_output_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014837,
        "dEQP-GLES31.functional.state_quer",
        "y.boolean.debug_output_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014838,
        "dEQP-GLES31.functional.state_query",
        ".boolean.debug_output_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014839,
        "dEQP-GLES31.functional.state_que",
        "ry.boolean.debug_output_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014840,
        "dEQP-GLES31.functional.state_query.boo",
        "lean.debug_output_synchronous_isenabled");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014841,
        "dEQP-GLES31.functional.state_query.bool",
        "ean.debug_output_synchronous_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014842,
        "dEQP-GLES31.functional.state_query.bool",
        "ean.debug_output_synchronous_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014843,
        "dEQP-GLES31.functional.state_query.boole",
        "an.debug_output_synchronous_getinteger64");

static SHRINK_HWTEST_F(ActsDeqpgles310015TestSuite, TestCase_014844,
        "dEQP-GLES31.functional.state_query.boo",
        "lean.debug_output_synchronous_getfloat");
