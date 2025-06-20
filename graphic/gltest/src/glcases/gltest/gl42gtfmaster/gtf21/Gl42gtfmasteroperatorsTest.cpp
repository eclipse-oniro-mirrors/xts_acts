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

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000662,
    "GTF-GL42.gtf21.GL.operators.postfixincrement_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000663,
    "GTF-GL42.gtf21.GL.operators.postfixincrement_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000664,
    "GTF-GL42.gtf21.GL.operators.postfixdecrement_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000665,
    "GTF-GL42.gtf21.GL.operators.postfixdecrement_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000666,
    "GTF-GL42.gtf21.GL.operators.prefixincrement_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000667,
    "GTF-GL42.gtf21.GL.operators.prefixincrement_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000668,
    "GTF-GL42.gtf21.GL.operators.prefixdecrement_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000669,
    "GTF-GL42.gtf21.GL.operators.prefixdecrement_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000670,
    "GTF-GL42.gtf21.GL.operators.unary_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000671,
    "GTF-GL42.gtf21.GL.operators.unary_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000672,
    "GTF-GL42.gtf21.GL.operators.multiplicative_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000673,
    "GTF-GL42.gtf21.GL.operators.multiplicative_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000674,
    "GTF-GL42.gtf21.GL.operators.division_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000675,
    "GTF-GL42.gtf21.GL.operators.division_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000676,
    "GTF-GL42.gtf21.GL.operators.addsubtract_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000677,
    "GTF-GL42.gtf21.GL.operators.addsubtract_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000678,
    "GTF-GL42.gtf21.GL.operators.relational_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000679,
    "GTF-GL42.gtf21.GL.operators.relational_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000680,
    "GTF-GL42.gtf21.GL.operators.equality_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000681,
    "GTF-GL42.gtf21.GL.operators.equality_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000682,
    "GTF-GL42.gtf21.GL.operators.logical_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000683,
    "GTF-GL42.gtf21.GL.operators.logical_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000684,
    "GTF-GL42.gtf21.GL.operators.selection_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000685,
    "GTF-GL42.gtf21.GL.operators.selection_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000686,
    "GTF-GL42.gtf21.GL.operators.assignments_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000687,
    "GTF-GL42.gtf21.GL.operators.assignments_vert");
