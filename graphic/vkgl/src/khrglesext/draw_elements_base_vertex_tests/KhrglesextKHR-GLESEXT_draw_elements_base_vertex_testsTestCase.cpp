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
#include "../KhrglesextBaseFunc.h"
#include "../ActsKhrglesext0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000290,
        "KHR-GLESEXT.draw_elements_base_v",
        "ertex_tests.basevertex_behavior1");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000291,
        "KHR-GLESEXT.draw_elements_base_v",
        "ertex_tests.basevertex_behavior2");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000292,
        "KHR-GLESEXT.draw_elements_base",
        "_vertex_tests.AEP_shader_stages");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000293,
        "KHR-GLESEXT.draw_elements_",
        "base_vertex_tests.underflow");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000294,
        "KHR-GLESEXT.draw_elements_",
        "base_vertex_tests.overflow");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000295,
        "KHR-GLESEXT.draw_elements_bas",
        "e_vertex_tests.valid_active_tf");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000296,
        "KHR-GLESEXT.draw_elements_base_ve",
        "rtex_tests.invalid_count_argument");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000297,
        "KHR-GLESEXT.draw_elements_base_vertex",
        "_tests.invalid_instancecount_argument");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000298,
        "KHR-GLESEXT.draw_elements_base_v",
        "ertex_tests.invalid_mode_argument");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000299,
        "KHR-GLESEXT.draw_elements_base_vert",
        "ex_tests.invalid_primcount_argument");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000300,
        "KHR-GLESEXT.draw_elements_base_vert",
        "ex_tests.invalid_start_end_arguments");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000301,
        "KHR-GLESEXT.draw_elements_base_v",
        "ertex_tests.invalid_type_argument");
