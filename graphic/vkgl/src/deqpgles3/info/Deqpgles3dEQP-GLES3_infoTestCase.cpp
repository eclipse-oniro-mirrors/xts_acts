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

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000001,
        "dEQP-GLES3.",
        "info.vendor");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000002,
        "dEQP-GLES3.i",
        "nfo.renderer");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000003,
        "dEQP-GLES3.",
        "info.version");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000004,
        "dEQP-GLES3.info.shad",
        "ing_language_version");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000005,
        "dEQP-GLES3.in",
        "fo.extensions");

static SHRINK_HWTEST_F(ActsDeqpgles30001TestSuite, TestCase_000006,
        "dEQP-GLES3.inf",
        "o.render_target");