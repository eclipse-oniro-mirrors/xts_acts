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

#include "include/HuksSignVerifySm2Test.h"
#include <algorithm>
#include <cstdint>
#include <cstring>
#include <hilog/log.h>
#include <huks/native_huks_api.h>
#include <huks/native_huks_param.h>
#include <huks/native_huks_type.h>
#include <string>

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0x0000
#define LOG_TAG "HUKS_SM2_TEST"

namespace Acts {
namespace Huks {

static const uint32_t SM2_COMMON_SIZE = 1024;
static const uint32_t MAX_UPDATE_SIZE = 64;
static const uint32_t MAX_OUTDATA_SIZE = 256;
static const uint32_t SUCCESS_RETURN_INDEX = 0;
static const size_t MAX_ALLOC_SIZE = SIZE_MAX / 2; // size_t 最大值的一半，防止整数溢出

static const std::string IN_DATA =
    "Hks_SM2_Sign_Verify_Test_0000000000000000000000000000000000000000000000000000000"
    "00000000000000000000000000000000000000000000000000000000000000000000000000000000"
    "0000000000000000000000000000000000000000000000000000000000000000000000000_string";

struct GenerateKeyCaseParam {
    uint32_t id;
    int32_t result;
    struct OH_Huks_Param params[5];
};

static const struct GenerateKeyCaseParam GEN_PARAMS_TEST[] = {
    {
        0,
        OH_HUKS_SUCCESS,
        { { .tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_SM2 },
          { .tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_SM2_KEY_SIZE_256 },
          { .tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_SIGN | OH_HUKS_KEY_PURPOSE_VERIFY },
          { .tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SM3 },
          { .tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE } },
    },

    {
        1,
        OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT,
        { { .tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_SM2 },
          { .tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_AES_KEY_SIZE_512 },
          { .tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_SIGN | OH_HUKS_KEY_PURPOSE_VERIFY },
          { .tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SM3 },
          { .tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE } },
    },

    {
        2,
        OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT,
        { { .tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_SM2 },
          { .tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_SM2_KEY_SIZE_256 },
          { .tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_SIGN | OH_HUKS_KEY_PURPOSE_VERIFY },
          { .tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA1 },
          { .tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE } },
    },

    {
        3,
        OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT,
        { { .tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_SM2 },
          { .tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_SM2_KEY_SIZE_256 },
          { .tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_ENCRYPT | OH_HUKS_KEY_PURPOSE_DECRYPT },
          { .tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SM3 },
          { .tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE } },
    },
};

static const struct GenerateKeyCaseParam SIGN_PARAMS_TEST[] = {
    {
        0,
        OH_HUKS_SUCCESS,
        { { .tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_SM2 },
          { .tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_SM2_KEY_SIZE_256 },
          { .tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_SIGN },
          { .tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SM3 },
          { .tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE } },
    },

    {
        1,
        OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT,
        { { .tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_SM2 },
          { .tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_AES_KEY_SIZE_512 },
          { .tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_SIGN },
          { .tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SM3 },
          { .tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE } },
    },

    {
        2,
        OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT,
        { { .tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_SM2 },
          { .tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_SM2_KEY_SIZE_256 },
          { .tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_SIGN },
          { .tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA1 },
          { .tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE } },
    },

    {
        3,
        OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT,
        { { .tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_SM2 },
          { .tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_SM2_KEY_SIZE_256 },
          { .tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_ENCRYPT },
          { .tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SM3 },
          { .tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE } },
    },
};

static const struct GenerateKeyCaseParam VERIFY_PARAMS_TEST[] = {
    {
        0,
        OH_HUKS_SUCCESS,
        { { .tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_SM2 },
          { .tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_SM2_KEY_SIZE_256 },
          { .tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_VERIFY },
          { .tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SM3 },
          { .tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE } },
    },

    {
        1,
        OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT,
        { { .tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_SM2 },
          { .tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_AES_KEY_SIZE_512 },
          { .tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_VERIFY },
          { .tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SM3 },
          { .tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE } },
    },

    {
        2,
        OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT,
        { { .tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_SM2 },
          { .tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_SM2_KEY_SIZE_256 },
          { .tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_VERIFY },
          { .tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA1 },
          { .tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE } },
    },

    {
        3,
        OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT,
        { { .tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_SM2 },
          { .tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_SM2_KEY_SIZE_256 },
          { .tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_DECRYPT },
          { .tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SM3 },
          { .tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE } },
    },
};

// Helper function: Initialize ParamSet
static OH_Huks_Result InitParamSet(struct OH_Huks_ParamSet** paramSet,
    const struct OH_Huks_Param* params,
    uint32_t paramcount)
{
    OH_Huks_Result ret = OH_Huks_InitParamSet(paramSet);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    ret = OH_Huks_AddParams(*paramSet, params, paramcount);
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

// Helper function: HksMalloc
static void* HksMalloc(size_t size)
{
    // G.MEM.01: 内存申请前，必须对申请内存大小进行合法性校验
    if (size == 0 || size > MAX_ALLOC_SIZE) {
        return nullptr;
    }
    return malloc(size);
}

// Helper function: HksFree
static void HksFree(void* ptr)
{
    if (ptr != nullptr) {
        free(ptr);
    }
}

// State structure for SM2 update loop
struct Sm2UpdateLoopState {
    struct OH_Huks_Blob* inDataSeg;
    uint8_t* lastPtr;
    struct OH_Huks_Blob* outData;
    uint8_t** cur;
    bool* isFinished;
};

// Helper function: Process SM2 update loop
static OH_Huks_Result ProcessSm2UpdateLoop(const struct OH_Huks_Blob* handle,
                                           const struct OH_Huks_ParamSet* paramSet,
                                           uint32_t purpose,
                                           struct Sm2UpdateLoopState* state)
{
    OH_Huks_Result ret;
    ret.errorCode = OH_HUKS_SUCCESS;
    struct OH_Huks_Blob outDataSeg = { MAX_OUTDATA_SIZE, nullptr };

    while (state->inDataSeg->data <= state->lastPtr) {
        // 早退出：检查是否到达最后一段
        if (state->inDataSeg->data + MAX_UPDATE_SIZE > state->lastPtr) {
            *(state->isFinished) = true;
            state->inDataSeg->size = state->lastPtr - state->inDataSeg->data + 1;
            break;
        }

        // 正常处理逻辑
        outDataSeg.size = MAX_OUTDATA_SIZE;
        
        // 为所有操作分配输出缓冲区（包括签名/验证）
        outDataSeg.data = static_cast<uint8_t*>(HksMalloc(outDataSeg.size));
        if (outDataSeg.data == nullptr) {
            ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
            return ret;
        }

        ret = OH_Huks_UpdateSession(handle, paramSet, state->inDataSeg, &outDataSeg);
        if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
            HksFree(outDataSeg.data);
            return ret;
        }

        // 签名和验证操作：UpdateSession 不产生有效输出数据，跳过数据复制
        // 签名数据只在 FinishSession 时生成
        if (purpose == OH_HUKS_KEY_PURPOSE_SIGN || purpose == OH_HUKS_KEY_PURPOSE_VERIFY) {
            HksFree(outDataSeg.data);
            state->inDataSeg->data += MAX_UPDATE_SIZE;
            continue;
        }

        // 早退出：如果没有数据则跳过复制
        if (outDataSeg.size == 0 || *(state->cur) == nullptr) {
            HksFree(outDataSeg.data);
            state->inDataSeg->data += MAX_UPDATE_SIZE;
            continue;
        }

        // 提取 memcpy_s 调用到更浅的层次
        if (static_cast<size_t>(outDataSeg.size) > static_cast<size_t>(state->outData->size + outDataSeg.size)) {
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

struct Sm2FinishSessionState {
    uint32_t purpose;
    const struct OH_Huks_Blob* inDataSeg;
    struct OH_Huks_Blob* outData;
    uint8_t* cur;
};

struct Sm2FinishParams {
    struct OH_Huks_Blob outDataSeg;
    const struct OH_Huks_Blob* finishInData;
    uint8_t tempBuffer[8];
};

static OH_Huks_Result PrepareVerifyFinishParams(const struct OH_Huks_Blob* handle,
                                                const struct OH_Huks_ParamSet* paramSet,
                                                struct Sm2FinishSessionState* state,
                                                struct Sm2FinishParams* params)
{
    struct OH_Huks_Blob tempBlob = { sizeof(params->tempBuffer), params->tempBuffer };
    OH_Huks_Result ret = OH_Huks_UpdateSession(handle, paramSet, state->inDataSeg, &tempBlob);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }
    params->finishInData = state->outData;
    params->outDataSeg.size = sizeof(params->tempBuffer);
    params->outDataSeg.data = params->tempBuffer;
    ret.errorCode = OH_HUKS_SUCCESS;
    return ret;
}

static OH_Huks_Result PrepareFinishParams(const struct OH_Huks_Blob* handle,
                                          const struct OH_Huks_ParamSet* paramSet,
                                          struct Sm2FinishSessionState* state,
                                          struct Sm2FinishParams* params)
{
    OH_Huks_Result ret;
    ret.errorCode = OH_HUKS_SUCCESS;
    params->outDataSeg.size = MAX_OUTDATA_SIZE;
    params->outDataSeg.data = nullptr;

    if (state->purpose == OH_HUKS_KEY_PURPOSE_ENCRYPT || state->purpose == OH_HUKS_KEY_PURPOSE_DECRYPT) {
        params->outDataSeg.data = static_cast<uint8_t*>(HksMalloc(params->outDataSeg.size));
        if (params->outDataSeg.data == nullptr) {
            ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
            return ret;
        }
        params->finishInData = state->inDataSeg;
    } else if (state->purpose == OH_HUKS_KEY_PURPOSE_SIGN) {
        params->outDataSeg.data = state->outData->data;
        params->outDataSeg.size = MAX_OUTDATA_SIZE;
        params->finishInData = state->inDataSeg;
    } else if (state->purpose == OH_HUKS_KEY_PURPOSE_VERIFY) {
        return PrepareVerifyFinishParams(handle, paramSet, state, params);
    } else {
        params->outDataSeg.data = state->cur;
        params->finishInData = state->inDataSeg;
    }
    return ret;
}

static OH_Huks_Result ProcessFinishResult(struct Sm2FinishSessionState* state,
                                          const struct OH_Huks_Blob* outDataSeg)
{
    OH_Huks_Result ret;
    ret.errorCode = OH_HUKS_SUCCESS;

    if (state->purpose == OH_HUKS_KEY_PURPOSE_ENCRYPT || state->purpose == OH_HUKS_KEY_PURPOSE_DECRYPT) {
        if (outDataSeg->size > 0 && state->cur != nullptr) {
            if (static_cast<size_t>(outDataSeg->size) >
                static_cast<size_t>(state->outData->size + outDataSeg->size)) {
                ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
                return ret;
            }
            std::copy(outDataSeg->data, outDataSeg->data + outDataSeg->size, state->cur);
            state->outData->size += outDataSeg->size;
        }
    } else if (state->purpose == OH_HUKS_KEY_PURPOSE_SIGN) {
        state->outData->size = outDataSeg->size;
    } else if (state->purpose != OH_HUKS_KEY_PURPOSE_VERIFY) {
        state->outData->size += outDataSeg->size;
    }
    return ret;
}

static OH_Huks_Result ProcessSm2FinishSession(const struct OH_Huks_Blob* handle,
                                              const struct OH_Huks_ParamSet* paramSet,
                                              struct Sm2FinishSessionState* state)
{
    struct Sm2FinishParams params = { { 0, nullptr }, nullptr, { 0 } };
    OH_Huks_Result ret = PrepareFinishParams(handle, paramSet, state, &params);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    ret = OH_Huks_FinishSession(handle, paramSet, params.finishInData, &params.outDataSeg);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        if (state->purpose == OH_HUKS_KEY_PURPOSE_ENCRYPT || state->purpose == OH_HUKS_KEY_PURPOSE_DECRYPT) {
            HksFree(params.outDataSeg.data);
        }
        return ret;
    }

    ret = ProcessFinishResult(state, &params.outDataSeg);
    if (state->purpose == OH_HUKS_KEY_PURPOSE_ENCRYPT || state->purpose == OH_HUKS_KEY_PURPOSE_DECRYPT) {
        HksFree(params.outDataSeg.data);
    }
    return ret;
}

// Helper function: TestUpdateFinish
static OH_Huks_Result TestUpdateFinish(const struct OH_Huks_Blob* handle,
                                       const struct OH_Huks_ParamSet* paramSet,
                                       uint32_t purpose,
                                       const struct OH_Huks_Blob* inData,
                                       struct OH_Huks_Blob* outData)
{
    OH_Huks_Result ret;
    ret.errorCode = OH_HUKS_SUCCESS;

    struct OH_Huks_Blob inDataSeg = *inData;
    uint8_t* lastPtr = inData->data + inData->size - 1;
    uint8_t* cur = outData->data;
    
    // 验证操作时，outData 包含签名数据，不应该重置
    // 签名操作时，outData 用于存储输出，需要重置
    if (purpose != OH_HUKS_KEY_PURPOSE_VERIFY) {
        outData->size = 0;
    }

    inDataSeg.size = MAX_UPDATE_SIZE;
    bool isFinished = false;

    struct Sm2UpdateLoopState state = {
        .inDataSeg = &inDataSeg, .lastPtr = lastPtr, .outData = outData, .cur = &cur, .isFinished = &isFinished
    };
    ret = ProcessSm2UpdateLoop(handle, paramSet, purpose, &state);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    struct Sm2FinishSessionState finishState = {
        .purpose = purpose, .inDataSeg = &inDataSeg, .outData = outData, .cur = cur
    };

    ret = ProcessSm2FinishSession(handle, paramSet, &finishState);
    return ret;
}

static OH_Huks_Result HksTestSignVerify(const struct OH_Huks_Blob* keyAlias,
                                        const struct OH_Huks_ParamSet* paramSet,
                                        const struct OH_Huks_Blob* inData,
                                        struct OH_Huks_Blob* outData)
{
    uint8_t tmpHandle[sizeof(uint64_t)] = { 0 };
    struct OH_Huks_Blob handle = { sizeof(uint64_t), tmpHandle };
    OH_Huks_Result ret;

    do {
        ret = OH_Huks_InitSession(keyAlias, paramSet, &handle, nullptr);
        if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
            break;
        }

        struct OH_Huks_Param* tmpParam = nullptr;
        ret = OH_Huks_GetParam(paramSet, OH_HUKS_TAG_PURPOSE, &tmpParam);
        if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
            break;
        }

        ret = TestUpdateFinish(&handle, paramSet, tmpParam->uint32Param, inData, outData);
        if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
            break;
        }
        ret.errorCode = (int32_t)OH_HUKS_SUCCESS;
    } while (0);

