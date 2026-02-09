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

#include "huks_agree_ecdh_test.h"

#include <gtest/gtest.h>

#include "huks_agree_ecdh_test_common.h"

using namespace testing::ext;
namespace Unittest::EcdhAgree
{
class HuksAgreeECDHTest : public testing::Test
{
   public:
    static void SetUpTestCase(void);

    static void TearDownTestCase(void);

    void SetUp();

    void TearDown();
};

void HuksAgreeECDHTest::SetUpTestCase(void) {}

void HuksAgreeECDHTest::TearDownTestCase(void) {}

void HuksAgreeECDHTest::SetUp() {}

void HuksAgreeECDHTest::TearDown() {}

static struct OH_Huks_Blob g_keyAlias01001 = {strlen("HksECDHAgreeKeyAliasTest001_1"),
                                              (uint8_t *)"HksECDHAgreeKeyAliasTest001_1"};
static struct OH_Huks_Blob g_keyAlias02001 = {strlen("HksECDHAgreeKeyAliasTest001_2"),
                                              (uint8_t *)"HksECDHAgreeKeyAliasTest001_2"};
static struct OH_Huks_Blob g_keyAliasFinal1001 = {strlen("HksECDHAgreeKeyAliasTest001_1_final"),
                                                  (uint8_t *)"HksECDHAgreeKeyAliasTest001_1_final"};
static struct OH_Huks_Blob g_keyAliasFinal2001 = {strlen("HksECDHAgreeKeyAliasTest001_2_final"),
                                                  (uint8_t *)"HksECDHAgreeKeyAliasTest001_2_final"};
static struct OH_Huks_Param g_genParams001[] = {
    {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_ECC},
    {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_AGREE},
    {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_ECC_KEY_SIZE_256},
    {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_NONE},
    {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_NONE},
    {.tag = OH_HUKS_TAG_BLOCK_MODE, .uint32Param = OH_HUKS_MODE_CBC},
    {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE}};
static struct OH_Huks_Param g_agreeParams01Init001[] = {
    {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_ECDH},
    {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_AGREE},
    {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_ECC_KEY_SIZE_256},
    {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE}};
static struct OH_Huks_Param g_agreeParams01Finish001[] = {
    {.tag = OH_HUKS_TAG_KEY_STORAGE_FLAG, .uint32Param = OH_HUKS_STORAGE_PERSISTENT},
    {.tag = OH_HUKS_TAG_IS_KEY_ALIAS, .boolParam = true},
    {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_AES},
    {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_AES_KEY_SIZE_256},
    {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_DERIVE},
    {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA256},
    {.tag = OH_HUKS_TAG_KEY_ALIAS, .blob = g_keyAliasFinal1001},
    {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_NONE},
    {.tag = OH_HUKS_TAG_BLOCK_MODE, .uint32Param = OH_HUKS_MODE_CBC},
    {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE}};
static struct OH_Huks_Param g_agreeParams02Init001[] = {
    {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_ECDH},
    {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_AGREE},
    {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_ECC_KEY_SIZE_256},
    {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE}};
static struct OH_Huks_Param g_agreeParams02Finish001[] = {
    {.tag = OH_HUKS_TAG_KEY_STORAGE_FLAG, .uint32Param = OH_HUKS_STORAGE_PERSISTENT},
    {.tag = OH_HUKS_TAG_IS_KEY_ALIAS, .boolParam = true},
    {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_AES},
    {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_AES_KEY_SIZE_256},
    {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_DERIVE},
    {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA256},
    {.tag = OH_HUKS_TAG_KEY_ALIAS, .blob = g_keyAliasFinal2001},
    {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_NONE},
    {.tag = OH_HUKS_TAG_BLOCK_MODE, .uint32Param = OH_HUKS_MODE_CBC},
    {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE}};

/**
 * @tc.name   Security_HUKS_NAPI_Agree_ECDH_0100
 * @tc.number Security_HUKS_NAPI_Agree_ECDH_0100
 * @tc.desc   alg-ECDH, pur-AGREE
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(HuksAgreeECDHTest, Security_HUKS_NAPI_Agree_ECDH_0100, TestSize.Level1)
{
    struct OH_Huks_ParamSet *genParamSet = nullptr;
    struct OH_Huks_ParamSet *initParamSet01 = nullptr;
    struct OH_Huks_ParamSet *finishParamSet01 = nullptr;
    struct OH_Huks_ParamSet *initParamSet02 = nullptr;
    struct OH_Huks_ParamSet *finishParamSet02 = nullptr;
    OH_Huks_Result ret = InitParamSet(&genParamSet, g_genParams001, sizeof(g_genParams001) / sizeof(OH_Huks_Param));
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "InitParamSet(gen) failed.";
    ret = InitParamSet(&initParamSet01, g_agreeParams01Init001, sizeof(g_agreeParams01Init001) / sizeof(OH_Huks_Param));
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "InitParamSet(init & update)01 failed.";
    ret = InitParamSet(&finishParamSet01, g_agreeParams01Finish001,
                       sizeof(g_agreeParams01Finish001) / sizeof(OH_Huks_Param));
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "InitParamSet(finish)01 failed.";
    ret = InitParamSet(&initParamSet02, g_agreeParams02Init001, sizeof(g_agreeParams02Init001) / sizeof(OH_Huks_Param));
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "InitParamSet(init & update)02 failed.";
    ret = InitParamSet(&finishParamSet02, g_agreeParams02Finish001,
                       sizeof(g_agreeParams02Finish001) / sizeof(OH_Huks_Param));
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "InitParamSet(finish)02 failed.";

    OH_Huks_Result ret1 = OH_Huks_GenerateKeyItem(&g_keyAlias01001, genParamSet, nullptr);
    EXPECT_EQ(ret1.errorCode, (int32_t)OH_HUKS_SUCCESS) << "GenerateKey01 failed.";
    ret1 = OH_Huks_GenerateKeyItem(&g_keyAlias02001, genParamSet, nullptr);
    EXPECT_EQ(ret1.errorCode, (int32_t)OH_HUKS_SUCCESS) << "GenerateKey02 failed.";

    struct OH_Huks_Blob publicKey01 = {.size = OH_HUKS_ECC_KEY_SIZE_256, .data = nullptr};
    struct OH_Huks_Blob publicKey02 = {.size = OH_HUKS_ECC_KEY_SIZE_256, .data = nullptr};
    ret = MallocAndCheckBlobData(&publicKey01, publicKey01.size);
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "Malloc publicKey01 failed.";
    ret = MallocAndCheckBlobData(&publicKey02, publicKey02.size);
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "Malloc publicKey02 failed.";
    ret = HksEcdhAgreeExport(&g_keyAlias01001, &g_keyAlias02001, &publicKey01, &publicKey02, genParamSet);
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "ExportKey failed.";

    struct OH_Huks_Blob outData01 = {.size = ECDH_COMMON_SIZE, .data = nullptr};
    struct OH_Huks_Blob outData02 = {.size = ECDH_COMMON_SIZE, .data = nullptr};
    ret = MallocAndCheckBlobData(&outData01, outData01.size);
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "Malloc outData01 failed.";
    ret = MallocAndCheckBlobData(&outData02, outData02.size);
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "Malloc outData02 failed.";
    ret = HksEcdhAgreeFinish(&g_keyAlias01001, &publicKey02, initParamSet01, finishParamSet01, &outData01);
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "HksEcdhAgreeFinish01 failed.";
    ret = HksEcdhAgreeFinish(&g_keyAlias02001, &publicKey01, initParamSet02, finishParamSet02, &outData02);
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "HksEcdhAgreeFinish02 failed.";

    OH_Huks_DeleteKeyItem(&g_keyAlias01001, genParamSet);
    OH_Huks_DeleteKeyItem(&g_keyAlias02001, genParamSet);
    OH_Huks_DeleteKeyItem(&g_keyAliasFinal1001, finishParamSet01);
    OH_Huks_DeleteKeyItem(&g_keyAliasFinal2001, finishParamSet02);
    HksEcdhAgreeFreeParamSet(genParamSet, initParamSet01, finishParamSet01, initParamSet02, finishParamSet02);
    HksEcdhAgreeFreeBlob(&publicKey01, &publicKey02, &outData01, &outData02);
}
}  // namespace Unittest::EcdhAgree