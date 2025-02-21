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
#include "../ActsDeqpgles310003TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002353,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.precision.tanh.highp_compute.scalar");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002354,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.precision.tanh.highp_compute.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002355,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.precision.tanh.highp_compute.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002356,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.precision.tanh.highp_compute.vec4");
