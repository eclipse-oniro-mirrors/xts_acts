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

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002115,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.uniform.findMSBMinusOne.lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002116,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.uniform.findMSBMinusOne.lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002117,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.uniform.findMSBMinusOne.lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002118,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.uniform.findMSBMinusOne.lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002119,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.uniform.findMSBMinusOne.lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002120,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.uniform.findMSBMinusOne.lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002121,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.uniform.findMSBMinusOne.mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002122,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.uniform.findMSBMinusOne.mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002123,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.uniform.findMSBMinusOne.mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002124,
        "dEQP-GLES31.functional.shaders.builtin_functio",
        "ns.uniform.findMSBMinusOne.mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002125,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.uniform.findMSBMinusOne.mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002126,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.uniform.findMSBMinusOne.mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002127,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.uniform.findMSBMinusOne.highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002128,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.uniform.findMSBMinusOne.highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002129,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.uniform.findMSBMinusOne.highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002130,
        "dEQP-GLES31.functional.shaders.builtin_functi",
        "ons.uniform.findMSBMinusOne.highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002131,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.uniform.findMSBMinusOne.highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002132,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.uniform.findMSBMinusOne.highp_compute");
