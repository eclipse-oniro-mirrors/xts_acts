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

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013104,
        "dEQP-GLES31.functional.texture.gather.basi",
        "c.2d.rgba8i.size_npot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013105,
        "dEQP-GLES31.functional.texture.gather.basic",
        ".2d.rgba8i.size_npot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013106,
        "dEQP-GLES31.functional.texture.gather.basic.2d",
        ".rgba8i.size_npot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013173,
        "dEQP-GLES31.functional.texture.gather.basic.2",
        "d_array.rgba8i.size_npot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013174,
        "dEQP-GLES31.functional.texture.gather.basic.2d",
        "_array.rgba8i.size_npot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013175,
        "dEQP-GLES31.functional.texture.gather.basic.2d_ar",
        "ray.rgba8i.size_npot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013254,
        "dEQP-GLES31.functional.texture.gather.basic",
        ".cube.rgba8i.size_npot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013255,
        "dEQP-GLES31.functional.texture.gather.basic.",
        "cube.rgba8i.size_npot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013256,
        "dEQP-GLES31.functional.texture.gather.basic.cub",
        "e.rgba8i.size_npot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013299,
        "dEQP-GLES31.functional.texture.gather.offset.min_req",
        "uired_offset.2d.rgba8i.size_npot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013300,
        "dEQP-GLES31.functional.texture.gather.offset.min_requ",
        "ired_offset.2d.rgba8i.size_npot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013301,
        "dEQP-GLES31.functional.texture.gather.offset.min_required",
        "_offset.2d.rgba8i.size_npot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013329,
        "dEQP-GLES31.functional.texture.gather.offset.min_requir",
        "ed_offset.2d_array.rgba8i.size_npot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013330,
        "dEQP-GLES31.functional.texture.gather.offset.min_require",
        "d_offset.2d_array.rgba8i.size_npot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013331,
        "dEQP-GLES31.functional.texture.gather.offset.min_required_of",
        "fset.2d_array.rgba8i.size_npot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013382,
        "dEQP-GLES31.functional.texture.gather.offset.implemen",
        "tation_offset.2d.rgba8i.size_npot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013383,
        "dEQP-GLES31.functional.texture.gather.offset.implement",
        "ation_offset.2d.rgba8i.size_npot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013384,
        "dEQP-GLES31.functional.texture.gather.offset.implementatio",
        "n_offset.2d.rgba8i.size_npot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013451,
        "dEQP-GLES31.functional.texture.gather.offset.implementat",
        "ion_offset.2d_array.rgba8i.size_npot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013452,
        "dEQP-GLES31.functional.texture.gather.offset.implementati",
        "on_offset.2d_array.rgba8i.size_npot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013453,
        "dEQP-GLES31.functional.texture.gather.offset.implementation_o",
        "ffset.2d_array.rgba8i.size_npot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013497,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.min",
        "_required_offset.2d.rgba8i.size_npot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013498,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.min_",
        "required_offset.2d.rgba8i.size_npot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013499,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.min_requ",
        "ired_offset.2d.rgba8i.size_npot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013527,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.min_re",
        "quired_offset.2d_array.rgba8i.size_npot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013528,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.min_req",
        "uired_offset.2d_array.rgba8i.size_npot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013529,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.min_require",
        "d_offset.2d_array.rgba8i.size_npot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013580,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.impl",
        "ementation_offset.2d.rgba8i.size_npot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013581,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.imple",
        "mentation_offset.2d.rgba8i.size_npot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013582,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implement",
        "ation_offset.2d.rgba8i.size_npot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013649,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.impleme",
        "ntation_offset.2d_array.rgba8i.size_npot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013650,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implemen",
        "tation_offset.2d_array.rgba8i.size_npot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013651,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implementati",
        "on_offset.2d_array.rgba8i.size_npot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013695,
        "dEQP-GLES31.functional.texture.gather.offsets.min_req",
        "uired_offset.2d.rgba8i.size_npot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013696,
        "dEQP-GLES31.functional.texture.gather.offsets.min_requ",
        "ired_offset.2d.rgba8i.size_npot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013697,
        "dEQP-GLES31.functional.texture.gather.offsets.min_require",
        "d_offset.2d.rgba8i.size_npot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013725,
        "dEQP-GLES31.functional.texture.gather.offsets.min_requir",
        "ed_offset.2d_array.rgba8i.size_npot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013726,
        "dEQP-GLES31.functional.texture.gather.offsets.min_require",
        "d_offset.2d_array.rgba8i.size_npot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013727,
        "dEQP-GLES31.functional.texture.gather.offsets.min_required_o",
        "ffset.2d_array.rgba8i.size_npot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013778,
        "dEQP-GLES31.functional.texture.gather.offsets.implemen",
        "tation_offset.2d.rgba8i.size_npot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013779,
        "dEQP-GLES31.functional.texture.gather.offsets.implement",
        "ation_offset.2d.rgba8i.size_npot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013780,
        "dEQP-GLES31.functional.texture.gather.offsets.implementati",
        "on_offset.2d.rgba8i.size_npot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013847,
        "dEQP-GLES31.functional.texture.gather.offsets.implementat",
        "ion_offset.2d_array.rgba8i.size_npot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013848,
        "dEQP-GLES31.functional.texture.gather.offsets.implementati",
        "on_offset.2d_array.rgba8i.size_npot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013849,
        "dEQP-GLES31.functional.texture.gather.offsets.implementation_",
        "offset.2d_array.rgba8i.size_npot.mirrored_repeat_clamp_to_edge");
