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
#include "../ActsDeqpgles30020TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019495,
        "dEQP-GLES3.functional.shaders.builtin_functi",
        "ons.precision.outerproduct.lowp_fragment.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019496,
        "dEQP-GLES3.functional.shaders.builtin_functio",
        "ns.precision.outerproduct.lowp_fragment.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019497,
        "dEQP-GLES3.functional.shaders.builtin_functio",
        "ns.precision.outerproduct.lowp_fragment.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019498,
        "dEQP-GLES3.functional.shaders.builtin_functio",
        "ns.precision.outerproduct.lowp_fragment.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019499,
        "dEQP-GLES3.functional.shaders.builtin_functi",
        "ons.precision.outerproduct.lowp_fragment.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019500,
        "dEQP-GLES3.functional.shaders.builtin_functio",
        "ns.precision.outerproduct.lowp_fragment.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019501,
        "dEQP-GLES3.functional.shaders.builtin_functio",
        "ns.precision.outerproduct.lowp_fragment.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019502,
        "dEQP-GLES3.functional.shaders.builtin_functio",
        "ns.precision.outerproduct.lowp_fragment.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019503,
        "dEQP-GLES3.functional.shaders.builtin_functi",
        "ons.precision.outerproduct.lowp_fragment.mat4");
