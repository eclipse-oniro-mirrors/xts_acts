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

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002970,
        "dEQP-GLES31.functional.shaders.sample_variabl",
        "es.sample_pos.distribution.default_framebuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002971,
        "dEQP-GLES31.functional.shaders.sample_variable",
        "s.sample_pos.distribution.singlesample_texture");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002972,
        "dEQP-GLES31.functional.shaders.sample_variable",
        "s.sample_pos.distribution.multisample_texture_1");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002973,
        "dEQP-GLES31.functional.shaders.sample_variable",
        "s.sample_pos.distribution.multisample_texture_2");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002974,
        "dEQP-GLES31.functional.shaders.sample_variable",
        "s.sample_pos.distribution.multisample_texture_4");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002975,
        "dEQP-GLES31.functional.shaders.sample_variable",
        "s.sample_pos.distribution.multisample_texture_8");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002976,
        "dEQP-GLES31.functional.shaders.sample_variables",
        ".sample_pos.distribution.multisample_texture_16");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002977,
        "dEQP-GLES31.functional.shaders.sample_variab",
        "les.sample_pos.distribution.singlesample_rbo");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002978,
        "dEQP-GLES31.functional.shaders.sample_variab",
        "les.sample_pos.distribution.multisample_rbo_1");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002979,
        "dEQP-GLES31.functional.shaders.sample_variab",
        "les.sample_pos.distribution.multisample_rbo_2");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002980,
        "dEQP-GLES31.functional.shaders.sample_variab",
        "les.sample_pos.distribution.multisample_rbo_4");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002981,
        "dEQP-GLES31.functional.shaders.sample_variab",
        "les.sample_pos.distribution.multisample_rbo_8");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002982,
        "dEQP-GLES31.functional.shaders.sample_variabl",
        "es.sample_pos.distribution.multisample_rbo_16");
