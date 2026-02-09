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
#include "../ActsDeqpgles20001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000026,
        "dEQP-GLES2.functional",
        ".clip_control.initial");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000027,
        "dEQP-GLES2.functional.",
        "clip_control.modify_get");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000028,
        "dEQP-GLES2.functiona",
        "l.clip_control.errors");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000029,
        "dEQP-GLES2.functiona",
        "l.clip_control.origin");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000030,
        "dEQP-GLES2.functional.clip_c",
        "ontrol.depth_mode_zero_to_one");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000031,
        "dEQP-GLES2.functional.clip_c",
        "ontrol.depth_mode_one_to_one");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000032,
        "dEQP-GLES2.functional.c",
        "lip_control.face_culling");

static SHRINK_HWTEST_F(ActsDeqpgles20001TestSuite, TestCase_000033,
        "dEQP-GLES2.functional.cli",
        "p_control.viewport_bounds");
