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

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013122,
        "dEQP-GLES31.functional.texture.gather.basic.2d.de",
        "pth32f.size_npot.compare_less.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013123,
        "dEQP-GLES31.functional.texture.gather.basic.2d.dep",
        "th32f.size_npot.compare_less.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013124,
        "dEQP-GLES31.functional.texture.gather.basic.2d.depth32",
        "f.size_npot.compare_less.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013191,
        "dEQP-GLES31.functional.texture.gather.basic.2d_array",
        ".depth32f.size_npot.compare_less.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013192,
        "dEQP-GLES31.functional.texture.gather.basic.2d_array.",
        "depth32f.size_npot.compare_less.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013193,
        "dEQP-GLES31.functional.texture.gather.basic.2d_array.dept",
        "h32f.size_npot.compare_less.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013278,
        "dEQP-GLES31.functional.texture.gather.basic.cube.depth32",
        "f.no_corners.size_npot.compare_less.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013279,
        "dEQP-GLES31.functional.texture.gather.basic.cube.depth32f",
        ".no_corners.size_npot.compare_less.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013280,
        "dEQP-GLES31.functional.texture.gather.basic.cube.depth32f.no",
        "_corners.size_npot.compare_less.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013308,
        "dEQP-GLES31.functional.texture.gather.offset.min_required_of",
        "fset.2d.depth32f.size_npot.compare_less.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013309,
        "dEQP-GLES31.functional.texture.gather.offset.min_required_off",
        "set.2d.depth32f.size_npot.compare_less.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013310,
        "dEQP-GLES31.functional.texture.gather.offset.min_required_offset",
        ".2d.depth32f.size_npot.compare_less.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013338,
        "dEQP-GLES31.functional.texture.gather.offset.min_required_offse",
        "t.2d_array.depth32f.size_npot.compare_less.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013339,
        "dEQP-GLES31.functional.texture.gather.offset.min_required_offset",
        ".2d_array.depth32f.size_npot.compare_less.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013340,
        "dEQP-GLES31.functional.texture.gather.offset.min_required_offset.2d",
        "_array.depth32f.size_npot.compare_less.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013400,
        "dEQP-GLES31.functional.texture.gather.offset.implementation_o",
        "ffset.2d.depth32f.size_npot.compare_less.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013401,
        "dEQP-GLES31.functional.texture.gather.offset.implementation_of",
        "fset.2d.depth32f.size_npot.compare_less.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013402,
        "dEQP-GLES31.functional.texture.gather.offset.implementation_offse",
        "t.2d.depth32f.size_npot.compare_less.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013469,
        "dEQP-GLES31.functional.texture.gather.offset.implementation_offs",
        "et.2d_array.depth32f.size_npot.compare_less.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013470,
        "dEQP-GLES31.functional.texture.gather.offset.implementation_offse",
        "t.2d_array.depth32f.size_npot.compare_less.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013471,
        "dEQP-GLES31.functional.texture.gather.offset.implementation_offset.2",
        "d_array.depth32f.size_npot.compare_less.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013506,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.min_require",
        "d_offset.2d.depth32f.size_npot.compare_less.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013507,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.min_required",
        "_offset.2d.depth32f.size_npot.compare_less.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013508,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.min_required_of",
        "fset.2d.depth32f.size_npot.compare_less.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013536,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.min_required_o",
        "ffset.2d_array.depth32f.size_npot.compare_less.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013537,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.min_required_of",
        "fset.2d_array.depth32f.size_npot.compare_less.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013538,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.min_required_offse",
        "t.2d_array.depth32f.size_npot.compare_less.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013598,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implementati",
        "on_offset.2d.depth32f.size_npot.compare_less.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013599,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implementatio",
        "n_offset.2d.depth32f.size_npot.compare_less.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013600,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implementation_o",
        "ffset.2d.depth32f.size_npot.compare_less.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013667,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implementation_",
        "offset.2d_array.depth32f.size_npot.compare_less.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013668,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implementation_o",
        "ffset.2d_array.depth32f.size_npot.compare_less.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013669,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implementation_offs",
        "et.2d_array.depth32f.size_npot.compare_less.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013704,
        "dEQP-GLES31.functional.texture.gather.offsets.min_required_o",
        "ffset.2d.depth32f.size_npot.compare_less.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013705,
        "dEQP-GLES31.functional.texture.gather.offsets.min_required_of",
        "fset.2d.depth32f.size_npot.compare_less.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013706,
        "dEQP-GLES31.functional.texture.gather.offsets.min_required_offset",
        ".2d.depth32f.size_npot.compare_less.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013734,
        "dEQP-GLES31.functional.texture.gather.offsets.min_required_offs",
        "et.2d_array.depth32f.size_npot.compare_less.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013735,
        "dEQP-GLES31.functional.texture.gather.offsets.min_required_offse",
        "t.2d_array.depth32f.size_npot.compare_less.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013736,
        "dEQP-GLES31.functional.texture.gather.offsets.min_required_offset.2d",
        "_array.depth32f.size_npot.compare_less.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013796,
        "dEQP-GLES31.functional.texture.gather.offsets.implementation_",
        "offset.2d.depth32f.size_npot.compare_less.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013797,
        "dEQP-GLES31.functional.texture.gather.offsets.implementation_o",
        "ffset.2d.depth32f.size_npot.compare_less.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013798,
        "dEQP-GLES31.functional.texture.gather.offsets.implementation_offse",
        "t.2d.depth32f.size_npot.compare_less.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013865,
        "dEQP-GLES31.functional.texture.gather.offsets.implementation_off",
        "set.2d_array.depth32f.size_npot.compare_less.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013866,
        "dEQP-GLES31.functional.texture.gather.offsets.implementation_offs",
        "et.2d_array.depth32f.size_npot.compare_less.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013867,
        "dEQP-GLES31.functional.texture.gather.offsets.implementation_offset.2",
        "d_array.depth32f.size_npot.compare_less.mirrored_repeat_clamp_to_edge");
