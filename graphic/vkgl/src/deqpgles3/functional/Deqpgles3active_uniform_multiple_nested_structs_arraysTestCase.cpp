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
#include "../ActsDeqpgles30037TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036430,
        "dEQP-GLES3.functional.uniform_api.info_query.act",
        "ive_uniform.multiple_nested_structs_arrays.vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036431,
        "dEQP-GLES3.functional.uniform_api.info_query.acti",
        "ve_uniform.multiple_nested_structs_arrays.fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30037TestSuite, TestCase_036432,
        "dEQP-GLES3.functional.uniform_api.info_query.ac",
        "tive_uniform.multiple_nested_structs_arrays.both");