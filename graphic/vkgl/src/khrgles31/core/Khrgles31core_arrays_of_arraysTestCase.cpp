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
#include "../Khrgles31BaseFunc.h"
#include "../ActsKhrgles310003TestSuite.h"
#include "shrinkdefine.h"

using namespace std;
using namespace testing::ext;
using namespace OHOS;

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002190,
        "KHR-GLES31.core.arrays_of_arr",
        "ays.SizedDeclarationsPrimitive");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002191,
        "KHR-GLES31.core.arrays_of_array",
        "s.SizedDeclarationsStructTypes1");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002192,
        "KHR-GLES31.core.arrays_of_array",
        "s.SizedDeclarationsStructTypes2");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002193,
        "KHR-GLES31.core.arrays_of_array",
        "s.SizedDeclarationsStructTypes3");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002194,
        "KHR-GLES31.core.arrays_of_array",
        "s.SizedDeclarationsStructTypes4");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002195,
        "KHR-GLES31.core.arrays_of_arrays",
        ".SizedDeclarationsTypenameStyle1");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002196,
        "KHR-GLES31.core.arrays_of_arrays",
        ".SizedDeclarationsTypenameStyle2");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002197,
        "KHR-GLES31.core.arrays_of_arrays",
        ".SizedDeclarationsTypenameStyle3");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002198,
        "KHR-GLES31.core.arrays_of_arrays",
        ".SizedDeclarationsTypenameStyle4");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002199,
        "KHR-GLES31.core.arrays_of_arrays",
        ".SizedDeclarationsTypenameStyle5");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002200,
        "KHR-GLES31.core.arrays_of_arrays",
        ".SizedDeclarationsFunctionParams");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002201,
        "KHR-GLES31.core.arrays_of_arrays.",
        "sized_declarations_invalid_sizes1");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002202,
        "KHR-GLES31.core.arrays_of_arrays.",
        "sized_declarations_invalid_sizes2");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002203,
        "KHR-GLES31.core.arrays_of_arrays.",
        "sized_declarations_invalid_sizes3");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002204,
        "KHR-GLES31.core.arrays_of_arrays.",
        "sized_declarations_invalid_sizes4");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002205,
        "KHR-GLES31.core.arrays_of_arrays.Con",
        "structorsAndUnsizedDeclConstructors1");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002206,
        "KHR-GLES31.core.arrays_of_arrays.Con",
        "structorsAndUnsizedDeclConstructors2");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002207,
        "KHR-GLES31.core.arrays_of_arrays.Constr",
        "uctorsAndUnsizedDeclUnsizedConstructors");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002208,
        "KHR-GLES31.core.arrays_of_arrays",
        ".ConstructorsAndUnsizedDeclConst");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002209,
        "KHR-GLES31.core.arrays_of_arrays.Constr",
        "uctorsAndUnsizedDeclInvalidConstructors1");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002210,
        "KHR-GLES31.core.arrays_of_arrays.Constr",
        "uctorsAndUnsizedDeclInvalidConstructors2");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002211,
        "KHR-GLES31.core.arrays_of_arrays.Constr",
        "uctorsAndUnsizedDeclInvalidConstructors3");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002212,
        "KHR-GLES31.core.arrays_of_arrays.Constr",
        "uctorsAndUnsizedDeclInvalidConstructors4");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002213,
        "KHR-GLES31.core.arrays_of_arrays.Const",
        "ructorsAndUnsizedDeclConstructorSizing1");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002214,
        "KHR-GLES31.core.arrays_of_arrays.Const",
        "ructorsAndUnsizedDeclConstructorSizing2");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002215,
        "KHR-GLES31.core.arrays_of_arrays.Const",
        "ructorsAndUnsizedDeclStructConstructors");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002216,
        "KHR-GLES31.core.arrays_of_arrays.Con",
        "structorsAndUnsizedDeclUnsizedArrays1");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002217,
        "KHR-GLES31.core.arrays_of_arrays.Con",
        "structorsAndUnsizedDeclUnsizedArrays2");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002218,
        "KHR-GLES31.core.arrays_of_arrays.Con",
        "structorsAndUnsizedDeclUnsizedArrays3");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002219,
        "KHR-GLES31.core.arrays_of_arrays.Con",
        "structorsAndUnsizedDeclUnsizedArrays4");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002220,
        "KHR-GLES31.core.arrays_of_a",
        "rrays.ExpressionsAssignment1");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002221,
        "KHR-GLES31.core.arrays_of_a",
        "rrays.ExpressionsAssignment2");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002222,
        "KHR-GLES31.core.arrays_of_a",
        "rrays.ExpressionsAssignment3");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002223,
        "KHR-GLES31.core.arrays_of_arra",
        "ys.ExpressionsTypeRestrictions1");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002224,
        "KHR-GLES31.core.arrays_of_arra",
        "ys.ExpressionsTypeRestrictions2");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002225,
        "KHR-GLES31.core.arrays_of_arr",
        "ays.ExpressionsIndexingScalar1");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002226,
        "KHR-GLES31.core.arrays_of_arr",
        "ays.ExpressionsIndexingScalar2");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002227,
        "KHR-GLES31.core.arrays_of_arr",
        "ays.ExpressionsIndexingScalar3");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002228,
        "KHR-GLES31.core.arrays_of_arr",
        "ays.ExpressionsIndexingScalar4");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002229,
        "KHR-GLES31.core.arrays_of_arr",
        "ays.ExpressionsIndexingArray1");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002230,
        "KHR-GLES31.core.arrays_of_arr",
        "ays.ExpressionsIndexingArray2");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002231,
        "KHR-GLES31.core.arrays_of_arr",
        "ays.ExpressionsIndexingArray3");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002232,
        "KHR-GLES31.core.arrays_of_arra",
        "ys.ExpressionsDynamicIndexing1");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002233,
        "KHR-GLES31.core.arrays_of_arra",
        "ys.ExpressionsDynamicIndexing2");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002234,
        "KHR-GLES31.core.arrays_of_",
        "arrays.ExpressionsEquality1");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002235,
        "KHR-GLES31.core.arrays_of_",
        "arrays.ExpressionsEquality2");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002236,
        "KHR-GLES31.core.arrays_of",
        "_arrays.ExpressionsLength1");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002237,
        "KHR-GLES31.core.arrays_of",
        "_arrays.ExpressionsLength2");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002238,
        "KHR-GLES31.core.arrays_of",
        "_arrays.ExpressionsLength3");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002239,
        "KHR-GLES31.core.arrays_of_",
        "arrays.ExpressionsInvalid1");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002240,
        "KHR-GLES31.core.arrays_of_",
        "arrays.ExpressionsInvalid2");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002241,
        "KHR-GLES31.core.arrays_of_arr",
        "ays.InteractionFunctionCalls1");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002242,
        "KHR-GLES31.core.arrays_of_arr",
        "ays.InteractionFunctionCalls2");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002243,
        "KHR-GLES31.core.arrays_of_arra",
        "ys.InteractionArgumentAliasing1");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002244,
        "KHR-GLES31.core.arrays_of_arra",
        "ys.InteractionArgumentAliasing2");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002245,
        "KHR-GLES31.core.arrays_of_arra",
        "ys.InteractionArgumentAliasing3");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002246,
        "KHR-GLES31.core.arrays_of_arra",
        "ys.InteractionArgumentAliasing4");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002247,
        "KHR-GLES31.core.arrays_of_arra",
        "ys.InteractionArgumentAliasing5");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002248,
        "KHR-GLES31.core.arrays_of_arra",
        "ys.InteractionArgumentAliasing6");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002249,
        "KHR-GLES31.core.arrays_of_",
        "arrays.InteractionUniforms1");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002250,
        "KHR-GLES31.core.arrays_of_",
        "arrays.InteractionUniforms2");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002251,
        "KHR-GLES31.core.arrays_of_arr",
        "ays.InteractionUniformBuffers1");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002252,
        "KHR-GLES31.core.arrays_of_arr",
        "ays.InteractionUniformBuffers2");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002253,
        "KHR-GLES31.core.arrays_of_arr",
        "ays.InteractionUniformBuffers3");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002254,
        "KHR-GLES31.core.arrays_of_arra",
        "ys.InteractionInterfaceArrays1");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002255,
        "KHR-GLES31.core.arrays_of_arra",
        "ys.InteractionInterfaceArrays2");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002256,
        "KHR-GLES31.core.arrays_of_arra",
        "ys.InteractionInterfaceArrays3");

static SHRINK_HWTEST_F(ActsKhrgles310003TestSuite, TestCase_002257,
        "KHR-GLES31.core.arrays_of_arra",
        "ys.InteractionInterfaceArrays4");
