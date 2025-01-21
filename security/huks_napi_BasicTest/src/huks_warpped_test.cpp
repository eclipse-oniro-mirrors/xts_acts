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
 * WITHOUT WARRANTIES OR CONDITIONS OF ASNY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <gtest/gtest.h>

#include "huks_warpped_test.h"
#include "huks_three_stage_test_common.h"
#include "huks_wrapped_test_common.h"
#include "huks_mem.h"
#include "native_huks_type.h"

using namespace testing::ext;
namespace Unittest::ImportWrapped
{
    class HuksImportWrappedX25519Test : public testing::Test
    {
    public:
        static void SetUpTestCase(void);

        static void TearDownTestCase(void);

        void SetUp();

        void TearDown();
    };

    void HuksImportWrappedX25519Test::SetUpTestCase(void)
    {
    }

    void HuksImportWrappedX25519Test::TearDownTestCase(void)
    {
    }

    void HuksImportWrappedX25519Test::SetUp()
    {
    }

    void HuksImportWrappedX25519Test::TearDown()
    {
    }

    struct TestImportKeyData {
        struct OH_Huks_Blob x509PublicKey;
        struct OH_Huks_Blob publicOrXData;
        struct OH_Huks_Blob privateOrYData;
        struct OH_Huks_Blob zData;
    };

    static struct OH_Huks_Blob g_wrappingKeyAliasAes256 = {
        .size = strlen("test_wrappingKey_x25519_aes256"),
        .data = (uint8_t *)"test_wrappingKey_x25519_aes256"};

    static struct OH_Huks_Blob g_callerKeyAliasAes256 = {
        .size = strlen("test_caller_key_x25519_aes256"),
        .data = (uint8_t *)"test_caller_key_x25519_aes256"};

    static struct OH_Huks_Blob g_callerKekAliasAes256 = {
        .size = strlen("test_caller_kek_x25519_aes256"),
        .data = (uint8_t *)"test_caller_kek_x25519_aes256"};

    static struct OH_Huks_Blob g_callerAes256Kek = {
        .size = strlen("This is kek to encrypt plain key"),
        .data = (uint8_t *)"This is kek to encrypt plain key"};

    static struct OH_Huks_Blob g_callerAgreeKeyAliasAes256 = {
        .size = strlen("test_caller_agree_key_x25519_aes256"),
        .data = (uint8_t *)"test_caller_agree_key_x25519_aes256"};

    static struct OH_Huks_Blob g_importedKeyAliasAes256 = {
        .size = strlen("test_import_key_x25519_aes256"),
        .data = (uint8_t *)"test_import_key_x25519_aes256"};

    static struct OH_Huks_Blob g_importedAes256PlainKey = {
        .size = strlen("This is plain key to be imported"),
        .data = (uint8_t *)"This is plain key to be imported"};

