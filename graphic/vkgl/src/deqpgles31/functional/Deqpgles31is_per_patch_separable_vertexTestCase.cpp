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
#include "../ActsDeqpgles310023TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022314,
        "dEQP-GLES31.functional.program_interface_query.",
        "program_input.is_per_patch.separable_vertex.var");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022933,
        "dEQP-GLES31.functional.program_interface_query.",
        "program_output.is_per_patch.separable_vertex.var");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022934,
        "dEQP-GLES31.functional.program_interface_query.prog",
        "ram_output.is_per_patch.separable_vertex.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310023TestSuite, TestCase_022935,
        "dEQP-GLES31.functional.program_interface_query.pro",
        "gram_output.is_per_patch.separable_vertex.var_array");
