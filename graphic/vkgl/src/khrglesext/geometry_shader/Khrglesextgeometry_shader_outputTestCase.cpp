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

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000080,
        "KHR-GLESEXT.geometry_shader.out",
        "put.conflicted_output_primitive");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000081,
        "KHR-GLESEXT.geometry_shader.outp",
        "ut.conflicted_output_vertices_max");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000082,
        "KHR-GLESEXT.geometry_shade",
        "r.output.vertex_emit_at_end");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000083,
        "KHR-GLESEXT.geometry_shader.ou",
        "tput.primitive_end_done_at_end");

static SHRINK_HWTEST_F(ActsKhrglesext0001TestSuite, TestCase_000084,
        "KHR-GLESEXT.geometry_shader.output.p",
        "rimite_end_done_for_single_primitive");
