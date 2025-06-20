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

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001171,
    "GTF-GL43.gtf21.GL2Tests.link_program.successfulcompilevert_successfullcompilefrag_linkprogram");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001172,
    "GTF-GL43.gtf21.GL2Tests.link_program.successfulcompilevert_unsuccessfullcompilefrag_linkprogram");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001173,
    "GTF-GL43.gtf21.GL2Tests.link_program.unsuccessfulcompilevert_successfullcompilefrag_linkprogram");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001174,
    "GTF-GL43.gtf21.GL2Tests.link_program.unsuccessfulcompilevert_unsuccessfullcompilefrag_linkprogram");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001175,
    "GTF-GL43.gtf21.GL2Tests.link_program.successfulcompilevert_linkprogram_gl");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001176,
    "GTF-GL43.gtf21.GL2Tests.link_program.successfulcompilefrag_linkprogram_gl");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001177,
    "GTF-GL43.gtf21.GL2Tests.link_program.unsuccessfulcompilevert_linkprogram");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001178,
    "GTF-GL43.gtf21.GL2Tests.link_program.unsuccessfulcompilefrag_linkprogram");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001179,
    "GTF-GL43.gtf21.GL2Tests.link_program.link_emptyprogramobject");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001180,
    "GTF-GL43.gtf21.GL2Tests.link_program.link_invalidprogramhandle");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001181,
    "GTF-GL43.gtf21.GL2Tests.link_program.link_verthandle");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001182,
    "GTF-GL43.gtf21.GL2Tests.link_program.link_fraghandle");
