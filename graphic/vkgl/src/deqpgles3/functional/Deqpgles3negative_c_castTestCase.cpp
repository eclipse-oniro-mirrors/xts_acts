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
#include "../ActsDeqpgles30006TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005008,
        "dEQP-GLES3.functional.shaders.",
        "negative.c_cast.float_0_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005009,
        "dEQP-GLES3.functional.shaders.n",
        "egative.c_cast.float_0_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005010,
        "dEQP-GLES3.functional.shaders.",
        "negative.c_cast.float_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005011,
        "dEQP-GLES3.functional.shaders.n",
        "egative.c_cast.float_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005012,
        "dEQP-GLES3.functional.shaders.",
        "negative.c_cast.float_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005013,
        "dEQP-GLES3.functional.shaders.n",
        "egative.c_cast.float_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005014,
        "dEQP-GLES3.functional.shader",
        "s.negative.c_cast.int_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005015,
        "dEQP-GLES3.functional.shaders",
        ".negative.c_cast.int_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005016,
        "dEQP-GLES3.functional.shader",
        "s.negative.c_cast.uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005017,
        "dEQP-GLES3.functional.shaders",
        ".negative.c_cast.uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005018,
        "dEQP-GLES3.functional.shader",
        "s.negative.c_cast.bool_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005019,
        "dEQP-GLES3.functional.shaders",
        ".negative.c_cast.bool_fragment");
