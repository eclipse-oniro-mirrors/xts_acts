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

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013066,
        "dEQP-GLES31.functional.texture.gather.bas",
        "ic.2d.rgba8.size_pot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013067,
        "dEQP-GLES31.functional.texture.gather.basi",
        "c.2d.rgba8.size_pot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013068,
        "dEQP-GLES31.functional.texture.gather.basic.2",
        "d.rgba8.size_pot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013135,
        "dEQP-GLES31.functional.texture.gather.basic.",
        "2d_array.rgba8.size_pot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013136,
        "dEQP-GLES31.functional.texture.gather.basic.2",
        "d_array.rgba8.size_pot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013137,
        "dEQP-GLES31.functional.texture.gather.basic.2d_a",
        "rray.rgba8.size_pot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013204,
        "dEQP-GLES31.functional.texture.gather.basi",
        "c.cube.rgba8.size_pot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013205,
        "dEQP-GLES31.functional.texture.gather.basic",
        ".cube.rgba8.size_pot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013206,
        "dEQP-GLES31.functional.texture.gather.basic.cu",
        "be.rgba8.size_pot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013284,
        "dEQP-GLES31.functional.texture.gather.offset.min_re",
        "quired_offset.2d.rgba8.size_pot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013285,
        "dEQP-GLES31.functional.texture.gather.offset.min_req",
        "uired_offset.2d.rgba8.size_pot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013286,
        "dEQP-GLES31.functional.texture.gather.offset.min_require",
        "d_offset.2d.rgba8.size_pot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013314,
        "dEQP-GLES31.functional.texture.gather.offset.min_requi",
        "red_offset.2d_array.rgba8.size_pot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013315,
        "dEQP-GLES31.functional.texture.gather.offset.min_requir",
        "ed_offset.2d_array.rgba8.size_pot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013316,
        "dEQP-GLES31.functional.texture.gather.offset.min_required_o",
        "ffset.2d_array.rgba8.size_pot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013344,
        "dEQP-GLES31.functional.texture.gather.offset.impleme",
        "ntation_offset.2d.rgba8.size_pot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013345,
        "dEQP-GLES31.functional.texture.gather.offset.implemen",
        "tation_offset.2d.rgba8.size_pot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013346,
        "dEQP-GLES31.functional.texture.gather.offset.implementati",
        "on_offset.2d.rgba8.size_pot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013413,
        "dEQP-GLES31.functional.texture.gather.offset.implementa",
        "tion_offset.2d_array.rgba8.size_pot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013414,
        "dEQP-GLES31.functional.texture.gather.offset.implementat",
        "ion_offset.2d_array.rgba8.size_pot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013415,
        "dEQP-GLES31.functional.texture.gather.offset.implementation_",
        "offset.2d_array.rgba8.size_pot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013482,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.mi",
        "n_required_offset.2d.rgba8.size_pot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013483,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.min",
        "_required_offset.2d.rgba8.size_pot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013484,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.min_req",
        "uired_offset.2d.rgba8.size_pot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013512,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.min_r",
        "equired_offset.2d_array.rgba8.size_pot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013513,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.min_re",
        "quired_offset.2d_array.rgba8.size_pot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013514,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.min_requir",
        "ed_offset.2d_array.rgba8.size_pot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013542,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.imp",
        "lementation_offset.2d.rgba8.size_pot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013543,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.impl",
        "ementation_offset.2d.rgba8.size_pot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013544,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implemen",
        "tation_offset.2d.rgba8.size_pot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013611,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implem",
        "entation_offset.2d_array.rgba8.size_pot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013612,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.impleme",
        "ntation_offset.2d_array.rgba8.size_pot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013613,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implementat",
        "ion_offset.2d_array.rgba8.size_pot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013680,
        "dEQP-GLES31.functional.texture.gather.offsets.min_re",
        "quired_offset.2d.rgba8.size_pot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013681,
        "dEQP-GLES31.functional.texture.gather.offsets.min_req",
        "uired_offset.2d.rgba8.size_pot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013682,
        "dEQP-GLES31.functional.texture.gather.offsets.min_requir",
        "ed_offset.2d.rgba8.size_pot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013710,
        "dEQP-GLES31.functional.texture.gather.offsets.min_requi",
        "red_offset.2d_array.rgba8.size_pot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013711,
        "dEQP-GLES31.functional.texture.gather.offsets.min_requir",
        "ed_offset.2d_array.rgba8.size_pot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013712,
        "dEQP-GLES31.functional.texture.gather.offsets.min_required_",
        "offset.2d_array.rgba8.size_pot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013740,
        "dEQP-GLES31.functional.texture.gather.offsets.impleme",
        "ntation_offset.2d.rgba8.size_pot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013741,
        "dEQP-GLES31.functional.texture.gather.offsets.implemen",
        "tation_offset.2d.rgba8.size_pot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013742,
        "dEQP-GLES31.functional.texture.gather.offsets.implementat",
        "ion_offset.2d.rgba8.size_pot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013809,
        "dEQP-GLES31.functional.texture.gather.offsets.implementa",
        "tion_offset.2d_array.rgba8.size_pot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013810,
        "dEQP-GLES31.functional.texture.gather.offsets.implementat",
        "ion_offset.2d_array.rgba8.size_pot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013811,
        "dEQP-GLES31.functional.texture.gather.offsets.implementation",
        "_offset.2d_array.rgba8.size_pot.mirrored_repeat_clamp_to_edge");
