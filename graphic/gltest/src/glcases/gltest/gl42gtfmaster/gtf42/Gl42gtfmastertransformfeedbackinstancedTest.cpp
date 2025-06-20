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
#include "../Gl42gtfmasterBaseFunc.h"
#include "../ActsGl42gtfmaster0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001715,
    "GTF-GL42.gtf42.GL3Tests.transform_feedback_instanced.transform_feedback_instanced_init_defaults");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001716,
    "GTF-GL42.gtf42.GL3Tests.transform_feedback_instanced.transform_feedback_instanced_api");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001717,
    "GTF-GL42.gtf42.GL3Tests.transform_feedback_instanced.transform_feedback_instanced_error");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001718,
    "GTF-GL42.gtf42.GL3Tests.transform_feedback_instanced.transform_feedback_instanced_basic");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001719,
    "GTF-GL42.gtf42.GL3Tests.transform_feedback_instanced.transform_feedback_instanced_streams");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001720,
    "GTF-GL42.gtf42.GL3Tests.transform_feedback_instanced.transform_feedback_instanced_conditional_render");
