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

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016118,
        "dEQP-GLES31.functional.state_query.vertex_attribute",
        "_binding.indexed.vertex_binding_divisor_getintegeri");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016119,
        "dEQP-GLES31.functional.state_query.vertex_attribut",
        "e_binding.indexed.vertex_binding_offset_getintegeri");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016120,
        "dEQP-GLES31.functional.state_query.vertex_attribut",
        "e_binding.indexed.vertex_binding_stride_getintegeri");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016121,
        "dEQP-GLES31.functional.state_query.vertex_attribut",
        "e_binding.indexed.vertex_binding_buffer_getintegeri");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016122,
        "dEQP-GLES31.functional.state_query.vertex_attribute_",
        "binding.indexed.vertex_binding_divisor_getintegeri64");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016123,
        "dEQP-GLES31.functional.state_query.vertex_attribute",
        "_binding.indexed.vertex_binding_offset_getintegeri64");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016124,
        "dEQP-GLES31.functional.state_query.vertex_attribute",
        "_binding.indexed.vertex_binding_stride_getintegeri64");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016125,
        "dEQP-GLES31.functional.state_query.vertex_attribute",
        "_binding.indexed.vertex_binding_buffer_getintegeri64");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016126,
        "dEQP-GLES31.functional.state_query.vertex_attribut",
        "e_binding.indexed.vertex_binding_divisor_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016127,
        "dEQP-GLES31.functional.state_query.vertex_attribut",
        "e_binding.indexed.vertex_binding_offset_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016128,
        "dEQP-GLES31.functional.state_query.vertex_attribut",
        "e_binding.indexed.vertex_binding_stride_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016129,
        "dEQP-GLES31.functional.state_query.vertex_attribut",
        "e_binding.indexed.vertex_binding_buffer_getboolean");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016130,
        "dEQP-GLES31.functional.state_query.vertex_attrib",
        "ute_binding.indexed.vertex_binding_divisor_mixed");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016131,
        "dEQP-GLES31.functional.state_query.vertex_attri",
        "bute_binding.indexed.vertex_binding_offset_mixed");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016132,
        "dEQP-GLES31.functional.state_query.vertex_attri",
        "bute_binding.indexed.vertex_binding_stride_mixed");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016133,
        "dEQP-GLES31.functional.state_query.vertex_attri",
        "bute_binding.indexed.vertex_binding_buffer_mixed");
