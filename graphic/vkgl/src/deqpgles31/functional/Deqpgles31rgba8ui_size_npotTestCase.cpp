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

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013089,
        "dEQP-GLES31.functional.texture.gather.basi",
        "c.2d.rgba8ui.size_npot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013090,
        "dEQP-GLES31.functional.texture.gather.basic",
        ".2d.rgba8ui.size_npot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013091,
        "dEQP-GLES31.functional.texture.gather.basic.2d.",
        "rgba8ui.size_npot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013158,
        "dEQP-GLES31.functional.texture.gather.basic.2",
        "d_array.rgba8ui.size_npot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013159,
        "dEQP-GLES31.functional.texture.gather.basic.2d",
        "_array.rgba8ui.size_npot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013160,
        "dEQP-GLES31.functional.texture.gather.basic.2d_arr",
        "ay.rgba8ui.size_npot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013233,
        "dEQP-GLES31.functional.texture.gather.basic",
        ".cube.rgba8ui.size_npot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013234,
        "dEQP-GLES31.functional.texture.gather.basic.",
        "cube.rgba8ui.size_npot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013235,
        "dEQP-GLES31.functional.texture.gather.basic.cube",
        ".rgba8ui.size_npot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013293,
        "dEQP-GLES31.functional.texture.gather.offset.min_requ",
        "ired_offset.2d.rgba8ui.size_npot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013294,
        "dEQP-GLES31.functional.texture.gather.offset.min_requi",
        "red_offset.2d.rgba8ui.size_npot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013295,
        "dEQP-GLES31.functional.texture.gather.offset.min_required",
        "_offset.2d.rgba8ui.size_npot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013323,
        "dEQP-GLES31.functional.texture.gather.offset.min_require",
        "d_offset.2d_array.rgba8ui.size_npot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013324,
        "dEQP-GLES31.functional.texture.gather.offset.min_required",
        "_offset.2d_array.rgba8ui.size_npot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013325,
        "dEQP-GLES31.functional.texture.gather.offset.min_required_of",
        "fset.2d_array.rgba8ui.size_npot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013367,
        "dEQP-GLES31.functional.texture.gather.offset.implement",
        "ation_offset.2d.rgba8ui.size_npot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013368,
        "dEQP-GLES31.functional.texture.gather.offset.implementa",
        "tion_offset.2d.rgba8ui.size_npot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013369,
        "dEQP-GLES31.functional.texture.gather.offset.implementatio",
        "n_offset.2d.rgba8ui.size_npot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013436,
        "dEQP-GLES31.functional.texture.gather.offset.implementati",
        "on_offset.2d_array.rgba8ui.size_npot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013437,
        "dEQP-GLES31.functional.texture.gather.offset.implementatio",
        "n_offset.2d_array.rgba8ui.size_npot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013438,
        "dEQP-GLES31.functional.texture.gather.offset.implementation_o",
        "ffset.2d_array.rgba8ui.size_npot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013491,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.min_",
        "required_offset.2d.rgba8ui.size_npot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013492,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.min_r",
        "equired_offset.2d.rgba8ui.size_npot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013493,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.min_requ",
        "ired_offset.2d.rgba8ui.size_npot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013521,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.min_req",
        "uired_offset.2d_array.rgba8ui.size_npot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013522,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.min_requ",
        "ired_offset.2d_array.rgba8ui.size_npot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013523,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.min_require",
        "d_offset.2d_array.rgba8ui.size_npot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013565,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.imple",
        "mentation_offset.2d.rgba8ui.size_npot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013566,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implem",
        "entation_offset.2d.rgba8ui.size_npot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013567,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implement",
        "ation_offset.2d.rgba8ui.size_npot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013634,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implemen",
        "tation_offset.2d_array.rgba8ui.size_npot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013635,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implement",
        "ation_offset.2d_array.rgba8ui.size_npot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013636,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implementati",
        "on_offset.2d_array.rgba8ui.size_npot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013689,
        "dEQP-GLES31.functional.texture.gather.offsets.min_req",
        "uired_offset.2d.rgba8ui.size_npot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013690,
        "dEQP-GLES31.functional.texture.gather.offsets.min_requ",
        "ired_offset.2d.rgba8ui.size_npot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013691,
        "dEQP-GLES31.functional.texture.gather.offsets.min_required",
        "_offset.2d.rgba8ui.size_npot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013719,
        "dEQP-GLES31.functional.texture.gather.offsets.min_requir",
        "ed_offset.2d_array.rgba8ui.size_npot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013720,
        "dEQP-GLES31.functional.texture.gather.offsets.min_require",
        "d_offset.2d_array.rgba8ui.size_npot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013721,
        "dEQP-GLES31.functional.texture.gather.offsets.min_required_of",
        "fset.2d_array.rgba8ui.size_npot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013763,
        "dEQP-GLES31.functional.texture.gather.offsets.implemen",
        "tation_offset.2d.rgba8ui.size_npot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013764,
        "dEQP-GLES31.functional.texture.gather.offsets.implement",
        "ation_offset.2d.rgba8ui.size_npot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013765,
        "dEQP-GLES31.functional.texture.gather.offsets.implementatio",
        "n_offset.2d.rgba8ui.size_npot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013832,
        "dEQP-GLES31.functional.texture.gather.offsets.implementat",
        "ion_offset.2d_array.rgba8ui.size_npot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013833,
        "dEQP-GLES31.functional.texture.gather.offsets.implementati",
        "on_offset.2d_array.rgba8ui.size_npot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013834,
        "dEQP-GLES31.functional.texture.gather.offsets.implementation_o",
        "ffset.2d_array.rgba8ui.size_npot.mirrored_repeat_clamp_to_edge");
