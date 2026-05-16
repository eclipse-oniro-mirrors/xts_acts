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
#include "../Deqpgles2BaseFunc.h"
#include "../ActsDeqpgles20008TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007657,
        "dEQP-GLES2.functional.sha",
        "ders.discard.basic_always");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007658,
        "dEQP-GLES2.functional.sh",
        "aders.discard.basic_never");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007659,
        "dEQP-GLES2.functional.sha",
        "ders.discard.basic_uniform");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007660,
        "dEQP-GLES2.functional.sha",
        "ders.discard.basic_dynamic");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007661,
        "dEQP-GLES2.functional.sha",
        "ders.discard.basic_texture");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007662,
        "dEQP-GLES2.functional.shad",
        "ers.discard.function_always");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007663,
        "dEQP-GLES2.functional.shad",
        "ers.discard.function_never");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007664,
        "dEQP-GLES2.functional.shade",
        "rs.discard.function_uniform");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007665,
        "dEQP-GLES2.functional.shade",
        "rs.discard.function_dynamic");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007666,
        "dEQP-GLES2.functional.shade",
        "rs.discard.function_texture");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007667,
        "dEQP-GLES2.functional.shader",
        "s.discard.static_loop_always");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007668,
        "dEQP-GLES2.functional.shade",
        "rs.discard.static_loop_never");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007669,
        "dEQP-GLES2.functional.shader",
        "s.discard.static_loop_uniform");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007670,
        "dEQP-GLES2.functional.shader",
        "s.discard.static_loop_dynamic");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007671,
        "dEQP-GLES2.functional.shader",
        "s.discard.static_loop_texture");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007672,
        "dEQP-GLES2.functional.shader",
        "s.discard.dynamic_loop_always");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007673,
        "dEQP-GLES2.functional.shader",
        "s.discard.dynamic_loop_never");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007674,
        "dEQP-GLES2.functional.shaders",
        ".discard.dynamic_loop_uniform");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007675,
        "dEQP-GLES2.functional.shaders",
        ".discard.dynamic_loop_dynamic");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007676,
        "dEQP-GLES2.functional.shaders",
        ".discard.dynamic_loop_texture");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007677,
        "dEQP-GLES2.functional.shaders.di",
        "scard.function_static_loop_always");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007678,
        "dEQP-GLES2.functional.shaders.di",
        "scard.function_static_loop_never");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007679,
        "dEQP-GLES2.functional.shaders.dis",
        "card.function_static_loop_uniform");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007680,
        "dEQP-GLES2.functional.shaders.dis",
        "card.function_static_loop_dynamic");

static SHRINK_HWTEST_F(ActsDeqpgles20008TestSuite, TestCase_007681,
        "dEQP-GLES2.functional.shaders.dis",
        "card.function_static_loop_texture");
