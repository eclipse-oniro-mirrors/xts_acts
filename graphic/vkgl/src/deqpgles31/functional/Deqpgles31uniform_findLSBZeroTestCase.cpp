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

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002133,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.uniform.findLSBZero.lowp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002134,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.uniform.findLSBZero.lowp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002135,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.uniform.findLSBZero.lowp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002136,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.uniform.findLSBZero.lowp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002137,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.uniform.findLSBZero.lowp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002138,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.uniform.findLSBZero.lowp_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002139,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.uniform.findLSBZero.mediump_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002140,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.uniform.findLSBZero.mediump_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002141,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.uniform.findLSBZero.mediump_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002142,
        "dEQP-GLES31.functional.shaders.builtin_funct",
        "ions.uniform.findLSBZero.mediump_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002143,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.uniform.findLSBZero.mediump_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002144,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.uniform.findLSBZero.mediump_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002145,
        "dEQP-GLES31.functional.shaders.builtin_f",
        "unctions.uniform.findLSBZero.highp_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002146,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.uniform.findLSBZero.highp_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002147,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.uniform.findLSBZero.highp_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002148,
        "dEQP-GLES31.functional.shaders.builtin_func",
        "tions.uniform.findLSBZero.highp_tess_control");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002149,
        "dEQP-GLES31.functional.shaders.builtin_fun",
        "ctions.uniform.findLSBZero.highp_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002150,
        "dEQP-GLES31.functional.shaders.builtin_fu",
        "nctions.uniform.findLSBZero.highp_compute");
