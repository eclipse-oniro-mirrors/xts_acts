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
#include "../ActsGles3MainUncover0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000195,
        "dEQP-GLES3.functional.shaders.s",
        "witch.default_only_static_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000196,
        "dEQP-GLES3.functional.shaders.sw",
        "itch.default_only_static_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000197,
        "dEQP-GLES3.functional.shaders.sw",
        "itch.default_only_uniform_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000198,
        "dEQP-GLES3.functional.shaders.swi",
        "tch.default_only_uniform_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000199,
        "dEQP-GLES3.functional.shaders.swit",
        "ch.empty_case_default_static_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000200,
        "dEQP-GLES3.functional.shaders.switc",
        "h.empty_case_default_static_fragment");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000201,
        "dEQP-GLES3.functional.shaders.switc",
        "h.empty_case_default_uniform_vertex");

static SHRINK_HWTEST_F(ActsGles3MainUncover0001TestSuite, TestCase_000202,
        "dEQP-GLES3.functional.shaders.switch",
        ".empty_case_default_uniform_fragment");
