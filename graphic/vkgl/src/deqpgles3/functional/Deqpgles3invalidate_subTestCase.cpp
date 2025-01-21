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

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032792,
        "dEQP-GLES3.functional.fbo.",
        "invalidate.sub.render_none");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032793,
        "dEQP-GLES3.functional.fbo.",
        "invalidate.sub.render_color");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032794,
        "dEQP-GLES3.functional.fbo.",
        "invalidate.sub.render_depth");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032795,
        "dEQP-GLES3.functional.fbo.i",
        "nvalidate.sub.render_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032796,
        "dEQP-GLES3.functional.fbo.inva",
        "lidate.sub.render_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032797,
        "dEQP-GLES3.functional.fbo",
        ".invalidate.sub.render_all");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032798,
        "dEQP-GLES3.functional.fbo.inv",
        "alidate.sub.unbind_read_color");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032799,
        "dEQP-GLES3.functional.fbo.inv",
        "alidate.sub.unbind_read_depth");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032800,
        "dEQP-GLES3.functional.fbo.inva",
        "lidate.sub.unbind_read_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032801,
        "dEQP-GLES3.functional.fbo.invalid",
        "ate.sub.unbind_read_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032802,
        "dEQP-GLES3.functional.fbo.invalid",
        "ate.sub.unbind_read_color_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032803,
        "dEQP-GLES3.functional.fbo.inv",
        "alidate.sub.unbind_blit_color");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032804,
        "dEQP-GLES3.functional.fbo.inv",
        "alidate.sub.unbind_blit_depth");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032805,
        "dEQP-GLES3.functional.fbo.inva",
        "lidate.sub.unbind_blit_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032806,
        "dEQP-GLES3.functional.fbo.invalid",
        "ate.sub.unbind_blit_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032807,
        "dEQP-GLES3.functional.fbo.inval",
        "idate.sub.unbind_blit_msaa_color");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032808,
        "dEQP-GLES3.functional.fbo.inval",
        "idate.sub.unbind_blit_msaa_depth");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032809,
        "dEQP-GLES3.functional.fbo.invali",
        "date.sub.unbind_blit_msaa_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032810,
        "dEQP-GLES3.functional.fbo.invalidat",
        "e.sub.unbind_blit_msaa_depth_stencil");
