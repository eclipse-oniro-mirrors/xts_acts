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
#include "../ActsDeqpgles310016TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015973,
        "dEQP-GLES31.functional.stat",
        "e_query.shader.sampler_type");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015974,
        "dEQP-GLES31.functional.state_query.s",
        "hader.sampler_type_multisample_array");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015975,
        "dEQP-GLES31.functional.state_query",
        ".shader.sampler_type_texture_buffer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015976,
        "dEQP-GLES31.functional.state_quer",
        "y.shader.image_type_texture_buffer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015977,
        "dEQP-GLES31.functional.state_que",
        "ry.shader.sampler_type_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015978,
        "dEQP-GLES31.functional.state_qu",
        "ery.shader.image_type_cube_array");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015979,
        "dEQP-GLES31.functional.state",
        "_query.shader.info_log_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015980,
        "dEQP-GLES31.functional.state_",
        "query.shader.info_log_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015981,
        "dEQP-GLES31.functional.state_",
        "query.shader.info_log_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015982,
        "dEQP-GLES31.functional.state_q",
        "uery.shader.info_log_tess_ctrl");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015983,
        "dEQP-GLES31.functional.state_q",
        "uery.shader.info_log_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015984,
        "dEQP-GLES31.functional.state_",
        "query.shader.info_log_compute");
