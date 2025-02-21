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
#include "../ActsDeqpgles310017TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016321,
        "dEQP-GLES31.functional.geometry_sh",
        "ading.input.basic_primitive.points");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016322,
        "dEQP-GLES31.functional.geometry_s",
        "hading.input.basic_primitive.lines");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016323,
        "dEQP-GLES31.functional.geometry_sha",
        "ding.input.basic_primitive.line_loop");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016324,
        "dEQP-GLES31.functional.geometry_shad",
        "ing.input.basic_primitive.line_strip");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016325,
        "dEQP-GLES31.functional.geometry_sha",
        "ding.input.basic_primitive.triangles");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016326,
        "dEQP-GLES31.functional.geometry_shadin",
        "g.input.basic_primitive.triangle_strip");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016327,
        "dEQP-GLES31.functional.geometry_shadi",
        "ng.input.basic_primitive.triangle_fan");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016328,
        "dEQP-GLES31.functional.geometry_shadin",
        "g.input.basic_primitive.lines_adjacency");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016329,
        "dEQP-GLES31.functional.geometry_shading.i",
        "nput.basic_primitive.line_strip_adjacency");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016330,
        "dEQP-GLES31.functional.geometry_shading.",
        "input.basic_primitive.triangles_adjacency");
