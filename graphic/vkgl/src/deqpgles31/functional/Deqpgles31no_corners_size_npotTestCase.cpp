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

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013213,
        "dEQP-GLES31.functional.texture.gather.basic.cube",
        ".rgba8.no_corners.size_npot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013214,
        "dEQP-GLES31.functional.texture.gather.basic.cube.",
        "rgba8.no_corners.size_npot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013215,
        "dEQP-GLES31.functional.texture.gather.basic.cube.rgb",
        "a8.no_corners.size_npot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013239,
        "dEQP-GLES31.functional.texture.gather.basic.cube.",
        "rgba8ui.no_corners.size_npot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013240,
        "dEQP-GLES31.functional.texture.gather.basic.cube.r",
        "gba8ui.no_corners.size_npot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013241,
        "dEQP-GLES31.functional.texture.gather.basic.cube.rgba",
        "8ui.no_corners.size_npot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013260,
        "dEQP-GLES31.functional.texture.gather.basic.cube",
        ".rgba8i.no_corners.size_npot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013261,
        "dEQP-GLES31.functional.texture.gather.basic.cube.",
        "rgba8i.no_corners.size_npot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013262,
        "dEQP-GLES31.functional.texture.gather.basic.cube.rgba",
        "8i.no_corners.size_npot.mirrored_repeat_clamp_to_edge");
