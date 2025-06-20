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
#include "../Gl43gtfmasterBaseFunc.h"
#include "../ActsGl43gtfmaster0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001228,
    "GTF-GL43.gtf30.GL3Tests.color_buffer_float.color_buffer_float_coverage");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001229,
    "GTF-GL43.gtf30.GL3Tests.color_buffer_float.color_buffer_unsupported_format");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001230,
    "GTF-GL43.gtf30.GL3Tests.color_buffer_float.color_buffer_float_clamp_fixed");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001231,
    "GTF-GL43.gtf30.GL3Tests.color_buffer_float.color_buffer_float_clamp_off");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001232,
    "GTF-GL43.gtf30.GL3Tests.color_buffer_float.color_buffer_float_clamp_on");
