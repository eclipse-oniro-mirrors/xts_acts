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

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013114,
        "dEQP-GLES31.functional.texture.gathe",
        "r.basic.2d.rgba8i.base_level.level_1");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013115,
        "dEQP-GLES31.functional.texture.gathe",
        "r.basic.2d.rgba8i.base_level.level_2");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013183,
        "dEQP-GLES31.functional.texture.gather.b",
        "asic.2d_array.rgba8i.base_level.level_1");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013184,
        "dEQP-GLES31.functional.texture.gather.b",
        "asic.2d_array.rgba8i.base_level.level_2");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013270,
        "dEQP-GLES31.functional.texture.gather",
        ".basic.cube.rgba8i.base_level.level_1");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013271,
        "dEQP-GLES31.functional.texture.gather",
        ".basic.cube.rgba8i.base_level.level_2");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013392,
        "dEQP-GLES31.functional.texture.gather.offset.im",
        "plementation_offset.2d.rgba8i.base_level.level_1");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013393,
        "dEQP-GLES31.functional.texture.gather.offset.im",
        "plementation_offset.2d.rgba8i.base_level.level_2");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013461,
        "dEQP-GLES31.functional.texture.gather.offset.imple",
        "mentation_offset.2d_array.rgba8i.base_level.level_1");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013462,
        "dEQP-GLES31.functional.texture.gather.offset.imple",
        "mentation_offset.2d_array.rgba8i.base_level.level_2");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013590,
        "dEQP-GLES31.functional.texture.gather.offset_dynami",
        "c.implementation_offset.2d.rgba8i.base_level.level_1");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013591,
        "dEQP-GLES31.functional.texture.gather.offset_dynami",
        "c.implementation_offset.2d.rgba8i.base_level.level_2");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013659,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.i",
        "mplementation_offset.2d_array.rgba8i.base_level.level_1");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013660,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.i",
        "mplementation_offset.2d_array.rgba8i.base_level.level_2");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013788,
        "dEQP-GLES31.functional.texture.gather.offsets.im",
        "plementation_offset.2d.rgba8i.base_level.level_1");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013789,
        "dEQP-GLES31.functional.texture.gather.offsets.im",
        "plementation_offset.2d.rgba8i.base_level.level_2");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013857,
        "dEQP-GLES31.functional.texture.gather.offsets.imple",
        "mentation_offset.2d_array.rgba8i.base_level.level_1");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013858,
        "dEQP-GLES31.functional.texture.gather.offsets.imple",
        "mentation_offset.2d_array.rgba8i.base_level.level_2");
