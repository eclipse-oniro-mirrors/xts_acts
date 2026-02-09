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
#include "../Deqpgles31BaseFunc.h"
#include "../ActsDeqpgles310003TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002957,
        "dEQP-GLES31.functional.shaders.sample_variabl",
        "es.sample_pos.correctness.default_framebuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002958,
        "dEQP-GLES31.functional.shaders.sample_variabl",
        "es.sample_pos.correctness.singlesample_texture");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002959,
        "dEQP-GLES31.functional.shaders.sample_variable",
        "s.sample_pos.correctness.multisample_texture_1");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002960,
        "dEQP-GLES31.functional.shaders.sample_variable",
        "s.sample_pos.correctness.multisample_texture_2");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002961,
        "dEQP-GLES31.functional.shaders.sample_variable",
        "s.sample_pos.correctness.multisample_texture_4");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002962,
        "dEQP-GLES31.functional.shaders.sample_variable",
        "s.sample_pos.correctness.multisample_texture_8");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002963,
        "dEQP-GLES31.functional.shaders.sample_variable",
        "s.sample_pos.correctness.multisample_texture_16");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002964,
        "dEQP-GLES31.functional.shaders.sample_varia",
        "bles.sample_pos.correctness.singlesample_rbo");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002965,
        "dEQP-GLES31.functional.shaders.sample_variab",
        "les.sample_pos.correctness.multisample_rbo_1");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002966,
        "dEQP-GLES31.functional.shaders.sample_variab",
        "les.sample_pos.correctness.multisample_rbo_2");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002967,
        "dEQP-GLES31.functional.shaders.sample_variab",
        "les.sample_pos.correctness.multisample_rbo_4");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002968,
        "dEQP-GLES31.functional.shaders.sample_variab",
        "les.sample_pos.correctness.multisample_rbo_8");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002969,
        "dEQP-GLES31.functional.shaders.sample_variab",
        "les.sample_pos.correctness.multisample_rbo_16");
