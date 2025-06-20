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
#include "../Gl44gtfmasterBaseFunc.h"
#include "../ActsGl44gtfmaster0001TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_SF(ActsGl44gtfmaster0001TestSuite, TestCase_001077,
    "GTF-GL44.gtf21.GL2Tests.delete_object.successfulcompile_vert_successfulcompile_frag_deleteprogram");

static SHRINK_HWTEST_SF(ActsGl44gtfmaster0001TestSuite, TestCase_001078,
    "GTF-GL44.gtf21.GL2Tests.delete_object.successfulcompile_vert_successfulcompile_frag_deleteverthandle");

static SHRINK_HWTEST_SF(ActsGl44gtfmaster0001TestSuite, TestCase_001079,
    "GTF-GL44.gtf21.GL2Tests.delete_object.successfulcompile_vert_successfulcompile_frag_deletefraghandle");

static SHRINK_HWTEST_SF(ActsGl44gtfmaster0001TestSuite, TestCase_001080,
    "GTF-GL44.gtf21.GL2Tests.delete_object.successfulcompile_vert_successfulcompile_frag_delete_vert_frag_prog");

static SHRINK_HWTEST_SF(ActsGl44gtfmaster0001TestSuite, TestCase_001081,
    "GTF-GL44.gtf21.GL2Tests.delete_object.successfulcompile_vert_successfulcompile_frag_delete_frag_vert_prog");

static SHRINK_HWTEST_SF(ActsGl44gtfmaster0001TestSuite, TestCase_001082,
    "GTF-GL44.gtf21.GL2Tests.delete_object.successfulcompile_vert_successfulcompile_frag_delete_prog_vert_frag");

static SHRINK_HWTEST_SF(ActsGl44gtfmaster0001TestSuite, TestCase_001083,
    "GTF-GL44.gtf21.GL2Tests.delete_object.successfulcompile_vert_successfulcompile_frag_delete_vert_prog_vert");

static SHRINK_HWTEST_SF(ActsGl44gtfmaster0001TestSuite, TestCase_001084,
    "GTF-GL44.gtf21.GL2Tests.delete_object.successfulcompile_vert_successfulcompile_frag_delete_vert_vert_prog");

static SHRINK_HWTEST_SF(ActsGl44gtfmaster0001TestSuite, TestCase_001085,
    "GTF-GL44.gtf21.GL2Tests.delete_object.successfulcompile_vert_successfulcompile_frag_delete_vert_vert_frag");

static SHRINK_HWTEST_SF(ActsGl44gtfmaster0001TestSuite, TestCase_001086,
    "GTF-GL44.gtf21.GL2Tests.delete_object.successfulcompile_vert_successfulcompile_frag_delete_prog_vert_vert");

static SHRINK_HWTEST_SF(ActsGl44gtfmaster0001TestSuite, TestCase_001087,
    "GTF-GL44.gtf21.GL2Tests.delete_object.successfulcompile_vert_successfulcompile_frag_delete_frag_prog_frag");

static SHRINK_HWTEST_SF(ActsGl44gtfmaster0001TestSuite, TestCase_001088,
    "GTF-GL44.gtf21.GL2Tests.delete_object.successfulcompile_vert_successfulcompile_frag_delete_frag_frag_prog");

static SHRINK_HWTEST_SF(ActsGl44gtfmaster0001TestSuite, TestCase_001089,
    "GTF-GL44.gtf21.GL2Tests.delete_object.successfulcompile_vert_successfulcompile_frag_delete_frag_frag_vert");

static SHRINK_HWTEST_SF(ActsGl44gtfmaster0001TestSuite, TestCase_001090,
    "GTF-GL44.gtf21.GL2Tests.delete_object.successfulcompile_vert_successfulcompile_frag_delete_prog_frag_frag");

static SHRINK_HWTEST_SF(ActsGl44gtfmaster0001TestSuite, TestCase_001091,
    "GTF-GL44.gtf21.GL2Tests.delete_object.successfulcompile_vert_successfulcompile_frag_delete_frag_frag_frag");

static SHRINK_HWTEST_SF(ActsGl44gtfmaster0001TestSuite, TestCase_001092,
    "GTF-GL44.gtf21.GL2Tests.delete_object.successfulcompile_vert_successfulcompile_frag_delete_vert_vert_vert");

static SHRINK_HWTEST_SF(ActsGl44gtfmaster0001TestSuite, TestCase_001093,
    "GTF-GL44.gtf21.GL2Tests.delete_object.successfulcompile_vert_successfulcompile_frag_delete_vert_prog_prog");

static SHRINK_HWTEST_SF(ActsGl44gtfmaster0001TestSuite, TestCase_001094,
    "GTF-GL44.gtf21.GL2Tests.delete_object.successfulcompile_vert_successfulcompile_frag_delete_frag_prog_prog");

static SHRINK_HWTEST_SF(ActsGl44gtfmaster0001TestSuite, TestCase_001095,
    "GTF-GL44.gtf21.GL2Tests.delete_object.successfulcompile_vert_successfulcompile_frag_delete_prog_vert_prog");

static SHRINK_HWTEST_SF(ActsGl44gtfmaster0001TestSuite, TestCase_001096,
    "GTF-GL44.gtf21.GL2Tests.delete_object.successfulcompile_vert_successfulcompile_frag_delete_prog_frag_prog");

static SHRINK_HWTEST_SF(ActsGl44gtfmaster0001TestSuite, TestCase_001097,
    "GTF-GL44.gtf21.GL2Tests.delete_object.delete_zerohandle");
