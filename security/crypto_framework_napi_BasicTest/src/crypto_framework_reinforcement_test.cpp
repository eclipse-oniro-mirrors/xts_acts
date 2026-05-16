/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#include <stdlib.h>
#include <stdio.h>
#include <pthread.h>
#include <string.h>
#include <unistd.h>
 
#include "crypto_common.h"
#include "crypto_asym_cipher.h"
#include "crypto_asym_key.h"
#include "crypto_digest.h"
#include "crypto_kdf.h"
#include "crypto_key_agreement.h"
#include "crypto_mac.h"
#include "crypto_rand.h"
#include "crypto_signature.h"
#include "crypto_sym_cipher.h"
#include "crypto_sym_key.h"
#include "blob.h"
#include "log.h"

#include <gtest/gtest.h>
 
using namespace testing::ext;
namespace Unittest::CryptoFrameworkReinforcementTest {
class OHCryptoFrameworkReinforcementTest : public testing::Test {
public:
    static void SetUpTestCase() {};
    static void TearDownTestCase() {};
    void SetUp() {};
    void TearDown() {};
};
/**
* @tc.name   SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_0100
* @tc.number SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_0100
* @tc.desc   test OH_CryptoAsymKeyGenerator_Create with empty string
* @tc.type   FUNCTION
* @tc.size   MEDIUMTEST
* @tc.level  LEVEL0
*/
HWTEST_F(OHCryptoFrameworkReinforcementTest, SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_0100, TestSize.Level0)
{
    const char *algoName = "";
    OH_CryptoAsymKeyGenerator *ctx = nullptr;

    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Create(algoName, &ctx), CRYPTO_INVALID_PARAMS);
    EXPECT_EQ(ctx, nullptr);
    OH_CryptoAsymKeyGenerator_Destroy(ctx);
}

/**
* @tc.name   SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_0200
* @tc.number SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_0200
* @tc.desc   test OH_CryptoAsymKeyGenerator_Create with NULL
* @tc.type   FUNCTION
* @tc.size   MEDIUMTEST
* @tc.level  LEVEL0
*/
HWTEST_F(OHCryptoFrameworkReinforcementTest, SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_0200, TestSize.Level0)
{
    OH_CryptoAsymKeyGenerator *ctx = nullptr;

    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Create(nullptr, &ctx), CRYPTO_INVALID_PARAMS);
    EXPECT_EQ(ctx, nullptr);
    OH_CryptoAsymKeyGenerator_Destroy(ctx);
}

/**
* @tc.name   SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_0300
* @tc.number SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_0300
* @tc.desc   test OH_CryptoAsymKeyGenerator_GetAlgoName with NULL context
* @tc.type   FUNCTION
* @tc.size   MEDIUMTEST
* @tc.level  LEVEL0
*/
HWTEST_F(OHCryptoFrameworkReinforcementTest, SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_0300, TestSize.Level0)
{
    const char *algoName = OH_CryptoAsymKeyGenerator_GetAlgoName(nullptr);
    EXPECT_EQ(algoName, nullptr);
}

/**
* @tc.name   SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_0400
* @tc.number SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_0400
* @tc.desc   test OH_CryptoAsymKeySpec_GenEcCommonParamsSpec with empty string
* @tc.type   FUNCTION
* @tc.size   MEDIUMTEST
* @tc.level  LEVEL0
*/
HWTEST_F(OHCryptoFrameworkReinforcementTest, SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_0400, TestSize.Level0)
{
    const char *curveName = "";
    OH_CryptoAsymKeySpec *spec = nullptr;

    EXPECT_EQ(OH_CryptoAsymKeySpec_GenEcCommonParamsSpec(curveName, &spec), CRYPTO_PARAMETER_CHECK_FAILED);
    EXPECT_EQ(spec, nullptr);
    OH_CryptoAsymKeySpec_Destroy(spec);
}

/**
* @tc.name   SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_0500
* @tc.number SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_0500
* @tc.desc   test OH_CryptoAsymKeySpec_GenEcCommonParamsSpec with NULL
* @tc.type   FUNCTION
* @tc.size   MEDIUMTEST
* @tc.level  LEVEL0
*/
HWTEST_F(OHCryptoFrameworkReinforcementTest, SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_0500, TestSize.Level0)
{
    OH_CryptoAsymKeySpec *spec = nullptr;

    EXPECT_EQ(OH_CryptoAsymKeySpec_GenEcCommonParamsSpec(nullptr, &spec), CRYPTO_PARAMETER_CHECK_FAILED);
    EXPECT_EQ(spec, nullptr);
    OH_CryptoAsymKeySpec_Destroy(spec);
}

/**
* @tc.name   SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_0600
* @tc.number SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_0600
* @tc.desc   test OH_CryptoAsymKeySpec_Create with empty string
* @tc.type   FUNCTION
* @tc.size   MEDIUMTEST
* @tc.level  LEVEL0
*/
HWTEST_F(OHCryptoFrameworkReinforcementTest, SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_0600, TestSize.Level0)
{
    const char *algoName = "";
    OH_CryptoAsymKeySpec *spec = nullptr;

    EXPECT_EQ(OH_CryptoAsymKeySpec_Create(algoName, CRYPTO_ASYM_KEY_COMMON_PARAMS_SPEC, &spec), CRYPTO_PARAMETER_CHECK_FAILED);
    EXPECT_EQ(spec, nullptr);
    OH_CryptoAsymKeySpec_Destroy(spec);
}

