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

#include "include/HuksWrappedTest.h"
#include <algorithm>
#include <cstdint>
#include <cstring>
#include <huks/native_huks_api.h>
#include <huks/native_huks_param.h>
#include <huks/native_huks_type.h>
#include <string>

namespace Acts {
namespace Huks {

// Constants from huks_wrapped_test_common.h
static const uint32_t IV_SIZE = 16;
static uint8_t g_iv[IV_SIZE] = "bababababababab";

static const uint32_t AAD_SIZE = 16;
static uint8_t g_aad[AAD_SIZE] = "abababababababa";

static const uint32_t NONCE_SIZE = 12;
static uint8_t g_nonce[NONCE_SIZE] = "hahahahahah";

static const uint32_t AEAD_TAG_SIZE = 16;
static const uint32_t X25519_256_SIZE = 256;
static const uint32_t BITS_PER_BYTE = 8; // Bits per byte constant for key size conversion

// Structure definition
struct HksImportWrappedKeyTestParams {
    struct OH_Huks_Blob* wrappingKeyAlias;
    struct OH_Huks_Blob* agreeKeyAlgName;
    struct OH_Huks_ParamSet* genWrappingKeyParamSet;
    uint32_t publicKeySize;

    struct OH_Huks_Blob* callerKeyAlias;
    struct OH_Huks_ParamSet* genCallerKeyParamSet;

    struct OH_Huks_Blob* callerKekAlias;
    struct OH_Huks_Blob* callerKek;
    struct OH_Huks_ParamSet* importCallerKekParamSet;

    struct OH_Huks_Blob* callerAgreeKeyAlias;
    struct OH_Huks_ParamSet* agreeParamSet;

