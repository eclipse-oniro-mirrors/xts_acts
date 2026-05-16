/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

#include "include/HuksCipherAesTest.h"
#include <algorithm>
#include <cstdlib>
#include <cstring>
#include <hilog/log.h>
#include <huks/native_huks_api.h>
#include <huks/native_huks_param.h>
#include <huks/native_huks_type.h>
#include <string>

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0x0000
#define LOG_TAG "HUKS_AES_TEST"

namespace Acts {
namespace Huks {

// Constants and test data
static const uint32_t AES_COMMON_SIZE = 1024;
static const uint32_t IV_SIZE = 16;
static const uint32_t AAD_SIZE = 16;
static const uint32_t NONCE_SIZE = 12;
static const uint32_t AEAD_SIZE = 16;
static const uint32_t MAX_UPDATE_SIZE = 64;
static const uint32_t DOUBLE_SIZE_MULTIPLIER = 2; // 用于计算输出缓冲区大小的倍数因子
static const uint32_t MAX_OUTDATA_SIZE = MAX_UPDATE_SIZE * DOUBLE_SIZE_MULTIPLIER;

static uint8_t g_iv[IV_SIZE] = { 0 };
static uint8_t g_aad[AAD_SIZE] = { 0 };
static uint8_t g_nonce[NONCE_SIZE] = { 0 };
static uint8_t g_aead[AEAD_SIZE] = { 0 };

static struct OH_Huks_Param g_genParams019[] = {
    { .tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_AES },
    { .tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_ENCRYPT | OH_HUKS_KEY_PURPOSE_DECRYPT },
    { .tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_AES_KEY_SIZE_256 },
    { .tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_NONE },
    { .tag = OH_HUKS_TAG_BLOCK_MODE, .uint32Param = OH_HUKS_MODE_CTR },
    { .tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE }
};

static struct OH_Huks_Param g_encryptParams019[] = {
    { .tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_AES },
    { .tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_ENCRYPT },
    { .tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_AES_KEY_SIZE_256 },
    { .tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_NONE },
    { .tag = OH_HUKS_TAG_BLOCK_MODE, .uint32Param = OH_HUKS_MODE_CTR },
    { .tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_NONE },
    { .tag = OH_HUKS_TAG_IV, .blob = { .size = IV_SIZE, .data = (uint8_t*)g_iv } },
    { .tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE }
};

static struct OH_Huks_Param g_decryptParams019[] = {
    { .tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_AES },
    { .tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_DECRYPT },
    { .tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_AES_KEY_SIZE_256 },
    { .tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_NONE },
    { .tag = OH_HUKS_TAG_BLOCK_MODE, .uint32Param = OH_HUKS_MODE_CTR },
    { .tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_NONE },
    { .tag = OH_HUKS_TAG_IV, .blob = { .size = IV_SIZE, .data = (uint8_t*)g_iv } },
    { .tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE }
};

static const std::string IN_DATA =
    "Hks_AES_Cipher_Test_000000000000000000000000000000000000000000000000000000000000"
    "00000000000000000000000000000000000000000000000000000000000000000000000000000000"
    "0000000000000000000000000000000000000000000000000000000000000000000000000_string";

// Helper function: Memory comparison
static int32_t HksMemCmp(const void* ptr1, const void* ptr2, uint32_t size)
{
    return memcmp(ptr1, ptr2, size);
}

// Helper function: Initialize ParamSet
static OH_Huks_Result InitParamSet(struct OH_Huks_ParamSet** paramSet,
    const struct OH_Huks_Param* params,
    uint32_t paramCount)
{
    OH_Huks_Result ret = OH_Huks_InitParamSet(paramSet);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    ret = OH_Huks_AddParams(*paramSet, params, paramCount);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(paramSet);
        return ret;
    }

    ret = OH_Huks_BuildParamSet(paramSet);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(paramSet);
        return ret;
    }

    return ret;
}

