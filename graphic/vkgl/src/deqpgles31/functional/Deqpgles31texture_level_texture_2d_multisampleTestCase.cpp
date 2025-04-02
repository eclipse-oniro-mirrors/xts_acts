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

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015763,
        "dEQP-GLES31.functional.state_query.texture_",
        "level.texture_2d_multisample.samples_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015764,
        "dEQP-GLES31.functional.state_query.texture",
        "_level.texture_2d_multisample.samples_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015765,
        "dEQP-GLES31.functional.state_query.texture_level.te",
        "xture_2d_multisample.fixed_sample_locations_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015766,
        "dEQP-GLES31.functional.state_query.texture_level.t",
        "exture_2d_multisample.fixed_sample_locations_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015767,
        "dEQP-GLES31.functional.state_query.texture",
        "_level.texture_2d_multisample.width_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015768,
        "dEQP-GLES31.functional.state_query.textur",
        "e_level.texture_2d_multisample.width_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015769,
        "dEQP-GLES31.functional.state_query.texture_",
        "level.texture_2d_multisample.height_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015770,
        "dEQP-GLES31.functional.state_query.texture",
        "_level.texture_2d_multisample.height_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015771,
        "dEQP-GLES31.functional.state_query.texture",
        "_level.texture_2d_multisample.depth_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015772,
        "dEQP-GLES31.functional.state_query.textur",
        "e_level.texture_2d_multisample.depth_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015773,
        "dEQP-GLES31.functional.state_query.texture_leve",
        "l.texture_2d_multisample.internal_format_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015774,
        "dEQP-GLES31.functional.state_query.texture_lev",
        "el.texture_2d_multisample.internal_format_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015775,
        "dEQP-GLES31.functional.state_query.texture_l",
        "evel.texture_2d_multisample.red_size_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015776,
        "dEQP-GLES31.functional.state_query.texture_",
        "level.texture_2d_multisample.red_size_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015777,
        "dEQP-GLES31.functional.state_query.texture_le",
        "vel.texture_2d_multisample.green_size_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015778,
        "dEQP-GLES31.functional.state_query.texture_l",
        "evel.texture_2d_multisample.green_size_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015779,
        "dEQP-GLES31.functional.state_query.texture_l",
        "evel.texture_2d_multisample.blue_size_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015780,
        "dEQP-GLES31.functional.state_query.texture_",
        "level.texture_2d_multisample.blue_size_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015781,
        "dEQP-GLES31.functional.state_query.texture_le",
        "vel.texture_2d_multisample.alpha_size_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015782,
        "dEQP-GLES31.functional.state_query.texture_l",
        "evel.texture_2d_multisample.alpha_size_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015783,
        "dEQP-GLES31.functional.state_query.texture_le",
        "vel.texture_2d_multisample.depth_size_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015784,
        "dEQP-GLES31.functional.state_query.texture_l",
        "evel.texture_2d_multisample.depth_size_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015785,
        "dEQP-GLES31.functional.state_query.texture_lev",
        "el.texture_2d_multisample.stencil_size_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015786,
        "dEQP-GLES31.functional.state_query.texture_le",
        "vel.texture_2d_multisample.stencil_size_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015787,
        "dEQP-GLES31.functional.state_query.texture_le",
        "vel.texture_2d_multisample.shared_size_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015788,
        "dEQP-GLES31.functional.state_query.texture_l",
        "evel.texture_2d_multisample.shared_size_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015789,
        "dEQP-GLES31.functional.state_query.texture_l",
        "evel.texture_2d_multisample.red_type_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015790,
        "dEQP-GLES31.functional.state_query.texture_",
        "level.texture_2d_multisample.red_type_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015791,
        "dEQP-GLES31.functional.state_query.texture_le",
        "vel.texture_2d_multisample.green_type_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015792,
        "dEQP-GLES31.functional.state_query.texture_l",
        "evel.texture_2d_multisample.green_type_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015793,
        "dEQP-GLES31.functional.state_query.texture_l",
        "evel.texture_2d_multisample.blue_type_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015794,
        "dEQP-GLES31.functional.state_query.texture_",
        "level.texture_2d_multisample.blue_type_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015795,
        "dEQP-GLES31.functional.state_query.texture_le",
        "vel.texture_2d_multisample.alpha_type_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015796,
        "dEQP-GLES31.functional.state_query.texture_l",
        "evel.texture_2d_multisample.alpha_type_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015797,
        "dEQP-GLES31.functional.state_query.texture_le",
        "vel.texture_2d_multisample.depth_type_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015798,
        "dEQP-GLES31.functional.state_query.texture_l",
        "evel.texture_2d_multisample.depth_type_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015799,
        "dEQP-GLES31.functional.state_query.texture_le",
        "vel.texture_2d_multisample.compressed_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015800,
        "dEQP-GLES31.functional.state_query.texture_l",
        "evel.texture_2d_multisample.compressed_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015801,
        "dEQP-GLES31.functional.state_query.texture_level.tex",
        "ture_2d_multisample.buffer_data_store_binding_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015802,
        "dEQP-GLES31.functional.state_query.texture_level.te",
        "xture_2d_multisample.buffer_data_store_binding_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015803,
        "dEQP-GLES31.functional.state_query.texture_lev",
        "el.texture_2d_multisample.buffer_offset_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015804,
        "dEQP-GLES31.functional.state_query.texture_le",
        "vel.texture_2d_multisample.buffer_offset_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015805,
        "dEQP-GLES31.functional.state_query.texture_le",
        "vel.texture_2d_multisample.buffer_size_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015806,
        "dEQP-GLES31.functional.state_query.texture_l",
        "evel.texture_2d_multisample.buffer_size_float");
