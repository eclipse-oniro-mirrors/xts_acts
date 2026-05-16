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

#include "include/HuksCipherRsaTest.h"
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
#define LOG_TAG "HUKS_RSA_TEST"

namespace Acts {
namespace Huks {

// Constants and test data
static const uint32_t RSA_COMMON_SIZE = 1024;
static const uint32_t MAX_UPDATE_SIZE = 64;
static const uint32_t TIMES = 4;
static const uint32_t MAX_OUTDATA_SIZE = MAX_UPDATE_SIZE * TIMES;
static const uint32_t DOUBLE_SIZE_MULTIPLIER = 2;
static const uint32_t MAX_BLOB_SIZE = 1024 * 1024; // 1MB，合理的上限
static const uint32_t RSA_PARAM_COUNT = 7;

static const std::string IN_DATA_32 = "RSA_32_ttttttttttttttttttttttttt";

// Helper function: Memory comparison
static int32_t HksMemCmp(const void* ptr1, const void* ptr2, uint32_t size)
{
    return memcmp(ptr1, ptr2, size);
}

// Helper function: Free memory
static void HksFree(void* ptr)
{
    if (ptr != nullptr) {
        free(ptr);
    }
}

// Helper function: Malloc and check blob data
static OH_Huks_Result MallocAndCheckBlobData(struct OH_Huks_Blob* blob, const uint32_t blobSize)
{
    OH_Huks_Result ret;
    ret.errorCode = (int32_t)OH_HUKS_SUCCESS;

    // G.MEM.01: 内存申请前，必须对申请内存大小进行合法性校验
    if (blobSize == 0 || blobSize > MAX_BLOB_SIZE) {
        ret.errorCode = (int32_t)OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT;
        return ret;
    }

    blob->data = (uint8_t*)malloc(blobSize);
    if (blob->data == nullptr) {
        ret.errorCode = (int32_t)OH_HUKS_ERR_CODE_INTERNAL_ERROR;
    }
    return ret;
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

// Helper function: Process small data update and finish
static OH_Huks_Result ProcessSmallDataUpdateFinish(const struct OH_Huks_Blob* handle,
                                                   const struct OH_Huks_ParamSet* paramSet,
                                                   uint32_t purpose,
                                                   const struct OH_Huks_Blob* inData,
                                                   struct OH_Huks_Blob* outData)
{
    struct OH_Huks_Result ret;
    ret.errorCode = OH_HUKS_SUCCESS;

    // Allocate temporary output buffer for UpdateSession
    struct OH_Huks_Blob tmpOutData = { .size = MAX_OUTDATA_SIZE, .data = nullptr };
    if (MallocAndCheckBlobData(&tmpOutData, tmpOutData.size).errorCode != (int32_t)OH_HUKS_SUCCESS) {
        ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
        return ret;
    }

    // Execute UpdateSession
    ret = OH_Huks_UpdateSession(handle, paramSet, inData, &tmpOutData);
    HksFree(tmpOutData.data);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    // Allocate temporary input buffer for FinishSession
    struct OH_Huks_Blob tmpInData = { .size = 0, .data = nullptr };
    if (MallocAndCheckBlobData(&tmpInData, MAX_UPDATE_SIZE).errorCode != (int32_t)OH_HUKS_SUCCESS) {
        ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
        return ret;
    }

    // Execute FinishSession with parameter order based on purpose
    if (purpose == OH_HUKS_KEY_PURPOSE_VERIFY) {
        ret = OH_Huks_FinishSession(handle, paramSet, outData, &tmpInData);
    } else {
        ret = OH_Huks_FinishSession(handle, paramSet, &tmpInData, outData);
    }
    HksFree(tmpInData.data);

    return ret;
}

// Structure to encapsulate RSA update loop state
struct RsaUpdateLoopState {
    struct OH_Huks_Blob* inDataSeg;
    uint8_t* lastPtr;
    struct OH_Huks_Blob* outData;
    uint8_t** cur;
    uint32_t outDataBufferSize;
    bool* isFinished;
};

// Helper function: Process update loop
static OH_Huks_Result ProcessUpdateLoop(const struct OH_Huks_Blob* handle,
                                        const struct OH_Huks_ParamSet* paramSet,
                                        struct RsaUpdateLoopState* state)
{
    struct OH_Huks_Result ret;
    ret.errorCode = OH_HUKS_SUCCESS;
    while (state->inDataSeg->data <= state->lastPtr) {
        struct OH_Huks_Blob outDataSeg = { .size = MAX_OUTDATA_SIZE, .data = nullptr };
        if (state->inDataSeg->data + MAX_UPDATE_SIZE <= state->lastPtr) {
            outDataSeg.size = MAX_OUTDATA_SIZE;
        } else {
            *(state->isFinished) = true;
            state->inDataSeg->size = state->lastPtr - state->inDataSeg->data + 1;
            break;
        }
        if (MallocAndCheckBlobData(&outDataSeg, outDataSeg.size).errorCode != (int32_t)OH_HUKS_SUCCESS) {
            ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
            return ret;
        }
        ret = OH_Huks_UpdateSession(handle, paramSet, state->inDataSeg, &outDataSeg);
        if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
            HksFree(outDataSeg.data);
            return ret;
        }

        // Early exit pattern - skip if no data
        if (outDataSeg.size == 0) {
            HksFree(outDataSeg.data);
            state->inDataSeg->data += MAX_UPDATE_SIZE;
            continue;
        }

        // Extract variable to reduce nesting
        size_t remainingSize = state->outDataBufferSize - (*(state->cur) - state->outData->data);
        if (static_cast<size_t>(outDataSeg.size) > remainingSize) {
            HksFree(outDataSeg.data);
            ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
            return ret;
        }
        std::copy(outDataSeg.data, outDataSeg.data + outDataSeg.size, *(state->cur));
        *(state->cur) += outDataSeg.size;
        state->outData->size += outDataSeg.size;

        HksFree(outDataSeg.data);
        state->inDataSeg->data += MAX_UPDATE_SIZE;
    }
    return ret;
}

// Helper function: Process final update
static OH_Huks_Result ProcessFinalUpdate(const struct OH_Huks_Blob* handle,
                                         const struct OH_Huks_ParamSet* paramSet,
                                         struct RsaUpdateLoopState* state,
                                         uint32_t inDataSize)
{
    struct OH_Huks_Result ret;
    ret.errorCode = OH_HUKS_SUCCESS;

    if (*(state->isFinished)) {
        return ret;
    }

    struct OH_Huks_Blob outDataFinish = { inDataSize * DOUBLE_SIZE_MULTIPLIER, nullptr };
    if (MallocAndCheckBlobData(&outDataFinish, outDataFinish.size).errorCode != (int32_t)OH_HUKS_SUCCESS) {
        ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
        return ret;
    }

    ret = OH_Huks_UpdateSession(handle, paramSet, state->inDataSeg, &outDataFinish);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        HksFree(outDataFinish.data);
        return ret;
    }

