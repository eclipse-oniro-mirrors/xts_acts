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

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002151,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.uniform.findLSBMinusOne.lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002152,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.uniform.findLSBMinusOne.lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002153,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.uniform.findLSBMinusOne.lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002154,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.uniform.findLSBMinusOne.lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002155,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.uniform.findLSBMinusOne.lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002156,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.uniform.findLSBMinusOne.lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002157,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.uniform.findLSBMinusOne.mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002158,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.uniform.findLSBMinusOne.mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002159,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.uniform.findLSBMinusOne.mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002160,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.uniform.findLSBMinusOne.mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002161,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.uniform.findLSBMinusOne.mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002162,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.uniform.findLSBMinusOne.mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002163,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.uniform.findLSBMinusOne.highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002164,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.uniform.findLSBMinusOne.highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002165,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.uniform.findLSBMinusOne.highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002166,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.uniform.findLSBMinusOne.highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002167,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.uniform.findLSBMinusOne.highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002168,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.uniform.findLSBMinusOne.highp_compute");
