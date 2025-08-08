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
#include "../ActsDeqpgles310011TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010387,
        "dEQP-GLES31.functional.ssb",
        "o.array_length.sized_array");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010388,
        "dEQP-GLES31.functional.ssbo.arr",
        "ay_length.sized_writeonly_array");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010389,
        "dEQP-GLES31.functional.ssbo.ar",
        "ray_length.sized_readonly_array");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010390,
        "dEQP-GLES31.functional.ssbo",
        ".array_length.unsized_array");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010391,
        "dEQP-GLES31.functional.ssbo.arra",
        "y_length.unsized_writeonly_array");

static SHRINK_HWTEST_F(ActsDeqpgles310011TestSuite, TestCase_010392,
        "dEQP-GLES31.functional.ssbo.arr",
        "ay_length.unsized_readonly_array");
