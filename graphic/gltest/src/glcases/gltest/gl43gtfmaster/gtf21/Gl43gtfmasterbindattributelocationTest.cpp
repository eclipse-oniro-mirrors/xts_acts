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

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001054,
    "GTF-GL43.gtf21.GL2Tests.bind_attribute_location.succompile"
    "vert_succcompilefrag_bindattriblocation_nonexisting_attrib");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001055,
    "GTF-GL43.gtf21.GL2Tests.bind_attribute_location.succompilevert_succcompilefrag_bindattriblocation_float_attrib");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001056,
    "GTF-GL43.gtf21.GL2Tests.bind_attribute_location.succompilevert_succcompilefrag_bindattriblocation_vec3_attrib");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001057,
    "GTF-GL43.gtf21.GL2Tests.bind_attribute_location.succompi"
    "levert_succcompilefrag_bindattriblocation_gl_Color_attrib");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001058,
    "GTF-GL43.gtf21.GL2Tests.bind_attribute_location.succompile"
    "vert_succcompilefrag_bindattriblocation_gl_NonExist_attrib");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001059,
    "GTF-GL43.gtf21.GL2Tests.bind_attribute_location.succompileve"
    "rt_succcompilefrag_bindattriblocation_location_maxattribsloc");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001060,
    "GTF-GL43.gtf21.GL2Tests.bind_attribute_location.succompilevert"
    "_succcompilefrag_bindattriblocation_location_minusoneattribsloc");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001061,
    "GTF-GL43.gtf21.GL2Tests.bind_attribute_location.bindattriblocation_zeroprogramhandle");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001062,
    "GTF-GL43.gtf21.GL2Tests.bind_attribute_location.bindattriblocation_vertshaderhandleforprogram");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001063,
    "GTF-GL43.gtf21.GL2Tests.bind_attribute_location.bindattriblocation_fragshaderhandleforprogram");

static SHRINK_HWTEST_SF(ActsGl43gtfmaster0001TestSuite, TestCase_001064,
    "GTF-GL43.gtf21.GL2Tests.bind_attribute_location.bindattriblocation_emptyprogramhandle");
