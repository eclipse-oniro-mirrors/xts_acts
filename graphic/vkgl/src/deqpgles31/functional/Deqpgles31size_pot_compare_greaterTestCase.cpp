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

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013119,
        "dEQP-GLES31.functional.texture.gather.basic.2d.dep",
        "th32f.size_pot.compare_greater.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013120,
        "dEQP-GLES31.functional.texture.gather.basic.2d.dept",
        "h32f.size_pot.compare_greater.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013121,
        "dEQP-GLES31.functional.texture.gather.basic.2d.depth32f",
        ".size_pot.compare_greater.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013188,
        "dEQP-GLES31.functional.texture.gather.basic.2d_array.",
        "depth32f.size_pot.compare_greater.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013189,
        "dEQP-GLES31.functional.texture.gather.basic.2d_array.d",
        "epth32f.size_pot.compare_greater.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013190,
        "dEQP-GLES31.functional.texture.gather.basic.2d_array.depth",
        "32f.size_pot.compare_greater.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013275,
        "dEQP-GLES31.functional.texture.gather.basic.cube.depth32f",
        ".no_corners.size_pot.compare_greater.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013276,
        "dEQP-GLES31.functional.texture.gather.basic.cube.depth32f.",
        "no_corners.size_pot.compare_greater.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013277,
        "dEQP-GLES31.functional.texture.gather.basic.cube.depth32f.no_",
        "corners.size_pot.compare_greater.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013305,
        "dEQP-GLES31.functional.texture.gather.offset.min_required_off",
        "set.2d.depth32f.size_pot.compare_greater.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013306,
        "dEQP-GLES31.functional.texture.gather.offset.min_required_offs",
        "et.2d.depth32f.size_pot.compare_greater.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013307,
        "dEQP-GLES31.functional.texture.gather.offset.min_required_offset.",
        "2d.depth32f.size_pot.compare_greater.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013335,
        "dEQP-GLES31.functional.texture.gather.offset.min_required_offset",
        ".2d_array.depth32f.size_pot.compare_greater.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013336,
        "dEQP-GLES31.functional.texture.gather.offset.min_required_offset.",
        "2d_array.depth32f.size_pot.compare_greater.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013337,
        "dEQP-GLES31.functional.texture.gather.offset.min_required_offset.2d_",
        "array.depth32f.size_pot.compare_greater.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013397,
        "dEQP-GLES31.functional.texture.gather.offset.implementation_of",
        "fset.2d.depth32f.size_pot.compare_greater.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013398,
        "dEQP-GLES31.functional.texture.gather.offset.implementation_off",
        "set.2d.depth32f.size_pot.compare_greater.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013399,
        "dEQP-GLES31.functional.texture.gather.offset.implementation_offset",
        ".2d.depth32f.size_pot.compare_greater.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013466,
        "dEQP-GLES31.functional.texture.gather.offset.implementation_offse",
        "t.2d_array.depth32f.size_pot.compare_greater.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013467,
        "dEQP-GLES31.functional.texture.gather.offset.implementation_offset",
        ".2d_array.depth32f.size_pot.compare_greater.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013468,
        "dEQP-GLES31.functional.texture.gather.offset.implementation_offset.2d",
        "_array.depth32f.size_pot.compare_greater.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013503,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.min_required",
        "_offset.2d.depth32f.size_pot.compare_greater.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013504,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.min_required_",
        "offset.2d.depth32f.size_pot.compare_greater.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013505,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.min_required_off",
        "set.2d.depth32f.size_pot.compare_greater.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013533,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.min_required_of",
        "fset.2d_array.depth32f.size_pot.compare_greater.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013534,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.min_required_off",
        "set.2d_array.depth32f.size_pot.compare_greater.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013535,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.min_required_offset",
        ".2d_array.depth32f.size_pot.compare_greater.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013595,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implementatio",
        "n_offset.2d.depth32f.size_pot.compare_greater.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013596,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implementation",
        "_offset.2d.depth32f.size_pot.compare_greater.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013597,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implementation_of",
        "fset.2d.depth32f.size_pot.compare_greater.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013664,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implementation_o",
        "ffset.2d_array.depth32f.size_pot.compare_greater.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013665,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implementation_of",
        "fset.2d_array.depth32f.size_pot.compare_greater.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013666,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implementation_offse",
        "t.2d_array.depth32f.size_pot.compare_greater.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013701,
        "dEQP-GLES31.functional.texture.gather.offsets.min_required_of",
        "fset.2d.depth32f.size_pot.compare_greater.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013702,
        "dEQP-GLES31.functional.texture.gather.offsets.min_required_off",
        "set.2d.depth32f.size_pot.compare_greater.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013703,
        "dEQP-GLES31.functional.texture.gather.offsets.min_required_offset.",
        "2d.depth32f.size_pot.compare_greater.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013731,
        "dEQP-GLES31.functional.texture.gather.offsets.min_required_offse",
        "t.2d_array.depth32f.size_pot.compare_greater.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013732,
        "dEQP-GLES31.functional.texture.gather.offsets.min_required_offset",
        ".2d_array.depth32f.size_pot.compare_greater.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013733,
        "dEQP-GLES31.functional.texture.gather.offsets.min_required_offset.2d_",
        "array.depth32f.size_pot.compare_greater.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013793,
        "dEQP-GLES31.functional.texture.gather.offsets.implementation_o",
        "ffset.2d.depth32f.size_pot.compare_greater.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013794,
        "dEQP-GLES31.functional.texture.gather.offsets.implementation_of",
        "fset.2d.depth32f.size_pot.compare_greater.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013795,
        "dEQP-GLES31.functional.texture.gather.offsets.implementation_offset",
        ".2d.depth32f.size_pot.compare_greater.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013862,
        "dEQP-GLES31.functional.texture.gather.offsets.implementation_offs",
        "et.2d_array.depth32f.size_pot.compare_greater.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013863,
        "dEQP-GLES31.functional.texture.gather.offsets.implementation_offse",
        "t.2d_array.depth32f.size_pot.compare_greater.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013864,
        "dEQP-GLES31.functional.texture.gather.offsets.implementation_offset.2d",
        "_array.depth32f.size_pot.compare_greater.mirrored_repeat_clamp_to_edge");
