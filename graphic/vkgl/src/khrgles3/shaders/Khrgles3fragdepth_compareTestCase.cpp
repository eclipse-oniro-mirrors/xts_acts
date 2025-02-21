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

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000020,
        "KHR-GLES3.shaders.frag",
        "depth.compare.no_write");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000021,
        "KHR-GLES3.shaders.fr",
        "agdepth.compare.const");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000022,
        "KHR-GLES3.shaders.fra",
        "gdepth.compare.uniform");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000023,
        "KHR-GLES3.shaders.fra",
        "gdepth.compare.dynamic");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000024,
        "KHR-GLES3.shaders.fragd",
        "epth.compare.fragcoord_z");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000025,
        "KHR-GLES3.shaders.fragdepth.co",
        "mpare.uniform_conditional_write");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000026,
        "KHR-GLES3.shaders.fragdepth.co",
        "mpare.dynamic_conditional_write");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000027,
        "KHR-GLES3.shaders.fragdepth",
        ".compare.uniform_loop_write");

static SHRINK_HWTEST_F(ActsKhrgles30001TestSuite, TestCase_000028,
        "KHR-GLES3.shaders.fragdept",
        "h.compare.write_in_function");
