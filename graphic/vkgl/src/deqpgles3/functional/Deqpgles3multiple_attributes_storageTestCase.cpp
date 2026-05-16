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
#include "../ActsDeqpgles30034TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033688,
        "dEQP-GLES3.functional.vertex_arrays.multiple_",
        "attributes.storage.3_user_ptr_user_ptr_buffer");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033689,
        "dEQP-GLES3.functional.vertex_arrays.multiple_",
        "attributes.storage.3_user_ptr_buffer_user_ptr");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033690,
        "dEQP-GLES3.functional.vertex_arrays.multiple",
        "_attributes.storage.3_user_ptr_buffer_buffer");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033691,
        "dEQP-GLES3.functional.vertex_arrays.multiple_",
        "attributes.storage.3_buffer_user_ptr_user_ptr");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033692,
        "dEQP-GLES3.functional.vertex_arrays.multiple",
        "_attributes.storage.3_buffer_user_ptr_buffer");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033693,
        "dEQP-GLES3.functional.vertex_arrays.multiple",
        "_attributes.storage.3_buffer_buffer_user_ptr");

static SHRINK_HWTEST_F(ActsDeqpgles30034TestSuite, TestCase_033694,
        "dEQP-GLES3.functional.vertex_arrays.multipl",
        "e_attributes.storage.3_buffer_buffer_buffer");
