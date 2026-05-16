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
#include "../Khrgles2BaseFunc.h"
#include "../ActsKhrgles20001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000015,
        "KHR-GLES2.texture_3d.filte",
        "ring.formats.rgba8_nearest");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000016,
        "KHR-GLES2.texture_3d.filt",
        "ering.formats.rgba8_linear");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000017,
        "KHR-GLES2.texture_3d.filtering.fo",
        "rmats.rgba8_nearest_mipmap_nearest");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000018,
        "KHR-GLES2.texture_3d.filtering.fo",
        "rmats.rgba8_linear_mipmap_nearest");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000019,
        "KHR-GLES2.texture_3d.filtering.fo",
        "rmats.rgba8_nearest_mipmap_linear");

static SHRINK_HWTEST_F(ActsKhrgles20001TestSuite, TestCase_000020,
        "KHR-GLES2.texture_3d.filtering.f",
        "ormats.rgba8_linear_mipmap_linear");
