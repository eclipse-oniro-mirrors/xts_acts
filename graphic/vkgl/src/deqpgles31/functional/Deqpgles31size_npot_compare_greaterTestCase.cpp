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

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013125,
        "dEQP-GLES31.functional.texture.gather.basic.2d.dept",
        "h32f.size_npot.compare_greater.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013126,
        "dEQP-GLES31.functional.texture.gather.basic.2d.depth",
        "32f.size_npot.compare_greater.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013127,
        "dEQP-GLES31.functional.texture.gather.basic.2d.depth32f",
        ".size_npot.compare_greater.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013194,
        "dEQP-GLES31.functional.texture.gather.basic.2d_array.d",
        "epth32f.size_npot.compare_greater.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013195,
        "dEQP-GLES31.functional.texture.gather.basic.2d_array.de",
        "pth32f.size_npot.compare_greater.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013196,
        "dEQP-GLES31.functional.texture.gather.basic.2d_array.depth",
        "32f.size_npot.compare_greater.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013281,
        "dEQP-GLES31.functional.texture.gather.basic.cube.depth32f",
        ".no_corners.size_npot.compare_greater.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013282,
        "dEQP-GLES31.functional.texture.gather.basic.cube.depth32f.",
        "no_corners.size_npot.compare_greater.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013283,
        "dEQP-GLES31.functional.texture.gather.basic.cube.depth32f.no_c",
        "orners.size_npot.compare_greater.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013311,
        "dEQP-GLES31.functional.texture.gather.offset.min_required_off",
        "set.2d.depth32f.size_npot.compare_greater.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013312,
        "dEQP-GLES31.functional.texture.gather.offset.min_required_offs",
        "et.2d.depth32f.size_npot.compare_greater.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013313,
        "dEQP-GLES31.functional.texture.gather.offset.min_required_offset.2",
        "d.depth32f.size_npot.compare_greater.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013341,
        "dEQP-GLES31.functional.texture.gather.offset.min_required_offset",
        ".2d_array.depth32f.size_npot.compare_greater.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013342,
        "dEQP-GLES31.functional.texture.gather.offset.min_required_offset.",
        "2d_array.depth32f.size_npot.compare_greater.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013343,
        "dEQP-GLES31.functional.texture.gather.offset.min_required_offset.2d_a",
        "rray.depth32f.size_npot.compare_greater.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013403,
        "dEQP-GLES31.functional.texture.gather.offset.implementation_of",
        "fset.2d.depth32f.size_npot.compare_greater.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013404,
        "dEQP-GLES31.functional.texture.gather.offset.implementation_off",
        "set.2d.depth32f.size_npot.compare_greater.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013405,
        "dEQP-GLES31.functional.texture.gather.offset.implementation_offset.",
        "2d.depth32f.size_npot.compare_greater.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013472,
        "dEQP-GLES31.functional.texture.gather.offset.implementation_offse",
        "t.2d_array.depth32f.size_npot.compare_greater.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013473,
        "dEQP-GLES31.functional.texture.gather.offset.implementation_offset",
        ".2d_array.depth32f.size_npot.compare_greater.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013474,
        "dEQP-GLES31.functional.texture.gather.offset.implementation_offset.2d_",
        "array.depth32f.size_npot.compare_greater.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013509,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.min_required",
        "_offset.2d.depth32f.size_npot.compare_greater.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013510,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.min_required_",
        "offset.2d.depth32f.size_npot.compare_greater.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013511,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.min_required_offs",
        "et.2d.depth32f.size_npot.compare_greater.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013539,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.min_required_of",
        "fset.2d_array.depth32f.size_npot.compare_greater.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013540,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.min_required_off",
        "set.2d_array.depth32f.size_npot.compare_greater.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013541,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.min_required_offset.",
        "2d_array.depth32f.size_npot.compare_greater.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013601,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implementatio",
        "n_offset.2d.depth32f.size_npot.compare_greater.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013602,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implementation",
        "_offset.2d.depth32f.size_npot.compare_greater.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013603,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implementation_off",
        "set.2d.depth32f.size_npot.compare_greater.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013670,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implementation_o",
        "ffset.2d_array.depth32f.size_npot.compare_greater.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013671,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implementation_of",
        "fset.2d_array.depth32f.size_npot.compare_greater.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013672,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implementation_offset",
        ".2d_array.depth32f.size_npot.compare_greater.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013707,
        "dEQP-GLES31.functional.texture.gather.offsets.min_required_off",
        "set.2d.depth32f.size_npot.compare_greater.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013708,
        "dEQP-GLES31.functional.texture.gather.offsets.min_required_offs",
        "et.2d.depth32f.size_npot.compare_greater.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013709,
        "dEQP-GLES31.functional.texture.gather.offsets.min_required_offset.",
        "2d.depth32f.size_npot.compare_greater.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013737,
        "dEQP-GLES31.functional.texture.gather.offsets.min_required_offset",
        ".2d_array.depth32f.size_npot.compare_greater.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013738,
        "dEQP-GLES31.functional.texture.gather.offsets.min_required_offset.",
        "2d_array.depth32f.size_npot.compare_greater.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013739,
        "dEQP-GLES31.functional.texture.gather.offsets.min_required_offset.2d_",
        "array.depth32f.size_npot.compare_greater.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013799,
        "dEQP-GLES31.functional.texture.gather.offsets.implementation_of",
        "fset.2d.depth32f.size_npot.compare_greater.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013800,
        "dEQP-GLES31.functional.texture.gather.offsets.implementation_off",
        "set.2d.depth32f.size_npot.compare_greater.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013801,
        "dEQP-GLES31.functional.texture.gather.offsets.implementation_offset",
        ".2d.depth32f.size_npot.compare_greater.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013868,
        "dEQP-GLES31.functional.texture.gather.offsets.implementation_offse",
        "t.2d_array.depth32f.size_npot.compare_greater.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013869,
        "dEQP-GLES31.functional.texture.gather.offsets.implementation_offset",
        ".2d_array.depth32f.size_npot.compare_greater.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013870,
        "dEQP-GLES31.functional.texture.gather.offsets.implementation_offset.2d",
        "_array.depth32f.size_npot.compare_greater.mirrored_repeat_clamp_to_edge");
