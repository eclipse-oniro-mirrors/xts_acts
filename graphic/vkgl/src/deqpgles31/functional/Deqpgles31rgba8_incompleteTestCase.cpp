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

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013085,
        "dEQP-GLES31.functional.texture.gather.ba",
        "sic.2d.rgba8.incomplete.mipmap_incomplete");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013154,
        "dEQP-GLES31.functional.texture.gather.basic",
        ".2d_array.rgba8.incomplete.mipmap_incomplete");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013229,
        "dEQP-GLES31.functional.texture.gather.bas",
        "ic.cube.rgba8.incomplete.mipmap_incomplete");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013363,
        "dEQP-GLES31.functional.texture.gather.offset.impleme",
        "ntation_offset.2d.rgba8.incomplete.mipmap_incomplete");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013432,
        "dEQP-GLES31.functional.texture.gather.offset.implementa",
        "tion_offset.2d_array.rgba8.incomplete.mipmap_incomplete");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013561,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.imp",
        "lementation_offset.2d.rgba8.incomplete.mipmap_incomplete");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013630,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implem",
        "entation_offset.2d_array.rgba8.incomplete.mipmap_incomplete");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013759,
        "dEQP-GLES31.functional.texture.gather.offsets.implem",
        "entation_offset.2d.rgba8.incomplete.mipmap_incomplete");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013828,
        "dEQP-GLES31.functional.texture.gather.offsets.implement",
        "ation_offset.2d_array.rgba8.incomplete.mipmap_incomplete");
