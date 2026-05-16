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
#include "../ActsGles3KhrMainUncover0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsGles3KhrMainUncover0001TestSuite, TestCase_000005,
        "KHR-GLES3.shaders.struct",
        ".local.basic_equal_vertex");

static SHRINK_HWTEST_F(ActsGles3KhrMainUncover0001TestSuite, TestCase_000006,
        "KHR-GLES3.shaders.struct.",
        "local.basic_equal_fragment");

static SHRINK_HWTEST_F(ActsGles3KhrMainUncover0001TestSuite, TestCase_000007,
        "KHR-GLES3.shaders.struct.l",
        "ocal.basic_not_equal_vertex");

static SHRINK_HWTEST_F(ActsGles3KhrMainUncover0001TestSuite, TestCase_000008,
        "KHR-GLES3.shaders.struct.lo",
        "cal.basic_not_equal_fragment");

static SHRINK_HWTEST_F(ActsGles3KhrMainUncover0001TestSuite, TestCase_000009,
        "KHR-GLES3.shaders.struct.",
        "local.nested_equal_vertex");

static SHRINK_HWTEST_F(ActsGles3KhrMainUncover0001TestSuite, TestCase_000010,
        "KHR-GLES3.shaders.struct.l",
        "ocal.nested_equal_fragment");

static SHRINK_HWTEST_F(ActsGles3KhrMainUncover0001TestSuite, TestCase_000011,
        "KHR-GLES3.shaders.struct.lo",
        "cal.nested_not_equal_vertex");

static SHRINK_HWTEST_F(ActsGles3KhrMainUncover0001TestSuite, TestCase_000012,
        "KHR-GLES3.shaders.struct.loc",
        "al.nested_not_equal_fragment");

static SHRINK_HWTEST_F(ActsGles3KhrMainUncover0001TestSuite, TestCase_000013,
        "KHR-GLES3.shaders.struct.loca",
        "l.array_member_equality_vertex");

static SHRINK_HWTEST_F(ActsGles3KhrMainUncover0001TestSuite, TestCase_000014,
        "KHR-GLES3.shaders.struct.local",
        ".array_member_equality_fragment");
