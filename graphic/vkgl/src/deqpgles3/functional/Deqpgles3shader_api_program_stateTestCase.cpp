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
#include "../ActsDeqpgles30042TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041892,
        "dEQP-GLES3.functional.shader_api.",
        "program_state.detach_shader_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041893,
        "dEQP-GLES3.functional.shader_api.p",
        "rogram_state.detach_shader_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041894,
        "dEQP-GLES3.functional.shader_api.p",
        "rogram_state.reattach_shader_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041895,
        "dEQP-GLES3.functional.shader_api.pr",
        "ogram_state.reattach_shader_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041896,
        "dEQP-GLES3.functional.shader_api.",
        "program_state.delete_shader_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041897,
        "dEQP-GLES3.functional.shader_api.p",
        "rogram_state.delete_shader_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041898,
        "dEQP-GLES3.functional.shader_api.p",
        "rogram_state.replace_shader_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041899,
        "dEQP-GLES3.functional.shader_api.pr",
        "ogram_state.replace_shader_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041900,
        "dEQP-GLES3.functional.shader_api.pr",
        "ogram_state.recompile_shader_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041901,
        "dEQP-GLES3.functional.shader_api.pro",
        "gram_state.recompile_shader_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041902,
        "dEQP-GLES3.functional.shader_api.p",
        "rogram_state.replace_source_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041903,
        "dEQP-GLES3.functional.shader_api.pr",
        "ogram_state.replace_source_fragment");
