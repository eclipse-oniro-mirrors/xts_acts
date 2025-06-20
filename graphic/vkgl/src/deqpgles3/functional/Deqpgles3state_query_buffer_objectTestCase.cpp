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
#include "../ActsDeqpgles30044TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043187,
        "dEQP-GLES3.functional.state_query.buffe",
        "r_object.buffer_size_getbufferparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043188,
        "dEQP-GLES3.functional.state_query.buffer",
        "_object.buffer_size_getbufferparameteri64");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043189,
        "dEQP-GLES3.functional.state_query.buffer",
        "_object.buffer_usage_getbufferparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043190,
        "dEQP-GLES3.functional.state_query.buffer_",
        "object.buffer_usage_getbufferparameteri64");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043191,
        "dEQP-GLES3.functional.state_query.buffer_ob",
        "ject.buffer_access_flags_getbufferparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043192,
        "dEQP-GLES3.functional.state_query.buffer_obj",
        "ect.buffer_access_flags_getbufferparameteri64");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043193,
        "dEQP-GLES3.functional.state_query.buffer",
        "_object.buffer_mapped_getbufferparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043194,
        "dEQP-GLES3.functional.state_query.buffer_",
        "object.buffer_mapped_getbufferparameteri64");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043195,
        "dEQP-GLES3.functional.state_query.buffer_objec",
        "t.buffer_map_offset_length_getbufferparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043196,
        "dEQP-GLES3.functional.state_query.buffer_object",
        ".buffer_map_offset_length_getbufferparameteri64");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043197,
        "dEQP-GLES3.functional.state_que",
        "ry.buffer_object.buffer_pointer");
