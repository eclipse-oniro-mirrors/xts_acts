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
#include "../Khrgles31BaseFunc.h"
#include "../ActsKhrgles310002TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001813,
        "KHR-GLES31.core.vertex_a",
        "ttrib_binding.basic-usage");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001814,
        "KHR-GLES31.core.vertex_attr",
        "ib_binding.basic-input-case1");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001815,
        "KHR-GLES31.core.vertex_attr",
        "ib_binding.basic-input-case2");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001816,
        "KHR-GLES31.core.vertex_attr",
        "ib_binding.basic-input-case3");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001817,
        "KHR-GLES31.core.vertex_attr",
        "ib_binding.basic-input-case4");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001818,
        "KHR-GLES31.core.vertex_attr",
        "ib_binding.basic-input-case5");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001819,
        "KHR-GLES31.core.vertex_attr",
        "ib_binding.basic-input-case6");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001820,
        "KHR-GLES31.core.vertex_attr",
        "ib_binding.basic-input-case8");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001821,
        "KHR-GLES31.core.vertex_attr",
        "ib_binding.basic-input-case9");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001822,
        "KHR-GLES31.core.vertex_attri",
        "b_binding.basic-input-case11");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001823,
        "KHR-GLES31.core.vertex_attri",
        "b_binding.basic-input-case12");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001824,
        "KHR-GLES31.core.vertex_attri",
        "b_binding.basic-inputI-case1");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001825,
        "KHR-GLES31.core.vertex_attri",
        "b_binding.basic-inputI-case2");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001826,
        "KHR-GLES31.core.vertex_attri",
        "b_binding.basic-inputI-case3");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001827,
        "KHR-GLES31.core.vertex_at",
        "trib_binding.basic-state1");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001828,
        "KHR-GLES31.core.vertex_at",
        "trib_binding.basic-state2");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001829,
        "KHR-GLES31.core.vertex_attrib_",
        "binding.advanced-bindingUpdate");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001830,
        "KHR-GLES31.core.vertex_attri",
        "b_binding.advanced-iterations");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001831,
        "KHR-GLES31.core.vertex_attrib_binding.adv",
        "anced-largeStrideAndOffsetsNewAndLegacyAPI");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001832,
        "KHR-GLES31.core.vertex_attrib_b",
        "inding.negative-bindVertexBuffer");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001833,
        "KHR-GLES31.core.vertex_attrib_bi",
        "nding.negative-vertexAttribFormat");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001834,
        "KHR-GLES31.core.vertex_attrib_bin",
        "ding.negative-vertexAttribBinding");

static SHRINK_HWTEST_F(ActsKhrgles310002TestSuite, TestCase_001835,
        "KHR-GLES31.core.vertex_attrib_bin",
        "ding.negative-vertexAttribDivisor");