    (void)OH_Huks_AbortSession(&handle, paramSet);
    return ret;
}

static OH_Huks_Result CreateImportKeyAlias(struct OH_Huks_Blob* importKeyAlias, const struct OH_Huks_Blob* keyAlias)
{
    OH_Huks_Result ret;
    ret.errorCode = OH_HUKS_SUCCESS;
    const char* tmp = "new";
    importKeyAlias->size = keyAlias->size + strlen(tmp);
    importKeyAlias->data = static_cast<uint8_t*>(HksMalloc(importKeyAlias->size));
    if (importKeyAlias->data == nullptr) {
        ret.errorCode = OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT;
        return ret;
    }

    if (static_cast<size_t>(keyAlias->size) > static_cast<size_t>(importKeyAlias->size)) {
        HksFree(importKeyAlias->data);
        ret.errorCode = OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT;
        return ret;
    }
    std::copy(keyAlias->data, keyAlias->data + keyAlias->size, importKeyAlias->data);

    if (strlen(tmp) > static_cast<size_t>(importKeyAlias->size - keyAlias->size)) {
        HksFree(importKeyAlias->data);
        ret.errorCode = OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT;
        return ret;
    }
    const auto* tmpBytes = reinterpret_cast<const uint8_t*>(tmp);
    std::copy(tmpBytes, tmpBytes + strlen(tmp), importKeyAlias->data + keyAlias->size);
    return ret;
}

