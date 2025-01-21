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

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032046,
        "dEQP-GLES3.functional.fbo.depth.d",
        "epth_test_clamp.depth_component32f");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032047,
        "dEQP-GLES3.functional.fbo.depth.d",
        "epth_test_clamp.depth_component24");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032048,
        "dEQP-GLES3.functional.fbo.depth.d",
        "epth_test_clamp.depth_component16");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032049,
        "dEQP-GLES3.functional.fbo.depth.d",
        "epth_test_clamp.depth32f_stencil8");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032050,
        "dEQP-GLES3.functional.fbo.depth.",
        "depth_test_clamp.depth24_stencil8");
