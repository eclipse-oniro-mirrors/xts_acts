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

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019549,
        "dEQP-GLES3.functional.shaders.builtin_funct",
        "ions.precision.transpose.lowp_fragment.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019550,
        "dEQP-GLES3.functional.shaders.builtin_functi",
        "ons.precision.transpose.lowp_fragment.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019551,
        "dEQP-GLES3.functional.shaders.builtin_functi",
        "ons.precision.transpose.lowp_fragment.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019552,
        "dEQP-GLES3.functional.shaders.builtin_functi",
        "ons.precision.transpose.lowp_fragment.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019553,
        "dEQP-GLES3.functional.shaders.builtin_funct",
        "ions.precision.transpose.lowp_fragment.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019554,
        "dEQP-GLES3.functional.shaders.builtin_functi",
        "ons.precision.transpose.lowp_fragment.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019555,
        "dEQP-GLES3.functional.shaders.builtin_functi",
        "ons.precision.transpose.lowp_fragment.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019556,
        "dEQP-GLES3.functional.shaders.builtin_functi",
        "ons.precision.transpose.lowp_fragment.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles30020TestSuite, TestCase_019557,
        "dEQP-GLES3.functional.shaders.builtin_funct",
        "ions.precision.transpose.lowp_fragment.mat4");