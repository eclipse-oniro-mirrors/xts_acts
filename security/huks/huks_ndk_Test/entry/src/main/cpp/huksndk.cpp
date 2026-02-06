/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

#include <huks/native_huks_api.h>
#include <huks/native_huks_param.h>

#include <cstring>
#include <string>

#include "napi/native_api.h"
#include "utils.cpp"

#define FAIL (-1)
#define PARAM_0 0
#define PARAM_1 1
#define PARAM_7 7
#define PARAM_8 8
#define SUCCESS 0
#define SIZE_64 64
#define TEST_VALUE (-100)
#define ALIAS "testKey"
#define VERSION ""
#define SEC_INFO_DATA "hi_security_level_info"
#define CHALLENGE_DATA "hi_challenge_data"
#define VERSION_DATA "hi_os_version_data"
#define UDID_DATA "hi_udid_data"
#define SN_DATA "hi_sn_data"
#define DEVICE_ID "test_device_id"
#define SIZE_1024 1024

struct AddonData {
    napi_async_work asyncWork = nullptr;
    napi_deferred deferred = nullptr;
    napi_ref callback = nullptr;

    double result = 0;
};

static void resultAsyncWork(napi_env env, napi_status status, void *data)
{
    AddonData *addonData = static_cast<AddonData *>(data);
    napi_value result = nullptr;
    napi_create_double(env, addonData->result, &result);
    napi_resolve_deferred(env, addonData->deferred, result);

    if (addonData->callback != nullptr) {
        napi_delete_reference(env, addonData->callback);
    }

    napi_delete_async_work(env, addonData->asyncWork);
    delete addonData;
    addonData = nullptr;
};