    struct OH_Huks_ParamSet* importWrappedKeyParamSet;
    struct OH_Huks_Blob* importedKeyAlias;
    struct OH_Huks_Blob* importedPlainKey;
    uint32_t keyMaterialLen;
};

// Test data
static struct OH_Huks_Blob g_wrappingKeyAliasAes256 = { .size = static_cast<uint32_t>(
                                                            strlen("test_wrappingKey_x25519_aes256")),
                                                        .data = (uint8_t*)"test_wrappingKey_x25519_aes256" };

static struct OH_Huks_Blob g_callerKeyAliasAes256 = { .size = static_cast<uint32_t>(
                                                          strlen("test_caller_key_x25519_aes256")),
                                                      .data = (uint8_t*)"test_caller_key_x25519_aes256" };

static struct OH_Huks_Blob g_callerKekAliasAes256 = { .size = static_cast<uint32_t>(
                                                          strlen("test_caller_kek_x25519_aes256")),
                                                      .data = (uint8_t*)"test_caller_kek_x25519_aes256" };

static struct OH_Huks_Blob g_callerAes256Kek = { .size =
                                                     static_cast<uint32_t>(strlen("This is kek to encrypt plain key")),
                                                 .data = (uint8_t*)"This is kek to encrypt plain key" };

static struct OH_Huks_Blob g_callerAgreeKeyAliasAes256 = { .size = static_cast<uint32_t>(
                                                               strlen("test_caller_agree_key_x25519_aes256")),
                                                           .data = (uint8_t*)"test_caller_agree_key_x25519_aes256" };

static struct OH_Huks_Blob g_importedKeyAliasAes256 = { .size = static_cast<uint32_t>(
                                                            strlen("test_import_key_x25519_aes256")),
                                                        .data = (uint8_t*)"test_import_key_x25519_aes256" };

static struct OH_Huks_Blob g_importedAes256PlainKey = { .size = static_cast<uint32_t>(
                                                            strlen("This is plain key to be imported")),
                                                        .data = (uint8_t*)"This is plain key to be imported" };

static struct OH_Huks_Param g_importWrappedAes256Params[] = {
    { .tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_AES },
    { .tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_ENCRYPT | OH_HUKS_KEY_PURPOSE_DECRYPT },
    { .tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_AES_KEY_SIZE_256 },
    { .tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_NONE },
    { .tag = OH_HUKS_TAG_BLOCK_MODE, .uint32Param = OH_HUKS_MODE_GCM },
    { .tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_NONE },
    { .tag = OH_HUKS_TAG_UNWRAP_ALGORITHM_SUITE, .uint32Param = OH_HUKS_UNWRAP_SUITE_X25519_AES_256_GCM_NOPADDING },
    { .tag = OH_HUKS_TAG_ASSOCIATED_DATA, .blob = { .size = AAD_SIZE, .data = (uint8_t*)g_aad } },
    { .tag = OH_HUKS_TAG_NONCE, .blob = { .size = NONCE_SIZE, .data = (uint8_t*)g_nonce } },
    { .tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE }
};

static char g_agreeKeyAlgName[] = "X25519";
static struct OH_Huks_Blob g_agreeKeyAlgNameBlob = { .size = sizeof(g_agreeKeyAlgName),
                                                     .data = (uint8_t*)g_agreeKeyAlgName };

static const uint32_t X25519_PUB_KEY_SIZE = 32;

static struct OH_Huks_Param g_genWrappingKeyParams[] = {
    { .tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_X25519 },
    { .tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_UNWRAP },
    { .tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_CURVE25519_KEY_SIZE_256 },
    { .tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE }
};

static struct OH_Huks_Param g_genCallerX25519Params[] = {
    { .tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_X25519 },
    { .tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_AGREE },
    { .tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_CURVE25519_KEY_SIZE_256 },
    { .tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE }
};

static struct OH_Huks_Param g_importParamsCallerKek[] = {
    { .tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_AES },
    { .tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_ENCRYPT },
    { .tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_AES_KEY_SIZE_256 },
    { .tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_NONE },
    { .tag = OH_HUKS_TAG_BLOCK_MODE, .uint32Param = OH_HUKS_MODE_GCM },
    { .tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_NONE },
    { .tag = OH_HUKS_TAG_IV, .blob = { .size = IV_SIZE, .data = (uint8_t*)g_iv } },
    { .tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE }
};

static struct OH_Huks_Param g_callerAgreeParams[] = {
    { .tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_X25519 },
    { .tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_AGREE },
    { .tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_CURVE25519_KEY_SIZE_256 },
    { .tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE }
};

static struct OH_Huks_Param g_aesKekEncryptParams[] = {
    { .tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_AES },
    { .tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_ENCRYPT },
    { .tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_AES_KEY_SIZE_256 },
    { .tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_NONE },
    { .tag = OH_HUKS_TAG_BLOCK_MODE, .uint32Param = OH_HUKS_MODE_GCM },
    { .tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_NONE },
    { .tag = OH_HUKS_TAG_ASSOCIATED_DATA, .blob = { .size = AAD_SIZE, .data = (uint8_t*)g_aad } },
    { .tag = OH_HUKS_TAG_NONCE, .blob = { .size = NONCE_SIZE, .data = (uint8_t*)g_nonce } },
    { .tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE }
};

static struct OH_Huks_Param g_importAgreeKeyParams[] = {
    { .tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_AES },
    { .tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_ENCRYPT },
    { .tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_AES_KEY_SIZE_256 },
    { .tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_NONE },
    { .tag = OH_HUKS_TAG_BLOCK_MODE, .uint32Param = OH_HUKS_MODE_GCM },
    { .tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_NONE },
    { .tag = OH_HUKS_TAG_IV, .blob = { .size = IV_SIZE, .data = (uint8_t*)g_iv } },
    { .tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE }
};

// Memory allocation limit constant
static const size_t MAX_ALLOC_SIZE = SIZE_MAX / 2; // Half of size_t max value to prevent overflow

// Helper functions
static void* HksMalloc(size_t size)
{
    // G.MEM.01: Validate memory size before allocation
    if (size == 0 || size > MAX_ALLOC_SIZE) {
        return nullptr;
    }
    return malloc(size);
}

static void HksFree(void* ptr)
{
    if (ptr != nullptr) {
        free(ptr);
    }
}

// Helper function: Free blob data safely
static inline void HUKS_FREE_BLOB(struct OH_Huks_Blob& blob)
{
    if (blob.data != nullptr) {
        HksFree(blob.data);
        blob.data = nullptr;
    }
    blob.size = 0;
}

// Helper function: Convert key size from bits to bytes (G.PRE.02-CPP)
static inline uint32_t OH_HUKS_KEY_BYTES(uint32_t keySize)
{
    return (keySize + BITS_PER_BYTE - 1) / BITS_PER_BYTE;
}

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

static OH_Huks_Result MallocAndCheckBlobData(struct OH_Huks_Blob* blob, const uint32_t blobSize)
{
    OH_Huks_Result ret;
    ret.errorCode = OH_HUKS_SUCCESS;

    blob->data = (uint8_t*)HksMalloc(blobSize);
    if (blob->data == nullptr) {
        ret.errorCode = OH_HUKS_ERR_CODE_INSUFFICIENT_MEMORY;
    }
    return ret;
}

static OH_Huks_Result HuksEncrypt(const struct OH_Huks_Blob* key,
                                  const struct OH_Huks_ParamSet* paramSet,
                                  const struct OH_Huks_Blob* plainText,
                                  struct OH_Huks_Blob* cipherText)
{
    uint8_t tmpHandle[sizeof(uint64_t)] = { 0 };
    struct OH_Huks_Blob handle = { sizeof(uint64_t), tmpHandle };
    OH_Huks_Result ret;