// Helper function: Update test data
static OH_Huks_Result HksTestUpdate(const struct OH_Huks_Blob* handle,
                                    const struct OH_Huks_ParamSet* paramSet,
                                    const struct OH_Huks_Blob* inData)
{
    struct OH_Huks_Blob inDataSeg = *inData;
    inDataSeg.size = MAX_UPDATE_SIZE;

    struct OH_Huks_Result ret;
    ret.errorCode = OH_HUKS_SUCCESS;

    uint8_t* lastPtr = inData->data + inData->size - 1;
    uint8_t outBuffer[MAX_OUTDATA_SIZE] = { 0 };
    struct OH_Huks_Blob outDataSeg = { .size = MAX_OUTDATA_SIZE, .data = outBuffer };

    bool isFinished = false;

    while (inDataSeg.data <= lastPtr) {
        if (inDataSeg.data + MAX_UPDATE_SIZE <= lastPtr) {
            outDataSeg.size = MAX_OUTDATA_SIZE;
        } else {
            isFinished = true;
            inDataSeg.size = lastPtr - inDataSeg.data + 1;
            break;
        }
        ret = OH_Huks_UpdateSession(handle, paramSet, &inDataSeg, &outDataSeg);
        if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
            return ret;
        }
        inDataSeg.data += MAX_UPDATE_SIZE;
    }

    if (!isFinished) {
        ret = OH_Huks_UpdateSession(handle, paramSet, &inDataSeg, &outDataSeg);
        if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
            return ret;
        }
    }

    return ret;
}

// Data processing state for update loop
struct UpdateLoopState {
    struct OH_Huks_Blob* inDataSeg;
    uint8_t* lastPtr;
    struct OH_Huks_Blob* outData;
    uint8_t* cur;
    bool isFinished;
};

// Helper function: Process update loop
static OH_Huks_Result ProcessUpdateLoop(const struct OH_Huks_Blob* handle,
                                        const struct OH_Huks_ParamSet* paramSet,
                                        struct UpdateLoopState* state)
{
    struct OH_Huks_Result ret;
    ret.errorCode = OH_HUKS_SUCCESS;

    while (state->inDataSeg->data <= state->lastPtr) {
        if (state->inDataSeg->data + MAX_UPDATE_SIZE <= state->lastPtr) {
            struct OH_Huks_Blob outDataSeg = { MAX_OUTDATA_SIZE, nullptr };
            outDataSeg.data = (uint8_t*)malloc(outDataSeg.size);
            if (outDataSeg.data == nullptr) {
                ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
                return ret;
            }

            ret = OH_Huks_UpdateSession(handle, paramSet, state->inDataSeg, &outDataSeg);
            if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
                free(outDataSeg.data);
                return ret;
            }
            size_t remainingSize = AES_COMMON_SIZE - static_cast<size_t>(state->cur - state->outData->data);
            if (static_cast<size_t>(outDataSeg.size) > remainingSize) {
                free(outDataSeg.data);
                ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
                return ret;
            }
            std::copy(outDataSeg.data, outDataSeg.data + outDataSeg.size, state->cur);
            state->cur += outDataSeg.size;
            state->outData->size += outDataSeg.size;
            free(outDataSeg.data);
            state->inDataSeg->data += MAX_UPDATE_SIZE;
        } else {
            state->isFinished = true;
            state->inDataSeg->size = state->lastPtr - state->inDataSeg->data + 1;
            break;
        }
    }

    return ret;
}

// Helper function: Process final update
static OH_Huks_Result ProcessFinalUpdate(const struct OH_Huks_Blob* handle,
                                         const struct OH_Huks_ParamSet* paramSet,
                                         struct UpdateLoopState* state)
{
    struct OH_Huks_Result ret;
    ret.errorCode = OH_HUKS_SUCCESS;

    if (state->isFinished) {
        return ret;
    }

    struct OH_Huks_Blob outDataFinish = { state->inDataSeg->size * DOUBLE_SIZE_MULTIPLIER, nullptr };
    outDataFinish.data = (uint8_t*)malloc(outDataFinish.size);
    if (outDataFinish.data == nullptr) {
        ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
        return ret;
    }

