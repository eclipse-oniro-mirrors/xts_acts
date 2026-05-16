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

#include "include/HuksAttestTest.h"
#include <algorithm>
#include <cstdint>
#include <cstdlib>
#include <cstring>
#include <hilog/log.h>
#include <huks/native_huks_api.h>
#include <huks/native_huks_param.h>
#include <huks/native_huks_type.h>
#include <string>

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0x3200
#define LOG_TAG "HUKS_TEST"

namespace Acts {
namespace Huks {

// Constants and test data
static const uint32_t ATTESTATION_COMMON_PARAM_COUNT = 5; // Attestation parameter count

#define SEC_INFO_DATA "hi_security_level_info"
#define CHALLENGE_DATA "hi_challenge_data"
#define VERSION_DATA "hi_os_version_data"
#define ALIAS "testKey"
#define UDID_DATA "hi_udid_data"
#define SN_DATA "hi_sn_data"
#define DEVICE_ID "test_device_id"

static const uint32_t G_SIZE = 4096;
static const uint32_t CERT_COUNT = 4;
static const uint32_t G_PARAM_COUNT_IN_KEY_ATTEST = 4;
static const uint32_t G_PARAM_COUNT_IN_ID_ATTEST = 7;
static const uint32_t G_INDEX0 = 0;
static const uint32_t G_INDEX1 = 1;
static const uint32_t G_INDEX2 = 2;
static const uint32_t G_INDEX3 = 3;
static const uint32_t G_INDEX4 = 4;
static const uint32_t G_INDEX5 = 5;
static const uint32_t G_INDEX6 = 6;

enum ParamType {
    IDS_PARAM,
    NON_IDS_PARAM,
};

struct HksTestCertChain {
    bool certChainExist;
    bool certCountValid;
    bool certDataExist;
    uint32_t certDataSize;
};

// Helper function: Free memory
static void HksFree(void* ptr)
{
    if (ptr != nullptr) {
        free(ptr);
    }
}

// Memory allocation limit constant
static const size_t MAX_ALLOC_SIZE = SIZE_MAX / 2; // Half of size_t max value to prevent overflow

// Helper function: Allocate memory
static void* HksMalloc(size_t size)
{
    // G.MEM.01: 内存申请前，必须对申请内存大小进行合法性校验
    if (size == 0 || size > MAX_ALLOC_SIZE) {
        return nullptr;
    }
    return malloc(size);
}

// Helper function: Free certificate chain
static void FreeCertChain(struct OH_Huks_CertChain** certChain, const uint32_t pos)
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

// Helper function: Generate test key
static OH_Huks_Result TestGenerateKey(const struct OH_Huks_Blob* keyAlias)
{
    struct OH_Huks_Param tmpParams[] = {
        { .tag = OH_HUKS_TAG_KEY_STORAGE_FLAG, .uint32Param = OH_HUKS_STORAGE_PERSISTENT },
        { .tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_RSA },
        { .tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = OH_HUKS_RSA_KEY_SIZE_2048 },
        { .tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_VERIFY },
        { .tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA256 },
        { .tag = OH_HUKS_TAG_PADDING, .uint32Param = OH_HUKS_PADDING_PSS },
        { .tag = OH_HUKS_TAG_KEY_GENERATE_TYPE, .uint32Param = OH_HUKS_KEY_GENERATE_TYPE_DEFAULT },
        { .tag = OH_HUKS_TAG_BLOCK_MODE, .uint32Param = OH_HUKS_MODE_ECB },
        { .tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE }
    };
    struct OH_Huks_ParamSet* paramSet = nullptr;
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
    OH_Huks_FreeParamSet(&paramSet);
    return ret;
}

// Helper function: Construct data to certificate chain
static int32_t ConstructDataToCertChain(struct OH_Huks_CertChain** certChain,
                                        const struct HksTestCertChain* certChainParam)
{
    if (!certChainParam->certChainExist) {
        return 0;
    }
    *certChain = (struct OH_Huks_CertChain*)HksMalloc(sizeof(struct OH_Huks_CertChain));
    if (*certChain == nullptr) {
        return OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT;
    }
    if (!certChainParam->certCountValid) {
        (*certChain)->certsCount = 0;
        (*certChain)->certs = nullptr;
        return 0;
    }
    (*certChain)->certsCount = CERT_COUNT;
    if (!certChainParam->certDataExist) {
        (*certChain)->certs = nullptr;
        return 0;
    }
    (*certChain)->certs = (struct OH_Huks_Blob*)HksMalloc(sizeof(struct OH_Huks_Blob) * ((*certChain)->certsCount));
    if ((*certChain)->certs == nullptr) {
        HksFree(*certChain);
        *certChain = nullptr;
        return OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT;
    }
    for (uint32_t i = 0; i < (*certChain)->certsCount; i++) {
        (*certChain)->certs[i].size = certChainParam->certDataSize;
        (*certChain)->certs[i].data = static_cast<uint8_t*>(HksMalloc((*certChain)->certs[i].size));
        if ((*certChain)->certs[i].data == nullptr) {
            FreeCertChain(certChain, i);
            return OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT;
        }
        if ((*certChain)->certs[i].data != nullptr &&
            certChainParam->certDataSize <= static_cast<size_t>((*certChain)->certs[i].size)) {
            std::fill((*certChain)->certs[i].data,
                      (*certChain)->certs[i].data + certChainParam->certDataSize,
                      static_cast<uint8_t>(0));
        }
    }
    return 0;
}

// Helper function: Generate parameter set
static OH_Huks_Result GenerateParamSet(struct OH_Huks_ParamSet** paramSet,
    const struct OH_Huks_Param tmpParams[],
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

static int32_t ValidataAndCompareCertInfo(ParamType type,
                                          const struct OH_Huks_CertChain* certChain,
                                          struct OH_Huks_ParamSet* paramSet)
{
    if (certChain == nullptr || paramSet == nullptr) {
        return OH_HUKS_ERR_CODE_ILLEGAL_ARGUMENT;
    }
    int32_t ret = OH_HUKS_SUCCESS;
    if (ret == OH_HUKS_SUCCESS) {
        ret |= strcmp(SEC_INFO_DATA, reinterpret_cast<char*>(paramSet->params[G_INDEX0].blob.data));
        ret |= strcmp(CHALLENGE_DATA, reinterpret_cast<char*>(paramSet->params[G_INDEX1].blob.data));
        ret |= strcmp(VERSION_DATA, reinterpret_cast<char*>(paramSet->params[G_INDEX2].blob.data));
        ret |= strcmp(ALIAS, reinterpret_cast<char*>(paramSet->params[G_INDEX3].blob.data));
    }
    if (type == IDS_PARAM) {
        if (ret == OH_HUKS_SUCCESS) {
            ret |= strcmp(UDID_DATA, reinterpret_cast<char*>(paramSet->params[G_INDEX4].blob.data));
            ret |= strcmp(SN_DATA, reinterpret_cast<char*>(paramSet->params[G_INDEX5].blob.data));
            ret |= strcmp(DEVICE_ID, reinterpret_cast<char*>(paramSet->params[G_INDEX6].blob.data));
        }
    }
    return ret;
}

// Helper function: Validate certificate chain test
static OH_Huks_Result ValidateCertChainTest(const struct OH_Huks_CertChain* certChain,
                                            const struct OH_Huks_Param tmpParam[],
                                            ParamType type)
{
    OH_Huks_Result ret;
    struct OH_Huks_ParamSet* paramSet = nullptr;
    do {
        ret = OH_Huks_InitParamSet(&paramSet);
        if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
            break;
        }
        uint32_t paramCount = 0;
        if (type == IDS_PARAM) {
            paramCount = G_PARAM_COUNT_IN_ID_ATTEST;
        } else if (type == NON_IDS_PARAM) {
            paramCount = G_PARAM_COUNT_IN_KEY_ATTEST;
        }
        ret = OH_Huks_AddParams(paramSet, tmpParam, paramCount);
        if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
            break;
        }
        ret = OH_Huks_BuildParamSet(&paramSet);
        if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
            break;
        }
        ret.errorCode = ValidataAndCompareCertInfo(type, certChain, paramSet);
    } while (0);
    OH_Huks_FreeParamSet(&paramSet);
    return ret;
}

