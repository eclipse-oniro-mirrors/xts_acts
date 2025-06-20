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
#include "../ActsDeqpgles30033TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032852,
        "dEQP-GLES3.functional.fbo.invalidate",
        ".target.framebuffer_framebuffer_color");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032853,
        "dEQP-GLES3.functional.fbo.invalidate.tar",
        "get.framebuffer_framebuffer_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032854,
        "dEQP-GLES3.functional.fbo.invalidat",
        "e.target.framebuffer_framebuffer_all");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032855,
        "dEQP-GLES3.functional.fbo.invalidate.ta",
        "rget.framebuffer_read_framebuffer_color");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032856,
        "dEQP-GLES3.functional.fbo.invalidate.target",
        ".framebuffer_read_framebuffer_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032857,
        "dEQP-GLES3.functional.fbo.invalidate.t",
        "arget.framebuffer_read_framebuffer_all");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032858,
        "dEQP-GLES3.functional.fbo.invalidate.ta",
        "rget.framebuffer_draw_framebuffer_color");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032859,
        "dEQP-GLES3.functional.fbo.invalidate.target",
        ".framebuffer_draw_framebuffer_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032860,
        "dEQP-GLES3.functional.fbo.invalidate.t",
        "arget.framebuffer_draw_framebuffer_all");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032861,
        "dEQP-GLES3.functional.fbo.invalidate.ta",
        "rget.read_framebuffer_framebuffer_color");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032862,
        "dEQP-GLES3.functional.fbo.invalidate.target",
        ".read_framebuffer_framebuffer_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032863,
        "dEQP-GLES3.functional.fbo.invalidate.t",
        "arget.read_framebuffer_framebuffer_all");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032864,
        "dEQP-GLES3.functional.fbo.invalidate.targ",
        "et.read_framebuffer_read_framebuffer_color");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032865,
        "dEQP-GLES3.functional.fbo.invalidate.target.r",
        "ead_framebuffer_read_framebuffer_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032866,
        "dEQP-GLES3.functional.fbo.invalidate.tar",
        "get.read_framebuffer_read_framebuffer_all");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032867,
        "dEQP-GLES3.functional.fbo.invalidate.targ",
        "et.read_framebuffer_draw_framebuffer_color");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032868,
        "dEQP-GLES3.functional.fbo.invalidate.target.r",
        "ead_framebuffer_draw_framebuffer_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032869,
        "dEQP-GLES3.functional.fbo.invalidate.tar",
        "get.read_framebuffer_draw_framebuffer_all");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032870,
        "dEQP-GLES3.functional.fbo.invalidate.ta",
        "rget.draw_framebuffer_framebuffer_color");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032871,
        "dEQP-GLES3.functional.fbo.invalidate.target",
        ".draw_framebuffer_framebuffer_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032872,
        "dEQP-GLES3.functional.fbo.invalidate.t",
        "arget.draw_framebuffer_framebuffer_all");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032873,
        "dEQP-GLES3.functional.fbo.invalidate.targ",
        "et.draw_framebuffer_read_framebuffer_color");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032874,
        "dEQP-GLES3.functional.fbo.invalidate.target.d",
        "raw_framebuffer_read_framebuffer_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032875,
        "dEQP-GLES3.functional.fbo.invalidate.tar",
        "get.draw_framebuffer_read_framebuffer_all");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032876,
        "dEQP-GLES3.functional.fbo.invalidate.targ",
        "et.draw_framebuffer_draw_framebuffer_color");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032877,
        "dEQP-GLES3.functional.fbo.invalidate.target.d",
        "raw_framebuffer_draw_framebuffer_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032878,
        "dEQP-GLES3.functional.fbo.invalidate.tar",
        "get.draw_framebuffer_draw_framebuffer_all");
