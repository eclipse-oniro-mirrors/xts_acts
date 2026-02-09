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

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013083,
        "dEQP-GLES31.functional.texture.gath",
        "er.basic.2d.rgba8.base_level.level_1");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013084,
        "dEQP-GLES31.functional.texture.gath",
        "er.basic.2d.rgba8.base_level.level_2");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013152,
        "dEQP-GLES31.functional.texture.gather.",
        "basic.2d_array.rgba8.base_level.level_1");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013153,
        "dEQP-GLES31.functional.texture.gather.",
        "basic.2d_array.rgba8.base_level.level_2");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013227,
        "dEQP-GLES31.functional.texture.gathe",
        "r.basic.cube.rgba8.base_level.level_1");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013228,
        "dEQP-GLES31.functional.texture.gathe",
        "r.basic.cube.rgba8.base_level.level_2");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013361,
        "dEQP-GLES31.functional.texture.gather.offset.im",
        "plementation_offset.2d.rgba8.base_level.level_1");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013362,
        "dEQP-GLES31.functional.texture.gather.offset.im",
        "plementation_offset.2d.rgba8.base_level.level_2");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013430,
        "dEQP-GLES31.functional.texture.gather.offset.imple",
        "mentation_offset.2d_array.rgba8.base_level.level_1");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013431,
        "dEQP-GLES31.functional.texture.gather.offset.imple",
        "mentation_offset.2d_array.rgba8.base_level.level_2");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013559,
        "dEQP-GLES31.functional.texture.gather.offset_dynami",
        "c.implementation_offset.2d.rgba8.base_level.level_1");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013560,
        "dEQP-GLES31.functional.texture.gather.offset_dynami",
        "c.implementation_offset.2d.rgba8.base_level.level_2");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013628,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.i",
        "mplementation_offset.2d_array.rgba8.base_level.level_1");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013629,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.i",
        "mplementation_offset.2d_array.rgba8.base_level.level_2");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013757,
        "dEQP-GLES31.functional.texture.gather.offsets.i",
        "mplementation_offset.2d.rgba8.base_level.level_1");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013758,
        "dEQP-GLES31.functional.texture.gather.offsets.i",
        "mplementation_offset.2d.rgba8.base_level.level_2");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013826,
        "dEQP-GLES31.functional.texture.gather.offsets.impl",
        "ementation_offset.2d_array.rgba8.base_level.level_1");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013827,
        "dEQP-GLES31.functional.texture.gather.offsets.impl",
        "ementation_offset.2d_array.rgba8.base_level.level_2");
