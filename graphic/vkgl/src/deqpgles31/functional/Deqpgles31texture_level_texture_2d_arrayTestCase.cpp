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

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015675,
        "dEQP-GLES31.functional.state_query.textu",
        "re_level.texture_2d_array.samples_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015676,
        "dEQP-GLES31.functional.state_query.text",
        "ure_level.texture_2d_array.samples_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015677,
        "dEQP-GLES31.functional.state_query.texture_level",
        ".texture_2d_array.fixed_sample_locations_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015678,
        "dEQP-GLES31.functional.state_query.texture_leve",
        "l.texture_2d_array.fixed_sample_locations_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015679,
        "dEQP-GLES31.functional.state_query.text",
        "ure_level.texture_2d_array.width_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015680,
        "dEQP-GLES31.functional.state_query.tex",
        "ture_level.texture_2d_array.width_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015681,
        "dEQP-GLES31.functional.state_query.textu",
        "re_level.texture_2d_array.height_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015682,
        "dEQP-GLES31.functional.state_query.text",
        "ure_level.texture_2d_array.height_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015683,
        "dEQP-GLES31.functional.state_query.text",
        "ure_level.texture_2d_array.depth_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015684,
        "dEQP-GLES31.functional.state_query.tex",
        "ture_level.texture_2d_array.depth_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015685,
        "dEQP-GLES31.functional.state_query.texture_l",
        "evel.texture_2d_array.internal_format_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015686,
        "dEQP-GLES31.functional.state_query.texture_",
        "level.texture_2d_array.internal_format_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015687,
        "dEQP-GLES31.functional.state_query.textur",
        "e_level.texture_2d_array.red_size_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015688,
        "dEQP-GLES31.functional.state_query.textu",
        "re_level.texture_2d_array.red_size_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015689,
        "dEQP-GLES31.functional.state_query.texture",
        "_level.texture_2d_array.green_size_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015690,
        "dEQP-GLES31.functional.state_query.textur",
        "e_level.texture_2d_array.green_size_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015691,
        "dEQP-GLES31.functional.state_query.textur",
        "e_level.texture_2d_array.blue_size_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015692,
        "dEQP-GLES31.functional.state_query.textu",
        "re_level.texture_2d_array.blue_size_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015693,
        "dEQP-GLES31.functional.state_query.texture",
        "_level.texture_2d_array.alpha_size_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015694,
        "dEQP-GLES31.functional.state_query.textur",
        "e_level.texture_2d_array.alpha_size_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015695,
        "dEQP-GLES31.functional.state_query.texture",
        "_level.texture_2d_array.depth_size_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015696,
        "dEQP-GLES31.functional.state_query.textur",
        "e_level.texture_2d_array.depth_size_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015697,
        "dEQP-GLES31.functional.state_query.texture_",
        "level.texture_2d_array.stencil_size_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015698,
        "dEQP-GLES31.functional.state_query.texture",
        "_level.texture_2d_array.stencil_size_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015699,
        "dEQP-GLES31.functional.state_query.texture",
        "_level.texture_2d_array.shared_size_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015700,
        "dEQP-GLES31.functional.state_query.textur",
        "e_level.texture_2d_array.shared_size_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015701,
        "dEQP-GLES31.functional.state_query.textur",
        "e_level.texture_2d_array.red_type_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015702,
        "dEQP-GLES31.functional.state_query.textu",
        "re_level.texture_2d_array.red_type_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015703,
        "dEQP-GLES31.functional.state_query.texture",
        "_level.texture_2d_array.green_type_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015704,
        "dEQP-GLES31.functional.state_query.textur",
        "e_level.texture_2d_array.green_type_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015705,
        "dEQP-GLES31.functional.state_query.textur",
        "e_level.texture_2d_array.blue_type_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015706,
        "dEQP-GLES31.functional.state_query.textu",
        "re_level.texture_2d_array.blue_type_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015707,
        "dEQP-GLES31.functional.state_query.texture",
        "_level.texture_2d_array.alpha_type_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015708,
        "dEQP-GLES31.functional.state_query.textur",
        "e_level.texture_2d_array.alpha_type_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015709,
        "dEQP-GLES31.functional.state_query.texture",
        "_level.texture_2d_array.depth_type_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015710,
        "dEQP-GLES31.functional.state_query.textur",
        "e_level.texture_2d_array.depth_type_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015711,
        "dEQP-GLES31.functional.state_query.texture",
        "_level.texture_2d_array.compressed_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015712,
        "dEQP-GLES31.functional.state_query.textur",
        "e_level.texture_2d_array.compressed_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015713,
        "dEQP-GLES31.functional.state_query.texture_level.",
        "texture_2d_array.buffer_data_store_binding_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015714,
        "dEQP-GLES31.functional.state_query.texture_level",
        ".texture_2d_array.buffer_data_store_binding_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015715,
        "dEQP-GLES31.functional.state_query.texture_",
        "level.texture_2d_array.buffer_offset_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015716,
        "dEQP-GLES31.functional.state_query.texture",
        "_level.texture_2d_array.buffer_offset_float");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015717,
        "dEQP-GLES31.functional.state_query.texture",
        "_level.texture_2d_array.buffer_size_integer");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015718,
        "dEQP-GLES31.functional.state_query.textur",
        "e_level.texture_2d_array.buffer_size_float");
