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

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041906,
        "dEQP-GLES3.functional.shader_api.program_bi",
        "nary.binary_persistence.detach_shader_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041907,
        "dEQP-GLES3.functional.shader_api.program_bin",
        "ary.binary_persistence.detach_shader_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041908,
        "dEQP-GLES3.functional.shader_api.program_bin",
        "ary.binary_persistence.reattach_shader_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041909,
        "dEQP-GLES3.functional.shader_api.program_bina",
        "ry.binary_persistence.reattach_shader_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041910,
        "dEQP-GLES3.functional.shader_api.program_bi",
        "nary.binary_persistence.delete_shader_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041911,
        "dEQP-GLES3.functional.shader_api.program_bin",
        "ary.binary_persistence.delete_shader_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041912,
        "dEQP-GLES3.functional.shader_api.program_bin",
        "ary.binary_persistence.replace_shader_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041913,
        "dEQP-GLES3.functional.shader_api.program_bina",
        "ry.binary_persistence.replace_shader_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041914,
        "dEQP-GLES3.functional.shader_api.program_bina",
        "ry.binary_persistence.recompile_shader_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041915,
        "dEQP-GLES3.functional.shader_api.program_binar",
        "y.binary_persistence.recompile_shader_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041916,
        "dEQP-GLES3.functional.shader_api.program_bin",
        "ary.binary_persistence.replace_source_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles30042TestSuite, TestCase_041917,
        "dEQP-GLES3.functional.shader_api.program_bina",
        "ry.binary_persistence.replace_source_fragment");
