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
#include "../ActsDeqpgles310022TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021774,
        "dEQP-GLES31.functional.program_interface_query.pr",
        "ogram_input.resource_list.separable_fragment.empty");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021775,
        "dEQP-GLES31.functional.program_interface_query.p",
        "rogram_input.resource_list.separable_fragment.var");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021776,
        "dEQP-GLES31.functional.program_interface_query.progr",
        "am_input.resource_list.separable_fragment.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021777,
        "dEQP-GLES31.functional.program_interface_query.prog",
        "ram_input.resource_list.separable_fragment.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022355,
        "dEQP-GLES31.functional.program_interface_query.pro",
        "gram_output.resource_list.separable_fragment.empty");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022356,
        "dEQP-GLES31.functional.program_interface_query.pr",
        "ogram_output.resource_list.separable_fragment.var");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022357,
        "dEQP-GLES31.functional.program_interface_query.progr",
        "am_output.resource_list.separable_fragment.var_array");
