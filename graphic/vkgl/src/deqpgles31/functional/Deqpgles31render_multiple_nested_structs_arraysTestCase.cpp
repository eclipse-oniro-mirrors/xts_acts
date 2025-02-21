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

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017065,
        "dEQP-GLES31.functional.program_uniform.by_point",
        "er.render.multiple_nested_structs_arrays.vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017066,
        "dEQP-GLES31.functional.program_uniform.by_pointe",
        "r.render.multiple_nested_structs_arrays.fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017067,
        "dEQP-GLES31.functional.program_uniform.by_poin",
        "ter.render.multiple_nested_structs_arrays.both");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017434,
        "dEQP-GLES31.functional.program_uniform.by_valu",
        "e.render.multiple_nested_structs_arrays.vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017435,
        "dEQP-GLES31.functional.program_uniform.by_value",
        ".render.multiple_nested_structs_arrays.fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310018TestSuite, TestCase_017436,
        "dEQP-GLES31.functional.program_uniform.by_val",
        "ue.render.multiple_nested_structs_arrays.both");
