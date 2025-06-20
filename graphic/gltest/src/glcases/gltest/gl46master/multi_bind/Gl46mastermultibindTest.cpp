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
#include "../Gl46masterBaseFunc.h"
#include "../ActsGl46master0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007787,
    "KHR-GL46.multi_bind.dispatch_bind_textures");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007788,
    "KHR-GL46.multi_bind.errors_bind_buffers");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007789,
    "KHR-GL46.multi_bind.errors_bind_textures");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007790,
    "KHR-GL46.multi_bind.errors_bind_samplers");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007791,
    "KHR-GL46.multi_bind.errors_bind_image_textures");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007792,
    "KHR-GL46.multi_bind.errors_bind_vertex_buffers");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007793,
    "KHR-GL46.multi_bind.functional_bind_buffers_base");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007794,
    "KHR-GL46.multi_bind.functional_bind_buffers_range");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007795,
    "KHR-GL46.multi_bind.functional_bind_textures");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007796,
    "KHR-GL46.multi_bind.functional_bind_samplers");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007797,
    "KHR-GL46.multi_bind.functional_bind_image_textures");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007798,
    "KHR-GL46.multi_bind.functional_bind_vertex_buffers");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007799,
    "KHR-GL46.multi_bind.dispatch_bind_buffers_base");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007800,
    "KHR-GL46.multi_bind.dispatch_bind_buffers_range");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007801,
    "KHR-GL46.multi_bind.dispatch_bind_image_textures");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007802,
    "KHR-GL46.multi_bind.dispatch_bind_samplers");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007803,
    "KHR-GL46.multi_bind.draw_bind_vertex_buffers");
