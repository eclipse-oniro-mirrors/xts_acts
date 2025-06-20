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
#include "../Deqpgles2BaseFunc.h"
#include "../ActsDeqpgles20001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000133,
        "dEQP-GLES2.functional.shaders.prepr",
        "ocessor.basic.correct_phases_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000134,
        "dEQP-GLES2.functional.shaders.prepro",
        "cessor.basic.correct_phases_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000135,
        "dEQP-GLES2.functional.shaders.preproc",
        "essor.basic.invalid_identifier_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000136,
        "dEQP-GLES2.functional.shaders.preproce",
        "ssor.basic.invalid_identifier_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000137,
        "dEQP-GLES2.functional.shaders.prepr",
        "ocessor.basic.null_directive_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000138,
        "dEQP-GLES2.functional.shaders.prepro",
        "cessor.basic.null_directive_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000139,
        "dEQP-GLES2.functional.shaders.prepro",
        "cessor.basic.invalid_directive_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000140,
        "dEQP-GLES2.functional.shaders.preproc",
        "essor.basic.invalid_directive_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000141,
        "dEQP-GLES2.functional.shaders.preproc",
        "essor.basic.missing_identifier_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000142,
        "dEQP-GLES2.functional.shaders.preproce",
        "ssor.basic.missing_identifier_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000143,
        "dEQP-GLES2.functional.shaders.prep",
        "rocessor.basic.empty_object_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000144,
        "dEQP-GLES2.functional.shaders.prepr",
        "ocessor.basic.empty_object_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000145,
        "dEQP-GLES2.functional.shaders.prepr",
        "ocessor.basic.empty_function_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000146,
        "dEQP-GLES2.functional.shaders.prepro",
        "cessor.basic.empty_function_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000147,
        "dEQP-GLES2.functional.shaders.prepr",
        "ocessor.basic.empty_directive_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000148,
        "dEQP-GLES2.functional.shaders.prepro",
        "cessor.basic.empty_directive_fragment");
