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
#include "../ActsDeqpgles310017TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016378,
        "dEQP-GLES31.functional.geometry_shading.",
        "layered.render_with_default_layer_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016379,
        "dEQP-GLES31.functional.geometry_shadin",
        "g.layered.render_with_default_layer_3d");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016380,
        "dEQP-GLES31.functional.geometry_shading.l",
        "ayered.render_with_default_layer_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016381,
        "dEQP-GLES31.functional.geometry_shading.layered",
        ".render_with_default_layer_2d_multisample_array");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016382,
        "dEQP-GLES31.functional.geometry_sh",
        "ading.layered.render_to_one_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016383,
        "dEQP-GLES31.functional.geometry_",
        "shading.layered.render_to_one_3d");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016384,
        "dEQP-GLES31.functional.geometry_sha",
        "ding.layered.render_to_one_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016385,
        "dEQP-GLES31.functional.geometry_shading.l",
        "ayered.render_to_one_2d_multisample_array");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016386,
        "dEQP-GLES31.functional.geometry_sh",
        "ading.layered.render_to_all_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016387,
        "dEQP-GLES31.functional.geometry_",
        "shading.layered.render_to_all_3d");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016388,
        "dEQP-GLES31.functional.geometry_sha",
        "ding.layered.render_to_all_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016389,
        "dEQP-GLES31.functional.geometry_shading.l",
        "ayered.render_to_all_2d_multisample_array");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016390,
        "dEQP-GLES31.functional.geometry_shadi",
        "ng.layered.render_different_to_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016391,
        "dEQP-GLES31.functional.geometry_sha",
        "ding.layered.render_different_to_3d");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016392,
        "dEQP-GLES31.functional.geometry_shadin",
        "g.layered.render_different_to_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016393,
        "dEQP-GLES31.functional.geometry_shading.laye",
        "red.render_different_to_2d_multisample_array");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016394,
        "dEQP-GLES31.functional.geometry_sha",
        "ding.layered.fragment_layer_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016395,
        "dEQP-GLES31.functional.geometry_",
        "shading.layered.fragment_layer_3d");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016396,
        "dEQP-GLES31.functional.geometry_sha",
        "ding.layered.fragment_layer_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016397,
        "dEQP-GLES31.functional.geometry_shading.l",
        "ayered.fragment_layer_2d_multisample_array");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016398,
        "dEQP-GLES31.functional.geometry_shading",
        ".layered.layer_provoking_vertex_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016399,
        "dEQP-GLES31.functional.geometry_shad",
        "ing.layered.layer_provoking_vertex_3d");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016400,
        "dEQP-GLES31.functional.geometry_shading",
        ".layered.layer_provoking_vertex_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016401,
        "dEQP-GLES31.functional.geometry_shading.layer",
        "ed.layer_provoking_vertex_2d_multisample_array");