    // Early exit pattern - skip if no data
    if (outDataFinish.size == 0) {
        HksFree(outDataFinish.data);
        return ret;
    }

    // Extract variable to reduce nesting
    size_t remainingSize = state->outDataBufferSize - (*(state->cur) - state->outData->data);
    if (static_cast<size_t>(outDataFinish.size) > remainingSize) {
        HksFree(outDataFinish.data);
        ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
        return ret;
    }
    std::copy(outDataFinish.data, outDataFinish.data + outDataFinish.size, *(state->cur));
    *(state->cur) += outDataFinish.size;
    state->outData->size += outDataFinish.size;
    HksFree(outDataFinish.data);

    return ret;
}

// Helper function: Process finish session
static OH_Huks_Result ProcessFinishSession(const struct OH_Huks_Blob* handle,
                                           const struct OH_Huks_ParamSet* paramSet,
                                           uint32_t purpose,
                                           struct OH_Huks_Blob* outDataFinish,
                                           struct RsaUpdateLoopState* state)
{
    struct OH_Huks_Result ret;
    ret.errorCode = OH_HUKS_SUCCESS;

    struct OH_Huks_Blob tmpInData = { .size = 0, .data = nullptr };

    // Execute FinishSession with parameter order based on purpose
    if (purpose == OH_HUKS_KEY_PURPOSE_VERIFY) {
        ret = OH_Huks_FinishSession(handle, paramSet, outDataFinish, &tmpInData);
    } else {
        ret = OH_Huks_FinishSession(handle, paramSet, &tmpInData, outDataFinish);
    }

    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        HksFree(outDataFinish->data);
        return ret;
    }

