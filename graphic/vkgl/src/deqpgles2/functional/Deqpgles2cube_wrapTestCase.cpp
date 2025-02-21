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
#include "../ActsDeqpgles20011TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010992,
        "dEQP-GLES2.functional.texture",
        ".vertex.cube.wrap.clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010993,
        "dEQP-GLES2.functional.texture",
        ".vertex.cube.wrap.clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010994,
        "dEQP-GLES2.functional.texture",
        ".vertex.cube.wrap.clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010995,
        "dEQP-GLES2.functional.texture",
        ".vertex.cube.wrap.repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010996,
        "dEQP-GLES2.functional.texture.",
        "vertex.cube.wrap.repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010997,
        "dEQP-GLES2.functional.texture.",
        "vertex.cube.wrap.repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010998,
        "dEQP-GLES2.functional.texture",
        ".vertex.cube.wrap.mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010999,
        "dEQP-GLES2.functional.texture.",
        "vertex.cube.wrap.mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_011000,
        "dEQP-GLES2.functional.texture.",
        "vertex.cube.wrap.mirror_mirror");