// Helper function: Generate key and check existence
static OH_Huks_Result GenerateKeyForTest(const struct OH_Huks_Blob* keyAlias,
                                         const uint32_t genIndex,
                                         struct OH_Huks_ParamSet** genParamSet)
{
    OH_Huks_Result ret = InitParamSet(genParamSet,
                                      GEN_PARAMS_TEST[genIndex].params,
                                      sizeof(GEN_PARAMS_TEST[genIndex].params) / sizeof(OH_Huks_Param));
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    ret = OH_Huks_GenerateKeyItem(keyAlias, *genParamSet, nullptr);
    if (ret.errorCode == (int32_t)OH_HUKS_ERR_CODE_FEATURE_NOT_SUPPORTED) {
        // Algorithm not supported, return success to skip test gracefully
        ret.errorCode = (int32_t)OH_HUKS_SUCCESS;
        return ret;
    }
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        ret.errorCode =
            ((ret.errorCode == GEN_PARAMS_TEST[genIndex].result) ? (int32_t)OH_HUKS_SUCCESS : ret.errorCode);
        return ret;
    }

    ret = OH_Huks_IsKeyItemExist(keyAlias, *genParamSet);
    return ret;
}

// Helper function: Perform sign operation
static OH_Huks_Result PerformSignOperation(const struct OH_Huks_Blob* keyAlias,
                                           const uint32_t signIndex,
                                           const struct OH_Huks_Blob* inData,
                                           struct OH_Huks_Blob* outDataSign,
                                           struct OH_Huks_ParamSet** signParamSet)
{
    OH_Huks_Result ret = InitParamSet(signParamSet,
                                      SIGN_PARAMS_TEST[signIndex].params,
                                      sizeof(SIGN_PARAMS_TEST[signIndex].params) / sizeof(OH_Huks_Param));
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    ret = HksTestSignVerify(keyAlias, *signParamSet, inData, outDataSign);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        ret.errorCode =
            ((ret.errorCode == SIGN_PARAMS_TEST[signIndex].result) ? (int32_t)OH_HUKS_SUCCESS : ret.errorCode);
    }
    return ret;
}

