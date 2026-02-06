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
#include "../Deqpgles2BaseFunc.h"
#include "../ActsDeqpgles20016TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015712,
        "dEQP-GLES2.functional.c",
        "lipping.line.line_z_clip");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015713,
        "dEQP-GLES2.functional.clipping.",
        "line.line_z_clip_viewport_center");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015714,
        "dEQP-GLES2.functional.clipping.",
        "line.line_z_clip_viewport_corner");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015715,
        "dEQP-GLES2.functional.clipping",
        ".line.line_clip_viewport_center");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015716,
        "dEQP-GLES2.functional.clipping",
        ".line.line_clip_viewport_corner");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015717,
        "dEQP-GLES2.functional.clip",
        "ping.line.wide_line_z_clip");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015718,
        "dEQP-GLES2.functional.clipping.lin",
        "e.wide_line_z_clip_viewport_center");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015719,
        "dEQP-GLES2.functional.clipping.lin",
        "e.wide_line_z_clip_viewport_corner");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015720,
        "dEQP-GLES2.functional.cli",
        "pping.line.wide_line_clip");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015721,
        "dEQP-GLES2.functional.clipping.li",
        "ne.wide_line_clip_viewport_center");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015722,
        "dEQP-GLES2.functional.clipping.li",
        "ne.wide_line_clip_viewport_corner");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015723,
        "dEQP-GLES2.functional.cli",
        "pping.line.long_line_clip");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015724,
        "dEQP-GLES2.functional.clipp",
        "ing.line.long_wide_line_clip");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015725,
        "dEQP-GLES2.functional.clip",
        "ping.line.line_attrib_clip");

static SHRINK_HWTEST_F(ActsDeqpgles20016TestSuite, TestCase_015726,
        "dEQP-GLES2.functional.clippi",
        "ng.line.wide_line_attrib_clip");
