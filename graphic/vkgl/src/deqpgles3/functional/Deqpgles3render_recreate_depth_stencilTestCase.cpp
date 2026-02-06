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
#include "../ActsDeqpgles30032TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031723,
        "dEQP-GLES3.functional.fbo.render.recreate_depth_s",
        "tencil.tex2d_rgba8_depth_tex2d_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031724,
        "dEQP-GLES3.functional.fbo.render.recreate_depth_",
        "stencil.tex2d_rgba8_depth_rbo_depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031725,
        "dEQP-GLES3.functional.fbo.render.recreate_depth_",
        "stencil.tex2d_rgba8_depth_tex2d_depth_component24");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031726,
        "dEQP-GLES3.functional.fbo.render.recreate_depth",
        "_stencil.tex2d_rgba8_depth_rbo_depth_component24");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031727,
        "dEQP-GLES3.functional.fbo.render.recreate_depth_",
        "stencil.tex2d_rgba8_depth_tex2d_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031728,
        "dEQP-GLES3.functional.fbo.render.recreate_depth",
        "_stencil.tex2d_rgba8_depth_rbo_depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031729,
        "dEQP-GLES3.functional.fbo.render.recreate_depth_sten",
        "cil.tex2d_rgba8_depth_stencil_tex2d_depth32f_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031730,
        "dEQP-GLES3.functional.fbo.render.recreate_depth_ste",
        "ncil.tex2d_rgba8_depth_stencil_rbo_depth32f_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031731,
        "dEQP-GLES3.functional.fbo.render.recreate_depth_sten",
        "cil.tex2d_rgba8_depth_stencil_tex2d_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031732,
        "dEQP-GLES3.functional.fbo.render.recreate_depth_ste",
        "ncil.tex2d_rgba8_depth_stencil_rbo_depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30032TestSuite, TestCase_031733,
        "dEQP-GLES3.functional.fbo.render.recreate_depth",
        "_stencil.tex2d_rgba8_stencil_rbo_stencil_index8");
