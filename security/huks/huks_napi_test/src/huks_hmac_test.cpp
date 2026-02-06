/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

#include "huks_hmac_test.h"

#include <gtest/gtest.h>

using namespace testing::ext;
namespace Unittest::Hmac
{
class HksHmacTest : public testing::Test
{
   public:
    static void SetUpTestCase(void);

    static void TearDownTestCase(void);

    void SetUp();

    void TearDown();
};

void HksHmacTest::SetUpTestCase(void) {}

void HksHmacTest::TearDownTestCase(void) {}

void HksHmacTest::SetUp() {}

void HksHmacTest::TearDown() {}

static struct OH_Huks_Param g_genParams001[] = {
    {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_HMAC},
    {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_MAC},
    {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA384},
    {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = Unittest::Hmac::COMMON_SIZE},
    {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE}};
static struct OH_Huks_Param g_hmacParams001[] = {
    {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_HMAC},
    {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_MAC},
    {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA384},
    {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE}};

static struct OH_Huks_Param g_genParams006[] = {
    {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_HMAC},
    {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_MAC},
    {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SM3},
    {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = Unittest::Hmac::COMMON_SIZE},
    {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE}};
static struct OH_Huks_Param g_hmacParams006[] = {
    {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_HMAC},
    {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_MAC},
    {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SM3},
    {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE}};

static OH_Huks_Result HksHmacTestCase(const struct OH_Huks_Blob *keyAlias, struct OH_Huks_ParamSet *genParamSet,
                                      struct OH_Huks_ParamSet *hmacParamSet)
{
    struct OH_Huks_Blob inData = {g_inData.length(), (uint8_t *)g_inData.c_str()};

    /* 1. Generate Key */
    OH_Huks_Result ret = OH_Huks_GenerateKeyItem(keyAlias, genParamSet, nullptr);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    /* 2. HMAC Three Stage */
    // Init
    uint8_t handle[sizeof(uint64_t)] = {0};
    struct OH_Huks_Blob handleHMAC = {sizeof(uint64_t), handle};
    ret = OH_Huks_InitSession(keyAlias, hmacParamSet, &handleHMAC, nullptr);
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "Init failed.";
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_DeleteKeyItem(keyAlias, genParamSet);
        return ret;
    }
    // Update & Finish
    uint8_t out[Unittest::Hmac::COMMON_SIZE] = {0};
    struct OH_Huks_Blob outData = {Unittest::Hmac::COMMON_SIZE, out};
    ret = TestUpdateFinish(&handleHMAC, hmacParamSet, OH_HUKS_KEY_PURPOSE_MAC, &inData, &outData);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_DeleteKeyItem(keyAlias, genParamSet);
        return ret;
    }

    /* 3. Delete Key */
    ret = OH_Huks_DeleteKeyItem(keyAlias, genParamSet);
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "DeleteKey failed.";
    return ret;
}

/**
 * @tc.name   Security_HUKS_NAPI_HMAC_hmac_0100
 * @tc.number Security_HUKS_NAPI_HMAC_hmac_0100
 * @tc.desc   alg-HMAC pur-MAC dig-SHA384.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(HksHmacTest, Security_HUKS_NAPI_HMAC_hmac_0100, TestSize.Level1)
{
    char tmpKeyAlias[] = "HksHMACKeyAliasTest001";
    struct OH_Huks_Blob keyAlias = {strlen(tmpKeyAlias), (uint8_t *)tmpKeyAlias};

    struct OH_Huks_ParamSet *genParamSet = nullptr;
    OH_Huks_Result ret = InitParamSet(&genParamSet, g_genParams001, sizeof(g_genParams001) / sizeof(OH_Huks_Param));

    struct OH_Huks_ParamSet *hmacParamSet = nullptr;
    ret = InitParamSet(&hmacParamSet, g_hmacParams001, sizeof(g_hmacParams001) / sizeof(OH_Huks_Param));

    ret = HksHmacTestCase(&keyAlias, genParamSet, hmacParamSet);
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "this case failed.";

    OH_Huks_FreeParamSet(&genParamSet);
    OH_Huks_FreeParamSet(&hmacParamSet);
}

/**
 * @tc.name   Security_HUKS_NAPI_HMAC_SM3_0100
 * @tc.number Security_HUKS_NAPI_HMAC_SM3_0100
 * @tc.desc   alg-HMAC pur-MAC dig-sm3.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(HksHmacTest, Security_HUKS_NAPI_HMAC_SM3_0100, TestSize.Level1)
{
    char tmpKeyAlias[] = "HksHMACKeyAliasTest008";
    struct OH_Huks_Blob keyAlias = {strlen(tmpKeyAlias), (uint8_t *)tmpKeyAlias};

    struct OH_Huks_ParamSet *genParamSet = nullptr;
    OH_Huks_Result ret = InitParamSet(&genParamSet, g_genParams006, sizeof(g_genParams006) / sizeof(OH_Huks_Param));

    struct OH_Huks_ParamSet *hmacParamSet = nullptr;
    ret = InitParamSet(&hmacParamSet, g_hmacParams006, sizeof(g_hmacParams006) / sizeof(OH_Huks_Param));

    ret = HksHmacTestCase(&keyAlias, genParamSet, hmacParamSet);
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "this case failed.";

    OH_Huks_FreeParamSet(&genParamSet);
    OH_Huks_FreeParamSet(&hmacParamSet);
}
}  // namespace Unittest::Hmac