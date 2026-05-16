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

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015939,
        "dEQP-GLES31.functional.state_query.sampl",
        "er.set_value.texture_srgb_decode_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015940,
        "dEQP-GLES31.functional.state_query.samp",
        "ler.set_value.texture_srgb_decode_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015941,
        "dEQP-GLES31.functional.state_query.sampl",
        "er.set_value.texture_srgb_decode_pure_int");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015942,
        "dEQP-GLES31.functional.state_query.sample",
        "r.set_value.texture_srgb_decode_pure_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015943,
        "dEQP-GLES31.functional.state_query.sampl",
        "er.set_value.texture_border_color_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015944,
        "dEQP-GLES31.functional.state_query.samp",
        "ler.set_value.texture_border_color_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015945,
        "dEQP-GLES31.functional.state_query.sample",
        "r.set_value.texture_border_color_pure_int");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015946,
        "dEQP-GLES31.functional.state_query.sample",
        "r.set_value.texture_border_color_pure_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015947,
        "dEQP-GLES31.functional.state_query.sampler.se",
        "t_value.texture_wrap_s_clamp_to_border_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015948,
        "dEQP-GLES31.functional.state_query.sampler.s",
        "et_value.texture_wrap_s_clamp_to_border_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015949,
        "dEQP-GLES31.functional.state_query.sampler.se",
        "t_value.texture_wrap_t_clamp_to_border_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015950,
        "dEQP-GLES31.functional.state_query.sampler.s",
        "et_value.texture_wrap_t_clamp_to_border_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015951,
        "dEQP-GLES31.functional.state_query.sampler.se",
        "t_value.texture_wrap_r_clamp_to_border_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015952,
        "dEQP-GLES31.functional.state_query.sampler.s",
        "et_value.texture_wrap_r_clamp_to_border_float");
