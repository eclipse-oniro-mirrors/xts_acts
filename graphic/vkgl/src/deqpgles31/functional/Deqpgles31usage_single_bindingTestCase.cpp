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

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016512,
        "dEQP-GLES31.functional.vertex_attribute",
        "_binding.usage.single_binding.elements_1");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016513,
        "dEQP-GLES31.functional.vertex_attribute",
        "_binding.usage.single_binding.elements_2");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016514,
        "dEQP-GLES31.functional.vertex_attribute_binding",
        ".usage.single_binding.elements_2_share_elements");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016515,
        "dEQP-GLES31.functional.vertex_attribute_bin",
        "ding.usage.single_binding.offset_elements_1");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016516,
        "dEQP-GLES31.functional.vertex_attribute_bin",
        "ding.usage.single_binding.offset_elements_2");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016517,
        "dEQP-GLES31.functional.vertex_attribute_binding.us",
        "age.single_binding.offset_elements_2_share_elements");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016518,
        "dEQP-GLES31.functional.vertex_attribute_binding.usage.si",
        "ngle_binding.unaligned_offset_elements_1_aligned_elements");
