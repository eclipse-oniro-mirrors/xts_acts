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
#include "../ActsDeqpgles310024TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023292,
        "dEQP-GLES31.functional.program_interface_query.transform",
        "_feedback_varying.type.separable_vertex.whole_array.float");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023293,
        "dEQP-GLES31.functional.program_interface_query.transfor",
        "m_feedback_varying.type.separable_vertex.whole_array.int");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023294,
        "dEQP-GLES31.functional.program_interface_query.transform",
        "_feedback_varying.type.separable_vertex.whole_array.uint");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023295,
        "dEQP-GLES31.functional.program_interface_query.transform",
        "_feedback_varying.type.separable_vertex.whole_array.vec2");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023296,
        "dEQP-GLES31.functional.program_interface_query.transform",
        "_feedback_varying.type.separable_vertex.whole_array.vec3");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023297,
        "dEQP-GLES31.functional.program_interface_query.transform",
        "_feedback_varying.type.separable_vertex.whole_array.vec4");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023298,
        "dEQP-GLES31.functional.program_interface_query.transform",
        "_feedback_varying.type.separable_vertex.whole_array.ivec2");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023299,
        "dEQP-GLES31.functional.program_interface_query.transform",
        "_feedback_varying.type.separable_vertex.whole_array.ivec3");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023300,
        "dEQP-GLES31.functional.program_interface_query.transform",
        "_feedback_varying.type.separable_vertex.whole_array.ivec4");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023301,
        "dEQP-GLES31.functional.program_interface_query.transform",
        "_feedback_varying.type.separable_vertex.whole_array.uvec2");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023302,
        "dEQP-GLES31.functional.program_interface_query.transform",
        "_feedback_varying.type.separable_vertex.whole_array.uvec3");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023303,
        "dEQP-GLES31.functional.program_interface_query.transform",
        "_feedback_varying.type.separable_vertex.whole_array.uvec4");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023304,
        "dEQP-GLES31.functional.program_interface_query.transform",
        "_feedback_varying.type.separable_vertex.whole_array.mat2");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023305,
        "dEQP-GLES31.functional.program_interface_query.transform_",
        "feedback_varying.type.separable_vertex.whole_array.mat2x3");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023306,
        "dEQP-GLES31.functional.program_interface_query.transform_",
        "feedback_varying.type.separable_vertex.whole_array.mat2x4");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023307,
        "dEQP-GLES31.functional.program_interface_query.transform_",
        "feedback_varying.type.separable_vertex.whole_array.mat3x2");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023308,
        "dEQP-GLES31.functional.program_interface_query.transform",
        "_feedback_varying.type.separable_vertex.whole_array.mat3");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023309,
        "dEQP-GLES31.functional.program_interface_query.transform_",
        "feedback_varying.type.separable_vertex.whole_array.mat3x4");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023310,
        "dEQP-GLES31.functional.program_interface_query.transform_",
        "feedback_varying.type.separable_vertex.whole_array.mat4x2");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023311,
        "dEQP-GLES31.functional.program_interface_query.transform_",
        "feedback_varying.type.separable_vertex.whole_array.mat4x3");

static SHRINK_HWTEST_F(ActsDeqpgles310024TestSuite, TestCase_023312,
        "dEQP-GLES31.functional.program_interface_query.transform",
        "_feedback_varying.type.separable_vertex.whole_array.mat4");
