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

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001119,
    "GTF-GL43.gtf21.GL2Tests.get_active_attribute.succompilevert_succompilefrag_get_active_attribute_gl_Vertex");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001120,
    "GTF-GL43.gtf21.GL2Tests.get_active_attribute.succompilevert_succompilefrag_get_active_attribute_gl_Normal");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001121,
    "GTF-GL43.gtf21.GL2Tests.get_active_attribute.succompile"
    "vert_succompilefrag_get_active_attribute_float_vec2_vec3");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001122,
    "GTF-GL43.gtf21.GL2Tests.get_active_attribute.succompilevert_succompilefrag_get_active_attribute_vec4");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001123,
    "GTF-GL43.gtf21.GL2Tests.get_active_attribute.succompilevert_succompilefrag_get_active_attribute_mat2");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001124,
    "GTF-GL43.gtf21.GL2Tests.get_active_attribute.succompilevert_succompilefrag_get_active_attribute_mat3");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001125,
    "GTF-GL43.gtf21.GL2Tests.get_active_attribute.succompilevert_succompilefrag_get_active_attribute_mat4");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001126,
    "GTF-GL43.gtf21.GL2Tests.get_active_attribute.getactiveattribute_index_more_than_num_attribs");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001127,
    "GTF-GL43.gtf21.GL2Tests.get_active_attribute.getactiveuniform_vertshaderforprogramhandle");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001128,
    "GTF-GL43.gtf21.GL2Tests.get_active_attribute.getactiveuniform_zeroprogramhandle");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001129,
    "GTF-GL43.gtf21.GL2Tests.get_active_attribute.getactiveuniform_empty_program_handle");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001130,
    "GTF-GL43.gtf21.GL2Tests.get_active_attribute.getactiveuniform_fragshaderforprogramhandle");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001131,
    "GTF-GL43.gtf21.GL2Tests.get_active_attribute.getactiveuniform_index_minus_one");
