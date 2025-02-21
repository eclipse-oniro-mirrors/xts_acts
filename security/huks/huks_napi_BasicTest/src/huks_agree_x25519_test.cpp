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

#include "huks_agree_x25519_test.h"

#include <gtest/gtest.h>

using namespace testing::ext;
namespace Unittest::X25519Agree
{
class HuksAgreeX25519Test : public testing::Test
{
   public:
    static void SetUpTestCase(void);

    static void TearDownTestCase(void);

    void SetUp();

    void TearDown();
};

void HuksAgreeX25519Test::SetUpTestCase(void) {}

void HuksAgreeX25519Test::TearDownTestCase(void) {}

void HuksAgreeX25519Test::SetUp() {}

void HuksAgreeX25519Test::TearDown() {}

static struct OH_Huks_Blob g_keyAlias01001 = {strlen("HksX25519AgreeKeyAliasTest001_1"),
                                              (uint8_t *)"HksX25519AgreeKeyAliasTest001_1"};
static struct OH_Huks_Blob g_keyAlias02001 = {strlen("HksX25519AgreeKeyAliasTest001_2"),
                                              (uint8_t *)"HksX25519AgreeKeyAliasTest001_2"};
static struct OH_Huks_Blob g_keyAliasFinal1001 = {strlen("HksX25519AgreeKeyAliasTest001_final"),
                                                  (uint8_t *)"HksX25519AgreeKeyAliasTest001_final"};
static struct OH_Huks_Blob g_keyAliasFinal2001 = {strlen("HksX25519AgreeKeyAliasTest002_final"),
                                                  (uint8_t *)"HksX25519AgreeKeyAliasTest002_final"};

static struct OH_Huks_Param g_genParams001[] = {
    {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_X25519},
    {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_AGREE},
    {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_CURVE25519_KEY_SIZE_256},
    {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE}};
static struct OH_Huks_Param g_agreeParams01Init001[] = {
    {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_X25519},
    {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_AGREE},
    {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_CURVE25519_KEY_SIZE_256},
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
    {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_X25519},
    {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_AGREE},
    {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_CURVE25519_KEY_SIZE_256},
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

OH_Huks_Result HksX25519AgreeFinish(const struct OH_Huks_Blob *keyAlias, const struct OH_Huks_Blob *publicKey,
                                    const struct OH_Huks_ParamSet *initParamSet,
                                    const struct OH_Huks_ParamSet *finishParamSet, struct OH_Huks_Blob *outData)
{
    struct OH_Huks_Blob inData = {g_inData.length(), (uint8_t *)g_inData.c_str()};

    uint8_t handleU[sizeof(uint64_t)] = {0};
    struct OH_Huks_Blob handle = {sizeof(uint64_t), handleU};
    OH_Huks_Result ret = OH_Huks_InitSession(keyAlias, initParamSet, &handle, nullptr);
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "Init failed.";
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    uint8_t outDataU[X25519_COMMON_SIZE] = {0};
    struct OH_Huks_Blob outDataUpdate = {X25519_COMMON_SIZE, outDataU};
    ret = OH_Huks_UpdateSession(&handle, initParamSet, publicKey, &outDataUpdate);
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "Update failed.";
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    ret = OH_Huks_FinishSession(&handle, finishParamSet, &inData, outData);
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "Finish failed.";
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }
    return ret;
}

OH_Huks_Result HksX25519AgreeAbort(const struct OH_Huks_Blob *keyAlias, const struct OH_Huks_Blob *publicKey,
                                   const struct OH_Huks_ParamSet *initParamSet)
{
    uint8_t handleU[sizeof(uint64_t)] = {0};
    struct OH_Huks_Blob handle = {sizeof(uint64_t), handleU};
    OH_Huks_Result ret = OH_Huks_InitSession(keyAlias, initParamSet, &handle, nullptr);
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "Init failed.";
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    uint8_t outDataU[X25519_COMMON_SIZE] = {0};
    struct OH_Huks_Blob outDataUpdate = {X25519_COMMON_SIZE, outDataU};
    ret = OH_Huks_UpdateSession(&handle, initParamSet, publicKey, &outDataUpdate);
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "Update failed.";
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    ret = OH_Huks_AbortSession(&handle, initParamSet);
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "Finish failed.";
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }
    return ret;
}

OH_Huks_Result HksX25519AgreeExport(const struct OH_Huks_Blob *keyAlias1, const struct OH_Huks_Blob *keyAlias2,
                                    struct OH_Huks_Blob *publicKey1, struct OH_Huks_Blob *publicKey2,
                                    const struct OH_Huks_ParamSet *genParamSet)
{
    OH_Huks_Result ret = OH_Huks_ExportPublicKeyItem(keyAlias1, genParamSet, publicKey1);
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "ExportPublicKey01 failed.";
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }
    ret = OH_Huks_ExportPublicKeyItem(keyAlias2, genParamSet, publicKey2);
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "ExportPublicKey02 failed.";
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }
    return ret;
}

