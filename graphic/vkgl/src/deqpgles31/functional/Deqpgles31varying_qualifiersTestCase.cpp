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
#include "../ActsDeqpgles310005TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004489,
        "dEQP-GLES31.functional.shaders.linkage.",
        "es31.geometry.varying.qualifiers.smooth");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004490,
        "dEQP-GLES31.functional.shaders.linkage",
        ".es31.geometry.varying.qualifiers.flat");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004491,
        "dEQP-GLES31.functional.shaders.linkage.e",
        "s31.geometry.varying.qualifiers.centroid");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004492,
        "dEQP-GLES31.functional.shaders.linkage.",
        "es31.geometry.varying.qualifiers.sample");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004552,
        "dEQP-GLES31.functional.shaders.linkage.es",
        "31.tessellation.varying.qualifiers.smooth");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004553,
        "dEQP-GLES31.functional.shaders.linkage.e",
        "s31.tessellation.varying.qualifiers.flat");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004554,
        "dEQP-GLES31.functional.shaders.linkage.es3",
        "1.tessellation.varying.qualifiers.centroid");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004555,
        "dEQP-GLES31.functional.shaders.linkage.es",
        "31.tessellation.varying.qualifiers.sample");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004556,
        "dEQP-GLES31.functional.shaders.linkage.e",
        "s31.tessellation.varying.qualifiers.patch");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004760,
        "dEQP-GLES31.functional.shaders.linkage.",
        "es32.geometry.varying.qualifiers.smooth");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004761,
        "dEQP-GLES31.functional.shaders.linkage",
        ".es32.geometry.varying.qualifiers.flat");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004762,
        "dEQP-GLES31.functional.shaders.linkage.e",
        "s32.geometry.varying.qualifiers.centroid");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004763,
        "dEQP-GLES31.functional.shaders.linkage.",
        "es32.geometry.varying.qualifiers.sample");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004818,
        "dEQP-GLES31.functional.shaders.linkage.es",
        "32.tessellation.varying.qualifiers.smooth");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004819,
        "dEQP-GLES31.functional.shaders.linkage.e",
        "s32.tessellation.varying.qualifiers.flat");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004820,
        "dEQP-GLES31.functional.shaders.linkage.es3",
        "2.tessellation.varying.qualifiers.centroid");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004821,
        "dEQP-GLES31.functional.shaders.linkage.es",
        "32.tessellation.varying.qualifiers.sample");

static SHRINK_HWTEST_F(ActsDeqpgles310005TestSuite, TestCase_004822,
        "dEQP-GLES31.functional.shaders.linkage.e",
        "s32.tessellation.varying.qualifiers.patch");
