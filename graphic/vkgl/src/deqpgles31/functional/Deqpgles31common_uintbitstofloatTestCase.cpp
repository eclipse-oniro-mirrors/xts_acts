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
#include "../ActsDeqpgles310001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000961,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.common.uintbitstofloat.uint_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000962,
        "dEQP-GLES31.functional.shaders.builtin_function",
        "s.common.uintbitstofloat.uint_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000963,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.common.uintbitstofloat.uint_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000964,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.common.uintbitstofloat.uint_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000965,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.common.uintbitstofloat.uvec2_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000966,
        "dEQP-GLES31.functional.shaders.builtin_functions",
        ".common.uintbitstofloat.uvec2_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000967,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.common.uintbitstofloat.uvec2_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000968,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.common.uintbitstofloat.uvec2_highp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000969,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.common.uintbitstofloat.uvec3_highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000970,
        "dEQP-GLES31.functional.shaders.builtin_functions",
        ".common.uintbitstofloat.uvec3_highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000971,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.common.uintbitstofloat.uvec3_highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310001TestSuite, TestCase_000972,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.common.uintbitstofloat.uvec3_highp_compute");
