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

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032051,
        "dEQP-GLES3.functional.fbo.st",
        "encil.basic.depth32f_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032052,
        "dEQP-GLES3.functional.fbo.stenc",
        "il.basic.depth32f_stencil8_depth");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032053,
        "dEQP-GLES3.functional.fbo.st",
        "encil.basic.depth24_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032054,
        "dEQP-GLES3.functional.fbo.stenc",
        "il.basic.depth24_stencil8_depth");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032055,
        "dEQP-GLES3.functional.fbo.s",
        "tencil.basic.stencil_index8");