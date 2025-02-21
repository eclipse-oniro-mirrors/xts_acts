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
#include "../Khrgles3BaseFunc.h"
#include "../ActsKhrgles30002TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001396,
        "KHR-GLES3.shaders.name_hidin",
        "g.basic.hidden_name_1_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001397,
        "KHR-GLES3.shaders.name_hiding",
        ".basic.hidden_name_1_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001398,
        "KHR-GLES3.shaders.name_hidin",
        "g.basic.hidden_name_2_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001399,
        "KHR-GLES3.shaders.name_hiding",
        ".basic.hidden_name_2_fragment");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001400,
        "KHR-GLES3.shaders.name_hidin",
        "g.basic.hidden_name_3_vertex");

static SHRINK_HWTEST_F(ActsKhrgles30002TestSuite, TestCase_001401,
        "KHR-GLES3.shaders.name_hiding",
        ".basic.hidden_name_3_fragment");
