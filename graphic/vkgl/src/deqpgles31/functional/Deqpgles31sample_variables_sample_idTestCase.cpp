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

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002944,
        "dEQP-GLES31.functional.shaders.sample_",
        "variables.sample_id.default_framebuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002945,
        "dEQP-GLES31.functional.shaders.sample_v",
        "ariables.sample_id.singlesample_texture");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002946,
        "dEQP-GLES31.functional.shaders.sample_v",
        "ariables.sample_id.multisample_texture_1");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002947,
        "dEQP-GLES31.functional.shaders.sample_v",
        "ariables.sample_id.multisample_texture_2");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002948,
        "dEQP-GLES31.functional.shaders.sample_v",
        "ariables.sample_id.multisample_texture_4");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002949,
        "dEQP-GLES31.functional.shaders.sample_v",
        "ariables.sample_id.multisample_texture_8");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002950,
        "dEQP-GLES31.functional.shaders.sample_va",
        "riables.sample_id.multisample_texture_16");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002951,
        "dEQP-GLES31.functional.shaders.sample",
        "_variables.sample_id.singlesample_rbo");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002952,
        "dEQP-GLES31.functional.shaders.sample",
        "_variables.sample_id.multisample_rbo_1");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002953,
        "dEQP-GLES31.functional.shaders.sample",
        "_variables.sample_id.multisample_rbo_2");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002954,
        "dEQP-GLES31.functional.shaders.sample",
        "_variables.sample_id.multisample_rbo_4");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002955,
        "dEQP-GLES31.functional.shaders.sample",
        "_variables.sample_id.multisample_rbo_8");

static SHRINK_HWTEST_F(ActsDeqpgles310003TestSuite, TestCase_002956,
        "dEQP-GLES31.functional.shaders.sample_",
        "variables.sample_id.multisample_rbo_16");
