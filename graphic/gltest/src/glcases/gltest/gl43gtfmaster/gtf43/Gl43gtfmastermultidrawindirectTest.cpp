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

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001729,
    "GTF-GL43.gtf43.GL3Tests.multi_draw_indirect.multi_draw_indirect_init_defaults");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001730,
    "GTF-GL43.gtf43.GL3Tests.multi_draw_indirect.multi_draw_indirect_api");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001731,
    "GTF-GL43.gtf43.GL3Tests.multi_draw_indirect.multi_draw_indirect_error");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001732,
    "GTF-GL43.gtf43.GL3Tests.multi_draw_indirect.multi_draw_indirect_primcount");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001733,
    "GTF-GL43.gtf43.GL3Tests.multi_draw_indirect.multi_draw_indirect_stride");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001734,
    "GTF-GL43.gtf43.GL3Tests.multi_draw_indirect.multi_draw_indirect_mode");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001735,
    "GTF-GL43.gtf43.GL3Tests.multi_draw_indirect.multi_draw_indirect_type");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001736,
    "GTF-GL43.gtf43.GL3Tests.multi_draw_indirect.multi_draw_indirect_params");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001737,
    "GTF-GL43.gtf43.GL3Tests.multi_draw_indirect.multi_draw_indirect_stress");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001738,
    "GTF-GL43.gtf43.GL3Tests.multi_draw_indirect.multi_draw_indirect_conditional_render");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001739,
    "GTF-GL43.gtf43.GL3Tests.multi_draw_indirect.multi_draw_indirect_skip_draw");