    ret = OH_Huks_InitSession(key, paramSet, &handle, nullptr);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    ret = OH_Huks_FinishSession(&handle, paramSet, plainText, cipherText);
    return ret;
}

static OH_Huks_Result HuksAgreeKey(const struct OH_Huks_ParamSet* paramSet,
                                   const struct OH_Huks_Blob* keyAlias,
                                   const struct OH_Huks_Blob* peerPublicKey,
                                   struct OH_Huks_Blob* agreedKey)
{
    uint8_t tmpHandle[sizeof(uint64_t)] = { 0 };
    struct OH_Huks_Blob handle = { sizeof(uint64_t), tmpHandle };
    OH_Huks_Result ret;

    ret = OH_Huks_InitSession(keyAlias, paramSet, &handle, nullptr);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    ret = OH_Huks_UpdateSession(&handle, paramSet, peerPublicKey, agreedKey);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_AbortSession(&handle, paramSet);
        return ret;
    }

    struct OH_Huks_Blob outData = { 0, nullptr };
    ret = OH_Huks_FinishSession(&handle, paramSet, peerPublicKey, &outData);
    return ret;
}

static OH_Huks_Result BuildWrappedKeyData(struct OH_Huks_Blob** blobArray, uint32_t size, struct OH_Huks_Blob* outData)
{
    uint32_t totalLength = size * sizeof(uint32_t);
    OH_Huks_Result ret;
    ret.errorCode = OH_HUKS_SUCCESS;

    for (uint32_t i = 0; i < size; ++i) {
        totalLength += blobArray[i]->size;
    }

    struct OH_Huks_Blob outBlob = { 0, nullptr };
    outBlob.size = totalLength;
    ret = MallocAndCheckBlobData(&outBlob, outBlob.size);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    uint32_t offset = 0;

    for (uint32_t i = 0; i < size; ++i) {
        const auto* sizePtr = reinterpret_cast<const uint8_t*>(&blobArray[i]->size);
        if (sizeof(blobArray[i]->size) > static_cast<size_t>(totalLength - offset)) {
            HksFree(outBlob.data);
            ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
            return ret;
        }
        std::copy(sizePtr, sizePtr + sizeof(blobArray[i]->size), outBlob.data + offset);
        offset += sizeof(blobArray[i]->size);

        if (static_cast<size_t>(blobArray[i]->size) > static_cast<size_t>(totalLength - offset)) {
            HksFree(outBlob.data);
            ret.errorCode = OH_HUKS_ERR_CODE_INTERNAL_ERROR;
            return ret;
        }
        std::copy(blobArray[i]->data, blobArray[i]->data + blobArray[i]->size, outBlob.data + offset);
        offset += blobArray[i]->size;
    }

    outData->size = outBlob.size;
    outData->data = outBlob.data;
    return ret;
}

static OH_Huks_Result CheckParamsValid(const struct HksImportWrappedKeyTestParams* params)
{
    OH_Huks_Result ret;
    ret.errorCode = OH_HUKS_SUCCESS;
    if (params == nullptr) {
        ret.errorCode = OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT;
        return ret;
    }

    if (params->wrappingKeyAlias == nullptr || params->genWrappingKeyParamSet == nullptr ||
        params->agreeKeyAlgName == nullptr || params->callerKeyAlias == nullptr ||
        params->genCallerKeyParamSet == nullptr || params->callerKekAlias == nullptr || params->callerKek == nullptr ||
        params->importCallerKekParamSet == nullptr || params->callerAgreeKeyAlias == nullptr ||
        params->agreeParamSet == nullptr || params->importWrappedKeyParamSet == nullptr ||
        params->importedKeyAlias == nullptr || params->importedPlainKey == nullptr) {
        ret.errorCode = OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT;
        return ret;
    }
    return ret;
}

static int GenerateAndExportHuksPublicKey(const struct HksImportWrappedKeyTestParams* params,
                                          struct OH_Huks_Blob* huksPublicKey)
{
    OH_Huks_Result ret = OH_Huks_GenerateKeyItem(params->wrappingKeyAlias, params->genWrappingKeyParamSet, nullptr);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret.errorCode;
    }
    huksPublicKey->size = params->publicKeySize;

