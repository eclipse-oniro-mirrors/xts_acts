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

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001154,
    "GTF-GL42.gtf21.GL2Tests.get_uniform_location.succompilevert_succompilefrag_getuniformloc_correctvertuniform");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001155,
    "GTF-GL42.gtf21.GL2Tests.get_uniform_location.succompilevert_succompilefrag_getuniformloc_nonactiveuniform");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001156,
    "GTF-GL42.gtf21.GL2Tests.get_uniform_location.succompilevert_succompilefrag_getuniformloc_correctfraguniform");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001157,
    "GTF-GL42.gtf21.GL2Tests.get_uniform_location.succompilevert_succompilefrag_getuniformloc_fakeuniform");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001158,
    "GTF-GL42.gtf21.GL2Tests.get_uniform_location.succompilevert_succompilefrag_getuniformloc_gl_ModelViewMatrix");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001159,
    "GTF-GL42.gtf21.GL2Tests.get_uniform_location.succompilevert_succompilefrag_getuniformloc_gl_NonExist");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001160,
    "GTF-GL42.gtf21.GL2Tests.get_uniform_location.succompilevert_succompilefrag_getuniformloc_gl_NormalScale");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001161,
    "GTF-GL42.gtf21.GL2Tests.get_uniform_location.succompilevert_succompilefrag_getuniformloc_gl_ProjectionMatrix");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001162,
    "GTF-GL42.gtf21.GL2Tests.get_uniform_location.getuniformlocation_zeroprogramhandle");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001163,
    "GTF-GL42.gtf21.GL2Tests.get_uniform_location.getuniformlocation_vertshaderforprogramhandle");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_001164,
    "GTF-GL42.gtf21.GL2Tests.get_uniform_location.getuniformlocation_fragshaderforprogramhandle");
