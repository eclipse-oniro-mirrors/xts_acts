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

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001132,
    "GTF-GL43.gtf21.GL2Tests.get_active_uniform.succompilevert_succompilefrag_getactiveuniform_gl_ModelViewMatrix");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001133,
    "GTF-GL43.gtf21.GL2Tests.get_active_uniform.succompilevert_succompilefrag_getactiveuniform_gl_NormalMatrix");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001134,
    "GTF-GL43.gtf21.GL2Tests.get_active_uniform.succompilevert_s"
    "uccompilefrag_getactiveuniform_gl_ModelViewProjectionMatrix");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001135,
    "GTF-GL43.gtf21.GL2Tests.get_active_uniform.succompilevert_succompilefrag_getactiveuniform_vec3_float");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001136,
    "GTF-GL43.gtf21.GL2Tests.get_active_uniform.succompilevert_succompilefrag_getactiveuniform_float_float_float");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001137,
    "GTF-GL43.gtf21.GL2Tests.get_active_uniform.succompilevert_succompilefrag_getactiveuniform_vec3_vec3_float");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001138,
    "GTF-GL43.gtf21.GL2Tests.get_active_uniform.succompilevert_succompilefrag_getactiveuniform_vec2_vec4_int");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001139,
    "GTF-GL43.gtf21.GL2Tests.get_active_uniform.succompilevert_succompilefrag_getactiveuniform_ivec2_ivec3_ivec4");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001140,
    "GTF-GL43.gtf21.GL2Tests.get_active_uniform.succompilevert_succompilefrag_getactiveuniform_bool_bvec2_bvec3");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001141,
    "GTF-GL43.gtf21.GL2Tests.get_active_uniform.succompilevert_succompilefrag_getactiveuniform_bvec4_mat2_mat3_mat4");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001142,
    "GTF-GL43.gtf21.GL2Tests.get_active_uniform.succompilevert_succompilefrag_getnumactiveuniforms");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001143,
    "GTF-GL43.gtf21.GL2Tests.get_active_uniform.getactiveuniform_zeroprogramhandle");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001144,
    "GTF-GL43.gtf21.GL2Tests.get_active_uniform.getactiveuniform_fragshaderforprogramhandle");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001145,
    "GTF-GL43.gtf21.GL2Tests.get_active_uniform.getactiveuniform_vertshaderforprogramhandle");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001146,
    "GTF-GL43.gtf21.GL2Tests.get_active_uniform.getactiveuniform_index_more_than_num_uniforms");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001147,
    "GTF-GL43.gtf21.GL2Tests.get_active_uniform.getactiveuniform_index_minus_one");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001148,
    "GTF-GL43.gtf21.GL2Tests.get_active_uniform.getactiveuniform_empty_program_handle");