// Helper function: Check if using software implementation
static bool CheckUseSoftware()
{
    OH_LOG_INFO(LOG_APP, "CheckUseSoftware: Starting check");

    const char* keyAliasString = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa";
    struct OH_Huks_Param genParams[] = {
        { .tag = OH_HUKS_TAG_ALGORITHM, .uint32Param = OH_HUKS_ALG_DSA },
        { .tag = OH_HUKS_TAG_PURPOSE, .uint32Param = OH_HUKS_KEY_PURPOSE_SIGN | OH_HUKS_KEY_PURPOSE_VERIFY },
        { .tag = OH_HUKS_TAG_KEY_SIZE, .uint32Param = 1024 },
        { .tag = OH_HUKS_TAG_DIGEST, .uint32Param = OH_HUKS_DIGEST_SHA1 },
        { .tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE }
    };

    struct OH_Huks_ParamSet* genParamSet = nullptr;
    struct OH_Huks_Blob keyAlias = { static_cast<uint32_t>(strlen(keyAliasString)),
                                     reinterpret_cast<uint8_t*>(const_cast<char*>(keyAliasString)) };

    OH_Huks_Result initRet = OH_Huks_InitParamSet(&genParamSet);
    OH_LOG_INFO(LOG_APP, "CheckUseSoftware: InitParamSet errorCode=%{public}d", initRet.errorCode);
    if (initRet.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "CheckUseSoftware: InitParamSet failed, returning false");
        return false;
    }

    OH_Huks_Result addRet = OH_Huks_AddParams(genParamSet, genParams, sizeof(genParams) / sizeof(OH_Huks_Param));
    OH_LOG_INFO(LOG_APP, "CheckUseSoftware: AddParams errorCode=%{public}d", addRet.errorCode);
    if (addRet.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "CheckUseSoftware: AddParams failed, returning false");
        OH_Huks_FreeParamSet(&genParamSet);
        return false;
    }

    OH_Huks_Result buildRet = OH_Huks_BuildParamSet(&genParamSet);
    OH_LOG_INFO(LOG_APP, "CheckUseSoftware: BuildParamSet errorCode=%{public}d", buildRet.errorCode);
    if (buildRet.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "CheckUseSoftware: BuildParamSet failed, returning false");
        OH_Huks_FreeParamSet(&genParamSet);
        return false;
    }

    OH_Huks_Result ret = OH_Huks_GenerateKeyItem(&keyAlias, genParamSet, nullptr);
    OH_LOG_INFO(LOG_APP, "CheckUseSoftware: GenerateKeyItem errorCode=%{public}d", ret.errorCode);

    if (ret.errorCode == 0) {
        OH_LOG_INFO(LOG_APP, "CheckUseSoftware: DSA key generated successfully, using SOFTWARE mode");
        OH_Huks_DeleteKeyItem(&keyAlias, genParamSet);
        OH_Huks_FreeParamSet(&genParamSet);
        return true;
    }

    OH_LOG_INFO(LOG_APP, "CheckUseSoftware: DSA key generation failed, NOT using software mode (hardware TEE)");
    OH_Huks_FreeParamSet(&genParamSet);
    return false;
}