static napi_value OHHuksGetSdkVersion(napi_env env, napi_callback_info info)
{
    int returnValue = FAIL;
    napi_value result = nullptr;
    const uint32_t sdkSize = 32;
    struct OH_Huks_Blob *gkeyAlias = (struct OH_Huks_Blob *)malloc(sizeof(struct OH_Huks_Blob));
    if (gkeyAlias != nullptr) {
        gkeyAlias->data = static_cast<uint8_t *>(malloc(sdkSize));
        gkeyAlias->size = sdkSize;
    }
    struct OH_Huks_Result resultSt = OH_Huks_GetSdkVersion(gkeyAlias);
    if (resultSt.errorCode == (int32_t)OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHHuksGetSdkVersionErr(napi_env env, napi_callback_info info)
{
    int returnValue = FAIL;
    struct OH_Huks_Blob *gkeyAlias = new OH_Huks_Blob{};
    struct OH_Huks_Result resultSt = OH_Huks_GetSdkVersion(gkeyAlias);
    if (resultSt.errorCode != OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

struct OH_Huks_Param tmpParams[] = {
    {.tag = OH_HUKS_TAG_KEY_STORAGE_FLAG, .uint32Param = OH_HUKS_STORAGE_PERSISTENT},
    {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_RSA},
    {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_RSA_KEY_SIZE_2048},
    {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_VERIFY},
    {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA256},
    {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_PSS},
    {.tag = OH_HUKS_TAG_KEY_GENERATE_TYPE, .uint32Param = OH_HUKS_KEY_GENERATE_TYPE_DEFAULT},
    {.tag = OH_HUKS_TAG_BLOCK_MODE, .uint32Param = OH_HUKS_MODE_ECB},
    {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE},
};

static napi_value OHHuksGenerateKeyItem(napi_env env, napi_callback_info info)
{
    char alias[64] = {0};
    strcpy(alias, ALIAS);
    static const struct OH_Huks_Blob gkeyAlias = {sizeof(ALIAS),
                                                  reinterpret_cast<uint8_t *>(static_cast<char *>(alias))};
    int returnValue = FAIL;
    struct OH_Huks_ParamSet *paramSet = nullptr;
    OH_Huks_Result ret;
    OH_Huks_InitParamSet(&paramSet);
    ret = OH_Huks_AddParams(paramSet, tmpParams, sizeof(tmpParams) / sizeof(tmpParams[0]));
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(&paramSet);
    }

    ret = OH_Huks_BuildParamSet(&paramSet);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(&paramSet);
    }

    struct OH_Huks_Result resultSt = OH_Huks_GenerateKeyItem(&gkeyAlias, paramSet, nullptr);
    if (resultSt.errorCode == (int32_t)OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }
    OH_Huks_DeleteKeyItem(&gkeyAlias, paramSet);
    OH_Huks_FreeParamSet(&paramSet);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static struct OH_Huks_ParamSet *g_paramSetNullptr = nullptr;
static struct OH_Huks_Param *g_paramNullptr = nullptr;
static struct OH_Huks_Blob *g_blobNullptr = nullptr;
static struct OH_Huks_CertChain *g_certChainNullptr = nullptr;

static napi_value OHHuksGenerateKeyItemErr(napi_env env, napi_callback_info info)
{
    int returnValue = FAIL;
    struct OH_Huks_Result resultSt = OH_Huks_GenerateKeyItem(g_blobNullptr, g_paramSetNullptr, g_paramSetNullptr);
    if (resultSt.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }
    OH_Huks_DeleteKeyItem(g_blobNullptr, g_paramSetNullptr);
    OH_Huks_FreeParamSet(&g_paramSetNullptr);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static struct OH_Huks_Param g_genParams041[] = {
    {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_RSA},
    {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_ENCRYPT | OH_HUKS_KEY_PURPOSE_DECRYPT},
    {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_RSA_KEY_SIZE_4096},
    {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_OAEP},
    {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA384},
    {.tag = OH_HUKS_TAG_BLOCK_MODE, .uint32Param = OH_HUKS_MODE_ECB},
    {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE}};

static void doOHHuksExportPublicKeyItem(napi_env env, void *data)
{
    AddonData *addonData = static_cast<AddonData *>(data);

    int returnValue = FAIL;
    uint8_t tmpPublicKey[OH_HUKS_RSA_KEY_SIZE_1024] = {PARAM_0};
    struct OH_Huks_Blob publicKey = {OH_HUKS_RSA_KEY_SIZE_1024, static_cast<unsigned char *>(tmpPublicKey)};
    char tmpKeyAlias[] = "HksRSACipherKeyAliasTest041";
    struct OH_Huks_Blob keyAlias = {sizeof(tmpKeyAlias), reinterpret_cast<uint8_t *>(static_cast<char *>(tmpKeyAlias))};
    struct OH_Huks_ParamSet *genParamSet = nullptr;
    InitParamSet(&genParamSet, g_genParams041, sizeof(g_genParams041) / sizeof(OH_Huks_Param));
    OH_Huks_GenerateKeyItem(&keyAlias, genParamSet, nullptr);

    struct OH_Huks_Result resultSt = OH_Huks_ExportPublicKeyItem(&keyAlias, genParamSet, &publicKey);
    OH_Huks_DeleteKeyItem(&keyAlias, genParamSet);
    OH_Huks_FreeParamSet(&genParamSet);
    if (resultSt.errorCode == (int32_t)OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }

    addonData->result = returnValue;
}

static napi_value OHHuksExportPublicKeyItem(napi_env env, napi_callback_info info)
{
    napi_value promise = nullptr;
    napi_deferred deferred = nullptr;
    napi_create_promise(env, &deferred, &promise);

    auto addonData = new AddonData{
        .asyncWork = nullptr,
        .deferred = deferred,
    };

    napi_value resourceName = nullptr;
    napi_create_string_utf8(env, "addAsyncCallback", NAPI_AUTO_LENGTH, &resourceName);
    napi_create_async_work(env, nullptr, resourceName, doOHHuksExportPublicKeyItem, resultAsyncWork,
                           static_cast<void *>(addonData), &addonData->asyncWork);

    napi_queue_async_work(env, addonData->asyncWork);

    return promise;
}

static napi_value OHHuksExportPublicKeyItemErr(napi_env env, napi_callback_info info)
{
    int returnValue = FAIL;
    struct OH_Huks_Result resultSt = OH_Huks_ExportPublicKeyItem(g_blobNullptr, g_paramSetNullptr, g_blobNullptr);
    if (resultSt.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static struct OH_Huks_Param g_encryptParams041[] = {
    {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_RSA},
    {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_ENCRYPT},
    {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_RSA_KEY_SIZE_4096},
    {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_OAEP},
    {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA384},
    {.tag = OH_HUKS_TAG_BLOCK_MODE, .uint32Param = OH_HUKS_MODE_ECB},
    {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE}};

static void doOHHuksImportKeyItem(napi_env env, void *data)
{
    AddonData *addonData = static_cast<AddonData *>(data);
    int returnValue = FAIL;
    uint8_t tmpPublicKey[OH_HUKS_RSA_KEY_SIZE_1024] = {PARAM_0};
    struct OH_Huks_Blob publicKey = {OH_HUKS_RSA_KEY_SIZE_1024, static_cast<uint8_t *>(tmpPublicKey)};
    char tmpKeyAlias[] = "HksRSACipherKeyAliasTest041";
    struct OH_Huks_Blob keyAlias = {sizeof(tmpKeyAlias), reinterpret_cast<uint8_t *>(static_cast<char *>(tmpKeyAlias))};
    struct OH_Huks_ParamSet *genParamSet = nullptr;
    InitParamSet(&genParamSet, g_genParams041, sizeof(g_genParams041) / sizeof(OH_Huks_Param));
    OH_Huks_GenerateKeyItem(&keyAlias, genParamSet, nullptr);

    OH_Huks_ExportPublicKeyItem(&keyAlias, genParamSet, &publicKey);
    char tmpKey[] = "RSA_Encrypt_Decrypt_KeyAlias";
    struct OH_Huks_Blob newKeyAlias = {.size = sizeof(tmpKey),
                                       .data = reinterpret_cast<uint8_t *>(static_cast<char *>(tmpKey))};
    struct OH_Huks_ParamSet *encryptParamSet = nullptr;
    InitParamSet(&encryptParamSet, g_encryptParams041, sizeof(g_encryptParams041) / sizeof(OH_Huks_Param));

    struct OH_Huks_Result resultSt = OH_Huks_ImportKeyItem(&newKeyAlias, encryptParamSet, &publicKey);
    if (resultSt.errorCode == (int32_t)OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }

    OH_Huks_DeleteKeyItem(&keyAlias, genParamSet);
    OH_Huks_DeleteKeyItem(&newKeyAlias, encryptParamSet);
    OH_Huks_FreeParamSet(&genParamSet);
    OH_Huks_FreeParamSet(&encryptParamSet);

    addonData->result = returnValue;
};

static napi_value OHHuksImportKeyItem(napi_env env, napi_callback_info info)
{
    napi_value promise = nullptr;
    napi_deferred deferred = nullptr;
    napi_create_promise(env, &deferred, &promise);

    auto addonData = new AddonData{
        .asyncWork = nullptr,
        .deferred = deferred,
    };

    napi_value resourceName = nullptr;
    napi_create_string_utf8(env, "addAsyncCallback", NAPI_AUTO_LENGTH, &resourceName);
    napi_create_async_work(env, nullptr, resourceName, doOHHuksImportKeyItem, resultAsyncWork,
                           static_cast<void *>(addonData), &addonData->asyncWork);

    napi_queue_async_work(env, addonData->asyncWork);

    return promise;
}

static napi_value OHHuksImportKeyItemErr(napi_env env, napi_callback_info info)
{
    int returnValue = FAIL;
    struct OH_Huks_Result resultSt = OH_Huks_ImportKeyItem(g_blobNullptr, g_paramSetNullptr, g_blobNullptr);
    if (resultSt.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHHuksDeleteKeyItem(napi_env env, napi_callback_info info)
{
    char alias[64] = {0};
    strcpy(alias, ALIAS);
    static const struct OH_Huks_Blob gkeyAlias = {sizeof(ALIAS),
                                                  reinterpret_cast<uint8_t *>(static_cast<char *>(alias))};
    int returnValue = FAIL;
    struct OH_Huks_ParamSet *paramSet = nullptr;
    OH_Huks_InitParamSet(&paramSet);
    OH_Huks_Result ret = OH_Huks_AddParams(paramSet, tmpParams, sizeof(tmpParams) / sizeof(tmpParams[0]));
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(&paramSet);
    }

    ret = OH_Huks_BuildParamSet(&paramSet);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(&paramSet);
    }

    OH_Huks_GenerateKeyItem(&gkeyAlias, paramSet, nullptr);
    struct OH_Huks_Result resultSt = OH_Huks_DeleteKeyItem(&gkeyAlias, paramSet);
    if (resultSt.errorCode == (int32_t)OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHHuksDeleteKeyItemErr(napi_env env, napi_callback_info info)
{
    int returnValue = FAIL;
    struct OH_Huks_Result resultSt = OH_Huks_DeleteKeyItem(g_blobNullptr, g_paramSetNullptr);
    if (resultSt.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHHuksIsKeyItemExist(napi_env env, napi_callback_info info)
{
    char alias[64] = {0};
    strcpy(alias, ALIAS);
    static const struct OH_Huks_Blob gkeyAlias = {sizeof(ALIAS),
                                                  reinterpret_cast<uint8_t *>(static_cast<char *>(alias))};
    int returnValue = FAIL;
    struct OH_Huks_ParamSet *paramSet = nullptr;
    OH_Huks_InitParamSet(&paramSet);

    OH_Huks_Result ret = OH_Huks_AddParams(paramSet, tmpParams, sizeof(tmpParams) / sizeof(tmpParams[0]));
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(&paramSet);
    }

    ret = OH_Huks_BuildParamSet(&paramSet);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(&paramSet);
    }

    OH_Huks_GenerateKeyItem(&gkeyAlias, paramSet, nullptr);
    struct OH_Huks_Result resultSt = OH_Huks_IsKeyItemExist(&gkeyAlias, paramSet);
    if (resultSt.errorCode == (int32_t)OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }
    OH_Huks_DeleteKeyItem(&gkeyAlias, paramSet);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHHuksIsKeyItemExistErr(napi_env env, napi_callback_info info)
{
    int returnValue = FAIL;
    struct OH_Huks_Result resultSt = OH_Huks_IsKeyItemExist(g_blobNullptr, g_paramSetNullptr);
    if (resultSt.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static const uint32_t DERIVE_KEY_SIZE_32 = 32;
static struct OH_Huks_Param g_hkdfParams001[] = {
    {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_HKDF},
    {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_DERIVE},
    {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA256},
    {.tag = OH_HUKS_TAG_DERIVE_KEY_SIZE, .uint32Param = DERIVE_KEY_SIZE_32},
    {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE}};

static napi_value OHHuksInitSession(napi_env env, napi_callback_info info)

{
    int returnValue = FAIL;
    uint8_t handleD[sizeof(uint64_t)] = {0};
    struct OH_Huks_Blob handleDerive = {sizeof(uint64_t), handleD};
    struct OH_Huks_ParamSet *hkdfParamSet = nullptr;
    char alias[64] = {0};
    strcpy(alias, ALIAS);
    static const struct OH_Huks_Blob gkeyAlias = {sizeof(ALIAS),
                                                  reinterpret_cast<uint8_t *>(static_cast<char *>(alias))};
    struct OH_Huks_ParamSet *paramSet = nullptr;
    OH_Huks_InitParamSet(&paramSet);
    OH_Huks_Result ret = OH_Huks_AddParams(paramSet, tmpParams, sizeof(tmpParams) / sizeof(tmpParams[0]));
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(&paramSet);
    }
    ret = OH_Huks_BuildParamSet(&paramSet);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(&paramSet);
    }
    OH_Huks_GenerateKeyItem(&gkeyAlias, paramSet, nullptr);
    InitParamSet(&hkdfParamSet, g_hkdfParams001, sizeof(g_hkdfParams001) / sizeof(OH_Huks_Param));
    struct OH_Huks_Result resultSt = OH_Huks_InitSession(&gkeyAlias, hkdfParamSet, &handleDerive, nullptr);
    if (resultSt.errorCode == (int32_t)OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }
    OH_Huks_DeleteKeyItem(&gkeyAlias, paramSet);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHHuksInitSessionErr(napi_env env, napi_callback_info info)
{
    int returnValue = FAIL;
    struct OH_Huks_Result resultSt =
        OH_Huks_InitSession(g_blobNullptr, g_paramSetNullptr, g_blobNullptr, g_blobNullptr);
    if (resultSt.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

OH_Huks_Result TestGenerateKey(const struct OH_Huks_Blob *keyAlias)
{
    struct OH_Huks_ParamSet *paramSet = nullptr;
    OH_Huks_Result ret = OH_Huks_InitParamSet(&paramSet);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    ret = OH_Huks_AddParams(paramSet, tmpParams, sizeof(tmpParams) / sizeof(tmpParams[0]));
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(&paramSet);
        return ret;
    }

    ret = OH_Huks_BuildParamSet(&paramSet);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(&paramSet);
        return ret;
    }

    ret = OH_Huks_GenerateKeyItem(keyAlias, paramSet, nullptr);
    OH_Huks_DeleteKeyItem(keyAlias, paramSet);
    OH_Huks_FreeParamSet(&paramSet);
    return ret;
}

static struct OH_Huks_Blob g_secInfo = {sizeof(SEC_INFO_DATA), (uint8_t *)SEC_INFO_DATA};
static struct OH_Huks_Blob g_challenge = {sizeof(CHALLENGE_DATA), (uint8_t *)CHALLENGE_DATA};
static struct OH_Huks_Blob g_version = {sizeof(VERSION_DATA), (uint8_t *)VERSION_DATA};
static const struct OH_Huks_Blob g_keyAlias = {sizeof("testAttestKeyItem"), (uint8_t *)"testAttestKeyItem"};
static uint32_t g_size = 4096;

static const struct OH_Huks_Param g_commonParams[] = {
    {.tag = OH_HUKS_TAG_ATTESTATION_ID_SEC_LEVEL_INFO, .blob = g_secInfo},
    {.tag = OH_HUKS_TAG_ATTESTATION_CHALLENGE, .blob = g_challenge},
    {.tag = OH_HUKS_TAG_ATTESTATION_ID_VERSION_INFO, .blob = g_version},
    {.tag = OH_HUKS_TAG_ATTESTATION_ID_ALIAS, .blob = g_keyAlias},
    {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE},
};

OH_Huks_Result GenerateParamSet(struct OH_Huks_ParamSet **paramSet, const struct OH_Huks_Param tmpParams[],
                                uint32_t paramCount)
{
    OH_Huks_Result ret = OH_Huks_InitParamSet(paramSet);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        return ret;
    }

    ret = OH_Huks_AddParams(*paramSet, tmpParams, paramCount);
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

void *HksMalloc(size_t size)
{
    void *ptr = nullptr;
    if (size == (size_t)PARAM_0) {
        return static_cast<void *>(ptr);
    }
    return malloc(size);
}

void HksFree(void *ptr) { free(ptr); }

void FreeCertChain(struct OH_Huks_CertChain **certChain, const uint32_t pos)
{
    if (certChain == nullptr || *certChain == nullptr) {
        return;
    }

    if ((*certChain)->certs == nullptr) {
        HksFree(*certChain);
        *certChain = nullptr;
        return;
    }
    for (uint32_t j = 0; j < pos; j++) {
        if ((*certChain)->certs[j].data != nullptr) {
            HksFree((*certChain)->certs[j].data);
            (*certChain)->certs[j].data = nullptr;
        }
    }

    if ((*certChain)->certs != nullptr) {
        HksFree((*certChain)->certs);
        (*certChain)->certs = nullptr;
    }

    if (*certChain != nullptr) {
        HksFree(*certChain);
        *certChain = nullptr;
    }
}
struct HksTestCertChain {
    bool certChainExist;
    bool certCountValid;
    bool certDataExist;
    uint32_t certDataSize;
};
static uint32_t CERT_COUNT = 4;

int32_t ConstructDataToCertChain(struct OH_Huks_CertChain **certChain, const struct HksTestCertChain *certChainParam)
{
    if (!certChainParam->certChainExist) {
        return PARAM_0;
    }
    *certChain = static_cast<struct OH_Huks_CertChain *>(HksMalloc(sizeof(struct OH_Huks_CertChain)));
    if (*certChain == nullptr) {
        return OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT;
    }
    if (!certChainParam->certCountValid) {
        (*certChain)->certsCount = PARAM_0;
        (*certChain)->certs = nullptr;
        return PARAM_0;
    }
    (*certChain)->certsCount = CERT_COUNT;
    if (!certChainParam->certDataExist) {
        (*certChain)->certs = nullptr;
        return PARAM_0;
    }
    (*certChain)->certs =
        static_cast<struct OH_Huks_Blob *>(HksMalloc(sizeof(struct OH_Huks_Blob) * ((*certChain)->certsCount)));
    if (*certChain != nullptr) {
        for (uint32_t i = PARAM_0; i < (*certChain)->certsCount; i++) {
            (*certChain)->certs[i].size = certChainParam->certDataSize;
            (*certChain)->certs[i].data =
                reinterpret_cast<uint8_t *>(static_cast<char *>(HksMalloc((*certChain)->certs[i].size)));
            memset((*certChain)->certs[i].data, certChainParam->certDataSize, certChainParam->certDataSize);
        }
    }
    return PARAM_0;
}

static napi_value OHHuksAttestKeyItem(napi_env env, napi_callback_info info)
{
    char alias[64] = {0};
    strcpy(alias, ALIAS);
    static const struct OH_Huks_Blob gkeyAlias = {sizeof(ALIAS),
                                                  reinterpret_cast<uint8_t *>(static_cast<char *>(alias))};
    TestGenerateKey(&gkeyAlias);
    struct OH_Huks_ParamSet *paramSet = nullptr;
    GenerateParamSet(&paramSet, g_commonParams, sizeof(g_commonParams) / sizeof(g_commonParams[PARAM_0]));
    OH_Huks_CertChain *certChain = nullptr;
    const struct HksTestCertChain certParam = {true, true, true, g_size};
    (void)ConstructDataToCertChain(&certChain, &certParam);
    struct OH_Huks_Result resultSt = OH_Huks_AttestKeyItem(&gkeyAlias, paramSet, certChain);
    int returnValue = FAIL;
    if (resultSt.errorCode == (int32_t)OH_HUKS_ERR_CODE_PERMISSION_FAIL) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHHuksAttestKeyItemErr(napi_env env, napi_callback_info info)
{
    struct OH_Huks_Result resultSt = OH_Huks_AttestKeyItem(g_blobNullptr, g_paramSetNullptr, g_certChainNullptr);
    int returnValue = FAIL;
    if (resultSt.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHHuksInitParamSet(napi_env env, napi_callback_info info)
{
    struct OH_Huks_ParamSet *paramSet = nullptr;
    OH_Huks_Result resultSt = OH_Huks_InitParamSet(&paramSet);
    int returnValue = FAIL;
    if (resultSt.errorCode == (int32_t)OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHHuksInitParamSetErr(napi_env env, napi_callback_info info)
{
    OH_Huks_Result resultSt = OH_Huks_InitParamSet(nullptr);
    int returnValue = FAIL;
    if (resultSt.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHHuksAddParams(napi_env env, napi_callback_info info)
{
    struct OH_Huks_ParamSet *paramSet = nullptr;
    OH_Huks_InitParamSet(&paramSet);
    OH_Huks_Result resultSt = OH_Huks_AddParams(paramSet, tmpParams, sizeof(tmpParams) / sizeof(tmpParams[0]));
    int returnValue = FAIL;
    if (resultSt.errorCode == (int32_t)OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHHuksAddParamsErr(napi_env env, napi_callback_info info)
{
    OH_Huks_Result resultSt = OH_Huks_AddParams(g_paramSetNullptr, g_paramNullptr, 0);
    int returnValue = FAIL;
    if (resultSt.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHHuksBuildParamSet(napi_env env, napi_callback_info info)
{
    struct OH_Huks_ParamSet *paramSet = nullptr;
    OH_Huks_InitParamSet(&paramSet);
    OH_Huks_Result ret = OH_Huks_AddParams(paramSet, tmpParams, sizeof(tmpParams) / sizeof(tmpParams[0]));
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(&paramSet);
    }

    OH_Huks_Result resultSt = OH_Huks_BuildParamSet(&paramSet);
    int returnValue = FAIL;
    if (resultSt.errorCode == (int32_t)OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHHuksBuildParamSetErr(napi_env env, napi_callback_info info)
{
    OH_Huks_Result resultSt = OH_Huks_BuildParamSet(nullptr);
    int returnValue = FAIL;
    if (resultSt.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHHuksFreeParamSet(napi_env env, napi_callback_info info)
{
    struct OH_Huks_ParamSet *paramSet = nullptr;
    OH_Huks_InitParamSet(&paramSet);
    OH_Huks_Result ret = OH_Huks_AddParams(paramSet, tmpParams, sizeof(tmpParams) / sizeof(tmpParams[0]));
    OH_Huks_Result resultSt;
    resultSt.errorCode = TEST_VALUE;
    if (ret.errorCode == (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(&paramSet);
        resultSt = OH_Huks_BuildParamSet(&paramSet);
    }
    int returnValue = FAIL;
    if (resultSt.errorCode != (int32_t)OH_HUKS_SUCCESS && resultSt.errorCode != TEST_VALUE) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHHuksIsParamSetValid(napi_env env, napi_callback_info info)
{
    struct OH_Huks_ParamSet *paramSet = nullptr;
    OH_Huks_InitParamSet(&paramSet);

    OH_Huks_Result ret = OH_Huks_AddParams(paramSet, tmpParams, sizeof(tmpParams) / sizeof(tmpParams[0]));
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(&paramSet);
    }

    OH_Huks_BuildParamSet(&paramSet);
    OH_Huks_Result resultSt = OH_Huks_IsParamSetValid(paramSet, paramSet->paramSetSize);
    int returnValue = FAIL;
    if (resultSt.errorCode == (int32_t)OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHHuksIsParamSetValidErr(napi_env env, napi_callback_info info)
{
    OH_Huks_Result resultSt = OH_Huks_IsParamSetValid(g_paramSetNullptr, 0);
    int returnValue = FAIL;
    if (resultSt.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHHuksIsParamSetTagValid(napi_env env, napi_callback_info info)
{
    struct OH_Huks_ParamSet *paramSet = nullptr;
    OH_Huks_InitParamSet(&paramSet);

    OH_Huks_Result ret = OH_Huks_AddParams(paramSet, tmpParams, sizeof(tmpParams) / sizeof(tmpParams[0]));
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(&paramSet);
    }

    OH_Huks_BuildParamSet(&paramSet);
    OH_Huks_Result resultSt = OH_Huks_IsParamSetTagValid(paramSet);
    int returnValue = FAIL;
    if (resultSt.errorCode == (int32_t)OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHHuksIsParamSetTagValidErr(napi_env env, napi_callback_info info)
{
    OH_Huks_Result resultSt = OH_Huks_IsParamSetTagValid(g_paramSetNullptr);
    int returnValue = FAIL;
    if (resultSt.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHHuksCheckParamMatch(napi_env env, napi_callback_info info)
{
    struct OH_Huks_Param baseParam = {.tag = OH_HUKS_TAG_ALGORITHM, .uint64Param = (uint64_t)1};
    struct OH_Huks_Param otherParam = {.tag = OH_HUKS_TAG_ALGORITHM, .uint64Param = (uint64_t)1};
    OH_Huks_Result resultSt = OH_Huks_CheckParamMatch(&baseParam, &otherParam);
    int returnValue = FAIL;
    if (resultSt.errorCode == (int32_t)OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHHuksCheckParamMatchErr(napi_env env, napi_callback_info info)
{
    struct OH_Huks_Param baseParam = {.tag = OH_HUKS_TAG_ALGORITHM, .uint64Param = (uint64_t)1};
    struct OH_Huks_Param otherParam = {.tag = OH_HUKS_TAG_ALGORITHM, .uint64Param = (uint64_t)2};
    OH_Huks_Result resultSt = OH_Huks_CheckParamMatch(&baseParam, &otherParam);
    int returnValue = FAIL;
    if (resultSt.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHHuksFreshParamSet(napi_env env, napi_callback_info info)
{
    struct OH_Huks_ParamSet *paramSet = nullptr;
    OH_Huks_InitParamSet(&paramSet);
    OH_Huks_Result ret = OH_Huks_AddParams(paramSet, tmpParams, sizeof(tmpParams) / sizeof(tmpParams[0]));
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(&paramSet);
    }
    OH_Huks_BuildParamSet(&paramSet);
    OH_Huks_Result resultSt = OH_Huks_FreshParamSet(paramSet, true);
    int returnValue = FAIL;
    if (resultSt.errorCode == (int32_t)OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHHuksFreshParamSetErr(napi_env env, napi_callback_info info)
{
    OH_Huks_Result resultSt = OH_Huks_FreshParamSet(nullptr, 0);
    int returnValue = FAIL;
    if (resultSt.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static const uint32_t DSA_COMMON_SIZE = 1024;
static struct OH_Huks_Param g_genParamsTest001[] = {
    {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_DSA},
    {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_SIGN | OH_HUKS_KEY_PURPOSE_VERIFY},
    {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = DSA_COMMON_SIZE},
    {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA1},
    {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE}};

static struct OH_Huks_Param g_signParamsTest001[] = {
    {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_DSA},
    {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_SIGN},
    {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA1},
    {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE}};

static napi_value OHHuksGetParam(napi_env env, napi_callback_info info)
{
    char keyAliasString[] = "HksDSASignVerifyKeyAliasTest001";
    struct OH_Huks_Blob keyAlias = {sizeof(keyAliasString),
                                    reinterpret_cast<uint8_t *>(static_cast<char *>(keyAliasString))};
    struct OH_Huks_ParamSet *genParamSet = nullptr;
    struct OH_Huks_ParamSet *signParamSet = nullptr;
    InitParamSet(&genParamSet, g_genParamsTest001, sizeof(g_genParamsTest001) / sizeof(OH_Huks_Param));
    InitParamSet(&signParamSet, g_signParamsTest001, sizeof(g_signParamsTest001) / sizeof(OH_Huks_Param));
    OH_Huks_GenerateKeyItem(&keyAlias, genParamSet, nullptr);
    uint8_t tmpHandle[sizeof(uint64_t)] = {0};
    struct OH_Huks_Blob handle = {sizeof(uint64_t), tmpHandle};
    OH_Huks_InitSession(&keyAlias, signParamSet, &handle, nullptr);
    struct OH_Huks_Param *tmpParam = nullptr;
    OH_Huks_Result resultSt = OH_Huks_GetParam(signParamSet, OH_HUKS_TAG_PURPOSE, &tmpParam);
    int returnValue = FAIL;
    if (resultSt.errorCode == (int32_t)OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }
    OH_Huks_DeleteKeyItem(&keyAlias, genParamSet);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHHuksGetParamErr(napi_env env, napi_callback_info info)
{
    OH_Huks_Result resultSt = OH_Huks_GetParam(g_paramSetNullptr, 0, &g_paramNullptr);
    int returnValue = FAIL;
    if (resultSt.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHHuksCopyParamSet(napi_env env, napi_callback_info info)
{
    struct OH_Huks_ParamSet *paramSet = nullptr;
    struct OH_Huks_ParamSet *paramSetTo = nullptr;
    OH_Huks_InitParamSet(&paramSet);
    OH_Huks_Result ret = OH_Huks_AddParams(paramSet, tmpParams, sizeof(tmpParams) / sizeof(tmpParams[0]));
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(&paramSet);
    }
    OH_Huks_BuildParamSet(&paramSet);

    OH_Huks_Result resultSt = OH_Huks_CopyParamSet(paramSet, paramSet->paramSetSize, &paramSetTo);
    int returnValue = FAIL;
    if (resultSt.errorCode == (int32_t)OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHHuksCopyParamSetErr(napi_env env, napi_callback_info info)
{
    OH_Huks_Result resultSt = OH_Huks_CopyParamSet(g_paramSetNullptr, 0, &g_paramSetNullptr);
    int returnValue = FAIL;
    if (resultSt.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHHuksUpdateSessionErr(napi_env env, napi_callback_info info)
{
    OH_Huks_Result resultSt = OH_Huks_UpdateSession(g_blobNullptr, g_paramSetNullptr, g_blobNullptr, g_blobNullptr);
    int returnValue = FAIL;
    if (resultSt.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHHuksFinishSessionErr(napi_env env, napi_callback_info info)
{
    OH_Huks_Result resultSt = OH_Huks_FinishSession(g_blobNullptr, g_paramSetNullptr, g_blobNullptr, g_blobNullptr);
    int returnValue = FAIL;
    if (resultSt.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHHuksAbortSessionErr(napi_env env, napi_callback_info info)
{
    OH_Huks_Result resultSt = OH_Huks_AbortSession(g_blobNullptr, g_paramSetNullptr);
    int returnValue = FAIL;
    if (resultSt.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static uint8_t g_saltgen[16] = {0x14, 0x10, 0x11, 0x3a, 0x27, 0x9e, 0xc8, 0x5f,
                                0xe0, 0xf3, 0x36, 0x17, 0x57, 0x42, 0x8e, 0xff};
static const uint32_t DERIVE_ITERATION = 1000;
static const uint32_t COMMON_SIZE = 2048;

static struct OH_Huks_Param g_genParams001[] = {
    {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_AES},
    {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_DERIVE},
    {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA256},
    {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_AES_KEY_SIZE_256},
    {.tag = OH_HUKS_TAG_ITERATION, .uint32Param = 1000},
    {.tag = OH_HUKS_TAG_SALT, .blob = {sizeof(g_saltgen), (uint8_t *)g_saltgen}},
    {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE}};

static struct OH_Huks_Param g_pbkdf2Params001[] = {
    {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_PBKDF2},
    {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_DERIVE},
    {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA256},
    {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = 256},
    {.tag = OH_HUKS_TAG_ITERATION, .int32Param = DERIVE_ITERATION},
    {.tag = OH_HUKS_TAG_SALT, .blob = {sizeof(g_saltgen), (uint8_t *)g_saltgen}},
    {.tag = OH_HUKS_TAG_DERIVE_KEY_SIZE, .uint32Param = DERIVE_KEY_SIZE_32},
    {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE}};

static struct OH_Huks_Param g_pbkdf2FinishParams001[] = {
    {.tag = OH_HUKS_TAG_KEY_STORAGE_FLAG, .uint32Param = OH_HUKS_STORAGE_PERSISTENT},
    {.tag = OH_HUKS_TAG_KEY_ALIAS,
     .blob = {sizeof("HksPBKDF2DeriveKeyAliasTest001_2"), (uint8_t *)"HksPBKDF2DeriveKeyAliasTest001_2"}},
    {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_AES},
    {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = 256},
    {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_DERIVE},
    {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA256},
    {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE}};

static napi_value OHHuksUpdateSession(napi_env env, napi_callback_info info)
{
    char alias[] = {"HksPBKDF2DeriveKeyAliasTest001_1"};
    struct OH_Huks_Blob keyAlias = {sizeof("HksPBKDF2DeriveKeyAliasTest001_1"),
                                    reinterpret_cast<uint8_t *>(static_cast<char *>(alias))};

    struct OH_Huks_ParamSet *genParamSet = nullptr;
    InitParamSet(&genParamSet, g_genParams001, sizeof(g_genParams001) / sizeof(OH_Huks_Param));
    struct OH_Huks_ParamSet *pbkdf2ParamSet = nullptr;
    InitParamSet(&pbkdf2ParamSet, g_pbkdf2Params001, sizeof(g_pbkdf2Params001) / sizeof(OH_Huks_Param));
    struct OH_Huks_Blob inData = {sizeof("HksPBKDF2DeriveKeyAliasTest001_1"),
                                  reinterpret_cast<uint8_t *>(static_cast<char *>(alias))};

    OH_Huks_GenerateKeyItem(&keyAlias, genParamSet, nullptr);

    uint8_t handleD[sizeof(uint64_t)] = {0};
    struct OH_Huks_Blob handleDerive = {sizeof(uint64_t), handleD};
    OH_Huks_InitSession(&keyAlias, pbkdf2ParamSet, &handleDerive, nullptr);

    uint8_t tmpOut[COMMON_SIZE] = {0};
    struct OH_Huks_Blob outData = {COMMON_SIZE, tmpOut};
    OH_Huks_Result resultSt = OH_Huks_UpdateSession(&handleDerive, pbkdf2ParamSet, &inData, &outData);
    int returnValue = FAIL;
    if (resultSt.errorCode == (int32_t)OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }
    OH_Huks_DeleteKeyItem(&keyAlias, genParamSet);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHHuksFinishSession(napi_env env, napi_callback_info info)
{
    char alias[] = {"HksPBKDF2DeriveKeyAliasTest001_1"};
    struct OH_Huks_Blob keyAlias = {sizeof("HksPBKDF2DeriveKeyAliasTest001_1"),
                                    reinterpret_cast<uint8_t *>(static_cast<char *>(alias))};

    struct OH_Huks_ParamSet *genParamSet = nullptr;
    InitParamSet(&genParamSet, g_genParams001, sizeof(g_genParams001) / sizeof(OH_Huks_Param));

    struct OH_Huks_ParamSet *pbkdf2ParamSet = nullptr;
    struct OH_Huks_ParamSet *pbkdf2FinishParamSet = nullptr;
    InitParamSet(&pbkdf2ParamSet, g_pbkdf2Params001, sizeof(g_pbkdf2Params001) / sizeof(OH_Huks_Param));
    InitParamSet(&pbkdf2FinishParamSet, g_pbkdf2FinishParams001,
                 sizeof(g_pbkdf2FinishParams001) / sizeof(OH_Huks_Param));
    struct OH_Huks_Blob inData = {sizeof("HksPBKDF2DeriveKeyAliasTest001_1"),
                                  reinterpret_cast<uint8_t *>(static_cast<char *>(alias))};

    OH_Huks_GenerateKeyItem(&keyAlias, genParamSet, nullptr);

    uint8_t handleD[sizeof(uint64_t)] = {0};
    struct OH_Huks_Blob handleDerive = {sizeof(uint64_t), handleD};
    OH_Huks_InitSession(&keyAlias, pbkdf2ParamSet, &handleDerive, nullptr);

    uint8_t tmpOut[COMMON_SIZE] = {0};
    struct OH_Huks_Blob outData = {COMMON_SIZE, tmpOut};
    OH_Huks_UpdateSession(&handleDerive, pbkdf2ParamSet, &inData, &outData);

    uint8_t outDataD[COMMON_SIZE] = {0};
    struct OH_Huks_Blob outDataDerive = {COMMON_SIZE, outDataD};
    OH_Huks_Result resultSt = OH_Huks_FinishSession(&handleDerive, pbkdf2FinishParamSet, &inData, &outDataDerive);
    int returnValue = FAIL;
    if (resultSt.errorCode == (int32_t)OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }
    OH_Huks_DeleteKeyItem(&keyAlias, genParamSet);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHHuksAbortSession(napi_env env, napi_callback_info info)
{
    char alias[] = {"HksPBKDF2DeriveKeyAliasTest001_1"};
    struct OH_Huks_Blob keyAlias = {sizeof("HksPBKDF2DeriveKeyAliasTest001_1"),
                                    reinterpret_cast<uint8_t *>(static_cast<char *>(alias))};

    struct OH_Huks_ParamSet *genParamSet = nullptr;
    InitParamSet(&genParamSet, g_genParams001, sizeof(g_genParams001) / sizeof(OH_Huks_Param));

    struct OH_Huks_ParamSet *pbkdf2ParamSet = nullptr;
    struct OH_Huks_ParamSet *pbkdf2FinishParamSet = nullptr;
    InitParamSet(&pbkdf2ParamSet, g_pbkdf2Params001, sizeof(g_pbkdf2Params001) / sizeof(OH_Huks_Param));
    InitParamSet(&pbkdf2FinishParamSet, g_pbkdf2FinishParams001,
                 sizeof(g_pbkdf2FinishParams001) / sizeof(OH_Huks_Param));
    struct OH_Huks_Blob inData = {sizeof("HksPBKDF2DeriveKeyAliasTest001_1"),
                                  reinterpret_cast<uint8_t *>(static_cast<char *>(alias))};

    OH_Huks_GenerateKeyItem(&keyAlias, genParamSet, nullptr);

    uint8_t handleD[sizeof(uint64_t)] = {0};
    struct OH_Huks_Blob handleDerive = {sizeof(uint64_t), handleD};
    OH_Huks_InitSession(&keyAlias, pbkdf2ParamSet, &handleDerive, nullptr);

    uint8_t tmpOut[COMMON_SIZE] = {0};
    struct OH_Huks_Blob outData = {COMMON_SIZE, tmpOut};
    OH_Huks_UpdateSession(&handleDerive, pbkdf2ParamSet, &inData, &outData);

    OH_Huks_Result resultSt = OH_Huks_AbortSession(&handleDerive, pbkdf2ParamSet);
    int returnValue = FAIL;
    if (resultSt.errorCode == (int32_t)OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }
    OH_Huks_DeleteKeyItem(&keyAlias, genParamSet);
    OH_Huks_FreeParamSet(&genParamSet);
    OH_Huks_FreeParamSet(&pbkdf2ParamSet);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHHuksGetKeyItemParamSet(napi_env env, napi_callback_info info)
{
    char alias[64] = {0};
    strcpy(alias, ALIAS);
    static const struct OH_Huks_Blob gkeyAlias = {sizeof(ALIAS),
                                                  reinterpret_cast<uint8_t *>(static_cast<char *>(alias))};
    int returnValue = FAIL;
    struct OH_Huks_ParamSet *paramSet = nullptr;
    OH_Huks_Result ret = OH_Huks_InitParamSet(&paramSet);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
    }
    ret = OH_Huks_AddParams(paramSet, tmpParams, sizeof(tmpParams) / sizeof(tmpParams[0]));
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(&paramSet);
    }
    ret = OH_Huks_BuildParamSet(&paramSet);
    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_FreeParamSet(&paramSet);
    }
    struct OH_Huks_Result resSt = OH_Huks_IsKeyItemExist(&gkeyAlias, paramSet);
    if (resSt.errorCode == (int32_t)OH_HUKS_SUCCESS) {
        OH_Huks_DeleteKeyItem(&gkeyAlias, paramSet);
        OH_Huks_FreeParamSet(&paramSet);
    }
    OH_Huks_GenerateKeyItem(&gkeyAlias, paramSet, nullptr);
    struct OH_Huks_ParamSet *paramSetOut = nullptr;
    OH_Huks_InitParamSet(&paramSetOut);
    OH_Huks_BuildParamSet(&paramSetOut);
    paramSetOut->paramSetSize = COMMON_SIZE;
    struct OH_Huks_Result resultSt = OH_Huks_GetKeyItemParamSet(&gkeyAlias, paramSet, paramSetOut);
    if (resultSt.errorCode == (int32_t)OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }
    OH_Huks_DeleteKeyItem(&gkeyAlias, paramSet);
    OH_Huks_FreeParamSet(&paramSet);
    OH_Huks_FreeParamSet(&paramSetOut);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHHuksGetKeyItemParamSetErr(napi_env env, napi_callback_info info)
{
    int returnValue = FAIL;
    struct OH_Huks_Result resultSt = OH_Huks_GetKeyItemParamSet(nullptr, nullptr, nullptr);
    if (resultSt.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHHuksImportWrappedKeyItem(napi_env env, napi_callback_info info)
{
    int result = oHHuksImportWrappedKeyItem();
    napi_value ret;
    napi_create_int32(env, result, &ret);
    return ret;
}

static napi_value OHHuksImportWrappedKeyItemErr(napi_env env, napi_callback_info info)
{
    int returnValue = FAIL;
    struct OH_Huks_Result resultSt = OH_Huks_ImportWrappedKeyItem(nullptr, nullptr, nullptr, nullptr);
    if (resultSt.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}
static struct OH_Huks_Param g_genAnonAttestParams[] = {
    {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_RSA},
    {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_RSA_KEY_SIZE_2048},
    {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_VERIFY},
    {.tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA256},
    {.tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_PSS},
    {.tag = OH_HUKS_TAG_BLOCK_MODE, .uint32Param = OH_HUKS_MODE_ECB},
    {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE},
};
static napi_value OHHuksAnonAttestKeyItem(napi_env env, napi_callback_info info)
{
    char alias[64] = {0};
    strcpy(alias, ALIAS);
    static const struct OH_Huks_Blob gkeyAlias = {sizeof(ALIAS),
                                                  reinterpret_cast<uint8_t *>(static_cast<char *>(alias))};
    static struct OH_Huks_Param g_anonAttestParams[] = {
        {.tag = OH_HUKS_TAG_ATTESTATION_CHALLENGE, .blob = g_challenge},
        {.tag = OH_HUKS_TAG_ATTESTATION_ID_ALIAS, .blob = gkeyAlias},
        {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE},
    };
    TestGenerateKey(&gkeyAlias);
    struct OH_Huks_ParamSet *paramSet = nullptr;
    struct OH_Huks_ParamSet *anonAttestParamSet = nullptr;
    GenerateParamSet(&paramSet, g_genAnonAttestParams, sizeof(g_genAnonAttestParams) / sizeof(OH_Huks_Param));
    GenerateParamSet(&anonAttestParamSet, g_anonAttestParams, sizeof(g_anonAttestParams) / sizeof(OH_Huks_Param));
    OH_Huks_GenerateKeyItem(&gkeyAlias, paramSet, nullptr);
    OH_Huks_CertChain *certChain = nullptr;
    const struct HksTestCertChain certParam = {true, true, true, g_size};
    (void)ConstructDataToCertChain(&certChain, &certParam);
    struct OH_Huks_Result resultSt = OH_Huks_AnonAttestKeyItem(&gkeyAlias, anonAttestParamSet, certChain);
    int returnValue = FAIL;
    if (resultSt.errorCode == (int32_t)OH_HUKS_SUCCESS) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHHuksListAliases(napi_env env, napi_callback_info info)
{
    char alias1[64] = {0};
    char alias2[64] = {0};
    strcpy(alias1, "testAlias1");
    strcpy(alias2, "testAlias2");
    static struct OH_Huks_Blob gkeyAlias = {sizeof("testAlias1"),
                                            reinterpret_cast<uint8_t *>(static_cast<char *>(alias1))};
    static struct OH_Huks_Param g_listAliasedParams[] = {
        {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE},
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    struct OH_Huks_ParamSet *listAliasedParamSet = nullptr;
    GenerateParamSet(&paramSet, tmpParams, sizeof(tmpParams) / sizeof(OH_Huks_Param));
    GenerateParamSet(&listAliasedParamSet, g_listAliasedParams, sizeof(g_listAliasedParams) / sizeof(OH_Huks_Param));
    OH_Huks_GenerateKeyItem(&gkeyAlias, paramSet, nullptr);
    gkeyAlias = {sizeof("testAlias1"), reinterpret_cast<uint8_t *>(static_cast<char *>(alias2))};
    OH_Huks_GenerateKeyItem(&gkeyAlias, paramSet, nullptr);
    struct OH_Huks_KeyAliasSet *query_aliases = nullptr;
    struct OH_Huks_Result resultSt = OH_Huks_ListAliases(listAliasedParamSet, &query_aliases);
    int returnValue = SUCCESS;
    if (resultSt.errorCode != (int32_t)OH_HUKS_SUCCESS || query_aliases == NULL || query_aliases->aliasesCnt == 0) {
        returnValue = FAIL;
    }
    OH_Huks_FreeParamSet(&paramSet);
    OH_Huks_FreeParamSet(&listAliasedParamSet);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHHuksFreeKeyAliasSet(napi_env env, napi_callback_info info)
{
    char alias1[64] = {0};
    char alias2[64] = {0};
    strcpy(alias1, "testAlias1");
    strcpy(alias2, "testAlias2");
    static struct OH_Huks_Blob gkeyAlias = {sizeof("testAlias1"),
                                            reinterpret_cast<uint8_t *>(static_cast<char *>(alias1))};
    static struct OH_Huks_Param g_listAliasedParams[] = {
        {.tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE},
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    struct OH_Huks_ParamSet *listAliasedParamSet = nullptr;
    GenerateParamSet(&paramSet, tmpParams, sizeof(tmpParams) / sizeof(OH_Huks_Param));
    GenerateParamSet(&listAliasedParamSet, g_listAliasedParams, sizeof(g_listAliasedParams) / sizeof(OH_Huks_Param));
    OH_Huks_GenerateKeyItem(&gkeyAlias, paramSet, nullptr);
    gkeyAlias = {sizeof("testAlias1"), reinterpret_cast<uint8_t *>(static_cast<char *>(alias2))};
    OH_Huks_GenerateKeyItem(&gkeyAlias, paramSet, nullptr);
    struct OH_Huks_KeyAliasSet *query_aliases = nullptr;
    struct OH_Huks_Result resultSt = OH_Huks_ListAliases(listAliasedParamSet, &query_aliases);
    int returnValue = SUCCESS;
    if (resultSt.errorCode != (int32_t)OH_HUKS_SUCCESS || query_aliases == NULL || query_aliases->aliasesCnt == 0) {
        returnValue = FAIL;
    }
    OH_Huks_FreeParamSet(&paramSet);
    OH_Huks_FreeParamSet(&listAliasedParamSet);
    OH_Huks_FreeKeyAliasSet(query_aliases);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHHuksWrapKey(napi_env env, napi_callback_info info)
{
    char alias[64] = {0};
    strcpy(alias, ALIAS);
    static const struct OH_Huks_Blob gkeyAlias = {sizeof(ALIAS),
                                                  reinterpret_cast<uint8_t *>(static_cast<char *>(alias))};
    static struct OH_Huks_Param g_wrapKeyParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_AES},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_AES_KEY_SIZE_256},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_ENCRYPT},
        {.tag = OH_HUKS_TAG_KEY_WRAP_TYPE, .uint32Param = OH_HUKS_KEY_WRAP_TYPE_HUK_BASED},
    };
    struct OH_Huks_ParamSet *wrapKeyParamSet = nullptr;
    GenerateParamSet(&wrapKeyParamSet, g_wrapKeyParams, sizeof(g_wrapKeyParams) / sizeof(OH_Huks_Param));
    uint8_t tmpPublicKey[OH_HUKS_RSA_KEY_SIZE_1024] = {PARAM_0};
    struct OH_Huks_Blob outData = {OH_HUKS_RSA_KEY_SIZE_1024, static_cast<unsigned char *>(tmpPublicKey)};
    struct OH_Huks_Result resultSt = OH_Huks_WrapKey(&gkeyAlias, wrapKeyParamSet, &outData);
    int returnValue = SUCCESS;
    if (resultSt.errorCode != (int32_t)OH_HUKS_ERR_CODE_INSUFFICIENT_MEMORY &&
        resultSt.errorCode != OH_HUKS_ERR_CODE_NOT_SUPPORTED_API) {
        returnValue = FAIL;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHHuksUnwrapKey(napi_env env, napi_callback_info info)
{
    char alias[64] = {0};
    strcpy(alias, ALIAS);
    static const struct OH_Huks_Blob gkeyAlias = {sizeof(ALIAS),
                                                  reinterpret_cast<uint8_t *>(static_cast<char *>(alias))};
    static struct OH_Huks_Param g_wrapKeyParams[] = {
        {.tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_AES},
        {.tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_AES_KEY_SIZE_256},
        {.tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_ENCRYPT},
        {.tag = OH_HUKS_TAG_KEY_WRAP_TYPE, .uint32Param = OH_HUKS_KEY_WRAP_TYPE_HUK_BASED},
    };
    struct OH_Huks_ParamSet *paramSet = nullptr;
    struct OH_Huks_ParamSet *wrapKeyParamSet = nullptr;
    GenerateParamSet(&wrapKeyParamSet, g_wrapKeyParams, sizeof(g_wrapKeyParams) / sizeof(OH_Huks_Param));
    uint8_t tmpPublicKey[OH_HUKS_RSA_KEY_SIZE_1024] = {PARAM_0};
    struct OH_Huks_Blob outData = {OH_HUKS_RSA_KEY_SIZE_1024, static_cast<unsigned char *>(tmpPublicKey)};
    struct OH_Huks_Result resultSt = OH_Huks_UnwrapKey(&gkeyAlias, wrapKeyParamSet, &outData);
    int returnValue = SUCCESS;
    if (resultSt.errorCode != (int32_t)OH_HUKS_ERR_CODE_INSUFFICIENT_MEMORY &&
        resultSt.errorCode != OH_HUKS_ERR_CODE_NOT_SUPPORTED_API) {
        returnValue = FAIL;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"oHHuksGetSdkVersion", nullptr, OHHuksGetSdkVersion, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHHuksGetSdkVersionErr", nullptr, OHHuksGetSdkVersionErr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHHuksGenerateKeyItem", nullptr, OHHuksGenerateKeyItem, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHHuksGenerateKeyItemErr", nullptr, OHHuksGenerateKeyItemErr, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHHuksExportPublicKeyItem", nullptr, OHHuksExportPublicKeyItem, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHHuksExportPublicKeyItemErr", nullptr, OHHuksExportPublicKeyItemErr, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHHuksImportKeyItem", nullptr, OHHuksImportKeyItem, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHHuksImportKeyItemErr", nullptr, OHHuksImportKeyItemErr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHHuksDeleteKeyItem", nullptr, OHHuksDeleteKeyItem, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHHuksDeleteKeyItemErr", nullptr, OHHuksDeleteKeyItemErr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHHuksIsKeyItemExist", nullptr, OHHuksIsKeyItemExist, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHHuksIsKeyItemExistErr", nullptr, OHHuksIsKeyItemExistErr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHHuksInitSession", nullptr, OHHuksInitSession, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHHuksInitSessionErr", nullptr, OHHuksInitSessionErr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHHuksAttestKeyItem", nullptr, OHHuksAttestKeyItem, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHHuksAttestKeyItemErr", nullptr, OHHuksAttestKeyItemErr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHHuksInitParamSet", nullptr, OHHuksInitParamSet, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHHuksInitParamSetErr", nullptr, OHHuksInitParamSetErr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHHuksAddParams", nullptr, OHHuksAddParams, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHHuksAddParamsErr", nullptr, OHHuksAddParamsErr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHHuksBuildParamSet", nullptr, OHHuksBuildParamSet, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHHuksBuildParamSetErr", nullptr, OHHuksBuildParamSetErr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHHuksFreeParamSet", nullptr, OHHuksFreeParamSet, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHHuksIsParamSetValid", nullptr, OHHuksIsParamSetValid, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHHuksIsParamSetValidErr", nullptr, OHHuksIsParamSetValidErr, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHHuksIsParamSetTagValid", nullptr, OHHuksIsParamSetTagValid, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHHuksIsParamSetTagValidErr", nullptr, OHHuksIsParamSetTagValidErr, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHHuksCheckParamMatch", nullptr, OHHuksCheckParamMatch, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHHuksCheckParamMatchErr", nullptr, OHHuksCheckParamMatchErr, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHHuksFreshParamSet", nullptr, OHHuksFreshParamSet, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHHuksFreshParamSetErr", nullptr, OHHuksFreshParamSetErr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHHuksGetParam", nullptr, OHHuksGetParam, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHHuksGetParamErr", nullptr, OHHuksGetParamErr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHHuksCopyParamSet", nullptr, OHHuksCopyParamSet, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHHuksCopyParamSetErr", nullptr, OHHuksCopyParamSetErr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHHuksUpdateSession", nullptr, OHHuksUpdateSession, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHHuksUpdateSessionErr", nullptr, OHHuksUpdateSessionErr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHHuksFinishSession", nullptr, OHHuksFinishSession, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHHuksFinishSessionErr", nullptr, OHHuksFinishSessionErr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHHuksAbortSession", nullptr, OHHuksAbortSession, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHHuksAbortSessionErr", nullptr, OHHuksAbortSessionErr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHHuksGetKeyItemParamSet", nullptr, OHHuksGetKeyItemParamSet, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHHuksGetKeyItemParamSetErr", nullptr, OHHuksGetKeyItemParamSetErr, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHHuksImportWrappedKeyItem", nullptr, OHHuksImportWrappedKeyItem, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHHuksImportWrappedKeyItemErr", nullptr, OHHuksImportWrappedKeyItemErr, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHHuksAnonAttestKeyItem", nullptr, OHHuksAnonAttestKeyItem, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHHuksListAliases", nullptr, OHHuksListAliases, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHHuksFreeKeyAliasSet", nullptr, OHHuksFreeKeyAliasSet, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHHuksWrapKey", nullptr, OHHuksWrapKey, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHHuksUnwrapKey", nullptr, OHHuksUnwrapKey, nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}

EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "huksndk",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