    static struct OH_Huks_Param g_importWrappedAes256Params[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_AES},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_ENCRYPT | OH_HUKS_KEY_PURPOSE_DECRYPT},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_AES_KEY_SIZE_256},
        {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_NONE},
        {.tag = OH_HUKS_TAG_BLOCK_MODE, .uint32Param = OH_HUKS_MODE_GCM},
        {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_NONE},
        {.tag = OH_HUKS_TAG_UNWRAP_ALGORITHM_SUITE, .uint32Param = OH_HUKS_UNWRAP_SUITE_X25519_AES_256_GCM_NOPADDING},
        {.tag = OH_HUKS_TAG_ASSOCIATED_DATA, .blob = {.size = Unittest::ImportWrapped::AAD_SIZE, .data = (uint8_t *)Unittest::ImportWrapped::AAD}},
        {.tag = OH_HUKS_TAG_NONCE, .blob = {.size = Unittest::ImportWrapped::NONCE_SIZE, .data = (uint8_t *)Unittest::ImportWrapped::NONCE}}};

    static char g_agreeKeyAlgName[] = "X25519";

    static struct OH_Huks_Blob g_agreeKeyAlgNameBlob = {
        .size = sizeof(g_agreeKeyAlgName),
        .data = (uint8_t *)g_agreeKeyAlgName};

    static const uint32_t g_x25519PubKeySize = 32;

    static struct OH_Huks_Param g_genWrappingKeyParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_X25519},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_UNWRAP},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_CURVE25519_KEY_SIZE_256}};

    static struct OH_Huks_Param g_genCallerX25519Params[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_X25519},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_AGREE},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_CURVE25519_KEY_SIZE_256}};

    static struct OH_Huks_Param g_importParamsCallerKek[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_AES},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_ENCRYPT},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_AES_KEY_SIZE_256},
        {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_NONE},
        {.tag = OH_HUKS_TAG_BLOCK_MODE, .uint32Param = OH_HUKS_MODE_GCM},
        {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_NONE},
        {.tag = OH_HUKS_TAG_IV, .blob = {.size = Unittest::ImportWrapped::IV_SIZE, .data = (uint8_t *)Unittest::ImportWrapped::IV}}};

    static struct OH_Huks_Param g_callerAgreeParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_X25519},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_AGREE},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_CURVE25519_KEY_SIZE_256}
    };

    static void InitCommonTestParamsAndDoImport(
        struct HksImportWrappedKeyTestParams *importWrappedKeyTestParams,
        const struct OH_Huks_Param *importedKeyParamSetArray,
        uint32_t arraySize)
    {
        importWrappedKeyTestParams->agreeKeyAlgName = &g_agreeKeyAlgNameBlob;

        struct OH_Huks_ParamSet *genX25519KeyParamSet = nullptr;
        OH_Huks_Result ret = InitParamSet(&genX25519KeyParamSet, g_genWrappingKeyParams,
                           sizeof(g_genWrappingKeyParams) / sizeof(OH_Huks_Param));
        EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "InitParamSet(gen huks x25519) failed.";
        importWrappedKeyTestParams->genWrappingKeyParamSet = genX25519KeyParamSet;
        importWrappedKeyTestParams->publicKeySize = g_x25519PubKeySize;

        struct OH_Huks_ParamSet *genCallerKeyParamSet = nullptr;
        ret = InitParamSet(&genCallerKeyParamSet, g_genCallerX25519Params,
                           sizeof(g_genCallerX25519Params) / sizeof(OH_Huks_Param));
        EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "InitParamSet(gen caller x25519) failed.";
        importWrappedKeyTestParams->genCallerKeyParamSet = genCallerKeyParamSet;

        struct OH_Huks_ParamSet *callerImportParamsKek = nullptr;
        ret = InitParamSet(&callerImportParamsKek, g_importParamsCallerKek,
                           sizeof(g_importParamsCallerKek) / sizeof(OH_Huks_Param));
        EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "InitParamSet(import call kek) failed.";
        importWrappedKeyTestParams->importCallerKekParamSet = callerImportParamsKek;

        struct OH_Huks_ParamSet *agreeParamSet = nullptr;
        ret = InitParamSet(&agreeParamSet, g_callerAgreeParams,
                           sizeof(g_callerAgreeParams) / sizeof(OH_Huks_Param));
        EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "InitParamSet(agreeParamSet) failed.";
        importWrappedKeyTestParams->agreeParamSet = agreeParamSet;

        struct OH_Huks_ParamSet *importPlainKeyParams = nullptr;
        ret = InitParamSet(&importPlainKeyParams, importedKeyParamSetArray, arraySize);
        EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "InitParamSet(import plain key) failed.";
        importWrappedKeyTestParams->importWrappedKeyParamSet = importPlainKeyParams;

        HksImportWrappedKeyTestCommonCase(importWrappedKeyTestParams);

        OH_Huks_FreeParamSet(&genX25519KeyParamSet);
        OH_Huks_FreeParamSet(&genCallerKeyParamSet);
        OH_Huks_FreeParamSet(&callerImportParamsKek);
        OH_Huks_FreeParamSet(&importPlainKeyParams);
    }

    /**
     * @tc.name: HuksImportWrappedX25519Test.Security_HUKS_NAPI_Wrapped_0100
     * @tc.desc: Test import wrapped aes256-gcm-no_padding key including generate&export x25519 key, generate kek,
     * agree, encrypt, of which generate kek, agree, encrypt should done by caller self.
     * @tc.type: FUNC
     */
    HWTEST_F(HuksImportWrappedX25519Test, Security_HUKS_NAPI_Wrapped_0100, TestSize.Level0)
    {
        struct HksImportWrappedKeyTestParams importWrappedKeyTestParams001 = {0};

        importWrappedKeyTestParams001.wrappingKeyAlias = &g_wrappingKeyAliasAes256;
        importWrappedKeyTestParams001.keyMaterialLen = g_importedAes256PlainKey.size;
        importWrappedKeyTestParams001.callerKeyAlias = &g_callerKeyAliasAes256;
        importWrappedKeyTestParams001.callerKekAlias = &g_callerKekAliasAes256;
        importWrappedKeyTestParams001.callerKek = &g_callerAes256Kek;
        importWrappedKeyTestParams001.callerAgreeKeyAlias = &g_callerAgreeKeyAliasAes256;
        importWrappedKeyTestParams001.importedKeyAlias = &g_importedKeyAliasAes256;
        importWrappedKeyTestParams001.importedPlainKey = &g_importedAes256PlainKey;
        InitCommonTestParamsAndDoImport(&importWrappedKeyTestParams001, g_importWrappedAes256Params,
                                        sizeof(g_importWrappedAes256Params) / sizeof(struct OH_Huks_Param));
        HksClearKeysForWrappedKeyTest(&importWrappedKeyTestParams001);
    }
}