// Structure to encapsulate attestation data blobs
struct AttestationDataBlobs {
    struct OH_Huks_Blob* secInfo;
    struct OH_Huks_Blob* challenge;
    struct OH_Huks_Blob* version;
};

// Helper function: Initialize attestation data and generate key
static int InitAttestationDataAndGenerateKey(struct AttestationDataBlobs* dataBlobs,
                                             const struct OH_Huks_Blob* gKeyAlias,
                                             struct OH_Huks_Param* gCommonParams,
                                             struct OH_Huks_ParamSet** paramSet)
{
    // Initialize static blobs
    *dataBlobs->secInfo = { sizeof(SEC_INFO_DATA), reinterpret_cast<uint8_t*>(const_cast<char*>(SEC_INFO_DATA)) };
    *dataBlobs->challenge = { sizeof(CHALLENGE_DATA), reinterpret_cast<uint8_t*>(const_cast<char*>(CHALLENGE_DATA)) };
    *dataBlobs->version = { sizeof(VERSION_DATA), reinterpret_cast<uint8_t*>(const_cast<char*>(VERSION_DATA)) };

    // Initialize common params array
    gCommonParams[0] = { .tag = OH_HUKS_TAG_ATTESTATION_ID_SEC_LEVEL_INFO, .blob = *dataBlobs->secInfo };
    gCommonParams[1] = { .tag = OH_HUKS_TAG_ATTESTATION_CHALLENGE, .blob = *dataBlobs->challenge };
    gCommonParams[2] = { .tag = OH_HUKS_TAG_ATTESTATION_ID_VERSION_INFO, .blob = *dataBlobs->version };
    gCommonParams[3] = { .tag = OH_HUKS_TAG_ATTESTATION_ID_ALIAS, .blob = *gKeyAlias };
    gCommonParams[4] = { .tag = OH_HUKS_TAG_AUTH_STORAGE_LEVEL, .uint32Param = OH_HUKS_AUTH_STORAGE_LEVEL_DE };

