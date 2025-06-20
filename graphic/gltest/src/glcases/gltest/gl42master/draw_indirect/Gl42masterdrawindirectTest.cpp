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
#include "../Gl42masterBaseFunc.h"
#include "../ActsGl42master0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005268,
    "KHR-GL42.draw_indirect.basic-binding-default");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005269,
    "KHR-GL42.draw_indirect.basic-binding-zero");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005270,
    "KHR-GL42.draw_indirect.basic-binding-single");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005271,
    "KHR-GL42.draw_indirect.basic-binding-multi");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005272,
    "KHR-GL42.draw_indirect.basic-binding-delete");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005273,
    "KHR-GL42.draw_indirect.basic-buffer-data");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005274,
    "KHR-GL42.draw_indirect.basic-buffer-subData");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005275,
    "KHR-GL42.draw_indirect.basic-buffer-unMap");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005276,
    "KHR-GL42.draw_indirect.basic-buffer-getPointerv");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005277,
    "KHR-GL42.draw_indirect.basic-buffer-mapRange");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005278,
    "KHR-GL42.draw_indirect.basic-buffer-flushMappedRange");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005279,
    "KHR-GL42.draw_indirect.basic-buffer-copySubData");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005280,
    "KHR-GL42.draw_indirect.basic-drawArrays-singlePrimitive");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005281,
    "KHR-GL42.draw_indirect.basic-drawArrays-manyPrimitives");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005282,
    "KHR-GL42.draw_indirect.basic-drawArrays-instancing");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005283,
    "KHR-GL42.draw_indirect.basic-drawArrays-xfbPaused");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005284,
    "KHR-GL42.draw_indirect.basic-drawElements-singlePrimitive");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005285,
    "KHR-GL42.draw_indirect.basic-drawElements-manyPrimitives");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005286,
    "KHR-GL42.draw_indirect.basic-drawElements-instancing");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005287,
    "KHR-GL42.draw_indirect.basic-drawElements-xfbPaused");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005288,
    "KHR-GL42.draw_indirect.basic-drawArrays-simple");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005289,
    "KHR-GL42.draw_indirect.basic-drawArrays-noFirst");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005290,
    "KHR-GL42.draw_indirect.basic-drawArrays-bufferOffset");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005291,
    "KHR-GL42.draw_indirect.basic-drawArrays-vertexIds");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005292,
    "KHR-GL42.draw_indirect.basic-drawElements-simple");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005293,
    "KHR-GL42.draw_indirect.basic-drawElements-noFirstIndex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005294,
    "KHR-GL42.draw_indirect.basic-drawElements-basevertex");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005295,
    "KHR-GL42.draw_indirect.basic-drawElements-bufferOffset");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005296,
    "KHR-GL42.draw_indirect.basic-drawElements-vertexIds");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005297,
    "KHR-GL42.draw_indirect.basic-indicesDataType-unsigned_short");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005298,
    "KHR-GL42.draw_indirect.basic-indicesDataType-unsigned_byte");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005299,
    "KHR-GL42.draw_indirect.basic-mode-drawArrays-points");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005300,
    "KHR-GL42.draw_indirect.basic-mode-drawArrays-lines");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005301,
    "KHR-GL42.draw_indirect.basic-mode-drawArrays-line_strip");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005302,
    "KHR-GL42.draw_indirect.basic-mode-drawArrays-line_loop");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005303,
    "KHR-GL42.draw_indirect.basic-mode-drawArrays-triangle_strip");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005304,
    "KHR-GL42.draw_indirect.basic-mode-drawArrays-triangle_fan");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005305,
    "KHR-GL42.draw_indirect.basic-mode-drawArrays-lines_adjacency");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005306,
    "KHR-GL42.draw_indirect.basic-mode-drawArrays-line_strip_adjacency");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005307,
    "KHR-GL42.draw_indirect.basic-mode-drawArrays-triangles_adjacency");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005308,
    "KHR-GL42.draw_indirect.basic-mode-drawArrays-triangle_strip_adjacency");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005309,
    "KHR-GL42.draw_indirect.basic-mode-drawElements-points");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005310,
    "KHR-GL42.draw_indirect.basic-mode-drawElements-lines");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005311,
    "KHR-GL42.draw_indirect.basic-mode-drawElements-line_strip");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005312,
    "KHR-GL42.draw_indirect.basic-mode-drawElements-line_loop");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005313,
    "KHR-GL42.draw_indirect.basic-mode-drawElements-triangle_strip");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005314,
    "KHR-GL42.draw_indirect.basic-mode-drawElements-triangle_fan");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005315,
    "KHR-GL42.draw_indirect.basic-mode-drawElements-lines_adjacency");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005316,
    "KHR-GL42.draw_indirect.basic-mode-drawElements-line_strip_adjacency");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005317,
    "KHR-GL42.draw_indirect.basic-mode-drawElements-triangles_adjacency");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005318,
    "KHR-GL42.draw_indirect.basic-mode-drawElements-triangle_strip_adjacency");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005319,
    "KHR-GL42.draw_indirect.advanced-twoPass-transformFeedback-arrays");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005320,
    "KHR-GL42.draw_indirect.advanced-twoPass-transformFeedback-elements");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005321,
    "KHR-GL42.draw_indirect.advanced-primitiveRestart-elements");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005322,
    "KHR-GL42.draw_indirect.negative-noindirect-arrays");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005323,
    "KHR-GL42.draw_indirect.negative-noindirect-elements");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005324,
    "KHR-GL42.draw_indirect.negative-invalidMode-arrays");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005325,
    "KHR-GL42.draw_indirect.negative-invalidMode-elements");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005326,
    "KHR-GL42.draw_indirect.negative-noVAO-arrays");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005327,
    "KHR-GL42.draw_indirect.negative-noVAO-elements");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005328,
    "KHR-GL42.draw_indirect.negative-bufferMapped-arrays");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005329,
    "KHR-GL42.draw_indirect.negative-bufferMapped-elements");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005330,
    "KHR-GL42.draw_indirect.negative-invalidType-elements");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005331,
    "KHR-GL42.draw_indirect.negative-gshIncompatible-arrays");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005332,
    "KHR-GL42.draw_indirect.negative-gshIncompatible-elements");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005333,
    "KHR-GL42.draw_indirect.negative-wrongOffset-arrays");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005334,
    "KHR-GL42.draw_indirect.negative-wrongOffset-elements");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005335,
    "KHR-GL42.draw_indirect.negative-invalidSize-arrays");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005336,
    "KHR-GL42.draw_indirect.negative-invalidSize-elements");

static SHRINK_HWTEST_SF(ActsGl42master0001TestSuite, TestCase_005337,
    "KHR-GL42.draw_indirect.negative-unalignedOffset");
