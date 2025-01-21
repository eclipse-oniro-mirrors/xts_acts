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
#include "../ActsDeqpgles20013TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012520,
        "dEQP-GLES2.functional.fbo.render.",
        "shared_colorbuffer_clear.tex2d_rgb");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012521,
        "dEQP-GLES2.functional.fbo.render.s",
        "hared_colorbuffer_clear.tex2d_rgba");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012522,
        "dEQP-GLES2.functional.fbo.render.s",
        "hared_colorbuffer_clear.rbo_rgb565");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012523,
        "dEQP-GLES2.functional.fbo.render.s",
        "hared_colorbuffer_clear.rbo_rgb5_a1");

static SHRINK_HWTEST_F(ActsDeqpgles20013TestSuite, TestCase_012524,
        "dEQP-GLES2.functional.fbo.render.",
        "shared_colorbuffer_clear.rbo_rgba4");
