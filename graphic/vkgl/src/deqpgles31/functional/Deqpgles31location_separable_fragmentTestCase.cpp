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

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021851,
        "dEQP-GLES31.functional.program_interface_query",
        ".program_input.location.separable_fragment.var");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021852,
        "dEQP-GLES31.functional.program_interface_query.program_",
        "input.location.separable_fragment.var_explicit_location");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021853,
        "dEQP-GLES31.functional.program_interface_query.pr",
        "ogram_input.location.separable_fragment.var_struct");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021854,
        "dEQP-GLES31.functional.program_interface_query.program_inp",
        "ut.location.separable_fragment.var_struct_explicit_location");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021855,
        "dEQP-GLES31.functional.program_interface_query.pr",
        "ogram_input.location.separable_fragment.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021856,
        "dEQP-GLES31.functional.program_interface_query.program_inp",
        "ut.location.separable_fragment.var_array_explicit_location");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022447,
        "dEQP-GLES31.functional.program_interface_query",
        ".program_output.location.separable_fragment.var");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022448,
        "dEQP-GLES31.functional.program_interface_query.program_",
        "output.location.separable_fragment.var_explicit_location");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022449,
        "dEQP-GLES31.functional.program_interface_query.pr",
        "ogram_output.location.separable_fragment.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022450,
        "dEQP-GLES31.functional.program_interface_query.program_out",
        "put.location.separable_fragment.var_array_explicit_location");
