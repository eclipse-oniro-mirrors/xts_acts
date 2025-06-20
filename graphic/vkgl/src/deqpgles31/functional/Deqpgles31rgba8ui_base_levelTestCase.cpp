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

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013099,
        "dEQP-GLES31.functional.texture.gathe",
        "r.basic.2d.rgba8ui.base_level.level_1");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013100,
        "dEQP-GLES31.functional.texture.gathe",
        "r.basic.2d.rgba8ui.base_level.level_2");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013168,
        "dEQP-GLES31.functional.texture.gather.b",
        "asic.2d_array.rgba8ui.base_level.level_1");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013169,
        "dEQP-GLES31.functional.texture.gather.b",
        "asic.2d_array.rgba8ui.base_level.level_2");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013249,
        "dEQP-GLES31.functional.texture.gather",
        ".basic.cube.rgba8ui.base_level.level_1");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013250,
        "dEQP-GLES31.functional.texture.gather",
        ".basic.cube.rgba8ui.base_level.level_2");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013377,
        "dEQP-GLES31.functional.texture.gather.offset.imp",
        "lementation_offset.2d.rgba8ui.base_level.level_1");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013378,
        "dEQP-GLES31.functional.texture.gather.offset.imp",
        "lementation_offset.2d.rgba8ui.base_level.level_2");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013446,
        "dEQP-GLES31.functional.texture.gather.offset.implem",
        "entation_offset.2d_array.rgba8ui.base_level.level_1");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013447,
        "dEQP-GLES31.functional.texture.gather.offset.implem",
        "entation_offset.2d_array.rgba8ui.base_level.level_2");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013575,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic",
        ".implementation_offset.2d.rgba8ui.base_level.level_1");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013576,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic",
        ".implementation_offset.2d.rgba8ui.base_level.level_2");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013644,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.im",
        "plementation_offset.2d_array.rgba8ui.base_level.level_1");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013645,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.im",
        "plementation_offset.2d_array.rgba8ui.base_level.level_2");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013773,
        "dEQP-GLES31.functional.texture.gather.offsets.im",
        "plementation_offset.2d.rgba8ui.base_level.level_1");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013774,
        "dEQP-GLES31.functional.texture.gather.offsets.im",
        "plementation_offset.2d.rgba8ui.base_level.level_2");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013842,
        "dEQP-GLES31.functional.texture.gather.offsets.imple",
        "mentation_offset.2d_array.rgba8ui.base_level.level_1");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013843,
        "dEQP-GLES31.functional.texture.gather.offsets.imple",
        "mentation_offset.2d_array.rgba8ui.base_level.level_2");
