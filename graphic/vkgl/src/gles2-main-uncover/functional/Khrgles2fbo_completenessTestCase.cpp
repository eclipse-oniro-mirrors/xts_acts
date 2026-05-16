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
#include "../Khrgles2BaseFunc.h"
#include "../ActsGles2MainUncover0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000643,
        "dEQP-GLES2.functional.fbo.completenes",
        "s.renderable.renderbuffer.color0.bgra");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000644,
        "dEQP-GLES2.functional.fbo.completeness.",
        "renderable.renderbuffer.color0.bgra8_ext");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000645,
        "dEQP-GLES2.functional.fbo.completenes",
        "s.renderable.renderbuffer.stencil.bgra");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000646,
        "dEQP-GLES2.functional.fbo.completeness.r",
        "enderable.renderbuffer.stencil.bgra8_ext");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000647,
        "dEQP-GLES2.functional.fbo.completene",
        "ss.renderable.renderbuffer.depth.bgra");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000648,
        "dEQP-GLES2.functional.fbo.completeness.",
        "renderable.renderbuffer.depth.bgra8_ext");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000649,
        "dEQP-GLES2.functional.fbo.complete",
        "ness.renderable.texture.color0.bgra");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000650,
        "dEQP-GLES2.functional.fbo.completenes",
        "s.renderable.texture.color0.bgra8_ext");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000651,
        "dEQP-GLES2.functional.fbo.completen",
        "ess.renderable.texture.stencil.bgra");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000652,
        "dEQP-GLES2.functional.fbo.completenes",
        "s.renderable.texture.stencil.bgra8_ext");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000653,
        "dEQP-GLES2.functional.fbo.complete",
        "ness.renderable.texture.depth.bgra");

static SHRINK_HWTEST_F(ActsGles2MainUncover0001TestSuite, TestCase_000654,
        "dEQP-GLES2.functional.fbo.completene",
        "ss.renderable.texture.depth.bgra8_ext");
