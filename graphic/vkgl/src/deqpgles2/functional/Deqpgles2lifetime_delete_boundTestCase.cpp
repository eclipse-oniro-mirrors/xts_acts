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
#include "../ActsDeqpgles20017TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016473,
        "dEQP-GLES2.functional.lif",
        "etime.delete_bound.buffer");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016474,
        "dEQP-GLES2.functional.lif",
        "etime.delete_bound.texture");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016475,
        "dEQP-GLES2.functional.lifeti",
        "me.delete_bound.renderbuffer");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016476,
        "dEQP-GLES2.functional.lifet",
        "ime.delete_bound.framebuffer");
