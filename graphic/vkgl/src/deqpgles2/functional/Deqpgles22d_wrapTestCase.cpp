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

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010947,
        "dEQP-GLES2.functional.textur",
        "e.vertex.2d.wrap.clamp_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010948,
        "dEQP-GLES2.functional.textur",
        "e.vertex.2d.wrap.clamp_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010949,
        "dEQP-GLES2.functional.textur",
        "e.vertex.2d.wrap.clamp_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010950,
        "dEQP-GLES2.functional.textur",
        "e.vertex.2d.wrap.repeat_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010951,
        "dEQP-GLES2.functional.texture",
        ".vertex.2d.wrap.repeat_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010952,
        "dEQP-GLES2.functional.texture",
        ".vertex.2d.wrap.repeat_mirror");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010953,
        "dEQP-GLES2.functional.textur",
        "e.vertex.2d.wrap.mirror_clamp");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010954,
        "dEQP-GLES2.functional.texture",
        ".vertex.2d.wrap.mirror_repeat");

static SHRINK_HWTEST_F(ActsDeqpgles20011TestSuite, TestCase_010955,
        "dEQP-GLES2.functional.texture",
        ".vertex.2d.wrap.mirror_mirror");
