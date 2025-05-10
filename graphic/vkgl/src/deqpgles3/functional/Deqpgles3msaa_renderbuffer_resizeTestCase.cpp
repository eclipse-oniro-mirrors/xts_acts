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

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032741,
        "dEQP-GLES3.functional.fbo.msaa.r",
        "enderbuffer_resize.nonms_to_nonms");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032742,
        "dEQP-GLES3.functional.fbo.msaa.",
        "renderbuffer_resize.nonms_to_ms");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032743,
        "dEQP-GLES3.functional.fbo.msaa.",
        "renderbuffer_resize.ms_to_nonms");

static SHRINK_HWTEST_F(ActsDeqpgles30033TestSuite, TestCase_032744,
        "dEQP-GLES3.functional.fbo.msa",
        "a.renderbuffer_resize.ms_to_ms");
