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
#include "../ActsDeqpgles30001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000078,
        "dEQP-GLES3.functional.d",
        "epth_stencil_clear.depth");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000079,
        "dEQP-GLES3.functional.depth_",
        "stencil_clear.depth_scissored");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000080,
        "dEQP-GLES3.functional.depth_sten",
        "cil_clear.depth_scissored_masked");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000081,
        "dEQP-GLES3.functional.de",
        "pth_stencil_clear.stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000082,
        "dEQP-GLES3.functional.depth_",
        "stencil_clear.stencil_masked");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000083,
        "dEQP-GLES3.functional.depth_s",
        "tencil_clear.stencil_scissored");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000084,
        "dEQP-GLES3.functional.depth_stenc",
        "il_clear.stencil_scissored_masked");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000085,
        "dEQP-GLES3.functional.depth",
        "_stencil_clear.depth_stencil");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000086,
        "dEQP-GLES3.functional.depth_ste",
        "ncil_clear.depth_stencil_masked");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000087,
        "dEQP-GLES3.functional.depth_sten",
        "cil_clear.depth_stencil_scissored");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000088,
        "dEQP-GLES3.functional.depth_stencil_",
        "clear.depth_stencil_scissored_masked");
