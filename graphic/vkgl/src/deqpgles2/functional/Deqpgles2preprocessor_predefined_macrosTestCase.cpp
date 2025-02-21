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

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000273,
        "dEQP-GLES2.functional.shaders.preproc",
        "essor.predefined_macros.version_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000274,
        "dEQP-GLES2.functional.shaders.preproce",
        "ssor.predefined_macros.version_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000275,
        "dEQP-GLES2.functional.shaders.preproc",
        "essor.predefined_macros.gl_es_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000276,
        "dEQP-GLES2.functional.shaders.preproce",
        "ssor.predefined_macros.gl_es_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000277,
        "dEQP-GLES2.functional.shaders.preproc",
        "essor.predefined_macros.gl_es_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000278,
        "dEQP-GLES2.functional.shaders.preproce",
        "ssor.predefined_macros.gl_es_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000279,
        "dEQP-GLES2.functional.shaders.preproc",
        "essor.predefined_macros.line_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000280,
        "dEQP-GLES2.functional.shaders.preproce",
        "ssor.predefined_macros.line_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000281,
        "dEQP-GLES2.functional.shaders.prepro",
        "cessor.predefined_macros.file_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000282,
        "dEQP-GLES2.functional.shaders.preproc",
        "essor.predefined_macros.file_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000283,
        "dEQP-GLES2.functional.shaders.preproce",
        "ssor.predefined_macros.if_gl_es_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000284,
        "dEQP-GLES2.functional.shaders.preproces",
        "sor.predefined_macros.if_gl_es_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000285,
        "dEQP-GLES2.functional.shaders.preproces",
        "sor.predefined_macros.if_version_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000286,
        "dEQP-GLES2.functional.shaders.preprocess",
        "or.predefined_macros.if_version_fragment");
