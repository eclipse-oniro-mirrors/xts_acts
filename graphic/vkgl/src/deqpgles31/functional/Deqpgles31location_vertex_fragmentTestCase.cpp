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

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021847,
        "dEQP-GLES31.functional.program_interface_que",
        "ry.program_input.location.vertex_fragment.var");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021848,
        "dEQP-GLES31.functional.program_interface_query.progra",
        "m_input.location.vertex_fragment.var_explicit_location");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022437,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.program_output.location.vertex_fragment.var");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022438,
        "dEQP-GLES31.functional.program_interface_query.program",
        "_output.location.vertex_fragment.var_explicit_location");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022439,
        "dEQP-GLES31.functional.program_interface_query.p",
        "rogram_output.location.vertex_fragment.var_array");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_022440,
        "dEQP-GLES31.functional.program_interface_query.program_ou",
        "tput.location.vertex_fragment.var_array_explicit_location");
