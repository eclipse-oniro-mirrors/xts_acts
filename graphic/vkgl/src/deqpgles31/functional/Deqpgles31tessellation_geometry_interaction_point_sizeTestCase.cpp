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
#include "../ActsDeqpgles310019TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018303,
        "dEQP-GLES31.functional.tessellation_geo",
        "metry_interaction.point_size.vertex_set");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018304,
        "dEQP-GLES31.functional.tessellation_geome",
        "try_interaction.point_size.evaluation_set");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018305,
        "dEQP-GLES31.functional.tessellation_geom",
        "etry_interaction.point_size.geometry_set");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018306,
        "dEQP-GLES31.functional.tessellation_geometry_",
        "interaction.point_size.vertex_set_control_set");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018307,
        "dEQP-GLES31.functional.tessellation_geometry_i",
        "nteraction.point_size.vertex_set_evaluation_set");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018308,
        "dEQP-GLES31.functional.tessellation_geometry_",
        "interaction.point_size.vertex_set_eval_default");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018309,
        "dEQP-GLES31.functional.tessellation_geometry_",
        "interaction.point_size.vertex_set_geometry_set");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018310,
        "dEQP-GLES31.functional.tessellation_geometry_interact",
        "ion.point_size.vertex_set_evaluation_set_geometry_set");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018311,
        "dEQP-GLES31.functional.tessellation_geometry_interaction",
        ".point_size.vertex_set_control_pass_eval_add_geometry_add");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018312,
        "dEQP-GLES31.functional.tessellation_geometry_interactio",
        "n.point_size.vertex_set_evaluation_set_geometry_default");
