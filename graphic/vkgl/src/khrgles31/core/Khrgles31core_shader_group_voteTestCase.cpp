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
#include "../Khrgles31BaseFunc.h"
#include "../ActsKhrgles310003TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002261,
        "KHR-GLES31.core.shader_",
        "group_vote.availability");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002262,
        "KHR-GLES31.core.shader_g",
        "roup_vote.all_invocations");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002263,
        "KHR-GLES31.core.shader_g",
        "roup_vote.any_invocation");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002264,
        "KHR-GLES31.core.shader_grou",
        "p_vote.all_invocations_equal");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002265,
        "KHR-GLES31.core.shader_group_v",
        "ote.invocations_with_variables");