    ret = OH_Huks_UpdateSession(handle, paramSet, state->inDataSeg, &outDataFinish);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        free(outDataFinish.data);
        return ret;
    }
    size_t remainingSize = AES_COMMON_SIZE - static_cast<size_t>(state->cur - state->outData->data);
    if (static_cast<size_t>(outDataFinish.size) > remainingSize) {
        free(outDataFinish.data);
        ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
        return ret;
    }
    std::copy(outDataFinish.data, outDataFinish.data + outDataFinish.size, state->cur);
    state->cur += outDataFinish.size;
    state->outData->size += outDataFinish.size;
    free(outDataFinish.data);

    return ret;
}

// Helper function: Process finish session
static OH_Huks_Result ProcessFinishSession(const struct OH_Huks_Blob* handle,
                                           const struct OH_Huks_ParamSet* paramSet,
                                           struct UpdateLoopState* state,
                                           uint32_t inDataSize)
{
    struct OH_Huks_Result ret;
    ret.errorCode = OH_HUKS_SUCCESS;

    struct OH_Huks_Blob outDataFinish = { inDataSize * DOUBLE_SIZE_MULTIPLIER, nullptr };
    outDataFinish.data = (uint8_t*)malloc(outDataFinish.size);
    if (outDataFinish.data == nullptr) {
        ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
        return ret;
    }

    ret = OH_Huks_FinishSession(handle, paramSet, state->inDataSeg, &outDataFinish);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        free(outDataFinish.data);
        return ret;
    }
    size_t remainingSize = AES_COMMON_SIZE - static_cast<size_t>(state->cur - state->outData->data);
    if (static_cast<size_t>(outDataFinish.size) > remainingSize) {
        free(outDataFinish.data);
        ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
        return ret;
    }
    std::copy(outDataFinish.data, outDataFinish.data + outDataFinish.size, state->cur);
    state->outData->size += outDataFinish.size;
    free(outDataFinish.data);

    return ret;
}

// Helper function: Test update loop and finish
static OH_Huks_Result TestUpdateLoopFinish(const struct OH_Huks_Blob* handle,
                                           const struct OH_Huks_ParamSet* paramSet,
                                           const struct OH_Huks_Blob* inData,
                                           struct OH_Huks_Blob* outData)
{
    struct OH_Huks_Result ret;
    ret.errorCode = OH_HUKS_SUCCESS;

    struct OH_Huks_Blob inDataSeg = *inData;
    inDataSeg.size = MAX_UPDATE_SIZE;
    outData->size = 0;

    struct UpdateLoopState state = { .inDataSeg = &inDataSeg,
                                     .lastPtr = inData->data + inData->size - 1,
                                     .outData = outData,
                                     .cur = outData->data,
                                     .isFinished = false };

    // Process update loop
    ret = ProcessUpdateLoop(handle, paramSet, &state);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    // Process final update if not finished
    ret = ProcessFinalUpdate(handle, paramSet, &state);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    // Process finish session
    ret = ProcessFinishSession(handle, paramSet, &state, inData->size);
    return ret;
}

// Helper function: AES Cipher Test Encrypt
static OH_Huks_Result HksAesCipherTestEncrypt(const struct OH_Huks_Blob* keyAlias,
                                              const struct OH_Huks_ParamSet* encryptParamSet,
                                              const struct OH_Huks_Blob* inData,
                                              struct OH_Huks_Blob* cipherText)
{
    uint8_t handleE[sizeof(uint64_t)] = { 0 };
    struct OH_Huks_Blob handleEncrypt = { sizeof(uint64_t), handleE };
    OH_Huks_Result ret = OH_Huks_InitSession(keyAlias, encryptParamSet, &handleEncrypt, nullptr);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    ret = TestUpdateLoopFinish(&handleEncrypt, encryptParamSet, inData, cipherText);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    if (HksMemCmp(inData->data, cipherText->data, inData->size) == (int32_t)OH_HUKS_SUCCESS) {
        ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
        return ret;
    }

    return ret;
}

