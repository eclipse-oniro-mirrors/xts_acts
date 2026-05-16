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

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015719,
        "dEQP-GLES31.functional.state_query.textu",
        "re_level.texture_cube_map.samples_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015720,
        "dEQP-GLES31.functional.state_query.text",
        "ure_level.texture_cube_map.samples_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015721,
        "dEQP-GLES31.functional.state_query.texture_level",
        ".texture_cube_map.fixed_sample_locations_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015722,
        "dEQP-GLES31.functional.state_query.texture_leve",
        "l.texture_cube_map.fixed_sample_locations_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015723,
        "dEQP-GLES31.functional.state_query.text",
        "ure_level.texture_cube_map.width_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015724,
        "dEQP-GLES31.functional.state_query.tex",
        "ture_level.texture_cube_map.width_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015725,
        "dEQP-GLES31.functional.state_query.textu",
        "re_level.texture_cube_map.height_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015726,
        "dEQP-GLES31.functional.state_query.text",
        "ure_level.texture_cube_map.height_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015727,
        "dEQP-GLES31.functional.state_query.text",
        "ure_level.texture_cube_map.depth_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015728,
        "dEQP-GLES31.functional.state_query.tex",
        "ture_level.texture_cube_map.depth_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015729,
        "dEQP-GLES31.functional.state_query.texture_l",
        "evel.texture_cube_map.internal_format_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015730,
        "dEQP-GLES31.functional.state_query.texture_",
        "level.texture_cube_map.internal_format_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015731,
        "dEQP-GLES31.functional.state_query.textur",
        "e_level.texture_cube_map.red_size_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015732,
        "dEQP-GLES31.functional.state_query.textu",
        "re_level.texture_cube_map.red_size_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015733,
        "dEQP-GLES31.functional.state_query.texture",
        "_level.texture_cube_map.green_size_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015734,
        "dEQP-GLES31.functional.state_query.textur",
        "e_level.texture_cube_map.green_size_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015735,
        "dEQP-GLES31.functional.state_query.textur",
        "e_level.texture_cube_map.blue_size_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015736,
        "dEQP-GLES31.functional.state_query.textu",
        "re_level.texture_cube_map.blue_size_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015737,
        "dEQP-GLES31.functional.state_query.texture",
        "_level.texture_cube_map.alpha_size_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015738,
        "dEQP-GLES31.functional.state_query.textur",
        "e_level.texture_cube_map.alpha_size_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015739,
        "dEQP-GLES31.functional.state_query.texture",
        "_level.texture_cube_map.depth_size_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015740,
        "dEQP-GLES31.functional.state_query.textur",
        "e_level.texture_cube_map.depth_size_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015741,
        "dEQP-GLES31.functional.state_query.texture_",
        "level.texture_cube_map.stencil_size_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015742,
        "dEQP-GLES31.functional.state_query.texture",
        "_level.texture_cube_map.stencil_size_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015743,
        "dEQP-GLES31.functional.state_query.texture",
        "_level.texture_cube_map.shared_size_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015744,
        "dEQP-GLES31.functional.state_query.textur",
        "e_level.texture_cube_map.shared_size_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015745,
        "dEQP-GLES31.functional.state_query.textur",
        "e_level.texture_cube_map.red_type_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015746,
        "dEQP-GLES31.functional.state_query.textu",
        "re_level.texture_cube_map.red_type_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015747,
        "dEQP-GLES31.functional.state_query.texture",
        "_level.texture_cube_map.green_type_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015748,
        "dEQP-GLES31.functional.state_query.textur",
        "e_level.texture_cube_map.green_type_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015749,
        "dEQP-GLES31.functional.state_query.textur",
        "e_level.texture_cube_map.blue_type_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015750,
        "dEQP-GLES31.functional.state_query.textu",
        "re_level.texture_cube_map.blue_type_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015751,
        "dEQP-GLES31.functional.state_query.texture",
        "_level.texture_cube_map.alpha_type_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015752,
        "dEQP-GLES31.functional.state_query.textur",
        "e_level.texture_cube_map.alpha_type_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015753,
        "dEQP-GLES31.functional.state_query.texture",
        "_level.texture_cube_map.depth_type_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015754,
        "dEQP-GLES31.functional.state_query.textur",
        "e_level.texture_cube_map.depth_type_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015755,
        "dEQP-GLES31.functional.state_query.texture",
        "_level.texture_cube_map.compressed_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015756,
        "dEQP-GLES31.functional.state_query.textur",
        "e_level.texture_cube_map.compressed_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015757,
        "dEQP-GLES31.functional.state_query.texture_level.",
        "texture_cube_map.buffer_data_store_binding_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015758,
        "dEQP-GLES31.functional.state_query.texture_level",
        ".texture_cube_map.buffer_data_store_binding_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015759,
        "dEQP-GLES31.functional.state_query.texture_",
        "level.texture_cube_map.buffer_offset_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015760,
        "dEQP-GLES31.functional.state_query.texture",
        "_level.texture_cube_map.buffer_offset_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015761,
        "dEQP-GLES31.functional.state_query.texture",
        "_level.texture_cube_map.buffer_size_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015762,
        "dEQP-GLES31.functional.state_query.textur",
        "e_level.texture_cube_map.buffer_size_float");
