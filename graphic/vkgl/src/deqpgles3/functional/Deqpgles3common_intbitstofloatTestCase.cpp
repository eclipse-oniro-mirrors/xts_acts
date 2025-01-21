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
#include "../ActsDeqpgles30019TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018327,
        "dEQP-GLES3.functional.shaders.builtin_funct",
        "ions.common.intbitstofloat.int_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018328,
        "dEQP-GLES3.functional.shaders.builtin_functi",
        "ons.common.intbitstofloat.int_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018329,
        "dEQP-GLES3.functional.shaders.builtin_functi",
        "ons.common.intbitstofloat.ivec2_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018330,
        "dEQP-GLES3.functional.shaders.builtin_functio",
        "ns.common.intbitstofloat.ivec2_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018331,
        "dEQP-GLES3.functional.shaders.builtin_functi",
        "ons.common.intbitstofloat.ivec3_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018332,
        "dEQP-GLES3.functional.shaders.builtin_functio",
        "ns.common.intbitstofloat.ivec3_highp_fragment");
