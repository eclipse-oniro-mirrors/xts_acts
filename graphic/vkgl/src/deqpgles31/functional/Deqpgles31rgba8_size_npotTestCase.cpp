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

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013069,
        "dEQP-GLES31.functional.texture.gather.bas",
        "ic.2d.rgba8.size_npot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013070,
        "dEQP-GLES31.functional.texture.gather.basi",
        "c.2d.rgba8.size_npot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013071,
        "dEQP-GLES31.functional.texture.gather.basic.2d",
        ".rgba8.size_npot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013138,
        "dEQP-GLES31.functional.texture.gather.basic.",
        "2d_array.rgba8.size_npot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013139,
        "dEQP-GLES31.functional.texture.gather.basic.2",
        "d_array.rgba8.size_npot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013140,
        "dEQP-GLES31.functional.texture.gather.basic.2d_ar",
        "ray.rgba8.size_npot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013207,
        "dEQP-GLES31.functional.texture.gather.basi",
        "c.cube.rgba8.size_npot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013208,
        "dEQP-GLES31.functional.texture.gather.basic",
        ".cube.rgba8.size_npot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013209,
        "dEQP-GLES31.functional.texture.gather.basic.cub",
        "e.rgba8.size_npot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013287,
        "dEQP-GLES31.functional.texture.gather.offset.min_req",
        "uired_offset.2d.rgba8.size_npot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013288,
        "dEQP-GLES31.functional.texture.gather.offset.min_requ",
        "ired_offset.2d.rgba8.size_npot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013289,
        "dEQP-GLES31.functional.texture.gather.offset.min_require",
        "d_offset.2d.rgba8.size_npot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013317,
        "dEQP-GLES31.functional.texture.gather.offset.min_requir",
        "ed_offset.2d_array.rgba8.size_npot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013318,
        "dEQP-GLES31.functional.texture.gather.offset.min_require",
        "d_offset.2d_array.rgba8.size_npot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013319,
        "dEQP-GLES31.functional.texture.gather.offset.min_required_o",
        "ffset.2d_array.rgba8.size_npot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013347,
        "dEQP-GLES31.functional.texture.gather.offset.implemen",
        "tation_offset.2d.rgba8.size_npot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013348,
        "dEQP-GLES31.functional.texture.gather.offset.implement",
        "ation_offset.2d.rgba8.size_npot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013349,
        "dEQP-GLES31.functional.texture.gather.offset.implementati",
        "on_offset.2d.rgba8.size_npot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013416,
        "dEQP-GLES31.functional.texture.gather.offset.implementat",
        "ion_offset.2d_array.rgba8.size_npot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013417,
        "dEQP-GLES31.functional.texture.gather.offset.implementati",
        "on_offset.2d_array.rgba8.size_npot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013418,
        "dEQP-GLES31.functional.texture.gather.offset.implementation_",
        "offset.2d_array.rgba8.size_npot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013485,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.min",
        "_required_offset.2d.rgba8.size_npot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013486,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.min_",
        "required_offset.2d.rgba8.size_npot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013487,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.min_req",
        "uired_offset.2d.rgba8.size_npot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013515,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.min_re",
        "quired_offset.2d_array.rgba8.size_npot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013516,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.min_req",
        "uired_offset.2d_array.rgba8.size_npot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013517,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.min_requir",
        "ed_offset.2d_array.rgba8.size_npot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013545,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.impl",
        "ementation_offset.2d.rgba8.size_npot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013546,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.imple",
        "mentation_offset.2d.rgba8.size_npot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013547,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implemen",
        "tation_offset.2d.rgba8.size_npot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013614,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.impleme",
        "ntation_offset.2d_array.rgba8.size_npot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013615,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implemen",
        "tation_offset.2d_array.rgba8.size_npot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013616,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implementat",
        "ion_offset.2d_array.rgba8.size_npot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013683,
        "dEQP-GLES31.functional.texture.gather.offsets.min_re",
        "quired_offset.2d.rgba8.size_npot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013684,
        "dEQP-GLES31.functional.texture.gather.offsets.min_req",
        "uired_offset.2d.rgba8.size_npot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013685,
        "dEQP-GLES31.functional.texture.gather.offsets.min_require",
        "d_offset.2d.rgba8.size_npot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013713,
        "dEQP-GLES31.functional.texture.gather.offsets.min_requi",
        "red_offset.2d_array.rgba8.size_npot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013714,
        "dEQP-GLES31.functional.texture.gather.offsets.min_requir",
        "ed_offset.2d_array.rgba8.size_npot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013715,
        "dEQP-GLES31.functional.texture.gather.offsets.min_required_o",
        "ffset.2d_array.rgba8.size_npot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013743,
        "dEQP-GLES31.functional.texture.gather.offsets.impleme",
        "ntation_offset.2d.rgba8.size_npot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013744,
        "dEQP-GLES31.functional.texture.gather.offsets.implemen",
        "tation_offset.2d.rgba8.size_npot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013745,
        "dEQP-GLES31.functional.texture.gather.offsets.implementati",
        "on_offset.2d.rgba8.size_npot.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013812,
        "dEQP-GLES31.functional.texture.gather.offsets.implementa",
        "tion_offset.2d_array.rgba8.size_npot.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013813,
        "dEQP-GLES31.functional.texture.gather.offsets.implementat",
        "ion_offset.2d_array.rgba8.size_npot.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013814,
        "dEQP-GLES31.functional.texture.gather.offsets.implementation_",
        "offset.2d_array.rgba8.size_npot.mirrored_repeat_clamp_to_edge");
