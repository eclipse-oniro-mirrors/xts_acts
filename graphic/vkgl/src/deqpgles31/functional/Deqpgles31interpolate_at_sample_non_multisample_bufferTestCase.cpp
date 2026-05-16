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
#include "../ActsDeqpgles310004TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003164,
        "dEQP-GLES31.functional.shaders.multisample_interpolation.interpol",
        "ate_at_sample.non_multisample_buffer.sample_0_default_framebuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003165,
        "dEQP-GLES31.functional.shaders.multisample_interpolation.interpol",
        "ate_at_sample.non_multisample_buffer.sample_0_singlesample_texture");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003166,
        "dEQP-GLES31.functional.shaders.multisample_interpolation.interp",
        "olate_at_sample.non_multisample_buffer.sample_0_singlesample_rbo");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003167,
        "dEQP-GLES31.functional.shaders.multisample_interpolation.interpol",
        "ate_at_sample.non_multisample_buffer.sample_n_default_framebuffer");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003168,
        "dEQP-GLES31.functional.shaders.multisample_interpolation.interpol",
        "ate_at_sample.non_multisample_buffer.sample_n_singlesample_texture");

static SHRINK_HWTEST_F(ActsDeqpgles310004TestSuite, TestCase_003169,
        "dEQP-GLES31.functional.shaders.multisample_interpolation.interp",
        "olate_at_sample.non_multisample_buffer.sample_n_singlesample_rbo");
