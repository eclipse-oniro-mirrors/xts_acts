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

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001065,
    "GTF-GL42.gtf21.GL2Tests.compile_shader.successful_compile_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001066,
    "GTF-GL42.gtf21.GL2Tests.compile_shader.successful_compile_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001067,
    "GTF-GL42.gtf21.GL2Tests.compile_shader.unsuccessful_compile_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001068,
    "GTF-GL42.gtf21.GL2Tests.compile_shader.unsuccessful_compile_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001069,
    "GTF-GL42.gtf21.GL2Tests.compile_shader.compile_emptyhandle_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001070,
    "GTF-GL42.gtf21.GL2Tests.compile_shader.compile_emptyhandle_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001071,
    "GTF-GL42.gtf21.GL2Tests.compile_shader.compile_invalid_handle");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001072,
    "GTF-GL42.gtf21.GL2Tests.compile_shader.compile_program_handle");
