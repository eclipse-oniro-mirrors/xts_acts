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

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000261,
    "GTF-GL43.gtf21.GL.control_flow.for_break_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000262,
    "GTF-GL43.gtf21.GL.control_flow.for_break_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000263,
    "GTF-GL43.gtf21.GL.control_flow.for_continue_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000264,
    "GTF-GL43.gtf21.GL.control_flow.for_continue_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000265,
    "GTF-GL43.gtf21.GL.control_flow.for_nested_break_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000266,
    "GTF-GL43.gtf21.GL.control_flow.for_nested_break_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000267,
    "GTF-GL43.gtf21.GL.control_flow.for_nested_continue_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000268,
    "GTF-GL43.gtf21.GL.control_flow.for_nested_continue_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000269,
    "GTF-GL43.gtf21.GL.control_flow.nested_if_else_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_000270,
    "GTF-GL43.gtf21.GL.control_flow.nested_if_else_vert");