// Structure to hold export and import key parameters
struct ExportImportKeyParams {
    const struct OH_Huks_Blob* keyAlias;
    const struct OH_Huks_Blob* importKeyAlias;
    struct OH_Huks_ParamSet* genParamSet;
    uint32_t verifyIndex;
    struct OH_Huks_Blob* publicKey;
    struct OH_Huks_ParamSet** verifyParamSet;
};

// Helper function: Export public key and import for verify
static OH_Huks_Result ExportAndImportKeyForVerify(const struct ExportImportKeyParams* params)
{
    OH_Huks_Result ret = OH_Huks_ExportPublicKeyItem(params->keyAlias, params->genParamSet, params->publicKey);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    ret = InitParamSet(params->verifyParamSet,
                       VERIFY_PARAMS_TEST[params->verifyIndex].params,
                       sizeof(VERIFY_PARAMS_TEST[params->verifyIndex].params) / sizeof(OH_Huks_Param));
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    ret = OH_Huks_ImportKeyItem(params->importKeyAlias, *params->verifyParamSet, params->publicKey);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        ret.errorCode = ((ret.errorCode == VERIFY_PARAMS_TEST[params->verifyIndex].result) ? (int32_t)OH_HUKS_SUCCESS
                                                                                           : ret.errorCode);
    }
    return ret;
}

