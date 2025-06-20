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

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024827,
        "dEQP-GLES31.functional.layout_bi",
        "nding.ssbo.vertex_binding_single");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024828,
        "dEQP-GLES31.functional.layout_",
        "binding.ssbo.vertex_binding_max");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024829,
        "dEQP-GLES31.functional.layout_bin",
        "ding.ssbo.vertex_binding_multiple");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024830,
        "dEQP-GLES31.functional.layout_b",
        "inding.ssbo.vertex_binding_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024831,
        "dEQP-GLES31.functional.layout_bin",
        "ding.ssbo.vertex_binding_max_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024832,
        "dEQP-GLES31.functional.layout_bin",
        "ding.ssbo.fragment_binding_single");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024833,
        "dEQP-GLES31.functional.layout_b",
        "inding.ssbo.fragment_binding_max");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024834,
        "dEQP-GLES31.functional.layout_bind",
        "ing.ssbo.fragment_binding_multiple");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024835,
        "dEQP-GLES31.functional.layout_bi",
        "nding.ssbo.fragment_binding_array");

static SHRINK_HWTEST_F(ActsDeqpgles310025TestSuite, TestCase_024836,
        "dEQP-GLES31.functional.layout_bind",
        "ing.ssbo.fragment_binding_max_array");
