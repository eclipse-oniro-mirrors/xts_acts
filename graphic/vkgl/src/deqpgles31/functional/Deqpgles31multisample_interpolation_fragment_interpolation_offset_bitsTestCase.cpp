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
#include "../ActsDeqpgles310017TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016142,
        "dEQP-GLES31.functional.state_query.multisample_interp",
        "olation.fragment_interpolation_offset_bits.get_boolean");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016143,
        "dEQP-GLES31.functional.state_query.multisample_interp",
        "olation.fragment_interpolation_offset_bits.get_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016144,
        "dEQP-GLES31.functional.state_query.multisample_inter",
        "polation.fragment_interpolation_offset_bits.get_float");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016145,
        "dEQP-GLES31.functional.state_query.multisample_interpo",
        "lation.fragment_interpolation_offset_bits.get_integer64");
