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

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001098,
    "GTF-GL43.gtf21.GL2Tests.detach_shader.successfulcompile_vert_successfulcompile_frag_detach_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001099,
    "GTF-GL43.gtf21.GL2Tests.detach_shader.successfulcompile_vert_successfulcompile_frag_detach_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001100,
    "GTF-GL43.gtf21.GL2Tests.detach_shader.successfulcompile_vert_detach_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001101,
    "GTF-GL43.gtf21.GL2Tests.detach_shader.successfulcompile_frag_detach_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001102,
    "GTF-GL43.gtf21.GL2Tests.detach_shader.successfulcompile_vert_successfulcompile_frag_detach_vert_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001103,
    "GTF-GL43.gtf21.GL2Tests.detach_shader.successfulcompile_vert_successfulcompile_frag_detach_vert_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001104,
    "GTF-GL43.gtf21.GL2Tests.detach_shader.successfulcompile_vert_successfulcompile_frag_detach_frag_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001105,
    "GTF-GL43.gtf21.GL2Tests.detach_shader.emptyprogramobject_detach_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001106,
    "GTF-GL43.gtf21.GL2Tests.detach_shader.zeroprogramhandle_detach_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001107,
    "GTF-GL43.gtf21.GL2Tests.detach_shader.zeroprogramhandle_detach_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001108,
    "GTF-GL43.gtf21.GL2Tests.detach_shader.detach_zeroshaderhandle");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001109,
    "GTF-GL43.gtf21.GL2Tests.detach_shader.detach_programhandle");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001110,
    "GTF-GL43.gtf21.GL2Tests.detach_shader.successfulcompilevert_detach_emptyvertshaderhandle");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001111,
    "GTF-GL43.gtf21.GL2Tests.detach_shader.successfulcompilevert_detach_emptyfragshaderhandle");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001112,
    "GTF-GL43.gtf21.GL2Tests.detach_shader.successfulcompilefrag_detach_emptyvertshaderhandle");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001113,
    "GTF-GL43.gtf21.GL2Tests.detach_shader.successfulcompilefrag_detach_emptyfragshaderhandle");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001114,
    "GTF-GL43.gtf21.GL2Tests.detach_shader.programhandle_detach_emptyvertshaderhandle");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001115,
    "GTF-GL43.gtf21.GL2Tests.detach_shader.programhandle_detach_emptyfragshaderhandle");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001116,
    "GTF-GL43.gtf21.GL2Tests.detach_shader.zeroprogramhandle_detach_zeroshaderhandle");
