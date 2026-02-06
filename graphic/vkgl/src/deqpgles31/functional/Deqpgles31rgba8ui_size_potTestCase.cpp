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

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013086,
        "dEQP-GLES31.functional.texture.gather.basi",
        "c.2d.rgba8ui.size_pot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013087,
        "dEQP-GLES31.functional.texture.gather.basic",
        ".2d.rgba8ui.size_pot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013088,
        "dEQP-GLES31.functional.texture.gather.basic.2d",
        ".rgba8ui.size_pot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013155,
        "dEQP-GLES31.functional.texture.gather.basic.2",
        "d_array.rgba8ui.size_pot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013156,
        "dEQP-GLES31.functional.texture.gather.basic.2d",
        "_array.rgba8ui.size_pot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013157,
        "dEQP-GLES31.functional.texture.gather.basic.2d_ar",
        "ray.rgba8ui.size_pot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013230,
        "dEQP-GLES31.functional.texture.gather.basic",
        ".cube.rgba8ui.size_pot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013231,
        "dEQP-GLES31.functional.texture.gather.basic.",
        "cube.rgba8ui.size_pot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013232,
        "dEQP-GLES31.functional.texture.gather.basic.cub",
        "e.rgba8ui.size_pot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013290,
        "dEQP-GLES31.functional.texture.gather.offset.min_req",
        "uired_offset.2d.rgba8ui.size_pot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013291,
        "dEQP-GLES31.functional.texture.gather.offset.min_requ",
        "ired_offset.2d.rgba8ui.size_pot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013292,
        "dEQP-GLES31.functional.texture.gather.offset.min_required",
        "_offset.2d.rgba8ui.size_pot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013320,
        "dEQP-GLES31.functional.texture.gather.offset.min_requir",
        "ed_offset.2d_array.rgba8ui.size_pot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013321,
        "dEQP-GLES31.functional.texture.gather.offset.min_require",
        "d_offset.2d_array.rgba8ui.size_pot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013322,
        "dEQP-GLES31.functional.texture.gather.offset.min_required_of",
        "fset.2d_array.rgba8ui.size_pot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013364,
        "dEQP-GLES31.functional.texture.gather.offset.implemen",
        "tation_offset.2d.rgba8ui.size_pot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013365,
        "dEQP-GLES31.functional.texture.gather.offset.implement",
        "ation_offset.2d.rgba8ui.size_pot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013366,
        "dEQP-GLES31.functional.texture.gather.offset.implementatio",
        "n_offset.2d.rgba8ui.size_pot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013433,
        "dEQP-GLES31.functional.texture.gather.offset.implementat",
        "ion_offset.2d_array.rgba8ui.size_pot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013434,
        "dEQP-GLES31.functional.texture.gather.offset.implementati",
        "on_offset.2d_array.rgba8ui.size_pot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013435,
        "dEQP-GLES31.functional.texture.gather.offset.implementation_o",
        "ffset.2d_array.rgba8ui.size_pot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013488,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.min",
        "_required_offset.2d.rgba8ui.size_pot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013489,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.min_",
        "required_offset.2d.rgba8ui.size_pot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013490,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.min_requ",
        "ired_offset.2d.rgba8ui.size_pot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013518,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.min_re",
        "quired_offset.2d_array.rgba8ui.size_pot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013519,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.min_req",
        "uired_offset.2d_array.rgba8ui.size_pot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013520,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.min_require",
        "d_offset.2d_array.rgba8ui.size_pot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013562,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.impl",
        "ementation_offset.2d.rgba8ui.size_pot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013563,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.imple",
        "mentation_offset.2d.rgba8ui.size_pot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013564,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implement",
        "ation_offset.2d.rgba8ui.size_pot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013631,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.impleme",
        "ntation_offset.2d_array.rgba8ui.size_pot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013632,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implemen",
        "tation_offset.2d_array.rgba8ui.size_pot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013633,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implementati",
        "on_offset.2d_array.rgba8ui.size_pot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013686,
        "dEQP-GLES31.functional.texture.gather.offsets.min_req",
        "uired_offset.2d.rgba8ui.size_pot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013687,
        "dEQP-GLES31.functional.texture.gather.offsets.min_requ",
        "ired_offset.2d.rgba8ui.size_pot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013688,
        "dEQP-GLES31.functional.texture.gather.offsets.min_require",
        "d_offset.2d.rgba8ui.size_pot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013716,
        "dEQP-GLES31.functional.texture.gather.offsets.min_requir",
        "ed_offset.2d_array.rgba8ui.size_pot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013717,
        "dEQP-GLES31.functional.texture.gather.offsets.min_require",
        "d_offset.2d_array.rgba8ui.size_pot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013718,
        "dEQP-GLES31.functional.texture.gather.offsets.min_required_o",
        "ffset.2d_array.rgba8ui.size_pot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013760,
        "dEQP-GLES31.functional.texture.gather.offsets.implemen",
        "tation_offset.2d.rgba8ui.size_pot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013761,
        "dEQP-GLES31.functional.texture.gather.offsets.implement",
        "ation_offset.2d.rgba8ui.size_pot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013762,
        "dEQP-GLES31.functional.texture.gather.offsets.implementati",
        "on_offset.2d.rgba8ui.size_pot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013829,
        "dEQP-GLES31.functional.texture.gather.offsets.implementat",
        "ion_offset.2d_array.rgba8ui.size_pot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013830,
        "dEQP-GLES31.functional.texture.gather.offsets.implementati",
        "on_offset.2d_array.rgba8ui.size_pot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013831,
        "dEQP-GLES31.functional.texture.gather.offsets.implementation_",
        "offset.2d_array.rgba8ui.size_pot.mirrored_repeat_clamp_to_edge");
