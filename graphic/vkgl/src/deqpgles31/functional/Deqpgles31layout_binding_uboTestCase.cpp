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
#include "../ActsDeqpgles310025TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024817,
        "dEQP-GLES31.functional.layout_b",
        "inding.ubo.vertex_binding_single");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024818,
        "dEQP-GLES31.functional.layout_",
        "binding.ubo.vertex_binding_max");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024819,
        "dEQP-GLES31.functional.layout_bi",
        "nding.ubo.vertex_binding_multiple");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024820,
        "dEQP-GLES31.functional.layout_b",
        "inding.ubo.vertex_binding_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024821,
        "dEQP-GLES31.functional.layout_bin",
        "ding.ubo.vertex_binding_max_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024822,
        "dEQP-GLES31.functional.layout_bi",
        "nding.ubo.fragment_binding_single");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024823,
        "dEQP-GLES31.functional.layout_b",
        "inding.ubo.fragment_binding_max");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024824,
        "dEQP-GLES31.functional.layout_bin",
        "ding.ubo.fragment_binding_multiple");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024825,
        "dEQP-GLES31.functional.layout_bi",
        "nding.ubo.fragment_binding_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024826,
        "dEQP-GLES31.functional.layout_bind",
        "ing.ubo.fragment_binding_max_array");