/**
* @tc.name   SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_0700
* @tc.number SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_0700
* @tc.desc   test OH_CryptoAsymKeySpec_Create with NULL
* @tc.type   FUNCTION
* @tc.size   MEDIUMTEST
* @tc.level  LEVEL0
*/
HWTEST_F(OHCryptoFrameworkReinforcementTest, SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_0700, TestSize.Level0)
{
    OH_CryptoAsymKeySpec *spec = nullptr;

    EXPECT_EQ(OH_CryptoAsymKeySpec_Create(nullptr, CRYPTO_ASYM_KEY_COMMON_PARAMS_SPEC, &spec), CRYPTO_PARAMETER_CHECK_FAILED);
    EXPECT_EQ(spec, nullptr);
    OH_CryptoAsymKeySpec_Destroy(spec);
}

/**
* @tc.name   SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_0800
* @tc.number SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_0800
* @tc.desc   test OH_CryptoEcPoint_Create with empty string
* @tc.type   FUNCTION
* @tc.size   MEDIUMTEST
* @tc.level  LEVEL0
*/
HWTEST_F(OHCryptoFrameworkReinforcementTest, SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_0800, TestSize.Level0)
{
    const char *curveName = "";
    OH_CryptoEcPoint *point = nullptr;

    EXPECT_EQ(OH_CryptoEcPoint_Create(curveName, nullptr, &point), CRYPTO_SUCCESS);
    EXPECT_NE(point, nullptr);
    OH_CryptoEcPoint_Destroy(point);
}

/**
* @tc.name   SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_0900
* @tc.number SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_0900
* @tc.desc   test OH_CryptoEcPoint_Create with NULL
* @tc.type   FUNCTION
* @tc.size   MEDIUMTEST
* @tc.level  LEVEL0
*/
HWTEST_F(OHCryptoFrameworkReinforcementTest, SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_0900, TestSize.Level0)
{
    OH_CryptoEcPoint *point = nullptr;

    EXPECT_EQ(OH_CryptoEcPoint_Create(nullptr, nullptr, &point), CRYPTO_PARAMETER_CHECK_FAILED);
    EXPECT_EQ(point, nullptr);
    OH_CryptoEcPoint_Destroy(point);
}

/**
* @tc.name   SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_1000
* @tc.number SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_1000
* @tc.desc   test OH_CryptoDigest_Create with empty string
* @tc.type   FUNCTION
* @tc.size   MEDIUMTEST
* @tc.level  LEVEL0
*/
HWTEST_F(OHCryptoFrameworkReinforcementTest, SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_1000, TestSize.Level0)
{
    const char *algoName = "";
    OH_CryptoDigest *ctx = nullptr;

    EXPECT_EQ(OH_CryptoDigest_Create(algoName, &ctx), CRYPTO_INVALID_PARAMS);
    EXPECT_EQ(ctx, nullptr);
    OH_DigestCrypto_Destroy(ctx);
}

/**
* @tc.name   SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_1100
* @tc.number SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_1100
* @tc.desc   test OH_CryptoDigest_Create with NULL
* @tc.type   FUNCTION
* @tc.size   MEDIUMTEST
* @tc.level  LEVEL0
*/
HWTEST_F(OHCryptoFrameworkReinforcementTest, SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_1100, TestSize.Level0)
{
    OH_CryptoDigest *ctx = nullptr;

    EXPECT_EQ(OH_CryptoDigest_Create(nullptr, &ctx), CRYPTO_INVALID_PARAMS);
    EXPECT_EQ(ctx, nullptr);
    OH_DigestCrypto_Destroy(ctx);
}

/**
* @tc.name   SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_1200
* @tc.number SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_1200
* @tc.desc   test OH_CryptoDigest_GetAlgoName with NULL context
* @tc.type   FUNCTION
* @tc.size   MEDIUMTEST
* @tc.level  LEVEL0
*/
HWTEST_F(OHCryptoFrameworkReinforcementTest, SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_1200, TestSize.Level0)
{
    const char *algoName = OH_CryptoDigest_GetAlgoName(nullptr);
    EXPECT_EQ(algoName, nullptr);
}

/**
* @tc.name   SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_1300
* @tc.number SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_1300
* @tc.desc   test OH_CryptoKdfParams_Create with empty string
* @tc.type   FUNCTION
* @tc.size   MEDIUMTEST
* @tc.level  LEVEL0
*/
HWTEST_F(OHCryptoFrameworkReinforcementTest, SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_1300, TestSize.Level0)
{
    const char *algoName = "";
    OH_CryptoKdfParams *params = nullptr;

    EXPECT_EQ(OH_CryptoKdfParams_Create(algoName, &params), CRYPTO_PARAMETER_CHECK_FAILED);
    EXPECT_EQ(params, nullptr);
    OH_CryptoKdfParams_Destroy(params);
}

/**
* @tc.name   SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_1400
* @tc.number SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_1400
* @tc.desc   test OH_CryptoKdfParams_Create with NULL
* @tc.type   FUNCTION
* @tc.size   MEDIUMTEST
* @tc.level  LEVEL0
*/
HWTEST_F(OHCryptoFrameworkReinforcementTest, SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_1400, TestSize.Level0)
{
    OH_CryptoKdfParams *params = nullptr;

    EXPECT_EQ(OH_CryptoKdfParams_Create(nullptr, &params), CRYPTO_PARAMETER_CHECK_FAILED);
    EXPECT_EQ(params, nullptr);
    OH_CryptoKdfParams_Destroy(params);
}

/**
* @tc.name   SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_1500
* @tc.number SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_1500
* @tc.desc   test OH_CryptoKdf_Create with empty string
* @tc.type   FUNCTION
* @tc.size   MEDIUMTEST
* @tc.level  LEVEL0
*/
HWTEST_F(OHCryptoFrameworkReinforcementTest, SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_1500, TestSize.Level0)
{
    const char *algoName = "";
    OH_CryptoKdf *ctx = nullptr;

    EXPECT_EQ(OH_CryptoKdf_Create(algoName, &ctx), CRYPTO_PARAMETER_CHECK_FAILED);
    EXPECT_EQ(ctx, nullptr);
    OH_CryptoKdf_Destroy(ctx);
}

