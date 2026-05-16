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

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016402,
        "dEQP-GLES31.functional.geometry_shad",
        "ing.instanced.geometry_1_invocations");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016403,
        "dEQP-GLES31.functional.geometry_shad",
        "ing.instanced.geometry_2_invocations");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016404,
        "dEQP-GLES31.functional.geometry_shad",
        "ing.instanced.geometry_8_invocations");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016405,
        "dEQP-GLES31.functional.geometry_shad",
        "ing.instanced.geometry_32_invocations");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016406,
        "dEQP-GLES31.functional.geometry_shadi",
        "ng.instanced.geometry_max_invocations");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016407,
        "dEQP-GLES31.functional.geometry_shading.inst",
        "anced.geometry_output_different_2_invocations");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016408,
        "dEQP-GLES31.functional.geometry_shading.inst",
        "anced.geometry_output_different_8_invocations");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016409,
        "dEQP-GLES31.functional.geometry_shading.insta",
        "nced.geometry_output_different_32_invocations");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016410,
        "dEQP-GLES31.functional.geometry_shading.insta",
        "nced.geometry_output_different_max_invocations");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016411,
        "dEQP-GLES31.functional.geometry_shading",
        ".instanced.invocation_per_layer_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016412,
        "dEQP-GLES31.functional.geometry_shad",
        "ing.instanced.invocation_per_layer_3d");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016413,
        "dEQP-GLES31.functional.geometry_shading",
        ".instanced.invocation_per_layer_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016414,
        "dEQP-GLES31.functional.geometry_shading.insta",
        "nced.invocation_per_layer_2d_multisample_array");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016415,
        "dEQP-GLES31.functional.geometry_shading.inst",
        "anced.multiple_layers_per_invocation_cubemap");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016416,
        "dEQP-GLES31.functional.geometry_shading.i",
        "nstanced.multiple_layers_per_invocation_3d");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016417,
        "dEQP-GLES31.functional.geometry_shading.inst",
        "anced.multiple_layers_per_invocation_2d_array");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016418,
        "dEQP-GLES31.functional.geometry_shading.instanced.",
        "multiple_layers_per_invocation_2d_multisample_array");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016419,
        "dEQP-GLES31.functional.geometry_shading.in",
        "stanced.invocation_output_vary_by_attribute");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016420,
        "dEQP-GLES31.functional.geometry_shading.i",
        "nstanced.invocation_output_vary_by_uniform");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016421,
        "dEQP-GLES31.functional.geometry_shading.i",
        "nstanced.invocation_output_vary_by_texture");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016422,
        "dEQP-GLES31.functional.geometry_shading.inst",
        "anced.draw_2_instances_geometry_2_invocations");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016423,
        "dEQP-GLES31.functional.geometry_shading.inst",
        "anced.draw_2_instances_geometry_8_invocations");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016424,
        "dEQP-GLES31.functional.geometry_shading.inst",
        "anced.draw_4_instances_geometry_2_invocations");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016425,
        "dEQP-GLES31.functional.geometry_shading.inst",
        "anced.draw_4_instances_geometry_8_invocations");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016426,
        "dEQP-GLES31.functional.geometry_shading.inst",
        "anced.draw_8_instances_geometry_2_invocations");

static SHRINK_HWTEST_F(ActsDeqpgles310017TestSuite, TestCase_016427,
        "dEQP-GLES31.functional.geometry_shading.inst",
        "anced.draw_8_instances_geometry_8_invocations");