    ret = MallocAndCheckBlobData(huksPublicKey, huksPublicKey->size);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret.errorCode;
    }

    ret = OH_Huks_ExportPublicKeyItem(params->wrappingKeyAlias, params->genWrappingKeyParamSet, huksPublicKey);
    return ret.errorCode;
}

static int GenerateAndExportCallerPublicKey(const struct HksImportWrappedKeyTestParams* params,
                                            struct OH_Huks_Blob* callerSelfPublicKey)
{
    OH_Huks_Result ret = OH_Huks_GenerateKeyItem(params->callerKeyAlias, params->genCallerKeyParamSet, nullptr);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret.errorCode;
    }

    callerSelfPublicKey->size = params->publicKeySize;
    ret = MallocAndCheckBlobData(callerSelfPublicKey, callerSelfPublicKey->size);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret.errorCode;
    }

    ret = OH_Huks_ExportPublicKeyItem(params->callerKeyAlias, params->genWrappingKeyParamSet, callerSelfPublicKey);
    return ret.errorCode;
}

static int ImportKekAndAgreeSharedSecret(const struct HksImportWrappedKeyTestParams* params,
                                         const struct OH_Huks_Blob* huksPublicKey,
                                         struct OH_Huks_Blob* outSharedKey)
{
    OH_Huks_Result ret =
        OH_Huks_ImportKeyItem(params->callerKekAlias, params->importCallerKekParamSet, params->callerKek);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret.errorCode;
    }

    ret = MallocAndCheckBlobData(outSharedKey, outSharedKey->size);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret.errorCode;
    }

    ret = HuksAgreeKey(params->agreeParamSet, params->callerKeyAlias, huksPublicKey, outSharedKey);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret.errorCode;
    }

    struct OH_Huks_ParamSet* importAgreeKeyParams = nullptr;
    ret = InitParamSet(
        &importAgreeKeyParams, g_importAgreeKeyParams, sizeof(g_importAgreeKeyParams) / sizeof(OH_Huks_Param));
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret.errorCode;
    }

    ret = OH_Huks_ImportKeyItem(params->callerAgreeKeyAlias, importAgreeKeyParams, outSharedKey);
    OH_Huks_FreeParamSet(&importAgreeKeyParams);
    return ret.errorCode;
}

static int EncryptImportedPlainKeyAndKek(const struct HksImportWrappedKeyTestParams* params,
                                         struct OH_Huks_Blob* plainCipherText,
                                         struct OH_Huks_Blob* kekCipherText)
{
    struct OH_Huks_ParamSet* encryptParamSet = nullptr;
    OH_Huks_Result ret =
        InitParamSet(&encryptParamSet, g_aesKekEncryptParams, sizeof(g_aesKekEncryptParams) / sizeof(OH_Huks_Param));
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret.errorCode;
    }

    ret = HuksEncrypt(params->callerKekAlias, encryptParamSet, params->importedPlainKey, plainCipherText);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(&encryptParamSet);
        return ret.errorCode;
    }

    ret = HuksEncrypt(params->callerAgreeKeyAlias, encryptParamSet, params->callerKek, kekCipherText);
    OH_Huks_FreeParamSet(&encryptParamSet);
    return ret.errorCode;
}

