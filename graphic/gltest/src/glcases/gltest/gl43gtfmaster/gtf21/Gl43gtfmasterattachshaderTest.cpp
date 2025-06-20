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

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001023,
    "GTF-GL43.gtf21.GL2Tests.attach_shader.successfulcompile_attach_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001024,
    "GTF-GL43.gtf21.GL2Tests.attach_shader.unsuccessfulcompile_attach_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001025,
    "GTF-GL43.gtf21.GL2Tests.attach_shader.successfulcompile_attach_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001026,
    "GTF-GL43.gtf21.GL2Tests.attach_shader.unsuccessfulcompile_attach_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001027,
    "GTF-GL43.gtf21.GL2Tests.attach_shader.successfulcompile_vert_successfulcompile_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001028,
    "GTF-GL43.gtf21.GL2Tests.attach_shader.successfulcompile_vert_unsuccessfulcompile_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001029,
    "GTF-GL43.gtf21.GL2Tests.attach_shader.unsuccessfulcompile_vert_successfulcompile_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001030,
    "GTF-GL43.gtf21.GL2Tests.attach_shader.unsuccessfulcompile_vert_unsuccessfulcompile_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001031,
    "GTF-GL43.gtf21.GL2Tests.attach_shader.successfulcompile_vert_repeated_attach_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001032,
    "GTF-GL43.gtf21.GL2Tests.attach_shader.successfulcompile_frag_repeated_attach_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001033,
    "GTF-GL43.gtf21.GL2Tests.attach_shader.unsuccessfulcompile_vert_repeated_attach_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001034,
    "GTF-GL43.gtf21.GL2Tests.attach_shader.unsuccessfulcompile_frag_repeated_attach_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001035,
    "GTF-GL43.gtf21.GL2Tests.attach_shader.successfulcompile_vert_attach_invalid_handle_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001036,
    "GTF-GL43.gtf21.GL2Tests.attach_shader.unsuccessfulcompile_vert_attach_invalid_handle_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001037,
    "GTF-GL43.gtf21.GL2Tests.attach_shader.successfulcompile_frag_attach_invalid_handle_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001038,
    "GTF-GL43.gtf21.GL2Tests.attach_shader.unsuccessfulcompile_frag_attach_invalid_handle_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001039,
    "GTF-GL43.gtf21.GL2Tests.attach_shader.invalidshader_attach_valid_handle");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001040,
    "GTF-GL43.gtf21.GL2Tests.attach_shader.programobject_attach_programobject");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001041,
    "GTF-GL43.gtf21.GL2Tests.attach_shader.successfulcompilevert_attach_vertshaderobject_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001042,
    "GTF-GL43.gtf21.GL2Tests.attach_shader.unsuccessfulcompilevert_attach_vertshaderobject_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001043,
    "GTF-GL43.gtf21.GL2Tests.attach_shader.successfulcompilefrag_attach_vertshaderobject_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001044,
    "GTF-GL43.gtf21.GL2Tests.attach_shader.unsuccessfulcompilefrag_attach_vertshaderobject_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001045,
    "GTF-GL43.gtf21.GL2Tests.attach_shader.successfulcompilevert_attach_fragshaderobject_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001046,
    "GTF-GL43.gtf21.GL2Tests.attach_shader.unsuccessfulcompilevert_attach_fragshaderobject_vert");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001047,
    "GTF-GL43.gtf21.GL2Tests.attach_shader.successfulcompilefrag_attach_fragshaderobject_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001048,
    "GTF-GL43.gtf21.GL2Tests.attach_shader.unsuccessfulcompilefrag_attach_fragshaderobject_frag");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001049,
    "GTF-GL43.gtf21.GL2Tests.attach_shader.programobject_attach_vertshaderobject");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001050,
    "GTF-GL43.gtf21.GL2Tests.attach_shader.programobject_attach_fragshaderobject");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001051,
    "GTF-GL43.gtf21.GL2Tests.attach_shader.emptyvertshader_emptyfragshader_attach");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001052,
    "GTF-GL43.gtf21.GL2Tests.attach_shader.emptyvertshader_emptyvertshader_attach");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001053,
    "GTF-GL43.gtf21.GL2Tests.attach_shader.emptyfragshader_emptyfragshader_attach");
