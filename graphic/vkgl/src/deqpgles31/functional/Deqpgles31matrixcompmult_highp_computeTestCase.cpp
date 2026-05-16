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

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002741,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.precision.matrixcompmult.highp_compute.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002742,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.precision.matrixcompmult.highp_compute.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002743,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.precision.matrixcompmult.highp_compute.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002744,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.precision.matrixcompmult.highp_compute.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002745,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.precision.matrixcompmult.highp_compute.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002746,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.precision.matrixcompmult.highp_compute.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002747,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.precision.matrixcompmult.highp_compute.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002748,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.precision.matrixcompmult.highp_compute.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002749,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.precision.matrixcompmult.highp_compute.mat4");
