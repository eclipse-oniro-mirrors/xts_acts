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
#include "huks_cipher_aes_test.h"

#include <gtest/gtest.h>

#include "huks_cipher_aes_test_common.h"

using namespace testing::ext;
namespace Unittest::AesCipher
{
class HuksCipherAESTest : public testing::Test
{
   public:
    static void SetUpTestCase(void);

    static void TearDownTestCase(void);

    void SetUp();

    void TearDown();
};

void HuksCipherAESTest::SetUpTestCase(void) {}

void HuksCipherAESTest::TearDownTestCase(void) {}

void HuksCipherAESTest::SetUp() {}

void HuksCipherAESTest::TearDown() {}

static struct OH_Huks_Param g_genParams015[] = {
    {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_AES},
    {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_ENCRYPT | OH_HUKS_KEY_PURPOSE_DECRYPT},
    {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_AES_KEY_SIZE_256},
    {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_NONE},
    {.tag = OH_HUKS_TAG_BLOCK_MODE, .uint32Param = OH_HUKS_MODE_CBC},
    {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE}};
static struct OH_Huks_Param g_encryptParams015[] = {
    {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_AES},
    {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_ENCRYPT},
    {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_AES_KEY_SIZE_256},
    {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_NONE},
    {.tag = OH_HUKS_TAG_BLOCK_MODE, .uint32Param = OH_HUKS_MODE_CBC},
    {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_NONE},
    {.tag = OH_HUKS_TAG_IV, .blob = {.size = IV_SIZE, .data = (uint8_t *)IV}},
    {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE}};
static struct OH_Huks_Param g_decryptParams015[] = {
    {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_AES},
    {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_DECRYPT},
    {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_AES_KEY_SIZE_256},
    {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_NONE},
    {.tag = OH_HUKS_TAG_BLOCK_MODE, .uint32Param = OH_HUKS_MODE_CBC},
    {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_NONE},
    {.tag = OH_HUKS_TAG_IV, .blob = {.size = IV_SIZE, .data = (uint8_t *)IV}},
    {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE}};

static struct OH_Huks_Param g_genParams019[] = {
    {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_AES},
    {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_ENCRYPT | OH_HUKS_KEY_PURPOSE_DECRYPT},
    {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_AES_KEY_SIZE_256},
    {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_NONE},
    {.tag = OH_HUKS_TAG_BLOCK_MODE, .uint32Param = OH_HUKS_MODE_CTR},
    {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE}};
static struct OH_Huks_Param g_encryptParams019[] = {
    {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_AES},
    {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_ENCRYPT},
    {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_AES_KEY_SIZE_256},
    {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_NONE},
    {.tag = OH_HUKS_TAG_BLOCK_MODE, .uint32Param = OH_HUKS_MODE_CTR},
    {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_NONE},
    {.tag = OH_HUKS_TAG_IV, .blob = {.size = IV_SIZE, .data = (uint8_t *)IV}},
    {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE}};
static struct OH_Huks_Param g_decryptParams019[] = {
    {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_AES},
    {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_DECRYPT},
    {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_AES_KEY_SIZE_256},
    {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_NONE},
    {.tag = OH_HUKS_TAG_BLOCK_MODE, .uint32Param = OH_HUKS_MODE_CTR},
    {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_NONE},
    {.tag = OH_HUKS_TAG_IV, .blob = {.size = IV_SIZE, .data = (uint8_t *)IV}},
    {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE}};

/**
 * @tc.name: HuksCipherAESTest.Security_HUKS_NAPI_Cipher_AES_0100
 * @tc.desc: alg-AES pur-ENCRYPT&DECRYPT mod-CBC pad-NONE size-256.
 * @tc.type: FUNC
 */
HWTEST_F(HuksCipherAESTest, Security_HUKS_NAPI_Cipher_AES_0100, TestSize.Level0)
{
    char tmpKeyAlias[] = "HksAESCipherKeyAliasTest015";
    struct OH_Huks_Blob keyAlias = {strlen(tmpKeyAlias), (uint8_t *)tmpKeyAlias};

    struct OH_Huks_ParamSet *genParamSet = nullptr;
    OH_Huks_Result ret = InitParamSet(&genParamSet, g_genParams015, sizeof(g_genParams015) / sizeof(OH_Huks_Param));
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "InitParamSet(gen) failed.";

    struct OH_Huks_ParamSet *encryptParamSet = nullptr;
    ret = InitParamSet(&encryptParamSet, g_encryptParams015, sizeof(g_encryptParams015) / sizeof(OH_Huks_Param));
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "InitParamSet(encrypt) failed.";

    struct OH_Huks_ParamSet *decryptParamSet = nullptr;
    ret = InitParamSet(&decryptParamSet, g_decryptParams015, sizeof(g_decryptParams015) / sizeof(OH_Huks_Param));
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "InitParamSet(decrypt) failed.";

    ret = HksAesCipherTestCaseOther(&keyAlias, genParamSet, encryptParamSet, decryptParamSet);
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "this case failed.";

    OH_Huks_FreeParamSet(&genParamSet);
    OH_Huks_FreeParamSet(&encryptParamSet);
    OH_Huks_FreeParamSet(&decryptParamSet);
}

/**
 * @tc.name: HuksCipherAESTest.Security_HUKS_NAPI_Cipher_AES_0200
 * @tc.desc: alg-AES pur-ENCRYPT&DECRYPT mod-CBC pad-PKCS7 size-256. Decrypt-Abort
 * @tc.type: FUNC
 */
HWTEST_F(HuksCipherAESTest, Security_HUKS_NAPI_Cipher_AES_0200, TestSize.Level0)
{
    char tmpKeyAlias[] = "HksAESDecryptKeyAliasTest022";
    struct OH_Huks_Blob keyAlias = {strlen(tmpKeyAlias), (uint8_t *)tmpKeyAlias};
    struct OH_Huks_Blob inData = {g_inData.length(), (uint8_t *)g_inData.c_str()};

    /* 1. Generate Key */
    struct OH_Huks_ParamSet *genParamSet = nullptr;
    OH_Huks_Result ret = InitParamSet(&genParamSet, g_genParams019, sizeof(g_genParams019) / sizeof(OH_Huks_Param));
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "InitParamSet failed.";
    // Generate Key
    ret = OH_Huks_GenerateKeyItem(&keyAlias, genParamSet, nullptr);
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "GenerateKey failed.";

    /* 2. Encrypt Three Stage */
    struct OH_Huks_ParamSet *encryptParamSet = nullptr;
    ret = InitParamSet(&encryptParamSet, g_encryptParams019, sizeof(g_encryptParams019) / sizeof(OH_Huks_Param));
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "InitParamSet failed.";
    // Init
    uint8_t handleE[sizeof(uint64_t)] = {0};
    struct OH_Huks_Blob handleEncrypt = {sizeof(uint64_t), handleE};
    ret = OH_Huks_InitSession(&keyAlias, encryptParamSet, &handleEncrypt, nullptr);
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "Init failed.";
    // Update & Finish
    uint8_t cipher[AES_COMMON_SIZE] = {0};
    struct OH_Huks_Blob cipherText = {AES_COMMON_SIZE, cipher};
    ret = TestUpdateLoopFinish(&handleEncrypt, encryptParamSet, &inData, &cipherText);
    EXPECT_NE(HksMemCmp(inData.data, cipherText.data, inData.size), OH_HUKS_SUCCESS) << "cipherText equals inData";

    /* 3. Decrypt Three Stage */
    struct OH_Huks_ParamSet *decryptParamSet = nullptr;
    ret = InitParamSet(&decryptParamSet, g_decryptParams019, sizeof(g_decryptParams019) / sizeof(OH_Huks_Param));
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "InitParamSet failed.";
    // Init
    uint8_t handleD[sizeof(uint64_t)] = {0};
    struct OH_Huks_Blob handleDecrypt = {sizeof(uint64_t), handleD};
    ret = OH_Huks_InitSession(&keyAlias, decryptParamSet, &handleDecrypt, nullptr);
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "Init failed.";
    // Update loop
    ret = HksTestUpdate(&handleDecrypt, decryptParamSet, &cipherText);
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "Update failed.";
    // Abort
    ret = OH_Huks_AbortSession(&handleDecrypt, decryptParamSet);
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "Abort failed.";

    /* 4. Delete Key */
    ret = OH_Huks_DeleteKeyItem(&keyAlias, genParamSet);
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "DeleteKey failed.";

    OH_Huks_FreeParamSet(&genParamSet);
    OH_Huks_FreeParamSet(&encryptParamSet);
    OH_Huks_FreeParamSet(&decryptParamSet);
}

}  // namespace Unittest::AesCipher