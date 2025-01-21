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

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032748,
        "dEQP-GLES3.functional.fbo.in",
        "validate.default.render_none");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032749,
        "dEQP-GLES3.functional.fbo.in",
        "validate.default.render_color");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032750,
        "dEQP-GLES3.functional.fbo.in",
        "validate.default.render_depth");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032751,
        "dEQP-GLES3.functional.fbo.inv",
        "alidate.default.render_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032752,
        "dEQP-GLES3.functional.fbo.invali",
        "date.default.render_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032753,
        "dEQP-GLES3.functional.fbo.i",
        "nvalidate.default.render_all");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032754,
        "dEQP-GLES3.functional.fbo.i",
        "nvalidate.default.bind_color");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032755,
        "dEQP-GLES3.functional.fbo.i",
        "nvalidate.default.bind_depth");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032756,
        "dEQP-GLES3.functional.fbo.in",
        "validate.default.bind_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032757,
        "dEQP-GLES3.functional.fbo.inval",
        "idate.default.bind_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032758,
        "dEQP-GLES3.functional.fbo.",
        "invalidate.default.bind_all");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032759,
        "dEQP-GLES3.functional.fbo.inva",
        "lidate.default.sub_render_color");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032760,
        "dEQP-GLES3.functional.fbo.inva",
        "lidate.default.sub_render_depth");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032761,
        "dEQP-GLES3.functional.fbo.inval",
        "idate.default.sub_render_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032762,
        "dEQP-GLES3.functional.fbo.invalida",
        "te.default.sub_render_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032763,
        "dEQP-GLES3.functional.fbo.inv",
        "alidate.default.sub_render_all");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032764,
        "dEQP-GLES3.functional.fbo.inv",
        "alidate.default.sub_bind_color");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032765,
        "dEQP-GLES3.functional.fbo.inv",
        "alidate.default.sub_bind_depth");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032766,
        "dEQP-GLES3.functional.fbo.inva",
        "lidate.default.sub_bind_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032767,
        "dEQP-GLES3.functional.fbo.invalid",
        "ate.default.sub_bind_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032768,
        "dEQP-GLES3.functional.fbo.in",
        "validate.default.sub_bind_all");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032769,
        "dEQP-GLES3.functional.fbo.invalid",
        "ate.default.draw_framebuffer_color");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032770,
        "dEQP-GLES3.functional.fbo.invali",
        "date.default.draw_framebuffer_all");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032771,
        "dEQP-GLES3.functional.fbo.invalid",
        "ate.default.read_framebuffer_color");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032772,
        "dEQP-GLES3.functional.fbo.invali",
        "date.default.read_framebuffer_all");
