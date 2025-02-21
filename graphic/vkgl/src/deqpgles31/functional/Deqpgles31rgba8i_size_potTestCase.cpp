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

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013101,
        "dEQP-GLES31.functional.texture.gather.bas",
        "ic.2d.rgba8i.size_pot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013102,
        "dEQP-GLES31.functional.texture.gather.basi",
        "c.2d.rgba8i.size_pot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013103,
        "dEQP-GLES31.functional.texture.gather.basic.2d",
        ".rgba8i.size_pot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013170,
        "dEQP-GLES31.functional.texture.gather.basic.",
        "2d_array.rgba8i.size_pot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013171,
        "dEQP-GLES31.functional.texture.gather.basic.2",
        "d_array.rgba8i.size_pot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013172,
        "dEQP-GLES31.functional.texture.gather.basic.2d_ar",
        "ray.rgba8i.size_pot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013251,
        "dEQP-GLES31.functional.texture.gather.basi",
        "c.cube.rgba8i.size_pot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013252,
        "dEQP-GLES31.functional.texture.gather.basic",
        ".cube.rgba8i.size_pot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013253,
        "dEQP-GLES31.functional.texture.gather.basic.cub",
        "e.rgba8i.size_pot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013296,
        "dEQP-GLES31.functional.texture.gather.offset.min_req",
        "uired_offset.2d.rgba8i.size_pot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013297,
        "dEQP-GLES31.functional.texture.gather.offset.min_requ",
        "ired_offset.2d.rgba8i.size_pot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013298,
        "dEQP-GLES31.functional.texture.gather.offset.min_require",
        "d_offset.2d.rgba8i.size_pot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013326,
        "dEQP-GLES31.functional.texture.gather.offset.min_requir",
        "ed_offset.2d_array.rgba8i.size_pot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013327,
        "dEQP-GLES31.functional.texture.gather.offset.min_require",
        "d_offset.2d_array.rgba8i.size_pot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013328,
        "dEQP-GLES31.functional.texture.gather.offset.min_required_o",
        "ffset.2d_array.rgba8i.size_pot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013379,
        "dEQP-GLES31.functional.texture.gather.offset.implemen",
        "tation_offset.2d.rgba8i.size_pot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013380,
        "dEQP-GLES31.functional.texture.gather.offset.implement",
        "ation_offset.2d.rgba8i.size_pot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013381,
        "dEQP-GLES31.functional.texture.gather.offset.implementati",
        "on_offset.2d.rgba8i.size_pot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013448,
        "dEQP-GLES31.functional.texture.gather.offset.implementat",
        "ion_offset.2d_array.rgba8i.size_pot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013449,
        "dEQP-GLES31.functional.texture.gather.offset.implementati",
        "on_offset.2d_array.rgba8i.size_pot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013450,
        "dEQP-GLES31.functional.texture.gather.offset.implementation_",
        "offset.2d_array.rgba8i.size_pot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013494,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.min",
        "_required_offset.2d.rgba8i.size_pot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013495,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.min_",
        "required_offset.2d.rgba8i.size_pot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013496,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.min_req",
        "uired_offset.2d.rgba8i.size_pot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013524,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.min_re",
        "quired_offset.2d_array.rgba8i.size_pot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013525,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.min_req",
        "uired_offset.2d_array.rgba8i.size_pot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013526,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.min_requir",
        "ed_offset.2d_array.rgba8i.size_pot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013577,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.impl",
        "ementation_offset.2d.rgba8i.size_pot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013578,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.imple",
        "mentation_offset.2d.rgba8i.size_pot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013579,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implemen",
        "tation_offset.2d.rgba8i.size_pot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013646,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.impleme",
        "ntation_offset.2d_array.rgba8i.size_pot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013647,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implemen",
        "tation_offset.2d_array.rgba8i.size_pot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013648,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implementat",
        "ion_offset.2d_array.rgba8i.size_pot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013692,
        "dEQP-GLES31.functional.texture.gather.offsets.min_re",
        "quired_offset.2d.rgba8i.size_pot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013693,
        "dEQP-GLES31.functional.texture.gather.offsets.min_req",
        "uired_offset.2d.rgba8i.size_pot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013694,
        "dEQP-GLES31.functional.texture.gather.offsets.min_require",
        "d_offset.2d.rgba8i.size_pot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013722,
        "dEQP-GLES31.functional.texture.gather.offsets.min_requi",
        "red_offset.2d_array.rgba8i.size_pot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013723,
        "dEQP-GLES31.functional.texture.gather.offsets.min_requir",
        "ed_offset.2d_array.rgba8i.size_pot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013724,
        "dEQP-GLES31.functional.texture.gather.offsets.min_required_o",
        "ffset.2d_array.rgba8i.size_pot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013775,
        "dEQP-GLES31.functional.texture.gather.offsets.impleme",
        "ntation_offset.2d.rgba8i.size_pot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013776,
        "dEQP-GLES31.functional.texture.gather.offsets.implemen",
        "tation_offset.2d.rgba8i.size_pot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013777,
        "dEQP-GLES31.functional.texture.gather.offsets.implementati",
        "on_offset.2d.rgba8i.size_pot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013844,
        "dEQP-GLES31.functional.texture.gather.offsets.implementa",
        "tion_offset.2d_array.rgba8i.size_pot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013845,
        "dEQP-GLES31.functional.texture.gather.offsets.implementat",
        "ion_offset.2d_array.rgba8i.size_pot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013846,
        "dEQP-GLES31.functional.texture.gather.offsets.implementation_",
        "offset.2d_array.rgba8i.size_pot.mirrored_repeat_clamp_to_edge");