static int ImportWrappedKey(const struct HksImportWrappedKeyTestParams* params,
                            struct OH_Huks_Blob* plainCipher,
                            struct OH_Huks_Blob* kekCipherText,
                            struct OH_Huks_Blob* peerPublicKey,
                            struct OH_Huks_Blob* wrappedKeyData)
{
    struct OH_Huks_Blob commonAad = { .size = AAD_SIZE, .data = reinterpret_cast<uint8_t*>(g_aad) };
    struct OH_Huks_Blob commonNonce = { .size = NONCE_SIZE, .data = reinterpret_cast<uint8_t*>(g_nonce) };
    struct OH_Huks_Blob keyMaterialLen = { .size = sizeof(uint32_t), .data = (uint8_t*)&params->keyMaterialLen };

    const uint32_t tagSize = AEAD_TAG_SIZE;
    uint8_t kekTagBuf[tagSize] = { 0 };
    struct OH_Huks_Blob kekTag = { .size = tagSize, .data = kekTagBuf };
    if (tagSize > sizeof(kekTagBuf)) {
        return OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT;
    }
    std::copy(plainCipher->data + (plainCipher->size - tagSize), plainCipher->data + plainCipher->size, kekTag.data);
    plainCipher->size -= tagSize;

    uint8_t agreeKeyTagBuf[tagSize] = { 0 };
    struct OH_Huks_Blob agreeKeyTag = { .size = tagSize, .data = agreeKeyTagBuf };
    if (tagSize > sizeof(agreeKeyTagBuf)) {
        return OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT;
    }
    std::copy(kekCipherText->data + (kekCipherText->size - tagSize),
              kekCipherText->data + kekCipherText->size,
              agreeKeyTagBuf);
    kekCipherText->size -= tagSize;

    struct OH_Huks_Blob* blobArray[] = { peerPublicKey, &commonAad,   &commonNonce, &agreeKeyTag,    kekCipherText,
                                         &commonAad,    &commonNonce, &kekTag,      &keyMaterialLen, plainCipher };
    OH_Huks_Result ret = BuildWrappedKeyData(blobArray, OH_HUKS_IMPORT_WRAPPED_KEY_TOTAL_BLOBS, wrappedKeyData);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret.errorCode;
    }

    struct OH_Huks_Param* purpose = nullptr;
    ret = OH_Huks_GetParam(params->importWrappedKeyParamSet, OH_HUKS_TAG_PURPOSE, &purpose);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret.errorCode;
    }

    ret = OH_Huks_ImportWrappedKeyItem(
        params->importedKeyAlias, params->wrappingKeyAlias, params->importWrappedKeyParamSet, wrappedKeyData);

    if (purpose->uint32Param == (uint32_t)OH_HUKS_KEY_PURPOSE_UNWRAP) {
        return (ret.errorCode == (int32_t)OH_HUKS_ERR_CODE_INVALID_CRYPTO_ALG_ARGUMENT) ? 0 : ret.errorCode;
    } else {
        return (ret.errorCode == (int32_t)OH_HUKS_SUCCESS) ? 0 : ret.errorCode;
    }
}

static int HksImportWrappedKeyTestCommonCase(const struct HksImportWrappedKeyTestParams* params)
{
    OH_Huks_Result ret = CheckParamsValid(params);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret.errorCode;
    }

    struct OH_Huks_Blob huksPublicKey = { 0, nullptr };
    struct OH_Huks_Blob callerSelfPublicKey = { 0, nullptr };
    struct OH_Huks_Blob outSharedKey = { .size = OH_HUKS_KEY_BYTES(OH_HUKS_AES_KEY_SIZE_256), .data = nullptr };
    struct OH_Huks_Blob wrappedKeyData = { 0, nullptr };
    uint8_t plainKeyCipherBuffer[OH_HUKS_MAX_KEY_SIZE] = { 0 };
    struct OH_Huks_Blob plainCipherText = { OH_HUKS_MAX_KEY_SIZE, plainKeyCipherBuffer };
    uint8_t kekCipherTextBuffer[OH_HUKS_MAX_KEY_SIZE] = { 0 };
    struct OH_Huks_Blob kekCipherText = { OH_HUKS_MAX_KEY_SIZE, kekCipherTextBuffer };

    int result = 0;
    do {
        result = GenerateAndExportHuksPublicKey(params, &huksPublicKey);
        if (result != 0) {
            break;
        }

        result = GenerateAndExportCallerPublicKey(params, &callerSelfPublicKey);
        if (result != 0) {
            break;
        }

        result = ImportKekAndAgreeSharedSecret(params, &huksPublicKey, &outSharedKey);
        if (result != 0) {
            break;
        }

        result = EncryptImportedPlainKeyAndKek(params, &plainCipherText, &kekCipherText);
        if (result != 0) {
            break;
        }

        result = ImportWrappedKey(params, &plainCipherText, &kekCipherText, &callerSelfPublicKey, &wrappedKeyData);
    } while (0);

    HUKS_FREE_BLOB(huksPublicKey);
    HUKS_FREE_BLOB(callerSelfPublicKey);
    HUKS_FREE_BLOB(outSharedKey);
    HUKS_FREE_BLOB(wrappedKeyData);

    return result;
}

