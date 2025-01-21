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
#include "../Khrgles31BaseFunc.h"
#include "../ActsKhrgles310003TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002059,
        "KHR-GLES31.core.draw_indi",
        "rect.basic-binding-default");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002060,
        "KHR-GLES31.core.draw_ind",
        "irect.basic-binding-zero");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002061,
        "KHR-GLES31.core.draw_indi",
        "rect.basic-binding-single");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002062,
        "KHR-GLES31.core.draw_ind",
        "irect.basic-binding-multi");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002063,
        "KHR-GLES31.core.draw_indi",
        "rect.basic-binding-delete");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002064,
        "KHR-GLES31.core.draw_in",
        "direct.basic-buffer-data");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002065,
        "KHR-GLES31.core.draw_indi",
        "rect.basic-buffer-subData");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002066,
        "KHR-GLES31.core.draw_indire",
        "ct.basic-buffer-getPointerv");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002067,
        "KHR-GLES31.core.draw_indi",
        "rect.basic-buffer-mapRange");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002068,
        "KHR-GLES31.core.draw_indirect",
        ".basic-buffer-flushMappedRange");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002069,
        "KHR-GLES31.core.draw_indire",
        "ct.basic-buffer-copySubData");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002070,
        "KHR-GLES31.core.draw_indirect.b",
        "asic-drawArrays-singlePrimitive");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002071,
        "KHR-GLES31.core.draw_indirect.",
        "basic-drawArrays-manyPrimitives");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002072,
        "KHR-GLES31.core.draw_indirec",
        "t.basic-drawArrays-instancing");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002073,
        "KHR-GLES31.core.draw_indirec",
        "t.basic-drawArrays-xfbPaused");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002074,
        "KHR-GLES31.core.draw_indirect.ba",
        "sic-drawElements-singlePrimitive");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002075,
        "KHR-GLES31.core.draw_indirect.b",
        "asic-drawElements-manyPrimitives");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002076,
        "KHR-GLES31.core.draw_indirect",
        ".basic-drawElements-instancing");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002077,
        "KHR-GLES31.core.draw_indirect",
        ".basic-drawElements-xfbPaused");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002078,
        "KHR-GLES31.core.draw_indir",
        "ect.basic-drawArrays-simple");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002079,
        "KHR-GLES31.core.draw_indire",
        "ct.basic-drawArrays-noFirst");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002080,
        "KHR-GLES31.core.draw_indirect",
        ".basic-drawArrays-bufferOffset");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002081,
        "KHR-GLES31.core.draw_indirec",
        "t.basic-drawArrays-vertexIds");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002082,
        "KHR-GLES31.core.draw_indire",
        "ct.basic-drawElements-simple");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002083,
        "KHR-GLES31.core.draw_indirect.",
        "basic-drawElements-noFirstIndex");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002084,
        "KHR-GLES31.core.draw_indirect",
        ".basic-drawElements-basevertex");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002085,
        "KHR-GLES31.core.draw_indirect.",
        "basic-drawElements-bufferOffset");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002086,
        "KHR-GLES31.core.draw_indirect",
        ".basic-drawElements-vertexIds");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002087,
        "KHR-GLES31.core.draw_indirect.bas",
        "ic-indicesDataType-unsigned_short");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002088,
        "KHR-GLES31.core.draw_indirect.ba",
        "sic-indicesDataType-unsigned_byte");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002089,
        "KHR-GLES31.core.draw_indirect",
        ".basic-mode-drawArrays-points");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002090,
        "KHR-GLES31.core.draw_indirec",
        "t.basic-mode-drawArrays-lines");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002091,
        "KHR-GLES31.core.draw_indirect.b",
        "asic-mode-drawArrays-line_strip");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002092,
        "KHR-GLES31.core.draw_indirect.",
        "basic-mode-drawArrays-line_loop");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002093,
        "KHR-GLES31.core.draw_indirect.bas",
        "ic-mode-drawArrays-triangle_strip");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002094,
        "KHR-GLES31.core.draw_indirect.ba",
        "sic-mode-drawArrays-triangle_fan");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002095,
        "KHR-GLES31.core.draw_indirect.bas",
        "ic-mode-drawArrays-lines_adjacency");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002096,
        "KHR-GLES31.core.draw_indirect.basic-",
        "mode-drawArrays-line_strip_adjacency");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002097,
        "KHR-GLES31.core.draw_indirect.basic",
        "-mode-drawArrays-triangles_adjacency");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002098,
        "KHR-GLES31.core.draw_indirect.basic-mo",
        "de-drawArrays-triangle_strip_adjacency");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002099,
        "KHR-GLES31.core.draw_indirect.",
        "basic-mode-drawElements-points");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002100,
        "KHR-GLES31.core.draw_indirect",
        ".basic-mode-drawElements-lines");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002101,
        "KHR-GLES31.core.draw_indirect.ba",
        "sic-mode-drawElements-line_strip");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002102,
        "KHR-GLES31.core.draw_indirect.b",
        "asic-mode-drawElements-line_loop");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002103,
        "KHR-GLES31.core.draw_indirect.basi",
        "c-mode-drawElements-triangle_strip");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002104,
        "KHR-GLES31.core.draw_indirect.bas",
        "ic-mode-drawElements-triangle_fan");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002105,
        "KHR-GLES31.core.draw_indirect.basi",
        "c-mode-drawElements-lines_adjacency");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002106,
        "KHR-GLES31.core.draw_indirect.basic-m",
        "ode-drawElements-line_strip_adjacency");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002107,
        "KHR-GLES31.core.draw_indirect.basic-",
        "mode-drawElements-triangles_adjacency");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002108,
        "KHR-GLES31.core.draw_indirect.basic-mod",
        "e-drawElements-triangle_strip_adjacency");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002109,
        "KHR-GLES31.core.draw_indirect.advan",
        "ced-twoPass-transformFeedback-arrays");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002110,
        "KHR-GLES31.core.draw_indirect.advanc",
        "ed-twoPass-transformFeedback-elements");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002111,
        "KHR-GLES31.core.draw_indirect.",
        "advanced-twoPass-Compute-arrays");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002112,
        "KHR-GLES31.core.draw_indirect.a",
        "dvanced-twoPass-Compute-elements");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002113,
        "KHR-GLES31.core.draw_indirect.ad",
        "vanced-primitiveRestart-elements");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002114,
        "KHR-GLES31.core.draw_indirec",
        "t.negative-noindirect-arrays");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002115,
        "KHR-GLES31.core.draw_indirect",
        ".negative-noindirect-elements");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002116,
        "KHR-GLES31.core.draw_indirec",
        "t.negative-invalidMode-arrays");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002117,
        "KHR-GLES31.core.draw_indirect",
        ".negative-invalidMode-elements");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002118,
        "KHR-GLES31.core.draw_indi",
        "rect.negative-noVAO-arrays");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002119,
        "KHR-GLES31.core.draw_indir",
        "ect.negative-noVAO-elements");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002120,
        "KHR-GLES31.core.draw_indi",
        "rect.negative-noVBO-arrays");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002121,
        "KHR-GLES31.core.draw_indir",
        "ect.negative-noVBO-elements");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002122,
        "KHR-GLES31.core.draw_indirect",
        ".negative-bufferMapped-arrays");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002123,
        "KHR-GLES31.core.draw_indirect.",
        "negative-bufferMapped-elements");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002124,
        "KHR-GLES31.core.draw_indirect",
        ".negative-invalidType-elements");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002125,
        "KHR-GLES31.core.draw_indirec",
        "t.negative-wrongOffset-arrays");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002126,
        "KHR-GLES31.core.draw_indirect",
        ".negative-wrongOffset-elements");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002127,
        "KHR-GLES31.core.draw_indirec",
        "t.negative-invalidSize-arrays");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002128,
        "KHR-GLES31.core.draw_indirect",
        ".negative-invalidSize-elements");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002129,
        "KHR-GLES31.core.draw_indire",
        "ct.negative-unalignedOffset");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002130,
        "KHR-GLES31.core.draw_",
        "indirect.negative-xfb");