/**
* @tc.name   SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_1600
* @tc.number SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_1600
* @tc.desc   test OH_CryptoKdf_Create with NULL
* @tc.type   FUNCTION
* @tc.size   MEDIUMTEST
* @tc.level  LEVEL0
*/
HWTEST_F(OHCryptoFrameworkReinforcementTest, SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_1600, TestSize.Level0)
{
    OH_CryptoKdf *ctx = nullptr;

    EXPECT_EQ(OH_CryptoKdf_Create(nullptr, &ctx), CRYPTO_PARAMETER_CHECK_FAILED);
    EXPECT_EQ(ctx, nullptr);
    OH_CryptoKdf_Destroy(ctx);
}

/**
* @tc.name   SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_1700
* @tc.number SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_1700
* @tc.desc   test OH_CryptoKeyAgreement_Create with empty string
* @tc.type   FUNCTION
* @tc.size   MEDIUMTEST
* @tc.level  LEVEL0
*/
HWTEST_F(OHCryptoFrameworkReinforcementTest, SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_1700, TestSize.Level0)
{
    const char *algoName = "";
    OH_CryptoKeyAgreement *ctx = nullptr;

    EXPECT_EQ(OH_CryptoKeyAgreement_Create(algoName, &ctx), CRYPTO_PARAMETER_CHECK_FAILED);
    EXPECT_EQ(ctx, nullptr);
    OH_CryptoKeyAgreement_Destroy(ctx);
}

/**
* @tc.name   SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_1800
* @tc.number SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_1800
* @tc.desc   test OH_CryptoKeyAgreement_Create with NULL
* @tc.type   FUNCTION
* @tc.size   MEDIUMTEST
* @tc.level  LEVEL0
*/
HWTEST_F(OHCryptoFrameworkReinforcementTest, SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_1800, TestSize.Level0)
{
    OH_CryptoKeyAgreement *ctx = nullptr;

    EXPECT_EQ(OH_CryptoKeyAgreement_Create(nullptr, &ctx), CRYPTO_PARAMETER_CHECK_FAILED);
    EXPECT_EQ(ctx, nullptr);
    OH_CryptoKeyAgreement_Destroy(ctx);
}

/**
* @tc.name   SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_1900
* @tc.number SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_1900
* @tc.desc   test OH_CryptoMac_Create with empty string
* @tc.type   FUNCTION
* @tc.size   MEDIUMTEST
* @tc.level  LEVEL0
*/
HWTEST_F(OHCryptoFrameworkReinforcementTest, SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_1900, TestSize.Level0)
{
    const char *algoName = "";
    OH_CryptoMac *ctx = nullptr;

    EXPECT_EQ(OH_CryptoMac_Create(algoName, &ctx), CRYPTO_PARAMETER_CHECK_FAILED);
    EXPECT_EQ(ctx, nullptr);
    OH_CryptoMac_Destroy(ctx);
}

/**
* @tc.name   SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_2000
* @tc.number SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_2000
* @tc.desc   test OH_CryptoMac_Create with NULL
* @tc.type   FUNCTION
* @tc.size   MEDIUMTEST
* @tc.level  LEVEL0
*/
HWTEST_F(OHCryptoFrameworkReinforcementTest, SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_2000, TestSize.Level0)
{
    OH_CryptoMac *ctx = nullptr;

    EXPECT_EQ(OH_CryptoMac_Create(nullptr, &ctx), CRYPTO_PARAMETER_CHECK_FAILED);
    EXPECT_EQ(ctx, nullptr);
    OH_CryptoMac_Destroy(ctx);
}

/**
* @tc.name   SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_2100
* @tc.number SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_2100
* @tc.desc   test OH_CryptoRand_GetAlgoName with NULL context
* @tc.type   FUNCTION
* @tc.size   MEDIUMTEST
* @tc.level  LEVEL0
*/
HWTEST_F(OHCryptoFrameworkReinforcementTest, SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_2100, TestSize.Level0)
{
    const char *algoName = OH_CryptoRand_GetAlgoName(nullptr);
    EXPECT_EQ(algoName, nullptr);
}

/**
* @tc.name   SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_2200
* @tc.number SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_2200
* @tc.desc   test OH_CryptoVerify_Create with empty string
* @tc.type   FUNCTION
* @tc.size   MEDIUMTEST
* @tc.level  LEVEL0
*/
HWTEST_F(OHCryptoFrameworkReinforcementTest, SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_2200, TestSize.Level0)
{
    const char *algoName = "";
    OH_CryptoVerify *verify = nullptr;

    EXPECT_EQ(OH_CryptoVerify_Create(algoName, &verify), CRYPTO_INVALID_PARAMS);
    EXPECT_EQ(verify, nullptr);
    OH_CryptoVerify_Destroy(verify);
}

/**
* @tc.name   SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_2300
* @tc.number SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_2300
* @tc.desc   test OH_CryptoVerify_Create with NULL
* @tc.type   FUNCTION
* @tc.size   MEDIUMTEST
* @tc.level  LEVEL0
*/
HWTEST_F(OHCryptoFrameworkReinforcementTest, SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_2300, TestSize.Level0)
{
    OH_CryptoVerify *verify = nullptr;

    EXPECT_EQ(OH_CryptoVerify_Create(nullptr, &verify), CRYPTO_INVALID_PARAMS);
    EXPECT_EQ(verify, nullptr);
    OH_CryptoVerify_Destroy(verify);
}

/**
* @tc.name   SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_2400
* @tc.number SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_2400
* @tc.desc   test OH_CryptoVerify_GetAlgoName with NULL context
* @tc.type   FUNCTION
* @tc.size   MEDIUMTEST
* @tc.level  LEVEL0
*/
HWTEST_F(OHCryptoFrameworkReinforcementTest, SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_2400, TestSize.Level0)
{
    const char *algoName = OH_CryptoVerify_GetAlgoName(nullptr);
    EXPECT_EQ(algoName, nullptr);
}

