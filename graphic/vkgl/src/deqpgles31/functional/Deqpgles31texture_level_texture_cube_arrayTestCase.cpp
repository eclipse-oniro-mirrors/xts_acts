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

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015895,
        "dEQP-GLES31.functional.state_query.textur",
        "e_level.texture_cube_array.samples_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015896,
        "dEQP-GLES31.functional.state_query.textu",
        "re_level.texture_cube_array.samples_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015897,
        "dEQP-GLES31.functional.state_query.texture_level.",
        "texture_cube_array.fixed_sample_locations_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015898,
        "dEQP-GLES31.functional.state_query.texture_level",
        ".texture_cube_array.fixed_sample_locations_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015899,
        "dEQP-GLES31.functional.state_query.textu",
        "re_level.texture_cube_array.width_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015900,
        "dEQP-GLES31.functional.state_query.text",
        "ure_level.texture_cube_array.width_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015901,
        "dEQP-GLES31.functional.state_query.textur",
        "e_level.texture_cube_array.height_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015902,
        "dEQP-GLES31.functional.state_query.textu",
        "re_level.texture_cube_array.height_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015903,
        "dEQP-GLES31.functional.state_query.textu",
        "re_level.texture_cube_array.depth_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015904,
        "dEQP-GLES31.functional.state_query.text",
        "ure_level.texture_cube_array.depth_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015905,
        "dEQP-GLES31.functional.state_query.texture_le",
        "vel.texture_cube_array.internal_format_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015906,
        "dEQP-GLES31.functional.state_query.texture_l",
        "evel.texture_cube_array.internal_format_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015907,
        "dEQP-GLES31.functional.state_query.texture",
        "_level.texture_cube_array.red_size_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015908,
        "dEQP-GLES31.functional.state_query.textur",
        "e_level.texture_cube_array.red_size_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015909,
        "dEQP-GLES31.functional.state_query.texture_",
        "level.texture_cube_array.green_size_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015910,
        "dEQP-GLES31.functional.state_query.texture",
        "_level.texture_cube_array.green_size_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015911,
        "dEQP-GLES31.functional.state_query.texture",
        "_level.texture_cube_array.blue_size_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015912,
        "dEQP-GLES31.functional.state_query.textur",
        "e_level.texture_cube_array.blue_size_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015913,
        "dEQP-GLES31.functional.state_query.texture_",
        "level.texture_cube_array.alpha_size_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015914,
        "dEQP-GLES31.functional.state_query.texture",
        "_level.texture_cube_array.alpha_size_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015915,
        "dEQP-GLES31.functional.state_query.texture_",
        "level.texture_cube_array.depth_size_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015916,
        "dEQP-GLES31.functional.state_query.texture",
        "_level.texture_cube_array.depth_size_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015917,
        "dEQP-GLES31.functional.state_query.texture_l",
        "evel.texture_cube_array.stencil_size_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015918,
        "dEQP-GLES31.functional.state_query.texture_",
        "level.texture_cube_array.stencil_size_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015919,
        "dEQP-GLES31.functional.state_query.texture_",
        "level.texture_cube_array.shared_size_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015920,
        "dEQP-GLES31.functional.state_query.texture",
        "_level.texture_cube_array.shared_size_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015921,
        "dEQP-GLES31.functional.state_query.texture",
        "_level.texture_cube_array.red_type_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015922,
        "dEQP-GLES31.functional.state_query.textur",
        "e_level.texture_cube_array.red_type_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015923,
        "dEQP-GLES31.functional.state_query.texture_",
        "level.texture_cube_array.green_type_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015924,
        "dEQP-GLES31.functional.state_query.texture",
        "_level.texture_cube_array.green_type_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015925,
        "dEQP-GLES31.functional.state_query.texture",
        "_level.texture_cube_array.blue_type_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015926,
        "dEQP-GLES31.functional.state_query.textur",
        "e_level.texture_cube_array.blue_type_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015927,
        "dEQP-GLES31.functional.state_query.texture_",
        "level.texture_cube_array.alpha_type_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015928,
        "dEQP-GLES31.functional.state_query.texture",
        "_level.texture_cube_array.alpha_type_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015929,
        "dEQP-GLES31.functional.state_query.texture_",
        "level.texture_cube_array.depth_type_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015930,
        "dEQP-GLES31.functional.state_query.texture",
        "_level.texture_cube_array.depth_type_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015931,
        "dEQP-GLES31.functional.state_query.texture_",
        "level.texture_cube_array.compressed_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015932,
        "dEQP-GLES31.functional.state_query.texture",
        "_level.texture_cube_array.compressed_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015933,
        "dEQP-GLES31.functional.state_query.texture_level.t",
        "exture_cube_array.buffer_data_store_binding_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015934,
        "dEQP-GLES31.functional.state_query.texture_level.",
        "texture_cube_array.buffer_data_store_binding_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015935,
        "dEQP-GLES31.functional.state_query.texture_l",
        "evel.texture_cube_array.buffer_offset_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015936,
        "dEQP-GLES31.functional.state_query.texture_",
        "level.texture_cube_array.buffer_offset_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015937,
        "dEQP-GLES31.functional.state_query.texture_",
        "level.texture_cube_array.buffer_size_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015938,
        "dEQP-GLES31.functional.state_query.texture",
        "_level.texture_cube_array.buffer_size_float");