    // Early exit pattern - skip if no data
    if (outDataFinish->size == 0) {
        HksFree(outDataFinish->data);
        return ret;
    }

    // Extract variable to reduce nesting
    size_t remainingSize = state->outDataBufferSize - (*(state->cur) - state->outData->data);
    if (static_cast<size_t>(outDataFinish->size) > remainingSize) {
        HksFree(outDataFinish->data);
        ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
        return ret;
    }
    std::copy(outDataFinish->data, outDataFinish->data + outDataFinish->size, *(state->cur));
    state->outData->size += outDataFinish->size;
    HksFree(outDataFinish->data);

    return ret;
}

// Helper function: Test update and finish
static OH_Huks_Result TestUpdateFinish(const struct OH_Huks_Blob* handle,
                                       const struct OH_Huks_ParamSet* paramSet,
                                       uint32_t purpose,
                                       const struct OH_Huks_Blob* inData,
                                       struct OH_Huks_Blob* outData)
{
    struct OH_Huks_Result ret;
    ret.errorCode = OH_HUKS_SUCCESS;
    uint32_t outDataBufferSize = outData->size;

    // RSA 是块加密算法，必须一次性处理整个数据块，不能分段
    // 对于 RSA 加密/解密，无论数据大小都使用 ProcessSmallDataUpdateFinish
    if (inData->size <= MAX_UPDATE_SIZE || purpose == OH_HUKS_KEY_PURPOSE_ENCRYPT ||
        purpose == OH_HUKS_KEY_PURPOSE_DECRYPT) {
        return ProcessSmallDataUpdateFinish(handle, paramSet, purpose, inData, outData);
    }

    struct OH_Huks_Blob inDataSeg = *inData;
    inDataSeg.size = MAX_UPDATE_SIZE;
    uint8_t* lastPtr = inData->data + inData->size - 1;
    uint8_t* cur = outData->data;
    outData->size = 0;
    bool isFinished = false;

    struct RsaUpdateLoopState state = { .inDataSeg = &inDataSeg,
                                        .lastPtr = lastPtr,
                                        .outData = outData,
                                        .cur = &cur,
                                        .outDataBufferSize = outDataBufferSize,
                                        .isFinished = &isFinished };

    ret = ProcessUpdateLoop(handle, paramSet, &state);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    ret = ProcessFinalUpdate(handle, paramSet, &state, inData->size);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    struct OH_Huks_Blob outDataFinish = { inData->size * DOUBLE_SIZE_MULTIPLIER, nullptr };
    if (MallocAndCheckBlobData(&outDataFinish, outDataFinish.size).errorCode != (int32_t)OH_HUKS_SUCCESS) {
        ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
        return ret;
    }

    ret = ProcessFinishSession(handle, paramSet, purpose, &outDataFinish, &state);
    return ret;
}

// Helper function: RSA Cipher Test Encrypt
static OH_Huks_Result HksRsaCipherTestEncrypt(const struct OH_Huks_Blob* keyAlias,
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

    ret = TestUpdateFinish(&handleEncrypt, encryptParamSet, OH_HUKS_KEY_PURPOSE_ENCRYPT, inData, cipherText);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    int32_t ret1 = HksMemCmp(inData->data, cipherText->data, inData->size);
    if (ret1 == (int32_t)OH_HUKS_SUCCESS) {
        ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
        return ret;
    }

    return ret;
}