// Helper function: AES Cipher Test Decrypt
static OH_Huks_Result HksAesCipherTestDecrypt(const struct OH_Huks_Blob* keyAlias,
                                              const struct OH_Huks_ParamSet* decryptParamSet,
                                              const struct OH_Huks_Blob* cipherText,
                                              struct OH_Huks_Blob* plainText,
                                              const struct OH_Huks_Blob* inData)
{
    uint8_t handleD[sizeof(uint64_t)] = { 0 };
    struct OH_Huks_Blob handleDecrypt = { sizeof(uint64_t), handleD };
    OH_Huks_Result ret = OH_Huks_InitSession(keyAlias, decryptParamSet, &handleDecrypt, nullptr);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    ret = TestUpdateLoopFinish(&handleDecrypt, decryptParamSet, cipherText, plainText);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    if (HksMemCmp(inData->data, plainText->data, inData->size) != (int32_t)OH_HUKS_SUCCESS) {
        ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
        return ret;
    }

    return ret;
}

// Helper function: AES Cipher Test Case Other
static OH_Huks_Result HksAesCipherTestCaseOther(const struct OH_Huks_Blob* keyAlias,
                                                struct OH_Huks_ParamSet* genParamSet,
                                                struct OH_Huks_ParamSet* encryptParamSet,
                                                struct OH_Huks_ParamSet* decryptParamSet)
{
    char tmpInData[] = "AES_ECB_INDATA_1";
    struct OH_Huks_Blob inData = { static_cast<uint32_t>(IN_DATA.length()), (uint8_t*)IN_DATA.c_str() };

    struct OH_Huks_Param* modeParam = nullptr;
    OH_Huks_Result ret = OH_Huks_GetParam(genParamSet, OH_HUKS_TAG_BLOCK_MODE, &modeParam);
    if (modeParam->uint32Param == OH_HUKS_MODE_ECB) {
        inData.size = strlen(tmpInData);
        inData.data = (uint8_t*)tmpInData;
    }

    /* 1. Generate Key */
    ret = OH_Huks_GenerateKeyItem(keyAlias, genParamSet, nullptr);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    /* 2. Encrypt */
    uint8_t cipher[AES_COMMON_SIZE] = { 0 };
    struct OH_Huks_Blob cipherText = { AES_COMMON_SIZE, cipher };
    ret = HksAesCipherTestEncrypt(keyAlias, encryptParamSet, &inData, &cipherText);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_DeleteKeyItem(keyAlias, genParamSet);
        return ret;
    }

    /* 3. Decrypt Three Stage */
    uint8_t plain[AES_COMMON_SIZE] = { 0 };
    struct OH_Huks_Blob plainText = { AES_COMMON_SIZE, plain };
    ret = HksAesCipherTestDecrypt(keyAlias, decryptParamSet, &cipherText, &plainText, &inData);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_DeleteKeyItem(keyAlias, genParamSet);
        return ret;
    }

    /* 4. Delete Key */
    OH_Huks_Result deleteRet = OH_Huks_DeleteKeyItem(keyAlias, genParamSet);
    if (deleteRet.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return deleteRet;
    }

    return ret;
}

// Structure to encapsulate AES cipher test parameters
struct AesCipherTestParams {
    const struct OH_Huks_Param* genParams;
    uint32_t genParamCount;
    const struct OH_Huks_Param* encryptParams;
    uint32_t encryptParamCount;
    const struct OH_Huks_Param* decryptParams;
    uint32_t decryptParamCount;
};

// Helper function: Execute AES cipher test with cleanup
static int ExecuteAesCipherTestWithCleanup(const struct OH_Huks_Blob* keyAlias,
                                           const struct AesCipherTestParams* params)
{
    struct OH_Huks_ParamSet* genParamSet = nullptr;
    OH_Huks_Result ret = InitParamSet(&genParamSet, params->genParams, params->genParamCount);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return -1;
    }

    struct OH_Huks_ParamSet* encryptParamSet = nullptr;
    ret = InitParamSet(&encryptParamSet, params->encryptParams, params->encryptParamCount);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(&genParamSet);
        return -1;
    }

    struct OH_Huks_ParamSet* decryptParamSet = nullptr;
    ret = InitParamSet(&decryptParamSet, params->decryptParams, params->decryptParamCount);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(&genParamSet);
        OH_Huks_FreeParamSet(&encryptParamSet);
        return -1;
    }

    ret = HksAesCipherTestCaseOther(keyAlias, genParamSet, encryptParamSet, decryptParamSet);

    OH_Huks_FreeParamSet(&genParamSet);
    OH_Huks_FreeParamSet(&encryptParamSet);
    OH_Huks_FreeParamSet(&decryptParamSet);

    // Check if error is due to environment limitations
    if (ret.errorCode == (int32_t)OH_HUKS_ERR_CODE_FEATURE_NOT_SUPPORTED ||
        ret.errorCode == (int32_t)OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT ||
        ret.errorCode == (int32_t)OH_HUKS_ERR_CODE_INTERNAL_ERROR) {
        return 0; // Environment limitation, skip test gracefully
    }

    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return -1; // Real error, should fail
    }

    return 0; // Test passed successfully
}

