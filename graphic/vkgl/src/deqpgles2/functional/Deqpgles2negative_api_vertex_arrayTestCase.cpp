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
#include "../ActsDeqpgles20014TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013863,
        "dEQP-GLES2.functional.negative",
        "_api.vertex_array.vertex_attrib");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013864,
        "dEQP-GLES2.functional.negative_",
        "api.vertex_array.vertex_attribv");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013865,
        "dEQP-GLES2.functional.negative_api",
        ".vertex_array.vertex_attrib_pointer");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013866,
        "dEQP-GLES2.functional.negative_api.ve",
        "rtex_array.enable_vertex_attrib_array");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013867,
        "dEQP-GLES2.functional.negative_api.ve",
        "rtex_array.disable_vertex_attrib_array");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013868,
        "dEQP-GLES2.functional.negativ",
        "e_api.vertex_array.draw_arrays");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013869,
        "dEQP-GLES2.functional.negative_api.ve",
        "rtex_array.draw_arrays_invalid_program");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013870,
        "dEQP-GLES2.functional.negative_api.verte",
        "x_array.draw_arrays_incomplete_primitive");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013871,
        "dEQP-GLES2.functional.negative",
        "_api.vertex_array.draw_elements");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013872,
        "dEQP-GLES2.functional.negative_api.ver",
        "tex_array.draw_elements_invalid_program");

static SHRINK_HWTEST_F(ActsDeqpgles20014TestSuite, TestCase_013873,
        "dEQP-GLES2.functional.negative_api.vertex",
        "_array.draw_elements_incomplete_primitive");
