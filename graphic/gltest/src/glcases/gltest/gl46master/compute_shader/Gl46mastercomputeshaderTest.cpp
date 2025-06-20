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
#include "../Gl46masterBaseFunc.h"
#include "../ActsGl46master0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_005594,
    "KHR-GL46.compute_shader.simple-compute");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_005595,
    "KHR-GL46.compute_shader.one-work-group");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_005596,
    "KHR-GL46.compute_shader.resource-ubo");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_005597,
    "KHR-GL46.compute_shader.resource-texture");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_005598,
    "KHR-GL46.compute_shader.resource-image");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_005599,
    "KHR-GL46.compute_shader.resource-atomic-counter");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_005600,
    "KHR-GL46.compute_shader.resource-subroutine");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_005601,
    "KHR-GL46.compute_shader.resource-uniform");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_005602,
    "KHR-GL46.compute_shader.built-in-variables");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_005603,
    "KHR-GL46.compute_shader.max");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_005604,
    "KHR-GL46.compute_shader.work-group-size");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_005605,
    "KHR-GL46.compute_shader.build-monolithic");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_005606,
    "KHR-GL46.compute_shader.build-separable");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_005607,
    "KHR-GL46.compute_shader.shared-simple");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_005608,
    "KHR-GL46.compute_shader.shared-struct");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_005609,
    "KHR-GL46.compute_shader.dispatch-indirect");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_005610,
    "KHR-GL46.compute_shader.sso-compute-pipeline");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_005611,
    "KHR-GL46.compute_shader.sso-case2");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_005612,
    "KHR-GL46.compute_shader.sso-case3");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_005613,
    "KHR-GL46.compute_shader.atomic-case1");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_005614,
    "KHR-GL46.compute_shader.atomic-case2");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_005615,
    "KHR-GL46.compute_shader.atomic-case3");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_005616,
    "KHR-GL46.compute_shader.copy-image");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_005617,
    "KHR-GL46.compute_shader.pipeline-pre-vs");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_005618,
    "KHR-GL46.compute_shader.pipeline-gen-draw-commands");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_005619,
    "KHR-GL46.compute_shader.pipeline-compute-chain");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_005620,
    "KHR-GL46.compute_shader.pipeline-post-fs");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_005621,
    "KHR-GL46.compute_shader.pipeline-post-xfb");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_005622,
    "KHR-GL46.compute_shader.shared-indexing");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_005623,
    "KHR-GL46.compute_shader.shared-max");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_005624,
    "KHR-GL46.compute_shader.dynamic-paths");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_005625,
    "KHR-GL46.compute_shader.resources-max");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_005626,
    "KHR-GL46.compute_shader.fp64-case1");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_005627,
    "KHR-GL46.compute_shader.fp64-case2");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_005628,
    "KHR-GL46.compute_shader.fp64-case3");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_005629,
    "KHR-GL46.compute_shader.conditional-dispatching");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_005630,
    "KHR-GL46.compute_shader.api-no-active-program");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_005631,
    "KHR-GL46.compute_shader.api-work-group-count");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_005632,
    "KHR-GL46.compute_shader.api-indirect");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_005633,
    "KHR-GL46.compute_shader.api-program");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_005634,
    "KHR-GL46.compute_shader.glsl-compile-time-errors");

static SHRINK_HWTEST_SF(ActsGl46master0001TestSuite, TestCase_005635,
    "KHR-GL46.compute_shader.glsl-link-time-errors");