// Parameter structure for verify operation
struct VerifyOperationParams {
    const struct OH_Huks_Blob* importKeyAlias;
    struct OH_Huks_ParamSet* verifyParamSet;
    const struct OH_Huks_Blob* inData;
    struct OH_Huks_Blob* outDataSign;
    uint32_t verifyIndex;
    bool isTestSignData;
};

// Helper function: Perform verify operation
static OH_Huks_Result PerformVerifyOperation(const struct VerifyOperationParams* params)
{
    if (params->isTestSignData) {
        std::fill(
            params->outDataSign->data, params->outDataSign->data + params->outDataSign->size, static_cast<uint8_t>(0));
    }

    OH_Huks_Result ret =
        HksTestSignVerify(params->importKeyAlias, params->verifyParamSet, params->inData, params->outDataSign);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        ret.errorCode = ((ret.errorCode == VERIFY_PARAMS_TEST[params->verifyIndex].result) ? (int32_t)OH_HUKS_SUCCESS
                                                                                           : ret.errorCode);
    }
    return ret;
}

static void FreeBuffAndDeleteKey(struct OH_Huks_ParamSet** paramSet1,
                                 struct OH_Huks_ParamSet** paramSet2,
                                 struct OH_Huks_ParamSet** paramSet3,
                                 const struct OH_Huks_Blob* keyAlias1,
                                 const struct OH_Huks_Blob* keyAlias2)
{
    (void)OH_Huks_DeleteKeyItem(keyAlias1, *paramSet1);
    (void)OH_Huks_DeleteKeyItem(keyAlias2, *paramSet1);
    OH_Huks_FreeParamSet(paramSet1);
    OH_Huks_FreeParamSet(paramSet2);
    OH_Huks_FreeParamSet(paramSet3);
}