// Helper function: RSA Cipher Test Decrypt
static OH_Huks_Result HksRsaCipherTestDecrypt(const struct OH_Huks_Blob* keyAlias,
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

    ret = TestUpdateFinish(&handleDecrypt, decryptParamSet, OH_HUKS_KEY_PURPOSE_DECRYPT, cipherText, plainText);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    int32_t ret1 = HksMemCmp(inData->data, plainText->data, inData->size);
    if (ret1 != (int32_t)OH_HUKS_SUCCESS) {
        ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
        return ret;
    }

    return ret;
}

// Helper function: RSA Cipher Test Case
static OH_Huks_Result HksRsaCipherTestCase(const struct OH_Huks_Blob* keyAlias,
                                           struct OH_Huks_ParamSet* genParamSet,
                                           struct OH_Huks_ParamSet* encryptParamSet,
                                           struct OH_Huks_ParamSet* decryptParamSet,
                                           const struct OH_Huks_Blob* inData)
{
    /* 1. Generate Key */
    OH_Huks_Result ret = OH_Huks_GenerateKeyItem(keyAlias, genParamSet, nullptr);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    /* 2. Export Public Key */
    uint8_t tmpPublicKey[OH_HUKS_RSA_KEY_SIZE_4096] = { 0 };
    struct OH_Huks_Blob publicKey = { OH_HUKS_RSA_KEY_SIZE_4096, (uint8_t*)tmpPublicKey };
    ret = OH_Huks_ExportPublicKeyItem(keyAlias, genParamSet, &publicKey);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_DeleteKeyItem(keyAlias, genParamSet);
        return ret;
    }

    /* 3. Import Key */
    char tmpKey[] = "RSA_Encrypt_Decrypt_KeyAlias";
    struct OH_Huks_Blob newKeyAlias = { .size = static_cast<uint32_t>(strlen(tmpKey)), .data = (uint8_t*)tmpKey };
    ret = OH_Huks_ImportKeyItem(&newKeyAlias, encryptParamSet, &publicKey);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_DeleteKeyItem(keyAlias, genParamSet);
        return ret;
    }

    /* 4. Encrypt Three Stage */
    uint8_t cipher[RSA_COMMON_SIZE] = { 0 };
    struct OH_Huks_Blob cipherText = { RSA_COMMON_SIZE, cipher };
    ret = HksRsaCipherTestEncrypt(&newKeyAlias, encryptParamSet, inData, &cipherText);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_DeleteKeyItem(keyAlias, genParamSet);
        OH_Huks_DeleteKeyItem(&newKeyAlias, encryptParamSet);
        return ret;
    }

    /* 5. Decrypt Three Stage */
    uint8_t plain[RSA_COMMON_SIZE] = { 0 };
    struct OH_Huks_Blob plainText = { RSA_COMMON_SIZE, plain };
    ret = HksRsaCipherTestDecrypt(keyAlias, decryptParamSet, &cipherText, &plainText, inData);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_DeleteKeyItem(keyAlias, genParamSet);
        OH_Huks_DeleteKeyItem(&newKeyAlias, encryptParamSet);
        return ret;
    }

    /* 6. Delete Key */
    OH_Huks_Result deleteRet1 = OH_Huks_DeleteKeyItem(keyAlias, genParamSet);
    OH_Huks_Result deleteRet2 = OH_Huks_DeleteKeyItem(&newKeyAlias, encryptParamSet);

    if (deleteRet1.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return deleteRet1;
    }
    if (deleteRet2.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return deleteRet2;
    }

    return ret;
}

struct Rsa0100ParamSets {
    struct OH_Huks_ParamSet* genParamSet;
    struct OH_Huks_ParamSet* encryptParamSet;
    struct OH_Huks_ParamSet* decryptParamSet;
};

static void FreeRsa0100ParamSets(struct Rsa0100ParamSets* paramSets)
{
    OH_Huks_FreeParamSet(&paramSets->genParamSet);
    OH_Huks_FreeParamSet(&paramSets->encryptParamSet);
    OH_Huks_FreeParamSet(&paramSets->decryptParamSet);
}

