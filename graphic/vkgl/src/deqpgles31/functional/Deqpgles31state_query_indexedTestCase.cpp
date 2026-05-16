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

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015273,
        "dEQP-GLES31.functional.state_query.in",
        "dexed.sample_mask_value_getbooleani_v");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015274,
        "dEQP-GLES31.functional.state_query.in",
        "dexed.sample_mask_value_getintegeri_v");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015275,
        "dEQP-GLES31.functional.state_query.ind",
        "exed.sample_mask_value_getinteger64i_v");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015276,
        "dEQP-GLES31.functional.state_query.indexed",
        ".max_compute_work_group_count_getbooleani_v");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015277,
        "dEQP-GLES31.functional.state_query.indexed",
        ".max_compute_work_group_count_getintegeri_v");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015278,
        "dEQP-GLES31.functional.state_query.indexed.",
        "max_compute_work_group_count_getinteger64i_v");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015279,
        "dEQP-GLES31.functional.state_query.indexed",
        ".max_compute_work_group_size_getbooleani_v");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015280,
        "dEQP-GLES31.functional.state_query.indexed",
        ".max_compute_work_group_size_getintegeri_v");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015281,
        "dEQP-GLES31.functional.state_query.indexed.",
        "max_compute_work_group_size_getinteger64i_v");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015282,
        "dEQP-GLES31.functional.state_query.indexed.",
        "atomic_counter_buffer_binding_getbooleani_v");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015283,
        "dEQP-GLES31.functional.state_query.indexed.",
        "atomic_counter_buffer_binding_getintegeri_v");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015284,
        "dEQP-GLES31.functional.state_query.indexed.a",
        "tomic_counter_buffer_binding_getinteger64i_v");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015285,
        "dEQP-GLES31.functional.state_query.indexed",
        ".atomic_counter_buffer_start_getbooleani_v");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015286,
        "dEQP-GLES31.functional.state_query.indexed",
        ".atomic_counter_buffer_start_getintegeri_v");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015287,
        "dEQP-GLES31.functional.state_query.indexed.",
        "atomic_counter_buffer_start_getinteger64i_v");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015288,
        "dEQP-GLES31.functional.state_query.indexe",
        "d.atomic_counter_buffer_size_getbooleani_v");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015289,
        "dEQP-GLES31.functional.state_query.indexe",
        "d.atomic_counter_buffer_size_getintegeri_v");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015290,
        "dEQP-GLES31.functional.state_query.indexed",
        ".atomic_counter_buffer_size_getinteger64i_v");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015291,
        "dEQP-GLES31.functional.state_query.indexed.",
        "shader_storage_buffer_binding_getbooleani_v");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015292,
        "dEQP-GLES31.functional.state_query.indexed.",
        "shader_storage_buffer_binding_getintegeri_v");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015293,
        "dEQP-GLES31.functional.state_query.indexed.s",
        "hader_storage_buffer_binding_getinteger64i_v");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015294,
        "dEQP-GLES31.functional.state_query.indexed",
        ".shader_storage_buffer_start_getbooleani_v");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015295,
        "dEQP-GLES31.functional.state_query.indexed",
        ".shader_storage_buffer_start_getintegeri_v");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015296,
        "dEQP-GLES31.functional.state_query.indexed.",
        "shader_storage_buffer_start_getinteger64i_v");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015297,
        "dEQP-GLES31.functional.state_query.indexe",
        "d.shader_storage_buffer_size_getbooleani_v");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015298,
        "dEQP-GLES31.functional.state_query.indexe",
        "d.shader_storage_buffer_size_getintegeri_v");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015299,
        "dEQP-GLES31.functional.state_query.indexed",
        ".shader_storage_buffer_size_getinteger64i_v");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015300,
        "dEQP-GLES31.functional.state_query.in",
        "dexed.image_binding_name_getbooleani_v");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015301,
        "dEQP-GLES31.functional.state_query.in",
        "dexed.image_binding_name_getintegeri_v");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015302,
        "dEQP-GLES31.functional.state_query.ind",
        "exed.image_binding_name_getinteger64i_v");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015303,
        "dEQP-GLES31.functional.state_query.ind",
        "exed.image_binding_level_getbooleani_v");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015304,
        "dEQP-GLES31.functional.state_query.ind",
        "exed.image_binding_level_getintegeri_v");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015305,
        "dEQP-GLES31.functional.state_query.inde",
        "xed.image_binding_level_getinteger64i_v");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015306,
        "dEQP-GLES31.functional.state_query.inde",
        "xed.image_binding_layered_getbooleani_v");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015307,
        "dEQP-GLES31.functional.state_query.inde",
        "xed.image_binding_layered_getintegeri_v");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015308,
        "dEQP-GLES31.functional.state_query.index",
        "ed.image_binding_layered_getinteger64i_v");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015309,
        "dEQP-GLES31.functional.state_query.ind",
        "exed.image_binding_layer_getbooleani_v");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015310,
        "dEQP-GLES31.functional.state_query.ind",
        "exed.image_binding_layer_getintegeri_v");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015311,
        "dEQP-GLES31.functional.state_query.inde",
        "xed.image_binding_layer_getinteger64i_v");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015312,
        "dEQP-GLES31.functional.state_query.ind",
        "exed.image_binding_access_getbooleani_v");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015313,
        "dEQP-GLES31.functional.state_query.ind",
        "exed.image_binding_access_getintegeri_v");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015314,
        "dEQP-GLES31.functional.state_query.inde",
        "xed.image_binding_access_getinteger64i_v");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015315,
        "dEQP-GLES31.functional.state_query.ind",
        "exed.image_binding_format_getbooleani_v");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015316,
        "dEQP-GLES31.functional.state_query.ind",
        "exed.image_binding_format_getintegeri_v");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015317,
        "dEQP-GLES31.functional.state_query.inde",
        "xed.image_binding_format_getinteger64i_v");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015318,
        "dEQP-GLES31.functional.state_",
        "query.indexed.blend_isenabledi");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015319,
        "dEQP-GLES31.functional.state_quer",
        "y.indexed.color_mask_getbooleani_v");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015320,
        "dEQP-GLES31.functional.state_quer",
        "y.indexed.color_mask_getintegeri_v");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015321,
        "dEQP-GLES31.functional.state_query",
        ".indexed.color_mask_getinteger64i_v");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015322,
        "dEQP-GLES31.functional.state_quer",
        "y.indexed.blend_func_getbooleani_v");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015323,
        "dEQP-GLES31.functional.state_quer",
        "y.indexed.blend_func_getintegeri_v");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015324,
        "dEQP-GLES31.functional.state_query",
        ".indexed.blend_func_getinteger64i_v");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015325,
        "dEQP-GLES31.functional.state_query.",
        "indexed.blend_equation_getbooleani_v");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015326,
        "dEQP-GLES31.functional.state_query.",
        "indexed.blend_equation_getintegeri_v");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015327,
        "dEQP-GLES31.functional.state_query.i",
        "ndexed.blend_equation_getinteger64i_v");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015328,
        "dEQP-GLES31.functional.state_query.index",
        "ed.blend_equation_advanced_getbooleani_v");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015329,
        "dEQP-GLES31.functional.state_query.index",
        "ed.blend_equation_advanced_getintegeri_v");

static SHRINK_HWTEST_F(ActsDeqpgles310016TestSuite, TestCase_015330,
        "dEQP-GLES31.functional.state_query.indexe",
        "d.blend_equation_advanced_getinteger64i_v");