static void HksClearKeysForWrappedKeyTest(const struct HksImportWrappedKeyTestParams* params)
{
    OH_Huks_Result ret = CheckParamsValid(params);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return;
    }
    (void)OH_Huks_DeleteKeyItem(params->wrappingKeyAlias, params->genWrappingKeyParamSet);
    (void)OH_Huks_DeleteKeyItem(params->callerKeyAlias, params->genCallerKeyParamSet);
    (void)OH_Huks_DeleteKeyItem(params->callerKekAlias, params->importCallerKekParamSet);
    (void)OH_Huks_DeleteKeyItem(params->callerAgreeKeyAlias, params->agreeParamSet);
    (void)OH_Huks_DeleteKeyItem(params->importedKeyAlias, params->importWrappedKeyParamSet);
}

// Structure to hold wrapped key parameter set output
struct WrappedKeyParamSetOutput {
    struct OH_Huks_ParamSet** genX25519KeyParamSet;
    struct OH_Huks_ParamSet** genCallerKeyParamSet;
    struct OH_Huks_ParamSet** callerImportParamsKek;
    struct OH_Huks_ParamSet** agreeParamSet;
    struct OH_Huks_ParamSet** importPlainKeyParams;
};

// Structure to hold wrapped key input parameters
struct WrappedKeyInputParams {
    const struct OH_Huks_Param* importedKeyParamSetArray;
    uint32_t arraySize;
};

static OH_Huks_Result InitAllWrappedKeyParamSets(const struct WrappedKeyParamSetOutput* output,
                                                 const struct WrappedKeyInputParams* input)
{
    OH_Huks_Result ret = InitParamSet(
        output->genX25519KeyParamSet, g_genWrappingKeyParams, sizeof(g_genWrappingKeyParams) / sizeof(OH_Huks_Param));
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    ret = InitParamSet(
        output->genCallerKeyParamSet, g_genCallerX25519Params, sizeof(g_genCallerX25519Params) / sizeof(OH_Huks_Param));
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(output->genX25519KeyParamSet);
        return ret;
    }

    ret = InitParamSet(output->callerImportParamsKek,
                       g_importParamsCallerKek,
                       sizeof(g_importParamsCallerKek) / sizeof(OH_Huks_Param));
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(output->genX25519KeyParamSet);
        OH_Huks_FreeParamSet(output->genCallerKeyParamSet);
        return ret;
    }

    ret = InitParamSet(output->agreeParamSet, g_callerAgreeParams, sizeof(g_callerAgreeParams) / sizeof(OH_Huks_Param));
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(output->genX25519KeyParamSet);
        OH_Huks_FreeParamSet(output->genCallerKeyParamSet);
        OH_Huks_FreeParamSet(output->callerImportParamsKek);
        return ret;
    }

    ret = InitParamSet(output->importPlainKeyParams, input->importedKeyParamSetArray, input->arraySize);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(output->genX25519KeyParamSet);
        OH_Huks_FreeParamSet(output->genCallerKeyParamSet);
        OH_Huks_FreeParamSet(output->callerImportParamsKek);
        OH_Huks_FreeParamSet(output->agreeParamSet);
        return ret;
    }

    return ret;
}