/**
* @tc.name   SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_2500
* @tc.number SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_2500
* @tc.desc   test OH_CryptoSign_Create with empty string
* @tc.type   FUNCTION
* @tc.size   MEDIUMTEST
* @tc.level  LEVEL0
*/
HWTEST_F(OHCryptoFrameworkReinforcementTest, SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_2500, TestSize.Level0)
{
    const char *algoName = "";
    OH_CryptoSign *sign = nullptr;

    EXPECT_EQ(OH_CryptoSign_Create(algoName, &sign), CRYPTO_PARAMETER_CHECK_FAILED);
    EXPECT_EQ(sign, nullptr);
    OH_CryptoSign_Destroy(sign);
}

/**
* @tc.name   SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_2600
* @tc.number SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_2600
* @tc.desc   test OH_CryptoSign_Create with NULL
* @tc.type   FUNCTION
* @tc.size   MEDIUMTEST
* @tc.level  LEVEL0
*/
HWTEST_F(OHCryptoFrameworkReinforcementTest, SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_2600, TestSize.Level0)
{
    OH_CryptoSign *sign = nullptr;

    EXPECT_EQ(OH_CryptoSign_Create(nullptr, &sign), CRYPTO_PARAMETER_CHECK_FAILED);
    EXPECT_EQ(sign, nullptr);
    OH_CryptoSign_Destroy(sign);
}

/**
* @tc.name   SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_2700
* @tc.number SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_2700
* @tc.desc   test OH_CryptoSign_GetAlgoName with NULL context
* @tc.type   FUNCTION
* @tc.size   MEDIUMTEST
* @tc.level  LEVEL0
*/
HWTEST_F(OHCryptoFrameworkReinforcementTest, SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_2700, TestSize.Level0)
{
    const char *algoName = OH_CryptoSign_GetAlgoName(nullptr);
    EXPECT_EQ(algoName, nullptr);
}

/**
* @tc.name   SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_2800
* @tc.number SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_2800
* @tc.desc   test OH_CryptoSymCipher_Create with empty string
* @tc.type   FUNCTION
* @tc.size   MEDIUMTEST
* @tc.level  LEVEL0
*/
HWTEST_F(OHCryptoFrameworkReinforcementTest, SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_2800, TestSize.Level0)
{
    const char *algoName = "";
    OH_CryptoSymCipher *ctx = nullptr;

    EXPECT_EQ(OH_CryptoSymCipher_Create(algoName, &ctx), CRYPTO_NOT_SUPPORTED);
    EXPECT_EQ(ctx, nullptr);
    OH_CryptoSymCipher_Destroy(ctx);
}

/**
* @tc.name   SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_2900
* @tc.number SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_2900
* @tc.desc   test OH_CryptoSymCipher_Create with NULL
* @tc.type   FUNCTION
* @tc.size   MEDIUMTEST
* @tc.level  LEVEL0
*/
HWTEST_F(OHCryptoFrameworkReinforcementTest, SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_2900, TestSize.Level0)
{
    OH_CryptoSymCipher *ctx = nullptr;

    EXPECT_EQ(OH_CryptoSymCipher_Create(nullptr, &ctx), CRYPTO_INVALID_PARAMS);
    EXPECT_EQ(ctx, nullptr);
    OH_CryptoSymCipher_Destroy(ctx);
}

/**
* @tc.name   SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_3000
* @tc.number SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_3000
* @tc.desc   test OH_CryptoSymCipher_GetAlgoName with NULL context
* @tc.type   FUNCTION
* @tc.size   MEDIUMTEST
* @tc.level  LEVEL0
*/
HWTEST_F(OHCryptoFrameworkReinforcementTest, SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_3000, TestSize.Level0)
{
    const char *algoName = OH_CryptoSymCipher_GetAlgoName(nullptr);
    EXPECT_EQ(algoName, nullptr);
}

/**
* @tc.name   SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_3100
* @tc.number SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_3100
* @tc.desc   test OH_CryptoSymKeyGenerator_Create with empty string
* @tc.type   FUNCTION
* @tc.size   MEDIUMTEST
* @tc.level  LEVEL0
*/
HWTEST_F(OHCryptoFrameworkReinforcementTest, SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_3100, TestSize.Level0)
{
    const char *algoName = "";
    OH_CryptoSymKeyGenerator *ctx = nullptr;

    EXPECT_EQ(OH_CryptoSymKeyGenerator_Create(algoName, &ctx), CRYPTO_NOT_SUPPORTED);
    EXPECT_EQ(ctx, nullptr);
    OH_CryptoSymKeyGenerator_Destroy(ctx);
}

/**
* @tc.name   SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_3200
* @tc.number SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_3200
* @tc.desc   test OH_CryptoSymKeyGenerator_Create with NULL
* @tc.type   FUNCTION
* @tc.size   MEDIUMTEST
* @tc.level  LEVEL0
*/
HWTEST_F(OHCryptoFrameworkReinforcementTest, SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_3200, TestSize.Level0)
{
    OH_CryptoSymKeyGenerator *ctx = nullptr;

    EXPECT_EQ(OH_CryptoSymKeyGenerator_Create(nullptr, &ctx), CRYPTO_INVALID_PARAMS);
    EXPECT_EQ(ctx, nullptr);
    OH_CryptoSymKeyGenerator_Destroy(ctx);
}