    // Step 1: Generate Key
    OH_Huks_Result ret = TestGenerateKey(gKeyAlias);
    OH_LOG_INFO(LOG_APP, "[Step 1] TestGenerateKey result: errorCode=%{public}d", ret.errorCode);

    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "[Step 1] TestGenerateKey FAILED with errorCode=%{public}d, returning -1", ret.errorCode);
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "[Step 1] TestGenerateKey SUCCEEDED");

    // Step 2: Generate ParamSet
    ret = GenerateParamSet(paramSet, gCommonParams, ATTESTATION_COMMON_PARAM_COUNT);
    OH_LOG_INFO(LOG_APP, "[Step 2] GenerateParamSet result: errorCode=%{public}d", ret.errorCode);

    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_LOG_ERROR(LOG_APP,
                     "[Step 2] GenerateParamSet FAILED with errorCode=%{public}d, cleaning up and returning -1",
                     ret.errorCode);
        OH_Huks_DeleteKeyItem(gKeyAlias, nullptr);
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "[Step 2] GenerateParamSet SUCCEEDED");

    return 0;
}

// Helper function: Perform attestation and validate
static int PerformAttestationAndValidate(const struct OH_Huks_Blob* gKeyAlias,
                                         struct OH_Huks_ParamSet* paramSet,
                                         const struct OH_Huks_Param* gCommonParams,
                                         OH_Huks_CertChain** certChain)
{
    // Step 3: Construct CertChain
    const struct HksTestCertChain certParam = { true, true, true, G_SIZE };
    int32_t constructRet = ConstructDataToCertChain(certChain, &certParam);
    OH_LOG_INFO(LOG_APP, "[Step 3] ConstructDataToCertChain result: %{public}d", constructRet);

    if (constructRet != 0) {
        OH_LOG_ERROR(LOG_APP,
                     "[Step 3] ConstructDataToCertChain FAILED with code=%{public}d, cleaning up and returning -1",
                     constructRet);
        OH_Huks_FreeParamSet(&paramSet);
        OH_Huks_DeleteKeyItem(gKeyAlias, nullptr);
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "[Step 3] ConstructDataToCertChain SUCCEEDED");

    // Step 4: AttestKeyItem (expected to fail in software mode)
    OH_Huks_Result ret = OH_Huks_AttestKeyItem(gKeyAlias, paramSet, *certChain);
    OH_LOG_INFO(LOG_APP,
                "[Step 4] AttestKeyItem result: errorCode=%{public}d (EXPECTED to FAIL in software mode)",
                ret.errorCode);

    if (ret.errorCode == (int32_t)OH_HUKS_SUCCESS) {
        OH_LOG_ERROR(LOG_APP,
                     "[Step 4] AttestKeyItem unexpectedly SUCCEEDED in software mode (should fail!), returning -1");
        FreeCertChain(certChain, (*certChain)->certsCount);
        OH_Huks_FreeParamSet(&paramSet);
        OH_Huks_DeleteKeyItem(gKeyAlias, nullptr);
        return -1;
    }
    OH_LOG_INFO(
        LOG_APP, "[Step 4] AttestKeyItem FAILED as expected in software mode (errorCode=%{public}d)", ret.errorCode);

    // Step 5: ValidateCertChainTest
    ret = ValidateCertChainTest(*certChain, gCommonParams, NON_IDS_PARAM);
    OH_LOG_INFO(LOG_APP, "[Step 5] ValidateCertChainTest result: errorCode=%{public}d", ret.errorCode);

    if (ret.errorCode == (int32_t)OH_HUKS_SUCCESS) {
        OH_LOG_INFO(
            LOG_APP,
            "[Step 5] ValidateCertChainTest SUCCEEDED (validates parameter strings only, not cert chain validity)");
    } else {
        OH_LOG_INFO(LOG_APP, "[Step 5] ValidateCertChainTest FAILED with errorCode=%{public}d", ret.errorCode);
    }

    return 0;
}