static void FreeAllWrappedKeyParamSets(struct OH_Huks_ParamSet** genX25519KeyParamSet,
                                       struct OH_Huks_ParamSet** genCallerKeyParamSet,
                                       struct OH_Huks_ParamSet** callerImportParamsKek,
                                       struct OH_Huks_ParamSet** agreeParamSet,
                                       struct OH_Huks_ParamSet** importPlainKeyParams)
{
    OH_Huks_FreeParamSet(genX25519KeyParamSet);
    OH_Huks_FreeParamSet(genCallerKeyParamSet);
    OH_Huks_FreeParamSet(callerImportParamsKek);
    OH_Huks_FreeParamSet(agreeParamSet);
    OH_Huks_FreeParamSet(importPlainKeyParams);
}

static void InitCommonTestParamsAndDoImport(struct HksImportWrappedKeyTestParams* importWrappedKeyTestParams,
                                            const struct OH_Huks_Param* importedKeyParamSetArray,
                                            uint32_t arraySize)
{
    importWrappedKeyTestParams->agreeKeyAlgName = &g_agreeKeyAlgNameBlob;
    importWrappedKeyTestParams->publicKeySize = X25519_PUB_KEY_SIZE;

    struct OH_Huks_ParamSet* genX25519KeyParamSet = nullptr;
    struct OH_Huks_ParamSet* genCallerKeyParamSet = nullptr;
    struct OH_Huks_ParamSet* callerImportParamsKek = nullptr;
    struct OH_Huks_ParamSet* agreeParamSet = nullptr;
    struct OH_Huks_ParamSet* importPlainKeyParams = nullptr;

    struct WrappedKeyParamSetOutput paramOutput = { .genX25519KeyParamSet = &genX25519KeyParamSet,
                                                    .genCallerKeyParamSet = &genCallerKeyParamSet,
                                                    .callerImportParamsKek = &callerImportParamsKek,
                                                    .agreeParamSet = &agreeParamSet,
                                                    .importPlainKeyParams = &importPlainKeyParams };

    struct WrappedKeyInputParams inputParams = { .importedKeyParamSetArray = importedKeyParamSetArray,
                                                 .arraySize = arraySize };

    OH_Huks_Result ret = InitAllWrappedKeyParamSets(&paramOutput, &inputParams);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return;
    }

    importWrappedKeyTestParams->genWrappingKeyParamSet = genX25519KeyParamSet;
    importWrappedKeyTestParams->genCallerKeyParamSet = genCallerKeyParamSet;
    importWrappedKeyTestParams->importCallerKekParamSet = callerImportParamsKek;
    importWrappedKeyTestParams->agreeParamSet = agreeParamSet;
    importWrappedKeyTestParams->importWrappedKeyParamSet = importPlainKeyParams;

    HksImportWrappedKeyTestCommonCase(importWrappedKeyTestParams);
    HksClearKeysForWrappedKeyTest(importWrappedKeyTestParams);

    FreeAllWrappedKeyParamSets(
        &genX25519KeyParamSet, &genCallerKeyParamSet, &callerImportParamsKek, &agreeParamSet, &importPlainKeyParams);
}

/**
 * @tc.name   SecurityHuksNapiWrapped0100
 * @tc.number Security_HUKS_NAPI_Wrapped_0100
 * @tc.desc   Test import wrapped aes256-gcm-no_padding key including generate&export x25519 key, generate kek
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SecurityHuksNapiWrapped0100()
{
    struct HksImportWrappedKeyTestParams importWrappedKeyTestParams001 = { 0 };

    importWrappedKeyTestParams001.wrappingKeyAlias = &g_wrappingKeyAliasAes256;
    importWrappedKeyTestParams001.keyMaterialLen = g_importedAes256PlainKey.size;
    importWrappedKeyTestParams001.callerKeyAlias = &g_callerKeyAliasAes256;
    importWrappedKeyTestParams001.callerKekAlias = &g_callerKekAliasAes256;
    importWrappedKeyTestParams001.callerKek = &g_callerAes256Kek;
    importWrappedKeyTestParams001.callerAgreeKeyAlias = &g_callerAgreeKeyAliasAes256;
    importWrappedKeyTestParams001.importedKeyAlias = &g_importedKeyAliasAes256;
    importWrappedKeyTestParams001.importedPlainKey = &g_importedAes256PlainKey;
    InitCommonTestParamsAndDoImport(&importWrappedKeyTestParams001,
                                    g_importWrappedAes256Params,
                                    sizeof(g_importWrappedAes256Params) / sizeof(struct OH_Huks_Param));
    return 0;
}

} // namespace Huks
} // namespace Acts
