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

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016110,
        "dEQP-GLES31.functional.state_query.vertex_attri",
        "bute_binding.vertex_attrib.vertex_attrib_binding");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016111,
        "dEQP-GLES31.functional.state_query.vertex_attribute",
        "_binding.vertex_attrib.vertex_attrib_relative_offset");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016112,
        "dEQP-GLES31.functional.state_query.vertex_attribute_bind",
        "ing.vertex_attrib.vertex_attrib_binding_getvertexattribfv");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016113,
        "dEQP-GLES31.functional.state_query.vertex_attribute_binding.",
        "vertex_attrib.vertex_attrib_relative_offset_getvertexattribfv");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016114,
        "dEQP-GLES31.functional.state_query.vertex_attribute_bindi",
        "ng.vertex_attrib.vertex_attrib_binding_getvertexattribiiv");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016115,
        "dEQP-GLES31.functional.state_query.vertex_attribute_binding.v",
        "ertex_attrib.vertex_attrib_relative_offset_getvertexattribiiv");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016116,
        "dEQP-GLES31.functional.state_query.vertex_attribute_bindi",
        "ng.vertex_attrib.vertex_attrib_binding_getvertexattribiuiv");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016117,
        "dEQP-GLES31.functional.state_query.vertex_attribute_binding.v",
        "ertex_attrib.vertex_attrib_relative_offset_getvertexattribiuiv");
