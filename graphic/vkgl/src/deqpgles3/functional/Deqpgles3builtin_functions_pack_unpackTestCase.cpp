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

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018339,
        "dEQP-GLES3.functional.shaders.builtin_func",
        "tions.pack_unpack.packsnorm2x16_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018340,
        "dEQP-GLES3.functional.shaders.builtin_funct",
        "ions.pack_unpack.packsnorm2x16_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018341,
        "dEQP-GLES3.functional.shaders.builtin_functi",
        "ons.pack_unpack.packsnorm2x16_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018342,
        "dEQP-GLES3.functional.shaders.builtin_functio",
        "ns.pack_unpack.packsnorm2x16_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018343,
        "dEQP-GLES3.functional.shaders.builtin_funct",
        "ions.pack_unpack.packsnorm2x16_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018344,
        "dEQP-GLES3.functional.shaders.builtin_functi",
        "ons.pack_unpack.packsnorm2x16_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018345,
        "dEQP-GLES3.functional.shaders.builtin_fun",
        "ctions.pack_unpack.unpacksnorm2x16_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018346,
        "dEQP-GLES3.functional.shaders.builtin_func",
        "tions.pack_unpack.unpacksnorm2x16_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018347,
        "dEQP-GLES3.functional.shaders.builtin_func",
        "tions.pack_unpack.packunorm2x16_lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018348,
        "dEQP-GLES3.functional.shaders.builtin_funct",
        "ions.pack_unpack.packunorm2x16_lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018349,
        "dEQP-GLES3.functional.shaders.builtin_functi",
        "ons.pack_unpack.packunorm2x16_mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018350,
        "dEQP-GLES3.functional.shaders.builtin_functio",
        "ns.pack_unpack.packunorm2x16_mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018351,
        "dEQP-GLES3.functional.shaders.builtin_funct",
        "ions.pack_unpack.packunorm2x16_highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018352,
        "dEQP-GLES3.functional.shaders.builtin_functi",
        "ons.pack_unpack.packunorm2x16_highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018353,
        "dEQP-GLES3.functional.shaders.builtin_fun",
        "ctions.pack_unpack.unpackunorm2x16_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018354,
        "dEQP-GLES3.functional.shaders.builtin_func",
        "tions.pack_unpack.unpackunorm2x16_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018355,
        "dEQP-GLES3.functional.shaders.builtin_f",
        "unctions.pack_unpack.packhalf2x16_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018356,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.pack_unpack.packhalf2x16_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018357,
        "dEQP-GLES3.functional.shaders.builtin_fu",
        "nctions.pack_unpack.unpackhalf2x16_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30019TestSuite, TestCase_018358,
        "dEQP-GLES3.functional.shaders.builtin_fun",
        "ctions.pack_unpack.unpackhalf2x16_fragment");
