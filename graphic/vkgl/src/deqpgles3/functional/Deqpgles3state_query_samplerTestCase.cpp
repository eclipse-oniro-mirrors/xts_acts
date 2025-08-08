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
#include "../ActsDeqpgles30044TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043169,
        "dEQP-GLES3.functional.state_query.sampler.",
        "sampler_texture_wrap_s_getsamplerparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043170,
        "dEQP-GLES3.functional.state_query.sampler.",
        "sampler_texture_wrap_s_getsamplerparameterf");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043171,
        "dEQP-GLES3.functional.state_query.sampler.",
        "sampler_texture_wrap_t_getsamplerparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043172,
        "dEQP-GLES3.functional.state_query.sampler.",
        "sampler_texture_wrap_t_getsamplerparameterf");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043173,
        "dEQP-GLES3.functional.state_query.sampler.",
        "sampler_texture_wrap_r_getsamplerparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043174,
        "dEQP-GLES3.functional.state_query.sampler.",
        "sampler_texture_wrap_r_getsamplerparameterf");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043175,
        "dEQP-GLES3.functional.state_query.sampler.sa",
        "mpler_texture_mag_filter_getsamplerparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043176,
        "dEQP-GLES3.functional.state_query.sampler.sa",
        "mpler_texture_mag_filter_getsamplerparameterf");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043177,
        "dEQP-GLES3.functional.state_query.sampler.sa",
        "mpler_texture_min_filter_getsamplerparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043178,
        "dEQP-GLES3.functional.state_query.sampler.sa",
        "mpler_texture_min_filter_getsamplerparameterf");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043179,
        "dEQP-GLES3.functional.state_query.sampler.s",
        "ampler_texture_min_lod_getsamplerparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043180,
        "dEQP-GLES3.functional.state_query.sampler.s",
        "ampler_texture_min_lod_getsamplerparameterf");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043181,
        "dEQP-GLES3.functional.state_query.sampler.s",
        "ampler_texture_max_lod_getsamplerparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043182,
        "dEQP-GLES3.functional.state_query.sampler.s",
        "ampler_texture_max_lod_getsamplerparameterf");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043183,
        "dEQP-GLES3.functional.state_query.sampler.sam",
        "pler_texture_compare_mode_getsamplerparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043184,
        "dEQP-GLES3.functional.state_query.sampler.sam",
        "pler_texture_compare_mode_getsamplerparameterf");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043185,
        "dEQP-GLES3.functional.state_query.sampler.sam",
        "pler_texture_compare_func_getsamplerparameteri");

static SHRINK_HWTEST_F(ActsDeqpgles30044TestSuite, TestCase_043186,
        "dEQP-GLES3.functional.state_query.sampler.sam",
        "pler_texture_compare_func_getsamplerparameterf");
