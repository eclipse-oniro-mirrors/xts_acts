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
#include "../ActsDeqpgles310022TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021742,
        "dEQP-GLES31.functional.program_interface_",
        "query.atomic_counter_buffer.resource_list");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021743,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.atomic_counter_buffer.active_variables");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021744,
        "dEQP-GLES31.functional.program_interface_",
        "query.atomic_counter_buffer.buffer_binding");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021745,
        "dEQP-GLES31.functional.program_interface_q",
        "uery.atomic_counter_buffer.buffer_data_size");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021746,
        "dEQP-GLES31.functional.program_interface_quer",
        "y.atomic_counter_buffer.referenced_by_compute");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021747,
        "dEQP-GLES31.functional.program_interface_query.at",
        "omic_counter_buffer.referenced_by_separable_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021748,
        "dEQP-GLES31.functional.program_interface_query.ato",
        "mic_counter_buffer.referenced_by_separable_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021749,
        "dEQP-GLES31.functional.program_interface_query.ato",
        "mic_counter_buffer.referenced_by_separable_geometry");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021750,
        "dEQP-GLES31.functional.program_interface_query.atom",
        "ic_counter_buffer.referenced_by_separable_tess_ctrl");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021751,
        "dEQP-GLES31.functional.program_interface_query.atom",
        "ic_counter_buffer.referenced_by_separable_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021752,
        "dEQP-GLES31.functional.program_interface_query.at",
        "omic_counter_buffer.referenced_by_vertex_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021753,
        "dEQP-GLES31.functional.program_interface_query.atomic_c",
        "ounter_buffer.referenced_by_vertex_fragment_only_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021754,
        "dEQP-GLES31.functional.program_interface_query.atomic_co",
        "unter_buffer.referenced_by_vertex_fragment_only_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021755,
        "dEQP-GLES31.functional.program_interface_query.atom",
        "ic_counter_buffer.referenced_by_vertex_tess_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021756,
        "dEQP-GLES31.functional.program_interface_query.atomic_cou",
        "nter_buffer.referenced_by_vertex_tess_fragment_only_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021757,
        "dEQP-GLES31.functional.program_interface_query.atomic_coun",
        "ter_buffer.referenced_by_vertex_tess_fragment_only_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021758,
        "dEQP-GLES31.functional.program_interface_query.atomic_count",
        "er_buffer.referenced_by_vertex_tess_fragment_only_tess_ctrl");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021759,
        "dEQP-GLES31.functional.program_interface_query.atomic_count",
        "er_buffer.referenced_by_vertex_tess_fragment_only_tess_eval");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021760,
        "dEQP-GLES31.functional.program_interface_query.atom",
        "ic_counter_buffer.referenced_by_vertex_geo_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021761,
        "dEQP-GLES31.functional.program_interface_query.atomic_cou",
        "nter_buffer.referenced_by_vertex_geo_fragment_only_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021762,
        "dEQP-GLES31.functional.program_interface_query.atomic_coun",
        "ter_buffer.referenced_by_vertex_geo_fragment_only_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021763,
        "dEQP-GLES31.functional.program_interface_query.atomic_c",
        "ounter_buffer.referenced_by_vertex_geo_fragment_only_geo");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021764,
        "dEQP-GLES31.functional.program_interface_query.atomic",
        "_counter_buffer.referenced_by_vertex_tess_geo_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021765,
        "dEQP-GLES31.functional.program_interface_query.atomic_count",
        "er_buffer.referenced_by_vertex_tess_geo_fragment_only_vertex");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021766,
        "dEQP-GLES31.functional.program_interface_query.atomic_counte",
        "r_buffer.referenced_by_vertex_tess_geo_fragment_only_fragment");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021767,
        "dEQP-GLES31.functional.program_interface_query.atomic_coun",
        "ter_buffer.referenced_by_vertex_tess_geo_fragment_only_geo");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021768,
        "dEQP-GLES31.functional.program_interface_query.atomic_counter",
        "_buffer.referenced_by_vertex_tess_geo_fragment_only_tess_ctrl");

static SHRINK_HWTEST_F(ActsDeqpgles310022TestSuite, TestCase_021769,
        "dEQP-GLES31.functional.program_interface_query.atomic_counter",
        "_buffer.referenced_by_vertex_tess_geo_fragment_only_tess_eval");
