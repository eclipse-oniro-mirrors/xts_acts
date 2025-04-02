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
#include "../ActsDeqpgles310017TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016531,
        "dEQP-GLES31.functional.vertex_attribute_bin",
        "ding.negative.default_vao_bind_vertex_buffer");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016532,
        "dEQP-GLES31.functional.vertex_attribute_bind",
        "ing.negative.default_vao_vertex_attrib_format");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016533,
        "dEQP-GLES31.functional.vertex_attribute_bindi",
        "ng.negative.default_vao_vertex_attrib_i_format");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016534,
        "dEQP-GLES31.functional.vertex_attribute_bindi",
        "ng.negative.default_vao_vertex_attrib_binding");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016535,
        "dEQP-GLES31.functional.vertex_attribute_bindi",
        "ng.negative.default_vao_vertex_binding_divisor");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016536,
        "dEQP-GLES31.functional.vertex_attribute",
        "_binding.negative.bind_create_new_buffer");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016537,
        "dEQP-GLES31.functional.vertex_attribute_bindi",
        "ng.negative.vertex_attrib_format_large_offset");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016538,
        "dEQP-GLES31.functional.vertex_attribute_bind",
        "ing.negative.bind_vertex_buffer_large_stride");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016539,
        "dEQP-GLES31.functional.vertex_attribute_bindi",
        "ng.negative.bind_vertex_buffer_negative_stride");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016540,
        "dEQP-GLES31.functional.vertex_attribute_bindi",
        "ng.negative.bind_vertex_buffer_negative_offset");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016541,
        "dEQP-GLES31.functional.vertex_attribute_bindi",
        "ng.negative.vertex_attrib_binding_invalid_attr");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016542,
        "dEQP-GLES31.functional.vertex_attribute_binding",
        ".negative.vertex_attrib_binding_invalid_binding");
