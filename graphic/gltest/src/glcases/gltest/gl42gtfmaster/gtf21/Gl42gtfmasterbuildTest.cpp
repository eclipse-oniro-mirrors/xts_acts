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

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000063,
    "GTF-GL42.gtf21.GL.build.CorrectBuiltInOveride_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000064,
    "GTF-GL42.gtf21.GL.build.CorrectComma_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000065,
    "GTF-GL42.gtf21.GL.build.CorrectConstFolding1_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000066,
    "GTF-GL42.gtf21.GL.build.CorrectConstFolding2_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000067,
    "GTF-GL42.gtf21.GL.build.CorrectConstruct_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000068,
    "GTF-GL42.gtf21.GL.build.CorrectExtension10_V100_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000069,
    "GTF-GL42.gtf21.GL.build.CorrectExtension1_V100_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000070,
    "GTF-GL42.gtf21.GL.build.CorrectExtension4_V100_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000071,
    "GTF-GL42.gtf21.GL.build.CorrectFull_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000072,
    "GTF-GL42.gtf21.GL.build.CorrectFuncOverload_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000073,
    "GTF-GL42.gtf21.GL.build.CorrectFuncOverload_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000074,
    "GTF-GL42.gtf21.GL.build.CorrectFunction1_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000075,
    "GTF-GL42.gtf21.GL.build.CorrectModule_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000076,
    "GTF-GL42.gtf21.GL.build.CorrectParse1_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000077,
    "GTF-GL42.gtf21.GL.build.CorrectParse2_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000078,
    "GTF-GL42.gtf21.GL.build.CorrectParse2_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000079,
    "GTF-GL42.gtf21.GL.build.CorrectParseTest1_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000080,
    "GTF-GL42.gtf21.GL.build.CorrectParseTest_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000081,
    "GTF-GL42.gtf21.GL.build.CorrectPreprocess5_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000082,
    "GTF-GL42.gtf21.GL.build.CorrectPreprocess8_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000083,
    "GTF-GL42.gtf21.GL.build.CorrectPreprocess9_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000084,
    "GTF-GL42.gtf21.GL.build.CorrectSwizzle1_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000085,
    "GTF-GL42.gtf21.GL.build.CorrectSwizzle1_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000086,
    "GTF-GL42.gtf21.GL.build.CorrectSwizzle2_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000087,
    "GTF-GL42.gtf21.GL.build.CorrectSwizzle2_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000088,
    "GTF-GL42.gtf21.GL.build.CorrectSwizzle3_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000089,
    "GTF-GL42.gtf21.GL.build.CorrectTexture_Rectangle_Samplers_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000090,
    "GTF-GL42.gtf21.GL.build.DuplicateVersion1_V100_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000091,
    "GTF-GL42.gtf21.GL.build.CorrectVersion_V100_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000092,
    "GTF-GL42.gtf21.GL.build.FunctionParam_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000093,
    "GTF-GL42.gtf21.GL.build.ParseTest3_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000094,
    "GTF-GL42.gtf21.GL.build.ParseTest4_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000095,
    "GTF-GL42.gtf21.GL.build.array10_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000096,
    "GTF-GL42.gtf21.GL.build.array11_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000097,
    "GTF-GL42.gtf21.GL.build.array1_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000098,
    "GTF-GL42.gtf21.GL.build.array2_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000099,
    "GTF-GL42.gtf21.GL.build.array3_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000100,
    "GTF-GL42.gtf21.GL.build.array4_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000101,
    "GTF-GL42.gtf21.GL.build.array5_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000102,
    "GTF-GL42.gtf21.GL.build.array6_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000103,
    "GTF-GL42.gtf21.GL.build.array7_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000104,
    "GTF-GL42.gtf21.GL.build.array8_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000105,
    "GTF-GL42.gtf21.GL.build.array9_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000106,
    "GTF-GL42.gtf21.GL.build.attribute1_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000107,
    "GTF-GL42.gtf21.GL.build.attribute2_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000108,
    "GTF-GL42.gtf21.GL.build.attribute_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000109,
    "GTF-GL42.gtf21.GL.build.attribute_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000110,
    "GTF-GL42.gtf21.GL.build.break_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000111,
    "GTF-GL42.gtf21.GL.build.comma1_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000112,
    "GTF-GL42.gtf21.GL.build.comma2_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000113,
    "GTF-GL42.gtf21.GL.build.comma2_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000114,
    "GTF-GL42.gtf21.GL.build.comma3_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000115,
    "GTF-GL42.gtf21.GL.build.comment_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000116,
    "GTF-GL42.gtf21.GL.build.conditional1_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000117,
    "GTF-GL42.gtf21.GL.build.conditional2_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000118,
    "GTF-GL42.gtf21.GL.build.conditional3_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000119,
    "GTF-GL42.gtf21.GL.build.constFunc_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000120,
    "GTF-GL42.gtf21.GL.build.constructor1_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000121,
    "GTF-GL42.gtf21.GL.build.constructor2_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000122,
    "GTF-GL42.gtf21.GL.build.constructor3_V100_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000123,
    "GTF-GL42.gtf21.GL.build.continue_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000124,
    "GTF-GL42.gtf21.GL.build.dataType10_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000125,
    "GTF-GL42.gtf21.GL.build.dataType11_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000126,
    "GTF-GL42.gtf21.GL.build.dataType12_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000127,
    "GTF-GL42.gtf21.GL.build.dataType13_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000128,
    "GTF-GL42.gtf21.GL.build.dataType19_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000129,
    "GTF-GL42.gtf21.GL.build.dataType1_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000130,
    "GTF-GL42.gtf21.GL.build.dataType2_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000131,
    "GTF-GL42.gtf21.GL.build.dataType3_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000132,
    "GTF-GL42.gtf21.GL.build.dataType4_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000133,
    "GTF-GL42.gtf21.GL.build.dataType5_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000134,
    "GTF-GL42.gtf21.GL.build.dataType6_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000135,
    "GTF-GL42.gtf21.GL.build.dataType7_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000136,
    "GTF-GL42.gtf21.GL.build.dataType8_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000137,
    "GTF-GL42.gtf21.GL.build.dataType9_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000138,
    "GTF-GL42.gtf21.GL.build.dowhile_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000139,
    "GTF-GL42.gtf21.GL.build.dvec2_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000140,
    "GTF-GL42.gtf21.GL.build.dvec3_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000141,
    "GTF-GL42.gtf21.GL.build.dvec4_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000142,
    "GTF-GL42.gtf21.GL.build.extension2_V100_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000143,
    "GTF-GL42.gtf21.GL.build.extension3_V100_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000144,
    "GTF-GL42.gtf21.GL.build.extension5_V100_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000145,
    "GTF-GL42.gtf21.GL.build.extension6_V100_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000146,
    "GTF-GL42.gtf21.GL.build.extension7_V100_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000147,
    "GTF-GL42.gtf21.GL.build.extension8_V100_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000148,
    "GTF-GL42.gtf21.GL.build.extension9_V100_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000149,
    "GTF-GL42.gtf21.GL.build.float2_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000150,
    "GTF-GL42.gtf21.GL.build.float3_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000151,
    "GTF-GL42.gtf21.GL.build.float4_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000152,
    "GTF-GL42.gtf21.GL.build.fragmentOnly1_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000153,
    "GTF-GL42.gtf21.GL.build.fragmentOnly2_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000154,
    "GTF-GL42.gtf21.GL.build.fragmentOnly3_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000155,
    "GTF-GL42.gtf21.GL.build.fragmentOnly4_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000156,
    "GTF-GL42.gtf21.GL.build.fragmentOnly_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000157,
    "GTF-GL42.gtf21.GL.build.function10_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000158,
    "GTF-GL42.gtf21.GL.build.function1_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000159,
    "GTF-GL42.gtf21.GL.build.function2_V100_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000160,
    "GTF-GL42.gtf21.GL.build.function3_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000161,
    "GTF-GL42.gtf21.GL.build.function4_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000162,
    "GTF-GL42.gtf21.GL.build.function6_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000163,
    "GTF-GL42.gtf21.GL.build.function7_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000164,
    "GTF-GL42.gtf21.GL.build.function8_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000165,
    "GTF-GL42.gtf21.GL.build.function9_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000166,
    "GTF-GL42.gtf21.GL.build.hvec2_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000167,
    "GTF-GL42.gtf21.GL.build.hvec3_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000168,
    "GTF-GL42.gtf21.GL.build.hvec4_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000169,
    "GTF-GL42.gtf21.GL.build.identifier1_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000170,
    "GTF-GL42.gtf21.GL.build.identifier2_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000171,
    "GTF-GL42.gtf21.GL.build.identifier3_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000172,
    "GTF-GL42.gtf21.GL.build.if1_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000173,
    "GTF-GL42.gtf21.GL.build.if2_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000174,
    "GTF-GL42.gtf21.GL.build.increment1_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000175,
    "GTF-GL42.gtf21.GL.build.increment2_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000176,
    "GTF-GL42.gtf21.GL.build.increment3_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000177,
    "GTF-GL42.gtf21.GL.build.increment4_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000178,
    "GTF-GL42.gtf21.GL.build.increment6_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000179,
    "GTF-GL42.gtf21.GL.build.main1_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000180,
    "GTF-GL42.gtf21.GL.build.main2_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000181,
    "GTF-GL42.gtf21.GL.build.main3_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000182,
    "GTF-GL42.gtf21.GL.build.matrix_V100_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000183,
    "GTF-GL42.gtf21.GL.build.normal_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000184,
    "GTF-GL42.gtf21.GL.build.parser10_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000185,
    "GTF-GL42.gtf21.GL.build.parser1_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000186,
    "GTF-GL42.gtf21.GL.build.parser3_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000187,
    "GTF-GL42.gtf21.GL.build.parser4_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000188,
    "GTF-GL42.gtf21.GL.build.parser5_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000189,
    "GTF-GL42.gtf21.GL.build.parser6_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000190,
    "GTF-GL42.gtf21.GL.build.parser7_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000191,
    "GTF-GL42.gtf21.GL.build.parser8_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000192,
    "GTF-GL42.gtf21.GL.build.parser9_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000193,
    "GTF-GL42.gtf21.GL.build.preprocess0_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000194,
    "GTF-GL42.gtf21.GL.build.preprocess10_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000195,
    "GTF-GL42.gtf21.GL.build.preprocess11_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000196,
    "GTF-GL42.gtf21.GL.build.preprocess12_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000197,
    "GTF-GL42.gtf21.GL.build.preprocess13_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000198,
    "GTF-GL42.gtf21.GL.build.preprocess14_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000199,
    "GTF-GL42.gtf21.GL.build.preprocess15_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000200,
    "GTF-GL42.gtf21.GL.build.preprocess16_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000201,
    "GTF-GL42.gtf21.GL.build.preprocess17_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000202,
    "GTF-GL42.gtf21.GL.build.preprocess1_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000203,
    "GTF-GL42.gtf21.GL.build.preprocess2_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000204,
    "GTF-GL42.gtf21.GL.build.preprocess3_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000205,
    "GTF-GL42.gtf21.GL.build.preprocess4_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000206,
    "GTF-GL42.gtf21.GL.build.preprocess6_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000207,
    "GTF-GL42.gtf21.GL.build.preprocess7_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000208,
    "GTF-GL42.gtf21.GL.build.scoping1_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000209,
    "GTF-GL42.gtf21.GL.build.scoping2_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000210,
    "GTF-GL42.gtf21.GL.build.struct10_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000211,
    "GTF-GL42.gtf21.GL.build.struct11_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000212,
    "GTF-GL42.gtf21.GL.build.struct1_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000213,
    "GTF-GL42.gtf21.GL.build.struct2_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000214,
    "GTF-GL42.gtf21.GL.build.struct3_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000215,
    "GTF-GL42.gtf21.GL.build.struct4_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000216,
    "GTF-GL42.gtf21.GL.build.struct5_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000217,
    "GTF-GL42.gtf21.GL.build.struct6_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000218,
    "GTF-GL42.gtf21.GL.build.struct7_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000219,
    "GTF-GL42.gtf21.GL.build.struct8_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000220,
    "GTF-GL42.gtf21.GL.build.struct9_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000221,
    "GTF-GL42.gtf21.GL.build.swizzle1_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000222,
    "GTF-GL42.gtf21.GL.build.swizzle2_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000223,
    "GTF-GL42.gtf21.GL.build.swizzle3_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000224,
    "GTF-GL42.gtf21.GL.build.typecast_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000225,
    "GTF-GL42.gtf21.GL.build.uniform1_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000226,
    "GTF-GL42.gtf21.GL.build.uniform_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000227,
    "GTF-GL42.gtf21.GL.build.varying1_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000228,
    "GTF-GL42.gtf21.GL.build.varying2_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000229,
    "GTF-GL42.gtf21.GL.build.varying3_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000230,
    "GTF-GL42.gtf21.GL.build.varying_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000231,
    "GTF-GL42.gtf21.GL.build.vector_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000232,
    "GTF-GL42.gtf21.GL.build.version2_V100_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000233,
    "GTF-GL42.gtf21.GL.build.version3_V100_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000234,
    "GTF-GL42.gtf21.GL.build.vertexOnly2_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000235,
    "GTF-GL42.gtf21.GL.build.vertexOnly_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000236,
    "GTF-GL42.gtf21.GL.build.vertex_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000237,
    "GTF-GL42.gtf21.GL.build.while1_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000238,
    "GTF-GL42.gtf21.GL.build.while2_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000239,
    "GTF-GL42.gtf21.GL.build.while_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000240,
    "GTF-GL42.gtf21.GL.build.TernaryOp_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000241,
    "GTF-GL42.gtf21.GL.build.CG_Data_Types_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000242,
    "GTF-GL42.gtf21.GL.build.CG_Standard_Library_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000243,
    "GTF-GL42.gtf21.GL.build.Include_Preprocessor_Directive_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000244,
    "GTF-GL42.gtf21.GL.build.Low_Level_Assembly_Reserved_Words_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000245,
    "GTF-GL42.gtf21.GL.build.Main_Parameters_vert");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000246,
    "GTF-GL42.gtf21.GL.build.Permissive_Constant_Conversions_frag");

static SHRINK_HWTEST_SF(ActsGl42gtfmaster0001TestSuite, TestCase_000247,
    "GTF-GL42.gtf21.GL.build.Permissive_Scalar_Vector_Expressions_frag");