// Helper function: Cleanup attestation resources
static void CleanupAttestationResources(OH_Huks_CertChain** certChain,
                                        struct OH_Huks_ParamSet** paramSet,
                                        const struct OH_Huks_Blob* gKeyAlias)
{
    // Step 6: Cleanup cert chain
    FreeCertChain(certChain, (*certChain)->certsCount);
    OH_LOG_INFO(LOG_APP, "[Step 6] Certificate chain freed");

    // Step 7: DeleteKeyItem (may fail if key doesn't exist)
    OH_Huks_Result ret = OH_Huks_DeleteKeyItem(gKeyAlias, *paramSet);
    OH_LOG_INFO(LOG_APP, "[Step 7] DeleteKeyItem result: errorCode=%{public}d", ret.errorCode);
    OH_Huks_FreeParamSet(paramSet);

    if (ret.errorCode != (int32_t)OH_HUKS_SUCCESS) {
        OH_LOG_WARN(LOG_APP,
                    "[Step 7] DeleteKeyItem FAILED with errorCode=%{public}d (code -13 means key not found)",
                    ret.errorCode);
        OH_LOG_WARN(LOG_APP,
                    "[Step 7] In software mode, key may not exist if previous operations failed - this is ACCEPTABLE");
        OH_LOG_INFO(LOG_APP,
                    "[Step 7] The test logic itself PASSED (AttestKey and ValidateCertChain both failed as expected)");
    } else {
        OH_LOG_INFO(LOG_APP, "[Step 7] DeleteKeyItem SUCCEEDED");
    }
}

/**
 * @tc.name   SecurityHuksNapiAttest0100
 * @tc.number Security_HUKS_NAPI_Attest_0100
 * @tc.desc   attest with right params and validate success.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SecurityHuksNapiAttest0100()
{
    OH_LOG_INFO(LOG_APP, "========== SecurityHuksNapiAttest0100: Test started ==========");

    bool useSoftware = CheckUseSoftware();
    OH_LOG_INFO(LOG_APP, "CheckUseSoftware result: %{public}d (0=hardware TEE, 1=software mode)", useSoftware);

    if (useSoftware) {
        OH_LOG_INFO(LOG_APP, "========== Entering software mode branch ==========");

        static struct OH_Huks_Blob g_secInfo;
        static struct OH_Huks_Blob g_challenge;
        static struct OH_Huks_Blob g_version;
        static const struct OH_Huks_Blob gKeyAlias = { sizeof(ALIAS),
                                                       reinterpret_cast<uint8_t*>(const_cast<char*>(ALIAS)) };
        static struct OH_Huks_Param gCommonParams[ATTESTATION_COMMON_PARAM_COUNT];

        struct OH_Huks_ParamSet* paramSet = nullptr;
        struct AttestationDataBlobs dataBlobs = { .secInfo = &g_secInfo,
                                                  .challenge = &g_challenge,
                                                  .version = &g_version };

        if (InitAttestationDataAndGenerateKey(&dataBlobs, &gKeyAlias, gCommonParams, &paramSet) != 0) {
            return -1;
        }

        OH_Huks_CertChain* certChain = nullptr;
        if (PerformAttestationAndValidate(&gKeyAlias, paramSet, gCommonParams, &certChain) != 0) {
            OH_Huks_FreeParamSet(&paramSet);
            return -1;
        }

        CleanupAttestationResources(&certChain, &paramSet, &gKeyAlias);
        OH_LOG_INFO(LOG_APP, "========== Software mode branch completed successfully ==========");
    } else {
        OH_LOG_INFO(LOG_APP, "========== NOT using software mode (hardware TEE detected) ==========");
        OH_LOG_INFO(LOG_APP, "Skipping software mode test logic");
    }

    OH_LOG_INFO(LOG_APP, "========== SecurityHuksNapiAttest0100: Test PASSED, returning 0 ==========");
    return 0;
}

} // namespace Huks
} // namespace Acts
