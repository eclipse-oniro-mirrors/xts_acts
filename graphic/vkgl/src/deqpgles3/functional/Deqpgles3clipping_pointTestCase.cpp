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
#include "../Deqpgles3BaseFunc.h"
#include "../ActsDeqpgles30044TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043301,
        "dEQP-GLES3.functional.cl",
        "ipping.point.point_z_clip");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043302,
        "dEQP-GLES3.functional.clipping.p",
        "oint.point_z_clip_viewport_center");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043303,
        "dEQP-GLES3.functional.clipping.p",
        "oint.point_z_clip_viewport_corner");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043304,
        "dEQP-GLES3.functional.clipping.",
        "point.point_clip_viewport_center");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043305,
        "dEQP-GLES3.functional.clipping.",
        "point.point_clip_viewport_corner");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043306,
        "dEQP-GLES3.functional.clipp",
        "ing.point.wide_point_z_clip");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043307,
        "dEQP-GLES3.functional.clipping.poin",
        "t.wide_point_z_clip_viewport_center");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043308,
        "dEQP-GLES3.functional.clipping.poin",
        "t.wide_point_z_clip_viewport_corner");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043309,
        "dEQP-GLES3.functional.clip",
        "ping.point.wide_point_clip");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043310,
        "dEQP-GLES3.functional.clipping.poi",
        "nt.wide_point_clip_viewport_center");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043311,
        "dEQP-GLES3.functional.clipping.poi",
        "nt.wide_point_clip_viewport_corner");