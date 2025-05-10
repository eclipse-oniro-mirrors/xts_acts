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
#include "../ActsDeqpgles30001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000946,
        "dEQP-GLES3.functional.shaders.preproc",
        "essor.predefined_macros.version_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000947,
        "dEQP-GLES3.functional.shaders.preproce",
        "ssor.predefined_macros.version_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000948,
        "dEQP-GLES3.functional.shaders.preproc",
        "essor.predefined_macros.gl_es_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000949,
        "dEQP-GLES3.functional.shaders.preproce",
        "ssor.predefined_macros.gl_es_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000950,
        "dEQP-GLES3.functional.shaders.preproc",
        "essor.predefined_macros.gl_es_2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000951,
        "dEQP-GLES3.functional.shaders.preproce",
        "ssor.predefined_macros.gl_es_2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000952,
        "dEQP-GLES3.functional.shaders.preproc",
        "essor.predefined_macros.line_1_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000953,
        "dEQP-GLES3.functional.shaders.preproce",
        "ssor.predefined_macros.line_1_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000954,
        "dEQP-GLES3.functional.shaders.prepro",
        "cessor.predefined_macros.file_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000955,
        "dEQP-GLES3.functional.shaders.preproc",
        "essor.predefined_macros.file_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000956,
        "dEQP-GLES3.functional.shaders.preproce",
        "ssor.predefined_macros.if_gl_es_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000957,
        "dEQP-GLES3.functional.shaders.preproces",
        "sor.predefined_macros.if_gl_es_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000958,
        "dEQP-GLES3.functional.shaders.preproces",
        "sor.predefined_macros.if_version_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000959,
        "dEQP-GLES3.functional.shaders.preprocess",
        "or.predefined_macros.if_version_fragment");
