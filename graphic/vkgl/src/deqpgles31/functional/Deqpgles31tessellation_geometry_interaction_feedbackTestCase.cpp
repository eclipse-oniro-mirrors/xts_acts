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

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018296,
        "dEQP-GLES31.functional.tessellation_geometry_interaction.fe",
        "edback.tessellation_output_triangles_geometry_output_points");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018297,
        "dEQP-GLES31.functional.tessellation_geometry_interaction.",
        "feedback.tessellation_output_quads_geometry_output_points");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018298,
        "dEQP-GLES31.functional.tessellation_geometry_interaction.f",
        "eedback.tessellation_output_isolines_geometry_output_points");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018299,
        "dEQP-GLES31.functional.tessellation_geometry_interaction.feedbac",
        "k.tessellation_output_triangles_point_mode_geometry_output_lines");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018300,
        "dEQP-GLES31.functional.tessellation_geometry_interaction.feedb",
        "ack.tessellation_output_quads_point_mode_geometry_output_lines");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018301,
        "dEQP-GLES31.functional.tessellation_geometry_interaction.feedback",
        ".tessellation_output_isolines_point_mode_geometry_output_triangles");

static SHRINK_HWTEST_F(ActsDeqpgles310019TestSuite, TestCase_018302,
        "dEQP-GLES31.functional.tessellation_geometry_",
        "interaction.feedback.record_variable_selection");
