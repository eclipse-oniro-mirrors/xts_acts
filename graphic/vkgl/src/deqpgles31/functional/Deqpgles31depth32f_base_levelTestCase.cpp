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

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013133,
        "dEQP-GLES31.functional.texture.gather",
        ".basic.2d.depth32f.base_level.level_1");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013134,
        "dEQP-GLES31.functional.texture.gather",
        ".basic.2d.depth32f.base_level.level_2");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013202,
        "dEQP-GLES31.functional.texture.gather.ba",
        "sic.2d_array.depth32f.base_level.level_1");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013203,
        "dEQP-GLES31.functional.texture.gather.ba",
        "sic.2d_array.depth32f.base_level.level_2");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013411,
        "dEQP-GLES31.functional.texture.gather.offset.imp",
        "lementation_offset.2d.depth32f.base_level.level_1");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013412,
        "dEQP-GLES31.functional.texture.gather.offset.imp",
        "lementation_offset.2d.depth32f.base_level.level_2");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013480,
        "dEQP-GLES31.functional.texture.gather.offset.implem",
        "entation_offset.2d_array.depth32f.base_level.level_1");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013481,
        "dEQP-GLES31.functional.texture.gather.offset.implem",
        "entation_offset.2d_array.depth32f.base_level.level_2");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013609,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic",
        ".implementation_offset.2d.depth32f.base_level.level_1");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013610,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic",
        ".implementation_offset.2d.depth32f.base_level.level_2");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013678,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.im",
        "plementation_offset.2d_array.depth32f.base_level.level_1");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013679,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.im",
        "plementation_offset.2d_array.depth32f.base_level.level_2");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013807,
        "dEQP-GLES31.functional.texture.gather.offsets.imp",
        "lementation_offset.2d.depth32f.base_level.level_1");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013808,
        "dEQP-GLES31.functional.texture.gather.offsets.imp",
        "lementation_offset.2d.depth32f.base_level.level_2");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013876,
        "dEQP-GLES31.functional.texture.gather.offsets.implem",
        "entation_offset.2d_array.depth32f.base_level.level_1");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013877,
        "dEQP-GLES31.functional.texture.gather.offsets.implem",
        "entation_offset.2d_array.depth32f.base_level.level_2");
