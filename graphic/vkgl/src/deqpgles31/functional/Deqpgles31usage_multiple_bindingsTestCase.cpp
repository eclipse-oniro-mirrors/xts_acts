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

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016519,
        "dEQP-GLES31.functional.vertex_attribut",
        "e_binding.usage.multiple_bindings.basic");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016520,
        "dEQP-GLES31.functional.vertex_attribute_b",
        "inding.usage.multiple_bindings.zero_stride");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016521,
        "dEQP-GLES31.functional.vertex_attribute_",
        "binding.usage.multiple_bindings.instanced");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016522,
        "dEQP-GLES31.functional.vertex_attribute_binding.u",
        "sage.multiple_bindings.aliasing_buffer_zero_stride");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016523,
        "dEQP-GLES31.functional.vertex_attribute_binding.",
        "usage.multiple_bindings.aliasing_buffer_instanced");
