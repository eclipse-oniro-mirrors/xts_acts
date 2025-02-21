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

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032773,
        "dEQP-GLES3.functional.fbo.i",
        "nvalidate.whole.render_none");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032774,
        "dEQP-GLES3.functional.fbo.i",
        "nvalidate.whole.render_color");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032775,
        "dEQP-GLES3.functional.fbo.i",
        "nvalidate.whole.render_depth");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032776,
        "dEQP-GLES3.functional.fbo.in",
        "validate.whole.render_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032777,
        "dEQP-GLES3.functional.fbo.inval",
        "idate.whole.render_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032778,
        "dEQP-GLES3.functional.fbo.",
        "invalidate.whole.render_all");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032779,
        "dEQP-GLES3.functional.fbo.inva",
        "lidate.whole.unbind_read_color");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032780,
        "dEQP-GLES3.functional.fbo.inva",
        "lidate.whole.unbind_read_depth");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032781,
        "dEQP-GLES3.functional.fbo.inval",
        "idate.whole.unbind_read_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032782,
        "dEQP-GLES3.functional.fbo.invalida",
        "te.whole.unbind_read_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032783,
        "dEQP-GLES3.functional.fbo.invalida",
        "te.whole.unbind_read_color_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032784,
        "dEQP-GLES3.functional.fbo.inva",
        "lidate.whole.unbind_blit_color");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032785,
        "dEQP-GLES3.functional.fbo.inva",
        "lidate.whole.unbind_blit_depth");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032786,
        "dEQP-GLES3.functional.fbo.inval",
        "idate.whole.unbind_blit_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032787,
        "dEQP-GLES3.functional.fbo.invalida",
        "te.whole.unbind_blit_depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032788,
        "dEQP-GLES3.functional.fbo.invali",
        "date.whole.unbind_blit_msaa_color");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032789,
        "dEQP-GLES3.functional.fbo.invali",
        "date.whole.unbind_blit_msaa_depth");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032790,
        "dEQP-GLES3.functional.fbo.invalid",
        "ate.whole.unbind_blit_msaa_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032791,
        "dEQP-GLES3.functional.fbo.invalidate",
        ".whole.unbind_blit_msaa_depth_stencil");
