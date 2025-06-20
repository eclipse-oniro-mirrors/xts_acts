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
#include "../ActsDeqpgles310025TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024965,
        "dEQP-GLES31.functional.primitive_bo",
        "unding_box.state_query.initial_value");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024966,
        "dEQP-GLES31.functional.primitive_",
        "bounding_box.state_query.getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024967,
        "dEQP-GLES31.functional.primitive_b",
        "ounding_box.state_query.getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024968,
        "dEQP-GLES31.functional.primitive_b",
        "ounding_box.state_query.getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024969,
        "dEQP-GLES31.functional.primitive_bo",
        "unding_box.state_query.getinteger64");
