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

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001185,
    "GTF-GL43.gtf21.GL2Tests.shader_source.successfulcompilevert_shadersource");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001186,
    "GTF-GL43.gtf21.GL2Tests.shader_source.unsuccessfulcompilevert_shadersource");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001187,
    "GTF-GL43.gtf21.GL2Tests.shader_source.successfulcompilefrag_shadersource");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001188,
    "GTF-GL43.gtf21.GL2Tests.shader_source.unsuccessfulcompilefrag_shadersource");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001189,
    "GTF-GL43.gtf21.GL2Tests.shader_source.shadersource_invalidshaderhandle");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001190,
    "GTF-GL43.gtf21.GL2Tests.shader_source.shadersource_programhandle");
