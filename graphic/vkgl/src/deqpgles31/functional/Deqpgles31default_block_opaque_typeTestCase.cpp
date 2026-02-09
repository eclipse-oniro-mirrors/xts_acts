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
#include "../ActsDeqpgles310021TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020416,
        "dEQP-GLES31.functional.program_interface_query.uniform.atom",
        "ic_counter_buffer_index.default_block.opaque_type.sampler_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020417,
        "dEQP-GLES31.functional.program_interface_query.uniform.atomi",
        "c_counter_buffer_index.default_block.opaque_type.sampler_cube");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020418,
        "dEQP-GLES31.functional.program_interface_query.uniform.atomic_",
        "counter_buffer_index.default_block.opaque_type.sampler_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020419,
        "dEQP-GLES31.functional.program_interface_query.uniform.atom",
        "ic_counter_buffer_index.default_block.opaque_type.sampler_3d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020420,
        "dEQP-GLES31.functional.program_interface_query.uniform.atomic_c",
        "ounter_buffer_index.default_block.opaque_type.sampler_2d_shadow");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020421,
        "dEQP-GLES31.functional.program_interface_query.uniform.atomic_co",
        "unter_buffer_index.default_block.opaque_type.sampler_cube_shadow");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020422,
        "dEQP-GLES31.functional.program_interface_query.uniform.atomic_coun",
        "ter_buffer_index.default_block.opaque_type.sampler_2d_array_shadow");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020423,
        "dEQP-GLES31.functional.program_interface_query.uniform.atomi",
        "c_counter_buffer_index.default_block.opaque_type.isampler_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020424,
        "dEQP-GLES31.functional.program_interface_query.uniform.atomic",
        "_counter_buffer_index.default_block.opaque_type.isampler_cube");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020425,
        "dEQP-GLES31.functional.program_interface_query.uniform.atomic_c",
        "ounter_buffer_index.default_block.opaque_type.isampler_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020426,
        "dEQP-GLES31.functional.program_interface_query.uniform.atomi",
        "c_counter_buffer_index.default_block.opaque_type.isampler_3d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020427,
        "dEQP-GLES31.functional.program_interface_query.uniform.atomi",
        "c_counter_buffer_index.default_block.opaque_type.usampler_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020428,
        "dEQP-GLES31.functional.program_interface_query.uniform.atomic",
        "_counter_buffer_index.default_block.opaque_type.usampler_cube");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020429,
        "dEQP-GLES31.functional.program_interface_query.uniform.atomic_c",
        "ounter_buffer_index.default_block.opaque_type.usampler_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020430,
        "dEQP-GLES31.functional.program_interface_query.uniform.atomi",
        "c_counter_buffer_index.default_block.opaque_type.usampler_3d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020431,
        "dEQP-GLES31.functional.program_interface_query.uniform.atomic",
        "_counter_buffer_index.default_block.opaque_type.sampler_2d_ms");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020432,
        "dEQP-GLES31.functional.program_interface_query.uniform.atomic",
        "_counter_buffer_index.default_block.opaque_type.isampler_2d_ms");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020433,
        "dEQP-GLES31.functional.program_interface_query.uniform.atomic",
        "_counter_buffer_index.default_block.opaque_type.usampler_2d_ms");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020434,
        "dEQP-GLES31.functional.program_interface_query.uniform.ato",
        "mic_counter_buffer_index.default_block.opaque_type.image_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020435,
        "dEQP-GLES31.functional.program_interface_query.uniform.atom",
        "ic_counter_buffer_index.default_block.opaque_type.image_cube");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020436,
        "dEQP-GLES31.functional.program_interface_query.uniform.atomic",
        "_counter_buffer_index.default_block.opaque_type.image_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020437,
        "dEQP-GLES31.functional.program_interface_query.uniform.ato",
        "mic_counter_buffer_index.default_block.opaque_type.image_3d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020438,
        "dEQP-GLES31.functional.program_interface_query.uniform.atom",
        "ic_counter_buffer_index.default_block.opaque_type.iimage_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020439,
        "dEQP-GLES31.functional.program_interface_query.uniform.atomi",
        "c_counter_buffer_index.default_block.opaque_type.iimage_cube");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020440,
        "dEQP-GLES31.functional.program_interface_query.uniform.atomic_",
        "counter_buffer_index.default_block.opaque_type.iimage_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020441,
        "dEQP-GLES31.functional.program_interface_query.uniform.atom",
        "ic_counter_buffer_index.default_block.opaque_type.iimage_3d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020442,
        "dEQP-GLES31.functional.program_interface_query.uniform.atom",
        "ic_counter_buffer_index.default_block.opaque_type.uimage_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020443,
        "dEQP-GLES31.functional.program_interface_query.uniform.atomi",
        "c_counter_buffer_index.default_block.opaque_type.uimage_cube");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020444,
        "dEQP-GLES31.functional.program_interface_query.uniform.atomic_",
        "counter_buffer_index.default_block.opaque_type.uimage_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020445,
        "dEQP-GLES31.functional.program_interface_query.uniform.atom",
        "ic_counter_buffer_index.default_block.opaque_type.uimage_3d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020446,
        "dEQP-GLES31.functional.program_interface_query.uniform.atomi",
        "c_counter_buffer_index.default_block.opaque_type.atomic_uint");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020484,
        "dEQP-GLES31.functional.program_interface_query.uni",
        "form.location.default_block.opaque_type.sampler_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020485,
        "dEQP-GLES31.functional.program_interface_query.unif",
        "orm.location.default_block.opaque_type.sampler_cube");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020486,
        "dEQP-GLES31.functional.program_interface_query.unifor",
        "m.location.default_block.opaque_type.sampler_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020487,
        "dEQP-GLES31.functional.program_interface_query.uni",
        "form.location.default_block.opaque_type.sampler_3d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020488,
        "dEQP-GLES31.functional.program_interface_query.unifor",
        "m.location.default_block.opaque_type.sampler_2d_shadow");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020489,
        "dEQP-GLES31.functional.program_interface_query.uniform",
        ".location.default_block.opaque_type.sampler_cube_shadow");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020490,
        "dEQP-GLES31.functional.program_interface_query.uniform.l",
        "ocation.default_block.opaque_type.sampler_2d_array_shadow");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020491,
        "dEQP-GLES31.functional.program_interface_query.uni",
        "form.location.default_block.opaque_type.isampler_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020492,
        "dEQP-GLES31.functional.program_interface_query.unif",
        "orm.location.default_block.opaque_type.isampler_cube");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020493,
        "dEQP-GLES31.functional.program_interface_query.unifor",
        "m.location.default_block.opaque_type.isampler_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020494,
        "dEQP-GLES31.functional.program_interface_query.uni",
        "form.location.default_block.opaque_type.isampler_3d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020495,
        "dEQP-GLES31.functional.program_interface_query.uni",
        "form.location.default_block.opaque_type.usampler_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020496,
        "dEQP-GLES31.functional.program_interface_query.unif",
        "orm.location.default_block.opaque_type.usampler_cube");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020497,
        "dEQP-GLES31.functional.program_interface_query.unifor",
        "m.location.default_block.opaque_type.usampler_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020498,
        "dEQP-GLES31.functional.program_interface_query.uni",
        "form.location.default_block.opaque_type.usampler_3d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020499,
        "dEQP-GLES31.functional.program_interface_query.unif",
        "orm.location.default_block.opaque_type.sampler_2d_ms");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020500,
        "dEQP-GLES31.functional.program_interface_query.unifo",
        "rm.location.default_block.opaque_type.isampler_2d_ms");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020501,
        "dEQP-GLES31.functional.program_interface_query.unifo",
        "rm.location.default_block.opaque_type.usampler_2d_ms");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020502,
        "dEQP-GLES31.functional.program_interface_query.un",
        "iform.location.default_block.opaque_type.image_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020503,
        "dEQP-GLES31.functional.program_interface_query.uni",
        "form.location.default_block.opaque_type.image_cube");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020504,
        "dEQP-GLES31.functional.program_interface_query.unifo",
        "rm.location.default_block.opaque_type.image_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020505,
        "dEQP-GLES31.functional.program_interface_query.un",
        "iform.location.default_block.opaque_type.image_3d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020506,
        "dEQP-GLES31.functional.program_interface_query.un",
        "iform.location.default_block.opaque_type.iimage_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020507,
        "dEQP-GLES31.functional.program_interface_query.uni",
        "form.location.default_block.opaque_type.iimage_cube");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020508,
        "dEQP-GLES31.functional.program_interface_query.unifo",
        "rm.location.default_block.opaque_type.iimage_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020509,
        "dEQP-GLES31.functional.program_interface_query.un",
        "iform.location.default_block.opaque_type.iimage_3d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020510,
        "dEQP-GLES31.functional.program_interface_query.un",
        "iform.location.default_block.opaque_type.uimage_2d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020511,
        "dEQP-GLES31.functional.program_interface_query.uni",
        "form.location.default_block.opaque_type.uimage_cube");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020512,
        "dEQP-GLES31.functional.program_interface_query.unifo",
        "rm.location.default_block.opaque_type.uimage_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020513,
        "dEQP-GLES31.functional.program_interface_query.un",
        "iform.location.default_block.opaque_type.uimage_3d");

static SHRINK_HWTEST_F(ActsDeqpgles310021TestSuite, TestCase_020514,
        "dEQP-GLES31.functional.program_interface_query.uni",
        "form.location.default_block.opaque_type.atomic_uint");