void HksX25519AgreeFreeParamSet(struct OH_Huks_ParamSet *paramSet1, struct OH_Huks_ParamSet *paramSet2,
                                struct OH_Huks_ParamSet *paramSet3)
{
    OH_Huks_FreeParamSet(&paramSet1);
    OH_Huks_FreeParamSet(&paramSet2);
    OH_Huks_FreeParamSet(&paramSet3);
}

void HksX25519AgreeFreeParamSet(struct OH_Huks_ParamSet *paramSet1, struct OH_Huks_ParamSet *paramSet2,
                                struct OH_Huks_ParamSet *paramSet3, struct OH_Huks_ParamSet *paramSet4,
                                struct OH_Huks_ParamSet *paramSet5)
{
    OH_Huks_FreeParamSet(&paramSet1);
    OH_Huks_FreeParamSet(&paramSet2);
    OH_Huks_FreeParamSet(&paramSet3);
    OH_Huks_FreeParamSet(&paramSet4);
    OH_Huks_FreeParamSet(&paramSet5);
}

void HksX25519AgreeFreeBlob(struct OH_Huks_Blob *blob1, struct OH_Huks_Blob *blob2)
{
    HksFree(blob1->data);
    HksFree(blob2->data);
}

void HksX25519AgreeFreeBlob(struct OH_Huks_Blob *blob1, struct OH_Huks_Blob *blob2, struct OH_Huks_Blob *blob3,
                            struct OH_Huks_Blob *blob4)
{
    HksFree(blob1->data);
    HksFree(blob2->data);
    HksFree(blob3->data);
    HksFree(blob4->data);
}

/**
 * @tc.name: HuksAgreeX25519Test.Security_HUKS_NAPI_Agree_X25519_0100
 * @tc.desc: alg-x25519, pur-AGREE
 * @tc.type: FUNC
 */
HWTEST_F(HuksAgreeX25519Test, Security_HUKS_NAPI_Agree_X25519_0100, TestSize.Level0)
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

    ret = OH_Huks_GenerateKeyItem(&g_keyAlias01001, genParamSet, nullptr);
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "GenerateKey01 failed.";
    ret = OH_Huks_GenerateKeyItem(&g_keyAlias02001, genParamSet, nullptr);
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "GenerateKey02 failed.";

    struct OH_Huks_Blob publicKey01 = {.size = OH_HUKS_CURVE25519_KEY_SIZE_256, .data = nullptr};
    struct OH_Huks_Blob publicKey02 = {.size = OH_HUKS_CURVE25519_KEY_SIZE_256, .data = nullptr};
    EXPECT_EQ(MallocAndCheckBlobData(&publicKey01, publicKey01.size).errorCode, (int32_t)OH_HUKS_SUCCESS)
        << "Malloc publicKey01 failed.";
    EXPECT_EQ(MallocAndCheckBlobData(&publicKey02, publicKey02.size).errorCode, (int32_t)OH_HUKS_SUCCESS)
        << "Malloc publicKey02 failed.";
    ret = HksX25519AgreeExport(&g_keyAlias01001, &g_keyAlias02001, &publicKey01, &publicKey02, genParamSet);
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "ExportKey failed.";

    struct OH_Huks_Blob outData01 = {.size = X25519_COMMON_SIZE, .data = nullptr};
    struct OH_Huks_Blob outData02 = {.size = X25519_COMMON_SIZE, .data = nullptr};
    EXPECT_EQ(MallocAndCheckBlobData(&outData01, outData01.size).errorCode, (int32_t)OH_HUKS_SUCCESS)
        << "Malloc outData01 failed.";
    EXPECT_EQ(MallocAndCheckBlobData(&outData02, outData02.size).errorCode, (int32_t)OH_HUKS_SUCCESS)
        << "Malloc outData02 failed.";
    ret = HksX25519AgreeFinish(&g_keyAlias01001, &publicKey02, initParamSet01, finishParamSet01, &outData01);
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "HksX25519AgreeFinish01 failed.";
    ret = HksX25519AgreeFinish(&g_keyAlias02001, &publicKey01, initParamSet02, finishParamSet02, &outData02);
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "HksX25519AgreeFinish02 failed.";

    OH_Huks_DeleteKeyItem(&g_keyAlias01001, genParamSet);
    OH_Huks_DeleteKeyItem(&g_keyAlias02001, genParamSet);
    OH_Huks_DeleteKeyItem(&g_keyAliasFinal1001, finishParamSet01);
    OH_Huks_DeleteKeyItem(&g_keyAliasFinal2001, finishParamSet02);
    HksX25519AgreeFreeParamSet(genParamSet, initParamSet01, finishParamSet01, initParamSet02, finishParamSet02);
    HksX25519AgreeFreeBlob(&publicKey01, &publicKey02, &outData01, &outData02);
}
}  // namespace Unittest::X25519Agree