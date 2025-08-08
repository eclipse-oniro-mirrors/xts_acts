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
#include "../ActsDeqpgles310005TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004102,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.e",
        "s31.array_access.constant_expression_access_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004103,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es",
        "31.array_access.constant_expression_access_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004104,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.e",
        "s31.array_access.dynamic_expression_access_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004105,
        "dEQP-GLES31.functional.shaders.arrays_of_arrays.es",
        "31.array_access.dynamic_expression_access_fragment");
