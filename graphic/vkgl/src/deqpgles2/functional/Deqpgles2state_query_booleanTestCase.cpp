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
#include "../ActsDeqpgles20016TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015305,
        "dEQP-GLES2.functional.state_qu",
        "ery.boolean.cull_face_isenabled");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015306,
        "dEQP-GLES2.functional.state_que",
        "ry.boolean.cull_face_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015307,
        "dEQP-GLES2.functional.state_que",
        "ry.boolean.cull_face_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015308,
        "dEQP-GLES2.functional.state_qu",
        "ery.boolean.cull_face_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015309,
        "dEQP-GLES2.functional.state_query.b",
        "oolean.polygon_offset_fill_isenabled");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015310,
        "dEQP-GLES2.functional.state_query.bo",
        "olean.polygon_offset_fill_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015311,
        "dEQP-GLES2.functional.state_query.bo",
        "olean.polygon_offset_fill_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015312,
        "dEQP-GLES2.functional.state_query.b",
        "oolean.polygon_offset_fill_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015313,
        "dEQP-GLES2.functional.state_query.bool",
        "ean.sample_alpha_to_coverage_isenabled");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015314,
        "dEQP-GLES2.functional.state_query.bool",
        "ean.sample_alpha_to_coverage_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015315,
        "dEQP-GLES2.functional.state_query.bool",
        "ean.sample_alpha_to_coverage_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015316,
        "dEQP-GLES2.functional.state_query.boo",
        "lean.sample_alpha_to_coverage_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015317,
        "dEQP-GLES2.functional.state_query",
        ".boolean.sample_coverage_isenabled");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015318,
        "dEQP-GLES2.functional.state_query.",
        "boolean.sample_coverage_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015319,
        "dEQP-GLES2.functional.state_query.",
        "boolean.sample_coverage_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015320,
        "dEQP-GLES2.functional.state_query",
        ".boolean.sample_coverage_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015321,
        "dEQP-GLES2.functional.state_quer",
        "y.boolean.scissor_test_isenabled");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015322,
        "dEQP-GLES2.functional.state_quer",
        "y.boolean.scissor_test_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015323,
        "dEQP-GLES2.functional.state_quer",
        "y.boolean.scissor_test_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015324,
        "dEQP-GLES2.functional.state_que",
        "ry.boolean.scissor_test_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015325,
        "dEQP-GLES2.functional.state_quer",
        "y.boolean.stencil_test_isenabled");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015326,
        "dEQP-GLES2.functional.state_quer",
        "y.boolean.stencil_test_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015327,
        "dEQP-GLES2.functional.state_quer",
        "y.boolean.stencil_test_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015328,
        "dEQP-GLES2.functional.state_que",
        "ry.boolean.stencil_test_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015329,
        "dEQP-GLES2.functional.state_que",
        "ry.boolean.depth_test_isenabled");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015330,
        "dEQP-GLES2.functional.state_que",
        "ry.boolean.depth_test_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015331,
        "dEQP-GLES2.functional.state_que",
        "ry.boolean.depth_test_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015332,
        "dEQP-GLES2.functional.state_qu",
        "ery.boolean.depth_test_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015333,
        "dEQP-GLES2.functional.state_",
        "query.boolean.blend_isenabled");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015334,
        "dEQP-GLES2.functional.state_q",
        "uery.boolean.blend_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015335,
        "dEQP-GLES2.functional.state_q",
        "uery.boolean.blend_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015336,
        "dEQP-GLES2.functional.state_",
        "query.boolean.blend_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015337,
        "dEQP-GLES2.functional.state_q",
        "uery.boolean.dither_isenabled");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015338,
        "dEQP-GLES2.functional.state_q",
        "uery.boolean.dither_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015339,
        "dEQP-GLES2.functional.state_q",
        "uery.boolean.dither_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015340,
        "dEQP-GLES2.functional.state_",
        "query.boolean.dither_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015341,
        "dEQP-GLES2.functional.state_query.boo",
        "lean.sample_coverage_invert_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015342,
        "dEQP-GLES2.functional.state_query.boo",
        "lean.sample_coverage_invert_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015343,
        "dEQP-GLES2.functional.state_query.bo",
        "olean.sample_coverage_invert_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015344,
        "dEQP-GLES2.functional.state_query.",
        "boolean.color_writemask_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015345,
        "dEQP-GLES2.functional.state_query.",
        "boolean.color_writemask_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015346,
        "dEQP-GLES2.functional.state_query",
        ".boolean.color_writemask_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015347,
        "dEQP-GLES2.functional.state_query.",
        "boolean.depth_writemask_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015348,
        "dEQP-GLES2.functional.state_query.",
        "boolean.depth_writemask_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015349,
        "dEQP-GLES2.functional.state_query",
        ".boolean.depth_writemask_getfloat");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015350,
        "dEQP-GLES2.functional.state_query.",
        "boolean.shader_compiler_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015351,
        "dEQP-GLES2.functional.state_query.",
        "boolean.shader_compiler_getinteger");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015352,
        "dEQP-GLES2.functional.state_query",
        ".boolean.shader_compiler_getfloat");
