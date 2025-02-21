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

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032553,
        "dEQP-GLES3.functional.fbo.blit.dep",
        "th_stencil.depth_component32f_basic");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032554,
        "dEQP-GLES3.functional.fbo.blit.dep",
        "th_stencil.depth_component32f_scale");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032555,
        "dEQP-GLES3.functional.fbo.blit.dep",
        "th_stencil.depth_component24_basic");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032556,
        "dEQP-GLES3.functional.fbo.blit.dep",
        "th_stencil.depth_component24_scale");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032557,
        "dEQP-GLES3.functional.fbo.blit.dep",
        "th_stencil.depth_component16_basic");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032558,
        "dEQP-GLES3.functional.fbo.blit.dep",
        "th_stencil.depth_component16_scale");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032559,
        "dEQP-GLES3.functional.fbo.blit.dep",
        "th_stencil.depth32f_stencil8_basic");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032560,
        "dEQP-GLES3.functional.fbo.blit.dep",
        "th_stencil.depth32f_stencil8_scale");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032561,
        "dEQP-GLES3.functional.fbo.blit.depth",
        "_stencil.depth32f_stencil8_depth_only");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032562,
        "dEQP-GLES3.functional.fbo.blit.depth_",
        "stencil.depth32f_stencil8_stencil_only");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032563,
        "dEQP-GLES3.functional.fbo.blit.de",
        "pth_stencil.depth24_stencil8_basic");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032564,
        "dEQP-GLES3.functional.fbo.blit.de",
        "pth_stencil.depth24_stencil8_scale");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032565,
        "dEQP-GLES3.functional.fbo.blit.depth",
        "_stencil.depth24_stencil8_depth_only");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032566,
        "dEQP-GLES3.functional.fbo.blit.depth_",
        "stencil.depth24_stencil8_stencil_only");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032567,
        "dEQP-GLES3.functional.fbo.blit.d",
        "epth_stencil.stencil_index8_basic");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032568,
        "dEQP-GLES3.functional.fbo.blit.d",
        "epth_stencil.stencil_index8_scale");
