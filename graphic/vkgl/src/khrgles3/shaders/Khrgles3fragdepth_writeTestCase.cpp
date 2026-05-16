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
#include "../ActsKhrgles30001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000011,
        "KHR-GLES3.shaders.fra",
        "gdepth.write.no_write");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000012,
        "KHR-GLES3.shaders.f",
        "ragdepth.write.const");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000013,
        "KHR-GLES3.shaders.fr",
        "agdepth.write.uniform");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000014,
        "KHR-GLES3.shaders.fr",
        "agdepth.write.dynamic");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000015,
        "KHR-GLES3.shaders.frag",
        "depth.write.fragcoord_z");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000016,
        "KHR-GLES3.shaders.fragdepth.w",
        "rite.uniform_conditional_write");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000017,
        "KHR-GLES3.shaders.fragdepth.w",
        "rite.dynamic_conditional_write");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000018,
        "KHR-GLES3.shaders.fragdept",
        "h.write.uniform_loop_write");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000019,
        "KHR-GLES3.shaders.fragdep",
        "th.write.write_in_function");
