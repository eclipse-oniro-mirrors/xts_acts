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

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007757,
    "KHR-GL46.buffer_storage.errors");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007758,
    "KHR-GL46.buffer_storage.get_buffer_parameter");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007759,
    "KHR-GL46.buffer_storage.dynamic_storage");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007760,
    "KHR-GL46.buffer_storage.map_persistent_buffer_sub_data");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007761,
    "KHR-GL46.buffer_storage.map_persistent_texture");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007762,
    "KHR-GL46.buffer_storage.map_persistent_read_pixels");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007763,
    "KHR-GL46.buffer_storage.map_persistent_dispatch");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007764,
    "KHR-GL46.buffer_storage.map_persistent_flush");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_007765,
    "KHR-GL46.buffer_storage.map_persistent_draw");
