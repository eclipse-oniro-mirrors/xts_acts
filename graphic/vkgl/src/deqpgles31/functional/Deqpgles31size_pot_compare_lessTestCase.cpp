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

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013116,
        "dEQP-GLES31.functional.texture.gather.basic.2d.de",
        "pth32f.size_pot.compare_less.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013117,
        "dEQP-GLES31.functional.texture.gather.basic.2d.dep",
        "th32f.size_pot.compare_less.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013118,
        "dEQP-GLES31.functional.texture.gather.basic.2d.depth3",
        "2f.size_pot.compare_less.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013185,
        "dEQP-GLES31.functional.texture.gather.basic.2d_array",
        ".depth32f.size_pot.compare_less.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013186,
        "dEQP-GLES31.functional.texture.gather.basic.2d_array.",
        "depth32f.size_pot.compare_less.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013187,
        "dEQP-GLES31.functional.texture.gather.basic.2d_array.dep",
        "th32f.size_pot.compare_less.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013272,
        "dEQP-GLES31.functional.texture.gather.basic.cube.depth3",
        "2f.no_corners.size_pot.compare_less.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013273,
        "dEQP-GLES31.functional.texture.gather.basic.cube.depth32",
        "f.no_corners.size_pot.compare_less.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013274,
        "dEQP-GLES31.functional.texture.gather.basic.cube.depth32f.no",
        "_corners.size_pot.compare_less.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013302,
        "dEQP-GLES31.functional.texture.gather.offset.min_required_o",
        "ffset.2d.depth32f.size_pot.compare_less.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013303,
        "dEQP-GLES31.functional.texture.gather.offset.min_required_of",
        "fset.2d.depth32f.size_pot.compare_less.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013304,
        "dEQP-GLES31.functional.texture.gather.offset.min_required_offset",
        ".2d.depth32f.size_pot.compare_less.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013332,
        "dEQP-GLES31.functional.texture.gather.offset.min_required_offs",
        "et.2d_array.depth32f.size_pot.compare_less.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013333,
        "dEQP-GLES31.functional.texture.gather.offset.min_required_offse",
        "t.2d_array.depth32f.size_pot.compare_less.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013334,
        "dEQP-GLES31.functional.texture.gather.offset.min_required_offset.2d",
        "_array.depth32f.size_pot.compare_less.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013394,
        "dEQP-GLES31.functional.texture.gather.offset.implementation_",
        "offset.2d.depth32f.size_pot.compare_less.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013395,
        "dEQP-GLES31.functional.texture.gather.offset.implementation_o",
        "ffset.2d.depth32f.size_pot.compare_less.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013396,
        "dEQP-GLES31.functional.texture.gather.offset.implementation_offse",
        "t.2d.depth32f.size_pot.compare_less.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013463,
        "dEQP-GLES31.functional.texture.gather.offset.implementation_off",
        "set.2d_array.depth32f.size_pot.compare_less.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013464,
        "dEQP-GLES31.functional.texture.gather.offset.implementation_offs",
        "et.2d_array.depth32f.size_pot.compare_less.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013465,
        "dEQP-GLES31.functional.texture.gather.offset.implementation_offset.2",
        "d_array.depth32f.size_pot.compare_less.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013500,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.min_requir",
        "ed_offset.2d.depth32f.size_pot.compare_less.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013501,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.min_require",
        "d_offset.2d.depth32f.size_pot.compare_less.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013502,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.min_required_of",
        "fset.2d.depth32f.size_pot.compare_less.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013530,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.min_required_",
        "offset.2d_array.depth32f.size_pot.compare_less.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013531,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.min_required_o",
        "ffset.2d_array.depth32f.size_pot.compare_less.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013532,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.min_required_offse",
        "t.2d_array.depth32f.size_pot.compare_less.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013592,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implementat",
        "ion_offset.2d.depth32f.size_pot.compare_less.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013593,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implementati",
        "on_offset.2d.depth32f.size_pot.compare_less.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013594,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implementation_o",
        "ffset.2d.depth32f.size_pot.compare_less.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013661,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implementation",
        "_offset.2d_array.depth32f.size_pot.compare_less.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013662,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implementation_",
        "offset.2d_array.depth32f.size_pot.compare_less.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013663,
        "dEQP-GLES31.functional.texture.gather.offset_dynamic.implementation_offs",
        "et.2d_array.depth32f.size_pot.compare_less.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013698,
        "dEQP-GLES31.functional.texture.gather.offsets.min_required_o",
        "ffset.2d.depth32f.size_pot.compare_less.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013699,
        "dEQP-GLES31.functional.texture.gather.offsets.min_required_of",
        "fset.2d.depth32f.size_pot.compare_less.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013700,
        "dEQP-GLES31.functional.texture.gather.offsets.min_required_offse",
        "t.2d.depth32f.size_pot.compare_less.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013728,
        "dEQP-GLES31.functional.texture.gather.offsets.min_required_offs",
        "et.2d_array.depth32f.size_pot.compare_less.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013729,
        "dEQP-GLES31.functional.texture.gather.offsets.min_required_offse",
        "t.2d_array.depth32f.size_pot.compare_less.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013730,
        "dEQP-GLES31.functional.texture.gather.offsets.min_required_offset.2",
        "d_array.depth32f.size_pot.compare_less.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013790,
        "dEQP-GLES31.functional.texture.gather.offsets.implementation_",
        "offset.2d.depth32f.size_pot.compare_less.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013791,
        "dEQP-GLES31.functional.texture.gather.offsets.implementation_o",
        "ffset.2d.depth32f.size_pot.compare_less.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013792,
        "dEQP-GLES31.functional.texture.gather.offsets.implementation_offs",
        "et.2d.depth32f.size_pot.compare_less.mirrored_repeat_clamp_to_edge");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013859,
        "dEQP-GLES31.functional.texture.gather.offsets.implementation_off",
        "set.2d_array.depth32f.size_pot.compare_less.clamp_to_edge_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013860,
        "dEQP-GLES31.functional.texture.gather.offsets.implementation_offs",
        "et.2d_array.depth32f.size_pot.compare_less.repeat_mirrored_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles310014TestSuite, TestCase_013861,
        "dEQP-GLES31.functional.texture.gather.offsets.implementation_offset.",
        "2d_array.depth32f.size_pot.compare_less.mirrored_repeat_clamp_to_edge");
