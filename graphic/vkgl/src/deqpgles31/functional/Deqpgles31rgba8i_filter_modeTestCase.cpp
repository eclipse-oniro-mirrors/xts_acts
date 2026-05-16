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
#include "../ActsDeqpgles310014TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013113,
        "dEQP-GLES31.functional.texture.gather.basic.2d.rgba8",
        "i.filter_mode.min_nearest_mipmap_nearest_mag_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013182,
        "dEQP-GLES31.functional.texture.gather.basic.2d_array.rg",
        "ba8i.filter_mode.min_nearest_mipmap_nearest_mag_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013269,
        "dEQP-GLES31.functional.texture.gather.basic.cube.rgba",
        "8i.filter_mode.min_nearest_mipmap_nearest_mag_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013391,
        "dEQP-GLES31.functional.texture.gather.offset.implementation_off",
        "set.2d.rgba8i.filter_mode.min_nearest_mipmap_nearest_mag_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013460,
        "dEQP-GLES31.functional.texture.gather.offset.implementation_offset",
        ".2d_array.rgba8i.filter_mode.min_nearest_mipmap_nearest_mag_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013589,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implementation",
        "_offset.2d.rgba8i.filter_mode.min_nearest_mipmap_nearest_mag_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013658,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implementation_of",
        "fset.2d_array.rgba8i.filter_mode.min_nearest_mipmap_nearest_mag_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013787,
        "dEQP-GLES31.functional.texture.gather.offsets.implementation_off",
        "set.2d.rgba8i.filter_mode.min_nearest_mipmap_nearest_mag_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013856,
        "dEQP-GLES31.functional.texture.gather.offsets.implementation_offset",
        ".2d_array.rgba8i.filter_mode.min_nearest_mipmap_nearest_mag_nearest");
