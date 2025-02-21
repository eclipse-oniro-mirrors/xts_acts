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
#include "../ActsDeqpgles30006TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005926,
        "dEQP-GLES3.functional.sha",
        "ders.discard.basic_always");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005927,
        "dEQP-GLES3.functional.sh",
        "aders.discard.basic_never");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005928,
        "dEQP-GLES3.functional.sha",
        "ders.discard.basic_uniform");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005929,
        "dEQP-GLES3.functional.sha",
        "ders.discard.basic_dynamic");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005930,
        "dEQP-GLES3.functional.sha",
        "ders.discard.basic_texture");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005931,
        "dEQP-GLES3.functional.shad",
        "ers.discard.function_always");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005932,
        "dEQP-GLES3.functional.shad",
        "ers.discard.function_never");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005933,
        "dEQP-GLES3.functional.shade",
        "rs.discard.function_uniform");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005934,
        "dEQP-GLES3.functional.shade",
        "rs.discard.function_dynamic");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005935,
        "dEQP-GLES3.functional.shade",
        "rs.discard.function_texture");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005936,
        "dEQP-GLES3.functional.shader",
        "s.discard.static_loop_always");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005937,
        "dEQP-GLES3.functional.shade",
        "rs.discard.static_loop_never");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005938,
        "dEQP-GLES3.functional.shader",
        "s.discard.static_loop_uniform");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005939,
        "dEQP-GLES3.functional.shader",
        "s.discard.static_loop_dynamic");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005940,
        "dEQP-GLES3.functional.shader",
        "s.discard.static_loop_texture");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005941,
        "dEQP-GLES3.functional.shader",
        "s.discard.dynamic_loop_always");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005942,
        "dEQP-GLES3.functional.shader",
        "s.discard.dynamic_loop_never");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005943,
        "dEQP-GLES3.functional.shaders",
        ".discard.dynamic_loop_uniform");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005944,
        "dEQP-GLES3.functional.shaders",
        ".discard.dynamic_loop_dynamic");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005945,
        "dEQP-GLES3.functional.shaders",
        ".discard.dynamic_loop_texture");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005946,
        "dEQP-GLES3.functional.shaders.di",
        "scard.function_static_loop_always");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005947,
        "dEQP-GLES3.functional.shaders.di",
        "scard.function_static_loop_never");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005948,
        "dEQP-GLES3.functional.shaders.dis",
        "card.function_static_loop_uniform");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005949,
        "dEQP-GLES3.functional.shaders.dis",
        "card.function_static_loop_dynamic");

static SHRINK_HWTEST_F(ActsDeqpgles30006TestSuite, TestCase_005950,
        "dEQP-GLES3.functional.shaders.dis",
        "card.function_static_loop_texture");