/**
* @tc.name   SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_3300
* @tc.number SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_3300
* @tc.desc   test OH_CryptoSymKeyGenerator_GetAlgoName with NULL context
* @tc.type   FUNCTION
* @tc.size   MEDIUMTEST
* @tc.level  LEVEL0
*/
HWTEST_F(OHCryptoFrameworkReinforcementTest, SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_3300, TestSize.Level0)
{
    const char *algoName = OH_CryptoSymKeyGenerator_GetAlgoName(nullptr);
    EXPECT_EQ(algoName, nullptr);
}

/**
* @tc.name   SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_3400
* @tc.number SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_3400
* @tc.desc   test OH_CryptoSymKey_GetAlgoName with NULL context
* @tc.type   FUNCTION
* @tc.size   MEDIUMTEST
* @tc.level  LEVEL0
*/
HWTEST_F(OHCryptoFrameworkReinforcementTest, SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_3400, TestSize.Level0)
{
    const char *algoName = OH_CryptoSymKey_GetAlgoName(nullptr);
    EXPECT_EQ(algoName, nullptr);
}

/**
* @tc.name   SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_3500
* @tc.number SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_3500
* @tc.desc   test OH_CryptoAsymCipher_Create with empty string
* @tc.type   FUNCTION
* @tc.size   MEDIUMTEST
* @tc.level  LEVEL0
*/
HWTEST_F(OHCryptoFrameworkReinforcementTest, SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_3500, TestSize.Level0)
{
    const char *algoName = "";
    OH_CryptoAsymCipher *ctx = nullptr;

    EXPECT_EQ(OH_CryptoAsymCipher_Create(algoName, &ctx), CRYPTO_NOT_SUPPORTED);
    EXPECT_EQ(ctx, nullptr);
    OH_CryptoAsymCipher_Destroy(ctx);
}

/**
* @tc.name   SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_3600
* @tc.number SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_3600
* @tc.desc   test OH_CryptoAsymCipher_Create with NULL
* @tc.type   FUNCTION
* @tc.size   MEDIUMTEST
* @tc.level  LEVEL0
*/
HWTEST_F(OHCryptoFrameworkReinforcementTest, SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_3600, TestSize.Level0)
{
    OH_CryptoAsymCipher *ctx = nullptr;

    EXPECT_EQ(OH_CryptoAsymCipher_Create(nullptr, &ctx), CRYPTO_PARAMETER_CHECK_FAILED);
    EXPECT_EQ(ctx, nullptr);
    OH_CryptoAsymCipher_Destroy(ctx);
}

