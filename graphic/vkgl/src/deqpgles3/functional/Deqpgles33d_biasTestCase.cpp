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
#include "../ActsDeqpgles30026TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025177,
        "dEQP-GLES3.functional.texture.",
        "mipmap.3d.bias.nearest_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025178,
        "dEQP-GLES3.functional.texture",
        ".mipmap.3d.bias.linear_nearest");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025179,
        "dEQP-GLES3.functional.texture",
        ".mipmap.3d.bias.nearest_linear");

static SHRINK_HWTEST_F(ActsDeqpgles30026TestSuite, TestCase_025180,
        "dEQP-GLES3.functional.texture",
        ".mipmap.3d.bias.linear_linear");