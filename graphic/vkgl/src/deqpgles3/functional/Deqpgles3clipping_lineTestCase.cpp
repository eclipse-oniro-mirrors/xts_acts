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

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043312,
        "dEQP-GLES3.functional.c",
        "lipping.line.line_z_clip");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043313,
        "dEQP-GLES3.functional.clipping.",
        "line.line_z_clip_viewport_center");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043314,
        "dEQP-GLES3.functional.clipping.",
        "line.line_z_clip_viewport_corner");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043315,
        "dEQP-GLES3.functional.clipping",
        ".line.line_clip_viewport_center");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043316,
        "dEQP-GLES3.functional.clipping",
        ".line.line_clip_viewport_corner");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043317,
        "dEQP-GLES3.functional.clip",
        "ping.line.wide_line_z_clip");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043318,
        "dEQP-GLES3.functional.clipping.lin",
        "e.wide_line_z_clip_viewport_center");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043319,
        "dEQP-GLES3.functional.clipping.lin",
        "e.wide_line_z_clip_viewport_corner");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043320,
        "dEQP-GLES3.functional.cli",
        "pping.line.wide_line_clip");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043321,
        "dEQP-GLES3.functional.clipping.li",
        "ne.wide_line_clip_viewport_center");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043322,
        "dEQP-GLES3.functional.clipping.li",
        "ne.wide_line_clip_viewport_corner");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043323,
        "dEQP-GLES3.functional.cli",
        "pping.line.long_line_clip");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043324,
        "dEQP-GLES3.functional.clipp",
        "ing.line.long_wide_line_clip");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043325,
        "dEQP-GLES3.functional.clip",
        "ping.line.line_attrib_clip");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043326,
        "dEQP-GLES3.functional.clippi",
        "ng.line.wide_line_attrib_clip");