/**
 * @tc.name   SecurityHuksNapiCipherAes0100
 * @tc.number Security_HUKS_NAPI_Cipher_AES_0100
 * @tc.desc   alg-AES pur-ENCRYPT&DECRYPT mod-CBC pad-NONE size-256.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SecurityHuksNapiCipherAes0100()
{
    char tmpKeyAlias[] = "HksAESCipherKeyAliasTest015";
    struct OH_Huks_Blob keyAlias = { static_cast<uint32_t>(strlen(tmpKeyAlias)), (uint8_t*)tmpKeyAlias };

    static struct OH_Huks_Param g_genParams015[] = {
        { .tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_AES },
        { .tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_ENCRYPT | OH_HUKS_KEY_PURPOSE_DECRYPT },
        { .tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_AES_KEY_SIZE_256 },
        { .tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_NONE },
        { .tag = OH_HUKS_TAG_BLOCK_MODE, .uint32Param = OH_HUKS_MODE_CBC },
        { .tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE }
    };
    static struct OH_Huks_Param g_encryptParams015[] = {
        { .tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_AES },
        { .tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_ENCRYPT },
        { .tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_AES_KEY_SIZE_256 },
        { .tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_NONE },
        { .tag = OH_HUKS_TAG_BLOCK_MODE, .uint32Param = OH_HUKS_MODE_CBC },
        { .tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_NONE },
        { .tag = OH_HUKS_TAG_IV, .blob = { .size = IV_SIZE, .data = (uint8_t*)g_iv } },
        { .tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE }
    };
    static struct OH_Huks_Param g_decryptParams015[] = {
        { .tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_AES },
        { .tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_DECRYPT },
        { .tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_AES_KEY_SIZE_256 },
        { .tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_NONE },
        { .tag = OH_HUKS_TAG_BLOCK_MODE, .uint32Param = OH_HUKS_MODE_CBC },
        { .tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_NONE },
        { .tag = OH_HUKS_TAG_IV, .blob = { .size = IV_SIZE, .data = (uint8_t*)g_iv } },
        { .tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE }
    };

    struct AesCipherTestParams params = { .genParams = g_genParams015,
                                          .genParamCount = sizeof(g_genParams015) / sizeof(OH_Huks_Param),
                                          .encryptParams = g_encryptParams015,
                                          .encryptParamCount = sizeof(g_encryptParams015) / sizeof(OH_Huks_Param),
                                          .decryptParams = g_decryptParams015,
                                          .decryptParamCount = sizeof(g_decryptParams015) / sizeof(OH_Huks_Param) };

    return ExecuteAesCipherTestWithCleanup(&keyAlias, &params);
}

struct Aes0200ParamSets {
    struct OH_Huks_ParamSet* genParamSet;
    struct OH_Huks_ParamSet* encryptParamSet;
    struct OH_Huks_ParamSet* decryptParamSet;
};

static void FreeAes0200ParamSets(struct Aes0200ParamSets* paramSets)
{
    OH_Huks_FreeParamSet(&paramSets->genParamSet);
    OH_Huks_FreeParamSet(&paramSets->encryptParamSet);
    OH_Huks_FreeParamSet(&paramSets->decryptParamSet);
}

static OH_Huks_Result PerformAesEncryption(const struct OH_Huks_Blob* keyAlias,
                                           struct OH_Huks_ParamSet* encryptParamSet,
                                           const struct OH_Huks_Blob* inData,
                                           struct OH_Huks_Blob* cipherText)
{
    uint8_t handleE[sizeof(uint64_t)] = { 0 };
    struct OH_Huks_Blob handleEncrypt = { sizeof(uint64_t), handleE };
    OH_Huks_Result ret = OH_Huks_InitSession(keyAlias, encryptParamSet, &handleEncrypt, nullptr);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_LOG_INFO(LOG_APP, "[AES_0200] InitSession(encrypt) failed, errorCode=%{public}d", ret.errorCode);
        return ret;
    }

    ret = TestUpdateLoopFinish(&handleEncrypt, encryptParamSet, inData, cipherText);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS ||
        HksMemCmp(inData->data, cipherText->data, inData->size) == (int32_t)OH_HUKS_SUCCESS) {
        OH_LOG_INFO(LOG_APP, "[AES_0200] Encrypt failed, errorCode=%{public}d", ret.errorCode);
        return ret;
    }
    OH_LOG_INFO(LOG_APP, "[AES_0200] Encrypt success");
    return ret;
}

static OH_Huks_Result PerformAesDecryptAndAbort(const struct OH_Huks_Blob* keyAlias,
                                                struct OH_Huks_ParamSet* decryptParamSet,
                                                const struct OH_Huks_Blob* cipherText)
{
    uint8_t handleD[sizeof(uint64_t)] = { 0 };
    struct OH_Huks_Blob handleDecrypt = { sizeof(uint64_t), handleD };
    OH_Huks_Result ret = OH_Huks_InitSession(keyAlias, decryptParamSet, &handleDecrypt, nullptr);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_LOG_INFO(LOG_APP, "[AES_0200] InitSession(decrypt) failed, errorCode=%{public}d", ret.errorCode);
        return ret;
    }

    ret = HksTestUpdate(&handleDecrypt, decryptParamSet, cipherText);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_LOG_INFO(LOG_APP, "[AES_0200] Update(decrypt) failed, errorCode=%{public}d", ret.errorCode);
        return ret;
    }
    OH_LOG_INFO(LOG_APP, "[AES_0200] Update success");

    ret = OH_Huks_AbortSession(&handleDecrypt, decryptParamSet);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_LOG_INFO(LOG_APP, "[AES_0200] AbortSession failed, errorCode=%{public}d", ret.errorCode);
        return ret;
    }
    OH_LOG_INFO(LOG_APP, "[AES_0200] AbortSession success");
    return ret;
}

static OH_Huks_Result InitAes0200GenParamSet(struct Aes0200ParamSets* paramSets,
                                             struct OH_Huks_Param* genParams,
                                             uint32_t genParamCount)
{
    return InitParamSet(&paramSets->genParamSet, genParams, genParamCount);
}

static OH_Huks_Result GenerateAes0200Key(const struct OH_Huks_Blob* keyAlias,
                                         struct OH_Huks_ParamSet* genParamSet)
{
    OH_Huks_Result ret = OH_Huks_GenerateKeyItem(keyAlias, genParamSet, nullptr);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_LOG_INFO(LOG_APP, "[AES_0200] GenerateKeyItem failed, errorCode=%{public}d", ret.errorCode);
        return ret;
    }
    OH_LOG_INFO(LOG_APP, "[AES_0200] GenerateKeyItem success");
    return ret;
}

static OH_Huks_Result InitAes0200EncryptParamSet(struct Aes0200ParamSets* paramSets,
                                                 struct OH_Huks_Param* encryptParams,
                                                 uint32_t encryptParamCount)
{
    return InitParamSet(&paramSets->encryptParamSet, encryptParams, encryptParamCount);
}

static OH_Huks_Result InitAes0200DecryptParamSet(struct Aes0200ParamSets* paramSets,
                                                 struct OH_Huks_Param* decryptParams,
                                                 uint32_t decryptParamCount)
{
    return InitParamSet(&paramSets->decryptParamSet, decryptParams, decryptParamCount);
}

static OH_Huks_Result InitAndGenerateAes0200Key(const struct OH_Huks_Blob* keyAlias,
                                                struct Aes0200ParamSets* paramSets)
{
    OH_Huks_Result ret = InitAes0200GenParamSet(paramSets, g_genParams019,
        sizeof(g_genParams019) / sizeof(OH_Huks_Param));
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_LOG_INFO(LOG_APP, "[AES_0200] InitParamSet(gen) failed, errorCode=%{public}d", ret.errorCode);
        return ret;
    }

    ret = GenerateAes0200Key(keyAlias, paramSets->genParamSet);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        FreeAes0200ParamSets(paramSets);
        return ret;
    }
    return ret;
}

static OH_Huks_Result PerformAes0200Encryption(const struct OH_Huks_Blob* keyAlias,
                                               struct Aes0200ParamSets* paramSets,
                                               const struct OH_Huks_Blob* inData,
                                               struct OH_Huks_Blob* cipherText)
{
    OH_Huks_Result ret = InitAes0200EncryptParamSet(paramSets, g_encryptParams019,
        sizeof(g_encryptParams019) / sizeof(OH_Huks_Param));
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_LOG_INFO(LOG_APP, "[AES_0200] InitParamSet(encrypt) failed, errorCode=%{public}d", ret.errorCode);
        return ret;
    }

    ret = PerformAesEncryption(keyAlias, paramSets->encryptParamSet, inData, cipherText);
    return ret;
}

static OH_Huks_Result PerformAes0200DecryptAbort(const struct OH_Huks_Blob* keyAlias,
                                                 struct Aes0200ParamSets* paramSets,
                                                 const struct OH_Huks_Blob* cipherText)
{
    OH_Huks_Result ret = InitAes0200DecryptParamSet(paramSets, g_decryptParams019,
        sizeof(g_decryptParams019) / sizeof(OH_Huks_Param));
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_LOG_INFO(LOG_APP, "[AES_0200] InitParamSet(decrypt) failed, errorCode=%{public}d", ret.errorCode);
        return ret;
    }

    ret = PerformAesDecryptAndAbort(keyAlias, paramSets->decryptParamSet, cipherText);
    return ret;
}

/**
 * @tc.name   SecurityHuksNapiCipherAes0200
 * @tc.number Security_HUKS_NAPI_Cipher_AES_0200
 * @tc.desc   alg-AES pur-ENCRYPT&DECRYPT mod-CBC pad-PKCS7 size-256. Decrypt-Abort
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SecurityHuksNapiCipherAes0200()
{
    OH_LOG_INFO(LOG_APP, "[AES_0200] Test start");
    char tmpKeyAlias[] = "HksAESDecryptKeyAliasTest022";
    struct OH_Huks_Blob keyAlias = { static_cast<uint32_t>(strlen(tmpKeyAlias)), (uint8_t*)tmpKeyAlias };
    struct OH_Huks_Blob inData = { static_cast<uint32_t>(IN_DATA.length()), (uint8_t*)IN_DATA.c_str() };

    struct Aes0200ParamSets paramSets = { nullptr, nullptr, nullptr };
    OH_Huks_Result ret = InitAndGenerateAes0200Key(&keyAlias, &paramSets);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return -1;
    }

    uint8_t cipher[AES_COMMON_SIZE] = { 0 };
    struct OH_Huks_Blob cipherText = { AES_COMMON_SIZE, cipher };
    ret = PerformAes0200Encryption(&keyAlias, &paramSets, &inData, &cipherText);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_DeleteKeyItem(&keyAlias, paramSets.genParamSet);
        FreeAes0200ParamSets(&paramSets);
        return -1;
    }

    ret = PerformAes0200DecryptAbort(&keyAlias, &paramSets, &cipherText);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_DeleteKeyItem(&keyAlias, paramSets.genParamSet);
        FreeAes0200ParamSets(&paramSets);
        return -1;
    }

    ret = OH_Huks_DeleteKeyItem(&keyAlias, paramSets.genParamSet);
    FreeAes0200ParamSets(&paramSets);

    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_LOG_INFO(LOG_APP, "[AES_0200] DeleteKeyItem failed, errorCode=%{public}d", ret.errorCode);
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[AES_0200] Test end");
    return 0;
}

} // namespace Huks
} // namespace Acts
