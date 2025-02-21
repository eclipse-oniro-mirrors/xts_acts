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
#include "../ActsDeqpgles310006TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005651,
        "dEQP-GLES31.functional.shaders.implicit_con",
        "versions.es31.functions.int_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005652,
        "dEQP-GLES31.functional.shaders.implicit_conv",
        "ersions.es31.functions.int_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005653,
        "dEQP-GLES31.functional.shaders.implicit_co",
        "nversions.es31.functions.int_to_uint_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005654,
        "dEQP-GLES31.functional.shaders.implicit_con",
        "versions.es31.functions.int_to_uint_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005655,
        "dEQP-GLES31.functional.shaders.implicit_con",
        "versions.es31.functions.uint_to_float_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005656,
        "dEQP-GLES31.functional.shaders.implicit_conv",
        "ersions.es31.functions.uint_to_float_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005657,
        "dEQP-GLES31.functional.shaders.implicit_conv",
        "ersions.es31.functions.ivec2_to_uvec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005658,
        "dEQP-GLES31.functional.shaders.implicit_conve",
        "rsions.es31.functions.ivec2_to_uvec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005659,
        "dEQP-GLES31.functional.shaders.implicit_con",
        "versions.es31.functions.ivec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005660,
        "dEQP-GLES31.functional.shaders.implicit_conv",
        "ersions.es31.functions.ivec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005661,
        "dEQP-GLES31.functional.shaders.implicit_con",
        "versions.es31.functions.uvec2_to_vec2_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005662,
        "dEQP-GLES31.functional.shaders.implicit_conv",
        "ersions.es31.functions.uvec2_to_vec2_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005663,
        "dEQP-GLES31.functional.shaders.implicit_conv",
        "ersions.es31.functions.ivec3_to_uvec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005664,
        "dEQP-GLES31.functional.shaders.implicit_conve",
        "rsions.es31.functions.ivec3_to_uvec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005665,
        "dEQP-GLES31.functional.shaders.implicit_con",
        "versions.es31.functions.ivec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005666,
        "dEQP-GLES31.functional.shaders.implicit_conv",
        "ersions.es31.functions.ivec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005667,
        "dEQP-GLES31.functional.shaders.implicit_con",
        "versions.es31.functions.uvec3_to_vec3_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005668,
        "dEQP-GLES31.functional.shaders.implicit_conv",
        "ersions.es31.functions.uvec3_to_vec3_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005669,
        "dEQP-GLES31.functional.shaders.implicit_conv",
        "ersions.es31.functions.ivec4_to_uvec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005670,
        "dEQP-GLES31.functional.shaders.implicit_conve",
        "rsions.es31.functions.ivec4_to_uvec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005671,
        "dEQP-GLES31.functional.shaders.implicit_con",
        "versions.es31.functions.ivec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005672,
        "dEQP-GLES31.functional.shaders.implicit_conv",
        "ersions.es31.functions.ivec4_to_vec4_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005673,
        "dEQP-GLES31.functional.shaders.implicit_con",
        "versions.es31.functions.uvec4_to_vec4_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310006TestSuite, TestCase_005674,
        "dEQP-GLES31.functional.shaders.implicit_conv",
        "ersions.es31.functions.uvec4_to_vec4_fragment");