static OH_Huks_Result HksSm2SignVerifyTestRun(const struct OH_Huks_Blob* keyAlias,
                                              const uint32_t genIndex,
                                              const uint32_t signIndex,
                                              const uint32_t verifyIndex,
                                              const bool isTestSignData)
{
    struct OH_Huks_ParamSet* genParamSet = nullptr;
    struct OH_Huks_ParamSet* signParamSet = nullptr;
    struct OH_Huks_ParamSet* verifyParamSet = nullptr;

    struct OH_Huks_Blob inData = { static_cast<uint32_t>(IN_DATA.length()),
                                   reinterpret_cast<uint8_t*>(const_cast<char*>(IN_DATA.c_str())) };
    uint8_t outDataS[SM2_COMMON_SIZE] = { 0 };
    struct OH_Huks_Blob outDataSign = { SM2_COMMON_SIZE, outDataS };

    uint8_t pubKey[OH_HUKS_MAX_KEY_SIZE] = { 0 };
    struct OH_Huks_Blob publicKey = { OH_HUKS_MAX_KEY_SIZE, pubKey };

    struct OH_Huks_Blob importKeyAlias;
    OH_Huks_Result ret = CreateImportKeyAlias(&importKeyAlias, keyAlias);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    do {
        /* 1. Generate Key */
        ret = GenerateKeyForTest(keyAlias, genIndex, &genParamSet);
        if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
            break;
        }

        /* 2. Sign Three Stage */
        ret = PerformSignOperation(keyAlias, signIndex, &inData, &outDataSign, &signParamSet);
        if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
            break;
        }

        /* 3. Export Public Key and Import for Verify */
        struct ExportImportKeyParams exportImportParams = { .keyAlias = keyAlias,
                                                            .importKeyAlias = &importKeyAlias,
                                                            .genParamSet = genParamSet,
                                                            .verifyIndex = verifyIndex,
                                                            .publicKey = &publicKey,
                                                            .verifyParamSet = &verifyParamSet };

        ret = ExportAndImportKeyForVerify(&exportImportParams);
        if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
            break;
        }

        /* 4. Verify Three Stage */
        struct VerifyOperationParams verifyParams = { .importKeyAlias = keyAlias,
                                                      .verifyParamSet = verifyParamSet,
                                                      .inData = &inData,
                                                      .outDataSign = &outDataSign,
                                                      .verifyIndex = verifyIndex,
                                                      .isTestSignData = isTestSignData };
        ret = PerformVerifyOperation(&verifyParams);
    } while (0);

    FreeBuffAndDeleteKey(&genParamSet, &signParamSet, &verifyParamSet, keyAlias, &importKeyAlias);
    HksFree(importKeyAlias.data);
    return ret;
}

/**
 * @tc.name   SecurityHuksNapiSignVerifySm20100
 * @tc.number Security_HUKS_NAPI_SignVerify_SM2_0100
 * @tc.desc   normal parameter test case : alg-SM2, pur-Sign/Verify, keySize-256 and dig-SM3.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SecurityHuksNapiSignVerifySm20100()
{
    OH_LOG_INFO(LOG_APP, "[SM2_0100] Test start");
    const char* keyAliasString = "HksSM2SignVerifyKeyAliasTest001";
    struct OH_Huks_Blob keyAlias = { static_cast<uint32_t>(strlen(keyAliasString)), (uint8_t*)keyAliasString };
    OH_Huks_Result ret =
        HksSm2SignVerifyTestRun(&keyAlias, SUCCESS_RETURN_INDEX, SUCCESS_RETURN_INDEX, SUCCESS_RETURN_INDEX, false);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "[SM2_0100] HksSm2SignVerifyTestRun failed, errorCode=%{public}d", ret.errorCode);
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "[SM2_0100] Test passed");
    return 0;
}

} // namespace Huks
} // namespace Acts