static void CleanupOldRsaKeys(const struct OH_Huks_Blob* keyAlias)
{
    char tmpKey[] = "RSA_Encrypt_Decrypt_KeyAlias";
    struct OH_Huks_Blob oldKeyAlias = { .size = static_cast<uint32_t>(strlen(tmpKey)), .data = (uint8_t*)tmpKey };
    OH_Huks_DeleteKeyItem(keyAlias, nullptr);
    OH_Huks_DeleteKeyItem(&oldKeyAlias, nullptr);
}

static OH_Huks_Result InitRsa0100ParamSets(struct Rsa0100ParamSets* paramSets,
                                           struct OH_Huks_Param* genParams,
                                           struct OH_Huks_Param* encryptParams,
                                           struct OH_Huks_Param* decryptParams)
{
    OH_Huks_Result ret = InitParamSet(&paramSets->genParamSet, genParams, RSA_PARAM_COUNT);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    ret = InitParamSet(&paramSets->encryptParamSet, encryptParams, RSA_PARAM_COUNT);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(&paramSets->genParamSet);
        return ret;
    }

    ret = InitParamSet(&paramSets->decryptParamSet, decryptParams, RSA_PARAM_COUNT);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(&paramSets->genParamSet);
        OH_Huks_FreeParamSet(&paramSets->encryptParamSet);
        return ret;
    }

    return ret;
}

/**
 * @tc.name   SecurityHuksNapiCipherRsa0100
 * @tc.number Security_HUKS_NAPI_Cipher_RSA_0100
 * @tc.desc   alg-RSA pur-ENCRYPT-DECRYPT size-4096 pad-OAEP dig-SHA384 mode-ECB.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int SecurityHuksNapiCipherRsa0100()
{
    char tmpKeyAlias[] = "HksRSACipherKeyAliasTest041";
    struct OH_Huks_Blob keyAlias = { static_cast<uint32_t>(strlen(tmpKeyAlias)), (uint8_t*)tmpKeyAlias };
    struct OH_Huks_Blob inData = { static_cast<uint32_t>(IN_DATA_32.length()), (uint8_t*)IN_DATA_32.c_str() };

    CleanupOldRsaKeys(&keyAlias);

    static struct OH_Huks_Param g_genParams041[] = {
        { .tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_RSA },
        { .tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_ENCRYPT | OH_HUKS_KEY_PURPOSE_DECRYPT },
        { .tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_RSA_KEY_SIZE_4096 },
        { .tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_OAEP },
        { .tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA384 },
        { .tag = OH_HUKS_TAG_BLOCK_MODE, .uint32Param = OH_HUKS_MODE_ECB },
        { .tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE }
    };
    static struct OH_Huks_Param g_encryptParams041[] = {
        { .tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_RSA },
        { .tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_ENCRYPT },
        { .tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_RSA_KEY_SIZE_4096 },
        { .tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_OAEP },
        { .tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA384 },
        { .tag = OH_HUKS_TAG_BLOCK_MODE, .uint32Param = OH_HUKS_MODE_ECB },
        { .tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE }
    };
    static struct OH_Huks_Param g_decryptParams041[] = {
        { .tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_RSA },
        { .tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_DECRYPT },
        { .tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_RSA_KEY_SIZE_4096 },
        { .tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_OAEP },
        { .tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA384 },
        { .tag = OH_HUKS_TAG_BLOCK_MODE, .uint32Param = OH_HUKS_MODE_ECB },
        { .tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE }
    };

    struct Rsa0100ParamSets paramSets = { nullptr, nullptr, nullptr };
    OH_Huks_Result ret = InitRsa0100ParamSets(&paramSets, g_genParams041, g_encryptParams041, g_decryptParams041);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return -1;
    }

    ret = HksRsaCipherTestCase(&keyAlias, paramSets.genParamSet, paramSets.encryptParamSet,
                               paramSets.decryptParamSet, &inData);
    FreeRsa0100ParamSets(&paramSets);

    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return -1;
    }

    return 0;
}

} // namespace Huks
} // namespace Acts
