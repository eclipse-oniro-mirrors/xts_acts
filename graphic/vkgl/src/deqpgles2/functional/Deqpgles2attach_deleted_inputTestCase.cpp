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

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016485,
        "dEQP-GLES2.functional.lifetime.atta",
        "ch.deleted_input.texture_framebuffer");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016486,
        "dEQP-GLES2.functional.lifetime.attach.",
        "deleted_input.renderbuffer_framebuffer");

static SHRINK_HWTEST_F(ActsDeqpgles20017TestSuite, TestCase_016487,
        "dEQP-GLES2.functional.lifetime.at",
        "tach.deleted_input.shader_program");