/**
* @tc.name   SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_3700
* @tc.number SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_3700
* @tc.desc   test OH_CryptoMac_SetParam with empty string for CRYPTO_MAC_DIGEST_NAME_STR
* @tc.type   FUNCTION
* @tc.size   MEDIUMTEST
* @tc.level  LEVEL0
*/
HWTEST_F(OHCryptoFrameworkReinforcementTest, SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_3700, TestSize.Level0)
{
    OH_CryptoMac *ctx = nullptr;
    const char *emptyStr = "";
    const Crypto_DataBlob value = {
        .data = reinterpret_cast<uint8_t *>(const_cast<char *>(emptyStr)),
        .len = strlen(emptyStr)
    };

    EXPECT_EQ(OH_CryptoMac_Create("HMAC", &ctx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoMac_SetParam(ctx, CRYPTO_MAC_DIGEST_NAME_STR, &value), CRYPTO_PARAMETER_CHECK_FAILED);
    
    OH_CryptoMac_Destroy(ctx);
}

/**
* @tc.name   SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_3800
* @tc.number SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_3800
* @tc.desc   test OH_CryptoMac_SetParam with empty string for CRYPTO_MAC_CIPHER_NAME_STR
* @tc.type   FUNCTION
* @tc.size   MEDIUMTEST
* @tc.level  LEVEL0
*/
HWTEST_F(OHCryptoFrameworkReinforcementTest, SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_3800, TestSize.Level0)
{
    OH_CryptoMac *ctx = nullptr;
    const char *emptyStr = "";
    const Crypto_DataBlob value = {
        .data = reinterpret_cast<uint8_t *>(const_cast<char *>(emptyStr)),
        .len = strlen(emptyStr)
    };

    EXPECT_EQ(OH_CryptoMac_Create("CMAC", &ctx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoMac_SetParam(ctx, CRYPTO_MAC_CIPHER_NAME_STR, &value), CRYPTO_PARAMETER_CHECK_FAILED);
    
    OH_CryptoMac_Destroy(ctx);
}

/**
* @tc.name   SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_3900
* @tc.number SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_3900
* @tc.desc   test OH_CryptoMac_SetParam with NULL value for CRYPTO_MAC_DIGEST_NAME_STR
* @tc.type   FUNCTION
* @tc.size   MEDIUMTEST
* @tc.level  LEVEL0
*/
HWTEST_F(OHCryptoFrameworkReinforcementTest, SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_3900, TestSize.Level0)
{
    OH_CryptoMac *ctx = nullptr;

    EXPECT_EQ(OH_CryptoMac_Create("HMAC", &ctx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoMac_SetParam(ctx, CRYPTO_MAC_DIGEST_NAME_STR, nullptr), CRYPTO_PARAMETER_CHECK_FAILED);
    
    OH_CryptoMac_Destroy(ctx);
}

/**
* @tc.name   SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_4000
* @tc.number SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_4000
* @tc.desc   test OH_CryptoMac_SetParam with NULL context
* @tc.type   FUNCTION
* @tc.size   MEDIUMTEST
* @tc.level  LEVEL0
*/
HWTEST_F(OHCryptoFrameworkReinforcementTest, SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_4000, TestSize.Level0)
{
    const char *digestName = "SHA256";
    const Crypto_DataBlob value = {
        .data = reinterpret_cast<uint8_t *>(const_cast<char *>(digestName)),
        .len = strlen(digestName)
    };

    EXPECT_EQ(OH_CryptoMac_SetParam(nullptr, CRYPTO_MAC_DIGEST_NAME_STR, &value), CRYPTO_PARAMETER_CHECK_FAILED);
}

/**
* @tc.name   SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_4100
* @tc.number SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_4100
* @tc.desc   test OH_CryptoVerify_SetParam with empty string for CRYPTO_PSS_MD_NAME_STR
* @tc.type   FUNCTION
* @tc.size   MEDIUMTEST
* @tc.level  LEVEL0
*/
HWTEST_F(OHCryptoFrameworkReinforcementTest, SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_4100, TestSize.Level0)
{
    OH_CryptoVerify *verify = nullptr;
    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    const char *emptyStr = "";
    Crypto_DataBlob value = {
        .data = reinterpret_cast<uint8_t *>(const_cast<char *>(emptyStr)),
        .len = strlen(emptyStr)
    };

    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Create("RSA1024", &keyCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Generate(keyCtx, &keyPair), CRYPTO_SUCCESS);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    EXPECT_EQ(OH_CryptoVerify_Create("RSA1024|PSS|SHA256|MGF1_SHA256", &verify), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoVerify_Init(verify, pubKey), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoVerify_SetParam(verify, CRYPTO_PSS_MD_NAME_STR, &value), CRYPTO_NOT_SUPPORTED);

    OH_CryptoVerify_Destroy(verify);
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
    OH_CryptoKeyPair_Destroy(keyPair);
}

/**
* @tc.name   SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_4200
* @tc.number SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_4200
* @tc.desc   test OH_CryptoVerify_SetParam with empty string for CRYPTO_PSS_MGF_NAME_STR
* @tc.type   FUNCTION
* @tc.size   MEDIUMTEST
* @tc.level  LEVEL0
*/
HWTEST_F(OHCryptoFrameworkReinforcementTest, SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_4200, TestSize.Level0)
{
    OH_CryptoVerify *verify = nullptr;
    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    const char *emptyStr = "";
    Crypto_DataBlob value = {
        .data = reinterpret_cast<uint8_t *>(const_cast<char *>(emptyStr)),
        .len = strlen(emptyStr)
    };

    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Create("RSA1024", &keyCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Generate(keyCtx, &keyPair), CRYPTO_SUCCESS);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    EXPECT_EQ(OH_CryptoVerify_Create("RSA1024|PSS|SHA256|MGF1_SHA256", &verify), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoVerify_Init(verify, pubKey), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoVerify_SetParam(verify, CRYPTO_PSS_MGF_NAME_STR, &value), CRYPTO_NOT_SUPPORTED);

    OH_CryptoVerify_Destroy(verify);
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
    OH_CryptoKeyPair_Destroy(keyPair);
}

/**
* @tc.name   SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_4300
* @tc.number SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_4300
* @tc.desc   test OH_CryptoVerify_SetParam with empty string for CRYPTO_PSS_MGF1_NAME_STR
* @tc.type   FUNCTION
* @tc.size   MEDIUMTEST
* @tc.level  LEVEL0
*/
HWTEST_F(OHCryptoFrameworkReinforcementTest, SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_4300, TestSize.Level0)
{
    OH_CryptoVerify *verify = nullptr;
    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    const char *emptyStr = "";
    Crypto_DataBlob value = {
        .data = reinterpret_cast<uint8_t *>(const_cast<char *>(emptyStr)),
        .len = strlen(emptyStr)
    };

    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Create("RSA1024", &keyCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Generate(keyCtx, &keyPair), CRYPTO_SUCCESS);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    EXPECT_EQ(OH_CryptoVerify_Create("RSA1024|PSS|SHA256|MGF1_SHA256", &verify), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoVerify_Init(verify, pubKey), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoVerify_SetParam(verify, CRYPTO_PSS_MGF1_NAME_STR, &value), CRYPTO_NOT_SUPPORTED);

    OH_CryptoVerify_Destroy(verify);
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
    OH_CryptoKeyPair_Destroy(keyPair);
}

/**
* @tc.name   SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_4400
* @tc.number SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_4400
* @tc.desc   test OH_CryptoVerify_SetParam with NULL value
* @tc.type   FUNCTION
* @tc.size   MEDIUMTEST
* @tc.level  LEVEL0
*/
HWTEST_F(OHCryptoFrameworkReinforcementTest, SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_4400, TestSize.Level0)
{
    OH_CryptoVerify *verify = nullptr;
    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;

    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Create("RSA1024", &keyCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Generate(keyCtx, &keyPair), CRYPTO_SUCCESS);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    EXPECT_EQ(OH_CryptoVerify_Create("RSA1024|PSS|SHA256|MGF1_SHA256", &verify), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoVerify_Init(verify, pubKey), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoVerify_SetParam(verify, CRYPTO_PSS_MD_NAME_STR, nullptr), CRYPTO_INVALID_PARAMS);

    OH_CryptoVerify_Destroy(verify);
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
    OH_CryptoKeyPair_Destroy(keyPair);
}

/**
* @tc.name   SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_4500
* @tc.number SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_4500
* @tc.desc   test OH_CryptoVerify_SetParam with NULL context
* @tc.type   FUNCTION
* @tc.size   MEDIUMTEST
* @tc.level  LEVEL0
*/
HWTEST_F(OHCryptoFrameworkReinforcementTest, SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_4500, TestSize.Level0)
{
    const char *mdName = "SHA256";
    Crypto_DataBlob value = {
        .data = reinterpret_cast<uint8_t *>(const_cast<char *>(mdName)),
        .len = strlen(mdName)
    };

    EXPECT_EQ(OH_CryptoVerify_SetParam(nullptr, CRYPTO_PSS_MD_NAME_STR, &value), CRYPTO_INVALID_PARAMS);
}

/**
* @tc.name   SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_4600
* @tc.number SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_4600
* @tc.desc   test OH_CryptoSign_SetParam with empty string for CRYPTO_PSS_MD_NAME_STR
* @tc.type   FUNCTION
* @tc.size   MEDIUMTEST
* @tc.level  LEVEL0
*/
HWTEST_F(OHCryptoFrameworkReinforcementTest, SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_4600, TestSize.Level0)
{
    OH_CryptoSign *sign = nullptr;
    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    const char *emptyStr = "";
    Crypto_DataBlob value = {
        .data = reinterpret_cast<uint8_t *>(const_cast<char *>(emptyStr)),
        .len = strlen(emptyStr)
    };

    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Create("RSA1024", &keyCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Generate(keyCtx, &keyPair), CRYPTO_SUCCESS);
    OH_CryptoPrivKey *privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    EXPECT_EQ(OH_CryptoSign_Create("RSA1024|PSS|SHA256|MGF1_SHA256", &sign), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_Init(sign, privKey), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_SetParam(sign, CRYPTO_PSS_MD_NAME_STR, &value), CRYPTO_NOT_SUPPORTED);

    OH_CryptoSign_Destroy(sign);
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
    OH_CryptoKeyPair_Destroy(keyPair);
}

/**
* @tc.name   SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_4700
* @tc.number SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_4700
* @tc.desc   test OH_CryptoSign_SetParam with empty string for CRYPTO_PSS_MGF_NAME_STR
* @tc.type   FUNCTION
* @tc.size   MEDIUMTEST
* @tc.level  LEVEL0
*/
HWTEST_F(OHCryptoFrameworkReinforcementTest, SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_4700, TestSize.Level0)
{
    OH_CryptoSign *sign = nullptr;
    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    const char *emptyStr = "";
    Crypto_DataBlob value = {
        .data = reinterpret_cast<uint8_t *>(const_cast<char *>(emptyStr)),
        .len = strlen(emptyStr)
    };

    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Create("RSA1024", &keyCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Generate(keyCtx, &keyPair), CRYPTO_SUCCESS);
    OH_CryptoPrivKey *privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    EXPECT_EQ(OH_CryptoSign_Create("RSA1024|PSS|SHA256|MGF1_SHA256", &sign), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_Init(sign, privKey), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_SetParam(sign, CRYPTO_PSS_MGF_NAME_STR, &value), CRYPTO_NOT_SUPPORTED);

    OH_CryptoSign_Destroy(sign);
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
    OH_CryptoKeyPair_Destroy(keyPair);
}

/**
* @tc.name   SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_4800
* @tc.number SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_4800
* @tc.desc   test OH_CryptoSign_SetParam with empty string for CRYPTO_PSS_MGF1_NAME_STR
* @tc.type   FUNCTION
* @tc.size   MEDIUMTEST
* @tc.level  LEVEL0
*/
HWTEST_F(OHCryptoFrameworkReinforcementTest, SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_4800, TestSize.Level0)
{
    OH_CryptoSign *sign = nullptr;
    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    const char *emptyStr = "";
    Crypto_DataBlob value = {
        .data = reinterpret_cast<uint8_t *>(const_cast<char *>(emptyStr)),
        .len = strlen(emptyStr)
    };

    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Create("RSA1024", &keyCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Generate(keyCtx, &keyPair), CRYPTO_SUCCESS);
    OH_CryptoPrivKey *privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    EXPECT_EQ(OH_CryptoSign_Create("RSA1024|PSS|SHA256|MGF1_SHA256", &sign), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_Init(sign, privKey), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_SetParam(sign, CRYPTO_PSS_MGF1_NAME_STR, &value), CRYPTO_NOT_SUPPORTED);

    OH_CryptoSign_Destroy(sign);
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
    OH_CryptoKeyPair_Destroy(keyPair);
}

/**
* @tc.name   SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_4900
* @tc.number SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_4900
* @tc.desc   test OH_CryptoSign_SetParam with NULL value
* @tc.type   FUNCTION
* @tc.size   MEDIUMTEST
* @tc.level  LEVEL0
*/
HWTEST_F(OHCryptoFrameworkReinforcementTest, SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_4900, TestSize.Level0)
{
    OH_CryptoSign *sign = nullptr;
    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;

    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Create("RSA1024", &keyCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Generate(keyCtx, &keyPair), CRYPTO_SUCCESS);
    OH_CryptoPrivKey *privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    EXPECT_EQ(OH_CryptoSign_Create("RSA1024|PSS|SHA256|MGF1_SHA256", &sign), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_Init(sign, privKey), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_SetParam(sign, CRYPTO_PSS_MD_NAME_STR, nullptr), CRYPTO_PARAMETER_CHECK_FAILED);

    OH_CryptoSign_Destroy(sign);
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
    OH_CryptoKeyPair_Destroy(keyPair);
}

/**
* @tc.name   SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_5000
* @tc.number SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_5000
* @tc.desc   test OH_CryptoSign_SetParam with NULL context
* @tc.type   FUNCTION
* @tc.size   MEDIUMTEST
* @tc.level  LEVEL0
*/
HWTEST_F(OHCryptoFrameworkReinforcementTest, SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_5000, TestSize.Level0)
{
    const char *mdName = "SHA256";
    const Crypto_DataBlob value = {
        .data = reinterpret_cast<uint8_t *>(const_cast<char *>(mdName)),
        .len = strlen(mdName)
    };

    EXPECT_EQ(OH_CryptoSign_SetParam(nullptr, CRYPTO_PSS_MD_NAME_STR, &value), CRYPTO_PARAMETER_CHECK_FAILED);
}

/**
* @tc.name   SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_5100
* @tc.number SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_5100
* @tc.desc   test OH_CryptoPubKey_Encode with empty string for encodingStandard
* @tc.type   FUNCTION
* @tc.size   MEDIUMTEST
* @tc.level  LEVEL0
*/
HWTEST_F(OHCryptoFrameworkReinforcementTest, SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_5100, TestSize.Level0)
{
    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_CryptoPubKey *pubKey = nullptr;
    Crypto_DataBlob out = {.data = nullptr, .len = 0};
    const char *emptyEncodingStandard = "";

    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Create("RSA1024", &keyCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Generate(keyCtx, &keyPair), CRYPTO_SUCCESS);
    pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    EXPECT_EQ(OH_CryptoPubKey_Encode(pubKey, CRYPTO_PEM, emptyEncodingStandard, &out), CRYPTO_INVALID_PARAMS);

    OH_Crypto_FreeDataBlob(&out);
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
    OH_CryptoKeyPair_Destroy(keyPair);
}

/**
* @tc.name   SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_5200
* @tc.number SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_5200
* @tc.desc   test OH_CryptoPubKey_Encode with NULL encodingStandard
* @tc.type   FUNCTION
* @tc.size   MEDIUMTEST
* @tc.level  LEVEL0
*/
HWTEST_F(OHCryptoFrameworkReinforcementTest, SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_5200, TestSize.Level0)
{
    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_CryptoPubKey *pubKey = nullptr;
    Crypto_DataBlob out = {.data = nullptr, .len = 0};

    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Create("RSA1024", &keyCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Generate(keyCtx, &keyPair), CRYPTO_SUCCESS);
    pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    EXPECT_EQ(OH_CryptoPubKey_Encode(pubKey, CRYPTO_DER, nullptr, &out), CRYPTO_SUCCESS);

    OH_Crypto_FreeDataBlob(&out);
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
    OH_CryptoKeyPair_Destroy(keyPair);
}

/**
* @tc.name   SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_5300
* @tc.number SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_5300
* @tc.desc   test OH_CryptoPrivKey_Encode with empty string for encodingStandard
* @tc.type   FUNCTION
* @tc.size   MEDIUMTEST
* @tc.level  LEVEL0
*/
HWTEST_F(OHCryptoFrameworkReinforcementTest, SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_5300, TestSize.Level0)
{
    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_CryptoPrivKey *privKey = nullptr;
    Crypto_DataBlob out = {.data = nullptr, .len = 0};
    const char *emptyEncodingStandard = "";

    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Create("RSA1024", &keyCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Generate(keyCtx, &keyPair), CRYPTO_SUCCESS);
    privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    EXPECT_EQ(OH_CryptoPrivKey_Encode(privKey, CRYPTO_PEM, emptyEncodingStandard, nullptr, &out), CRYPTO_PARAMETER_CHECK_FAILED);

    OH_Crypto_FreeDataBlob(&out);
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
    OH_CryptoKeyPair_Destroy(keyPair);
}

/**
* @tc.name   SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_5400
* @tc.number SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_5400
* @tc.desc   test OH_CryptoPrivKey_Encode with NULL encodingStandard
* @tc.type   FUNCTION
* @tc.size   MEDIUMTEST
* @tc.level  LEVEL0
*/
HWTEST_F(OHCryptoFrameworkReinforcementTest, SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_5400, TestSize.Level0)
{
    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_CryptoPrivKey *privKey = nullptr;
    Crypto_DataBlob out = {.data = nullptr, .len = 0};

    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Create("RSA1024", &keyCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Generate(keyCtx, &keyPair), CRYPTO_SUCCESS);
    privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    EXPECT_EQ(OH_CryptoPrivKey_Encode(privKey, CRYPTO_DER, nullptr, nullptr, &out), CRYPTO_SUCCESS);

    OH_Crypto_FreeDataBlob(&out);
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
    OH_CryptoKeyPair_Destroy(keyPair);
}

/**
* @tc.name   SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_5500
* @tc.number SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_5500
* @tc.desc   test OH_CryptoEcPoint_Encode with empty string for format
* @tc.type   FUNCTION
* @tc.size   MEDIUMTEST
* @tc.level  LEVEL0
*/
HWTEST_F(OHCryptoFrameworkReinforcementTest, SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_5500, TestSize.Level0)
{
    OH_CryptoEcPoint *point = nullptr;
    Crypto_DataBlob out = {.data = nullptr, .len = 0};
    const char *emptyFormat = "";

    EXPECT_EQ(OH_CryptoEcPoint_Create("ECC256", nullptr, &point), CRYPTO_SUCCESS);
    if (point != nullptr) {
        EXPECT_EQ(OH_CryptoEcPoint_Encode(point, emptyFormat, &out), CRYPTO_PARAMETER_CHECK_FAILED);
        OH_CryptoEcPoint_Destroy(point);
    }
    OH_Crypto_FreeDataBlob(&out);
}

/**
* @tc.name   SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_5600
* @tc.number SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_5600
* @tc.desc   test OH_CryptoEcPoint_Encode with NULL format
* @tc.type   FUNCTION
* @tc.size   MEDIUMTEST
* @tc.level  LEVEL0
*/
HWTEST_F(OHCryptoFrameworkReinforcementTest, SUB_Security_CryptoFramework_NAPI_Reinforcement_Test_5600, TestSize.Level0)
{
    OH_CryptoEcPoint *point = nullptr;
    Crypto_DataBlob out = {.data = nullptr, .len = 0};

    EXPECT_EQ(OH_CryptoEcPoint_Create("ECC256", nullptr, &point), CRYPTO_SUCCESS);
    if (point != nullptr) {
        EXPECT_EQ(OH_CryptoEcPoint_Encode(point, nullptr, &out), CRYPTO_PARAMETER_CHECK_FAILED);
        OH_CryptoEcPoint_Destroy(point);
    }
    OH_Crypto_FreeDataBlob(&out);
}


}