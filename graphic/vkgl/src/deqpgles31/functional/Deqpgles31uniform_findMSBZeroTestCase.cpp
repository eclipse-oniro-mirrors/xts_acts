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

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002097,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.uniform.findMSBZero.lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002098,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.uniform.findMSBZero.lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002099,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.uniform.findMSBZero.lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002100,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.uniform.findMSBZero.lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002101,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.uniform.findMSBZero.lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002102,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.uniform.findMSBZero.lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002103,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.uniform.findMSBZero.mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002104,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.uniform.findMSBZero.mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002105,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.uniform.findMSBZero.mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002106,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.uniform.findMSBZero.mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002107,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.uniform.findMSBZero.mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002108,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.uniform.findMSBZero.mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002109,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.uniform.findMSBZero.highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002110,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.uniform.findMSBZero.highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002111,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.uniform.findMSBZero.highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002112,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.uniform.findMSBZero.highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002113,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.uniform.findMSBZero.highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002114,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.uniform.findMSBZero.highp_compute");
