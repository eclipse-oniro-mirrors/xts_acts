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
#include "../Deqpgles2BaseFunc.h"
#include "../ActsDeqpgles20008TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007866,
        "dEQP-GLES2.functional.shader",
        "s.algorithm.hsl_to_rgb_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007867,
        "dEQP-GLES2.functional.shaders",
        ".algorithm.hsl_to_rgb_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007868,
        "dEQP-GLES2.functional.shader",
        "s.algorithm.rgb_to_hsl_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007869,
        "dEQP-GLES2.functional.shaders",
        ".algorithm.rgb_to_hsl_fragment");