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
#include "../ActsDeqpgles30017TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016714,
        "dEQP-GLES3.functional.shade",
        "rs.fragdepth.write.no_write");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016715,
        "dEQP-GLES3.functional.sha",
        "ders.fragdepth.write.const");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016716,
        "dEQP-GLES3.functional.shad",
        "ers.fragdepth.write.uniform");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016717,
        "dEQP-GLES3.functional.shad",
        "ers.fragdepth.write.dynamic");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016718,
        "dEQP-GLES3.functional.shader",
        "s.fragdepth.write.fragcoord_z");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016719,
        "dEQP-GLES3.functional.shaders.fragd",
        "epth.write.uniform_conditional_write");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016720,
        "dEQP-GLES3.functional.shaders.fragd",
        "epth.write.dynamic_conditional_write");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016721,
        "dEQP-GLES3.functional.shaders.fr",
        "agdepth.write.uniform_loop_write");

static SHRINK_HWTEST_F(ActsDeqpgles30017TestSuite, TestCase_016722,
        "dEQP-GLES3.functional.shaders.f",
        "ragdepth.write.write_in_function");
