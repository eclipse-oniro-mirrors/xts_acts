/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
#include <stdlib.h>
#include <stdio.h>
#include <pthread.h>
#include <string.h>
#include<math.h>

#include "crypto_framework_kdf_test.h"
#include "blob.h"
#include "log.h"

#include <gtest/gtest.h>

using namespace testing::ext;
namespace Unittest::CryptoFrameworkKdfNapiTest {
class OHCryptoFrameworkKdfNapiTest : public testing::Test {
public:
    static void SetUpTestCase(void) {};
    static void TearDownTestCase(void) {};
    void SetUp() {};
    void TearDown() {};
};

class KDF_TEST : public testing::TestWithParam<KdfSpec> {
    public:
        static void SetUpTestCase() {};
        static void TearDownTestCase() {};
};

class KDF_SCRYPT_TEST : public testing::TestWithParam<KdfSpec> {
    public:
        static void SetUpTestCase() {};
        static void TearDownTestCase() {};
};

class KDF_HKDF_TEST : public testing::TestWithParam<KdfSpec> {
    public:
        static void SetUpTestCase() {};
        static void TearDownTestCase() {};
};

class KDF_PBKDF2_TEST : public testing::TestWithParam<KdfSpec> {
    public:
        static void SetUpTestCase() {};
        static void TearDownTestCase() {};
};

class KDF_VECTOR_TEST : public testing::TestWithParam<KdfVectorSpec> {
    public:
        static void SetUpTestCase() {};
        static void TearDownTestCase() {};
};

static OH_Crypto_ErrCode OHTEST_CreatePbkdf2Params(paramsSpec paramInfo, OH_CryptoKdfParams **params)
{
    OH_Crypto_ErrCode ret = CRYPTO_SUCCESS;
    Crypto_DataBlob password = {.data = paramInfo.pbkdf2Params.password, .len = 0};
    Crypto_DataBlob salt = {.data = paramInfo.pbkdf2Params.salt, .len = 0};
    Crypto_DataBlob iterations = {.data = (uint8_t *)&(paramInfo.pbkdf2Params.iterations), .len = sizeof(int)};

    ret = OH_CryptoKdfParams_Create("PBKDF2", params);
    if (ret != CRYPTO_SUCCESS) {
        return ret;
    }
    if (paramInfo.pbkdf2Params.password) {
        password.len = strlen((const char *)paramInfo.pbkdf2Params.password);
        ret = OH_CryptoKdfParams_SetParam(*params, CRYPTO_KDF_KEY_DATABLOB, &password);
        if (ret != CRYPTO_SUCCESS) {
            OH_CryptoKdfParams_Destroy(*params);
            *params = nullptr;
            return ret;
        }
    }
    if (paramInfo.pbkdf2Params.salt) {
        salt.len = strlen((const char *)paramInfo.pbkdf2Params.salt);
        ret = OH_CryptoKdfParams_SetParam(*params, CRYPTO_KDF_SALT_DATABLOB, &salt);
        if (ret != CRYPTO_SUCCESS) {
            OH_CryptoKdfParams_Destroy(*params);
            *params = nullptr;
            return ret;
        }
    }
    ret = OH_CryptoKdfParams_SetParam(*params, CRYPTO_KDF_ITER_COUNT_INT, &iterations);
    if (ret != CRYPTO_SUCCESS) {
        OH_CryptoKdfParams_Destroy(*params);
        *params = nullptr;
        return ret;
    }

    return ret;
}

static OH_Crypto_ErrCode OHTEST_CreateHkdfParams(paramsSpec paramInfo, OH_CryptoKdfParams **params)
{
    OH_Crypto_ErrCode ret = CRYPTO_SUCCESS;
    Crypto_DataBlob key = {.data = paramInfo.hkdfParams.key, .len = 0};
    Crypto_DataBlob salt = {.data = paramInfo.hkdfParams.salt, .len = 0};
    Crypto_DataBlob info = {.data = paramInfo.hkdfParams.info, .len = 0};

    ret = OH_CryptoKdfParams_Create("HKDF", params);
    if (ret != CRYPTO_SUCCESS) {
        return ret;
    }
    if (paramInfo.hkdfParams.key) {
        key.len = strlen((const char *)paramInfo.hkdfParams.key);
        ret = OH_CryptoKdfParams_SetParam(*params, CRYPTO_KDF_KEY_DATABLOB, &key);
        if (ret != CRYPTO_SUCCESS) {
            OH_CryptoKdfParams_Destroy(*params);
            *params = nullptr;
            return ret;
        }
    }
    if (paramInfo.hkdfParams.salt) {
        salt.len = strlen((const char *)paramInfo.hkdfParams.salt);
        ret = OH_CryptoKdfParams_SetParam(*params, CRYPTO_KDF_SALT_DATABLOB, &salt);
        if (ret != CRYPTO_SUCCESS) {
            OH_CryptoKdfParams_Destroy(*params);
            *params = nullptr;
            return ret;
        }
    }
    if (paramInfo.hkdfParams.info) {
        info.len = strlen((const char *)paramInfo.hkdfParams.info);
        ret = OH_CryptoKdfParams_SetParam(*params, CRYPTO_KDF_INFO_DATABLOB, &info);
        if (ret != CRYPTO_SUCCESS) {
            OH_CryptoKdfParams_Destroy(*params);
            *params = nullptr;
            return ret;
        }
    }

    return ret;
}

static OH_Crypto_ErrCode OHTEST_CreateScryptParams(paramsSpec paramInfo, OH_CryptoKdfParams **params)
{
    OH_Crypto_ErrCode ret = CRYPTO_SUCCESS;
    Crypto_DataBlob passphrase = {.data = paramInfo.scryptParams.passphrase, .len = 0};
    Crypto_DataBlob salt = {.data = paramInfo.scryptParams.salt, .len = 0};
    Crypto_DataBlob n = {.data = (uint8_t *)&(paramInfo.scryptParams.n), .len = sizeof(uint64_t)};
    Crypto_DataBlob p = {.data = (uint8_t *)&(paramInfo.scryptParams.p), .len = sizeof(uint64_t)};
    Crypto_DataBlob r = {.data = (uint8_t *)&(paramInfo.scryptParams.r), .len = sizeof(uint64_t)};
    Crypto_DataBlob max_mem = {.data = (uint8_t *)&(paramInfo.scryptParams.max_mem), .len = sizeof(uint64_t)};

    ret = OH_CryptoKdfParams_Create("SCRYPT", params);
    if (ret != CRYPTO_SUCCESS) {
        return ret;
    }
    if (paramInfo.scryptParams.passphrase) {
        passphrase.len = strlen((const char *)paramInfo.scryptParams.passphrase);
        ret = OH_CryptoKdfParams_SetParam(*params, CRYPTO_KDF_KEY_DATABLOB, &passphrase);
        if (ret != CRYPTO_SUCCESS) {
            OH_CryptoKdfParams_Destroy(*params);
            *params = nullptr;
            return ret;
        }
    }
    if (paramInfo.scryptParams.salt) {
        salt.len = strlen((const char *)paramInfo.scryptParams.salt);
        ret = OH_CryptoKdfParams_SetParam(*params, CRYPTO_KDF_SALT_DATABLOB, &salt);
        if (ret != CRYPTO_SUCCESS) {
            OH_CryptoKdfParams_Destroy(*params);
            *params = nullptr;
            return ret;
        }
    }
    ret = OH_CryptoKdfParams_SetParam(*params, CRYPTO_KDF_SCRYPT_N_UINT64, &n);
    if (ret != CRYPTO_SUCCESS) {
        OH_CryptoKdfParams_Destroy(*params);
        *params = nullptr;
        return ret;
    }
    ret = OH_CryptoKdfParams_SetParam(*params, CRYPTO_KDF_SCRYPT_P_UINT64, &p);
    if (ret != CRYPTO_SUCCESS) {
        OH_CryptoKdfParams_Destroy(*params);
        *params = nullptr;
        return ret;
    }
    ret = OH_CryptoKdfParams_SetParam(*params, CRYPTO_KDF_SCRYPT_R_UINT64, &r);
    if (ret != CRYPTO_SUCCESS) {
        OH_CryptoKdfParams_Destroy(*params);
        *params = nullptr;
        return ret;
    }
    if (*(uint64_t *)&(paramInfo.scryptParams.max_mem)) {
        ret = OH_CryptoKdfParams_SetParam(*params, CRYPTO_KDF_SCRYPT_MAX_MEM_UINT64, &max_mem);
        if (ret != CRYPTO_SUCCESS) {
            OH_CryptoKdfParams_Destroy(*params);
            *params = nullptr;
            return ret;
        }
    }

    return ret;
}

static OH_Crypto_ErrCode OHTEST_CreateX963Params(paramsSpec paramInfo, OH_CryptoKdfParams **params)
{
    OH_Crypto_ErrCode ret = CRYPTO_SUCCESS;
    Crypto_DataBlob key = {.data = paramInfo.x963Params.key, .len = 0};
    Crypto_DataBlob info = {.data = paramInfo.x963Params.info, .len = 0};

    ret = OH_CryptoKdfParams_Create("X963KDF", params);
    if (ret != CRYPTO_SUCCESS) {
        printf("OH_CryptoKdfParams_Create failed\n");
        return ret;
    }
    if (paramInfo.x963Params.key) {
        key.len = strlen((const char *)paramInfo.x963Params.key);
        ret = OH_CryptoKdfParams_SetParam(*params, CRYPTO_KDF_KEY_DATABLOB, &key);
        if (ret != CRYPTO_SUCCESS) {
            printf("OH_CryptoKdfParams_SetParam key failed\n");
            OH_CryptoKdfParams_Destroy(*params);
            *params = nullptr;
            return ret;
        }
    }
    if (paramInfo.x963Params.info) {
        info.len = strlen((const char *)paramInfo.x963Params.info);
        ret = OH_CryptoKdfParams_SetParam(*params, CRYPTO_KDF_INFO_DATABLOB, &info);
        if (ret != CRYPTO_SUCCESS) {
            printf("OH_CryptoKdfParams_SetParam info failed\n");
            OH_CryptoKdfParams_Destroy(*params);
            *params = nullptr;
            return ret;
        }
    }
    printf("OH_CryptoKdfParams_SetParam success\n");

    return ret;
}

KdfSpec g_kdfSpec[] = {
    /* PBKDF2 */
    {
        .kdfType = OHTEST_KDF_PBKDF2, .algoName = "PBKDF2|SHA1", .keySize = 64,
        .params.pbkdf2Params = {.password = (uint8_t *)"0123456789", .salt = (uint8_t *)"abcdef", .iterations = 16}
    }, // 0
    {
        .kdfType = OHTEST_KDF_PBKDF2, .algoName = "PBKDF2|SHA224", .keySize = 64,
        .params.pbkdf2Params = {.password = (uint8_t *)"0123456789", .salt = (uint8_t *)"abcdef", .iterations = 16}
    },
    {
        .kdfType = OHTEST_KDF_PBKDF2, .algoName = "PBKDF2|SHA256", .keySize = 64,
        .params.pbkdf2Params = {.password = (uint8_t *)"0123456789", .salt = (uint8_t *)"abcdef", .iterations = 16}
    },
    {
        .kdfType = OHTEST_KDF_PBKDF2, .algoName = "PBKDF2|SHA384", .keySize = 64,
        .params.pbkdf2Params = {.password = (uint8_t *)"0123456789", .salt = (uint8_t *)"abcdef", .iterations = 16}
    },
    {
        .kdfType = OHTEST_KDF_PBKDF2, .algoName = "PBKDF2|SHA512", .keySize = 64,
        .params.pbkdf2Params = {.password = (uint8_t *)"0123456789", .salt = (uint8_t *)"abcdef", .iterations = 16}
    },
    {
        .kdfType = OHTEST_KDF_PBKDF2, .algoName = "PBKDF2|SM3", .keySize = 64,
        .params.pbkdf2Params = {.password = (uint8_t *)"0123456789", .salt = (uint8_t *)"abcdef", .iterations = 16}
    },
    /* HKDF */
    {
        .kdfType = OHTEST_KDF_HKDF, .algoName = "HKDF|SHA1|EXPAND_ONLY", .keySize = OHTEST_SHA1_DIGIESTSIZE * OHTEST_KDF_CONSTANT_LEN - 1,
        .params.hkdfParams = {.key = (uint8_t *)"0123456789", .salt = (uint8_t *)"abcdef", .info = (uint8_t *)"abc"}
    }, // 6
    {
        .kdfType = OHTEST_KDF_HKDF, .algoName = "HKDF|SHA1|EXTRACT_ONLY", .keySize = OHTEST_SHA1_DIGIESTSIZE,
        .params.hkdfParams = {.key = (uint8_t *)"0123456789", .salt = (uint8_t *)"abcdef", .info = (uint8_t *)"abc"}
    },
    {
        .kdfType = OHTEST_KDF_HKDF, .algoName = "HKDF|SHA1|EXTRACT_AND_EXPAND", .keySize = OHTEST_SHA1_DIGIESTSIZE * OHTEST_KDF_CONSTANT_LEN - 1,
        .params.hkdfParams = {.key = (uint8_t *)"0123456789", .salt = (uint8_t *)"abcdef", .info = (uint8_t *)"abc"}
    },
    {
        .kdfType = OHTEST_KDF_HKDF, .algoName = "HKDF|SHA224|EXPAND_ONLY", .keySize = OHTEST_SHA224_DIGIESTSIZE * OHTEST_KDF_CONSTANT_LEN - 1,
        .params.hkdfParams = {.key = (uint8_t *)"0123456789", .salt = (uint8_t *)"abcdef", .info = (uint8_t *)"abc"}
    },
    {
        .kdfType = OHTEST_KDF_HKDF, .algoName = "HKDF|SHA224|EXTRACT_ONLY", .keySize = OHTEST_SHA224_DIGIESTSIZE,
        .params.hkdfParams = {.key = (uint8_t *)"0123456789", .salt = (uint8_t *)"abcdef", .info = (uint8_t *)"abc"}
    },
    {
        .kdfType = OHTEST_KDF_HKDF, .algoName = "HKDF|SHA224|EXTRACT_AND_EXPAND", .keySize = OHTEST_SHA224_DIGIESTSIZE * OHTEST_KDF_CONSTANT_LEN - 1,
        .params.hkdfParams = {.key = (uint8_t *)"0123456789", .salt = (uint8_t *)"abcdef", .info = (uint8_t *)"abc"}
    },
    {
        .kdfType = OHTEST_KDF_HKDF, .algoName = "HKDF|SHA256|EXPAND_ONLY", .keySize = OHTEST_SHA256_DIGIESTSIZE * OHTEST_KDF_CONSTANT_LEN - 1,
        .params.hkdfParams = {.key = (uint8_t *)"0123456789", .salt = (uint8_t *)"abcdef", .info = (uint8_t *)"abc"}
    },
    {
        .kdfType = OHTEST_KDF_HKDF, .algoName = "HKDF|SHA256|EXTRACT_ONLY", .keySize = OHTEST_SHA256_DIGIESTSIZE,
        .params.hkdfParams = {.key = (uint8_t *)"0123456789", .salt = (uint8_t *)"abcdef", .info = (uint8_t *)"abc"}
    },
    {
        .kdfType = OHTEST_KDF_HKDF, .algoName = "HKDF|SHA256|EXTRACT_AND_EXPAND", .keySize = OHTEST_SHA256_DIGIESTSIZE * OHTEST_KDF_CONSTANT_LEN - 1,
        .params.hkdfParams = {.key = (uint8_t *)"0123456789", .salt = (uint8_t *)"abcdef", .info = (uint8_t *)"abc"}
    },
    {
        .kdfType = OHTEST_KDF_HKDF, .algoName = "HKDF|SHA384|EXPAND_ONLY", .keySize = OHTEST_SHA384_DIGIESTSIZE * OHTEST_KDF_CONSTANT_LEN - 1,
        .params.hkdfParams = {.key = (uint8_t *)"0123456789", .salt = (uint8_t *)"abcdef", .info = (uint8_t *)"abc"}
    },
    {
        .kdfType = OHTEST_KDF_HKDF, .algoName = "HKDF|SHA384|EXTRACT_ONLY", .keySize = OHTEST_SHA384_DIGIESTSIZE,
        .params.hkdfParams = {.key = (uint8_t *)"0123456789", .salt = (uint8_t *)"abcdef", .info = (uint8_t *)"abc"}
    },
    {
        .kdfType = OHTEST_KDF_HKDF, .algoName = "HKDF|SHA384|EXTRACT_AND_EXPAND", .keySize = OHTEST_SHA384_DIGIESTSIZE * OHTEST_KDF_CONSTANT_LEN - 1,
        .params.hkdfParams = {.key = (uint8_t *)"0123456789", .salt = (uint8_t *)"abcdef", .info = (uint8_t *)"abc"}
    },
    {
        .kdfType = OHTEST_KDF_HKDF, .algoName = "HKDF|SHA512|EXPAND_ONLY", .keySize = OHTEST_SHA512_DIGIESTSIZE * OHTEST_KDF_CONSTANT_LEN - 1,
        .params.hkdfParams = {.key = (uint8_t *)"0123456789", .salt = (uint8_t *)"abcdef", .info = (uint8_t *)"abc"}
    },
    {
        .kdfType = OHTEST_KDF_HKDF, .algoName = "HKDF|SHA512|EXTRACT_ONLY", .keySize = OHTEST_SHA512_DIGIESTSIZE,
        .params.hkdfParams = {.key = (uint8_t *)"0123456789", .salt = (uint8_t *)"abcdef", .info = (uint8_t *)"abc"}
    },
    {
        .kdfType = OHTEST_KDF_HKDF, .algoName = "HKDF|SHA512|EXTRACT_AND_EXPAND", .keySize = OHTEST_SHA512_DIGIESTSIZE * OHTEST_KDF_CONSTANT_LEN - 1,
        .params.hkdfParams = {.key = (uint8_t *)"0123456789", .salt = (uint8_t *)"abcdef", .info = (uint8_t *)"abc"}
    },
    {
        .kdfType = OHTEST_KDF_HKDF, .algoName = "HKDF|SM3|EXPAND_ONLY", .keySize = OHTEST_SM3_DIGIESTSIZE * OHTEST_KDF_CONSTANT_LEN - 1,
        .params.hkdfParams = {.key = (uint8_t *)"0123456789", .salt = (uint8_t *)"abcdef", .info = (uint8_t *)"abc"}
    },
    {
        .kdfType = OHTEST_KDF_HKDF, .algoName = "HKDF|SM3|EXTRACT_ONLY", .keySize = OHTEST_SM3_DIGIESTSIZE,
        .params.hkdfParams = {.key = (uint8_t *)"0123456789", .salt = (uint8_t *)"abcdef", .info = (uint8_t *)"abc"}
    },
    {
        .kdfType = OHTEST_KDF_HKDF, .algoName = "HKDF|SM3|EXTRACT_AND_EXPAND", .keySize = OHTEST_SM3_DIGIESTSIZE * OHTEST_KDF_CONSTANT_LEN - 1,
        .params.hkdfParams = {.key = (uint8_t *)"0123456789", .salt = (uint8_t *)"abcdef", .info = (uint8_t *)"abc"}
    },
    {
        .kdfType = OHTEST_KDF_HKDF, .algoName = "HKDF|MD5|EXPAND_ONLY", .keySize = OHTEST_MD5_DIGIESTSIZE * OHTEST_KDF_CONSTANT_LEN - 1,
        .params.hkdfParams = {.key = (uint8_t *)"0123456789", .salt = (uint8_t *)"abcdef", .info = (uint8_t *)"abc"}
    },
    {
        .kdfType = OHTEST_KDF_HKDF, .algoName = "HKDF|MD5|EXTRACT_ONLY", .keySize = OHTEST_MD5_DIGIESTSIZE,
        .params.hkdfParams = {.key = (uint8_t *)"0123456789", .salt = (uint8_t *)"abcdef", .info = (uint8_t *)"abc"}
    },
    {
        .kdfType = OHTEST_KDF_HKDF, .algoName = "HKDF|MD5|EXTRACT_AND_EXPAND", .keySize = OHTEST_MD5_DIGIESTSIZE * OHTEST_KDF_CONSTANT_LEN - 1,
        .params.hkdfParams = {.key = (uint8_t *)"0123456789", .salt = (uint8_t *)"abcdef", .info = (uint8_t *)"abc"}
    },
    {
        .kdfType = OHTEST_KDF_HKDF, .algoName = "HKDF|MD5", .keySize = OHTEST_MD5_DIGIESTSIZE * OHTEST_KDF_CONSTANT_LEN - 1,
        .params.hkdfParams = {.key = (uint8_t *)"0123456789", .salt = (uint8_t *)"abcdef", .info = (uint8_t *)"abc"}
    },
    /* SCRYPT */
    {
        .kdfType = OHTEST_KDF_SCRYPT, .algoName = "SCRYPT", .keySize = 64,
        // max_mem = p * 128 * r + 32 * r * (n + 2) * 4 + 1
        .params.scryptParams = {.passphrase = (uint8_t *)"0123456789", .salt = (uint8_t *)"abcdef", .n = 1024, .p = 1, .r = 8, .max_mem = 1051649}
    }, // 28
    /* X963 with info*/
    {
        .kdfType = OHTEST_KDF_X963, .algoName = "X963KDF|SHA1", .keySize = 64,
        .params.x963Params = {.key = (uint8_t *)"0123456789", .info = (uint8_t *)"abcdef"}
    },
    {
        .kdfType = OHTEST_KDF_X963, .algoName = "X963KDF|SHA224", .keySize = 27,
        .params.x963Params = {.key = (uint8_t *)"0123456789", .info = (uint8_t *)"abcdef"}
    },
    {
        .kdfType = OHTEST_KDF_X963, .algoName = "X963KDF|SHA256", .keySize = 33,
        .params.x963Params = {.key = (uint8_t *)"0123456789", .info = (uint8_t *)"abcdef"}
    },
    {
        .kdfType = OHTEST_KDF_X963, .algoName = "X963KDF|SHA384", .keySize = 64,
        .params.x963Params = {.key = (uint8_t *)"0123456789", .info = (uint8_t *)"abcdef"}
    },
    {
        .kdfType = OHTEST_KDF_X963, .algoName = "X963KDF|SHA512", .keySize = 16,
        .params.x963Params = {.key = (uint8_t *)"0123456789", .info = (uint8_t *)"abcdef"}
    },
    /* X963 without info*/
    {
        .kdfType = OHTEST_KDF_X963, .algoName = "X963KDF|SHA1", .keySize = 64,
        .params.x963Params = {.key = (uint8_t *)"0123456789", .info = nullptr}
    },
    {
        .kdfType = OHTEST_KDF_X963, .algoName = "X963KDF|SHA224", .keySize = 27,
        .params.x963Params = {.key = (uint8_t *)"0123456789", .info = nullptr}
    },
    {
        .kdfType = OHTEST_KDF_X963, .algoName = "X963KDF|SHA256", .keySize = 33,
        .params.x963Params = {.key = (uint8_t *)"0123456789", .info = nullptr}
    },
    {
        .kdfType = OHTEST_KDF_X963, .algoName = "X963KDF|SHA384", .keySize = 64,
        .params.x963Params = {.key = (uint8_t *)"0123456789", .info = nullptr}
    },
    {
        .kdfType = OHTEST_KDF_X963, .algoName = "X963KDF|SHA512", .keySize = 16,
        .params.x963Params = {.key = (uint8_t *)"0123456789", .info = nullptr}
    },
};
INSTANTIATE_TEST_CASE_P(OHCryptoFrameworkKdfNapiTest, KDF_TEST, ::testing::ValuesIn(g_kdfSpec));

HWTEST_P(KDF_TEST, SUB_Security_CryptoFramework_NAPI_Kdf_Test_0100, TestSize.Level0)
{
    KdfSpec infoSpec = GetParam();
    KdfType kdfType = infoSpec.kdfType;
    const char *algoName = infoSpec.algoName;
    int keySize = infoSpec.keySize;
    OH_CryptoKdfParams *params = nullptr;
    OH_CryptoKdf *ctx = nullptr;
    Crypto_DataBlob key = {.data = nullptr, .len = 0};

    switch(kdfType) {
        case OHTEST_KDF_PBKDF2:
            EXPECT_EQ(OHTEST_CreatePbkdf2Params(infoSpec.params, &params), CRYPTO_SUCCESS);
            break;
        case OHTEST_KDF_HKDF:
            EXPECT_EQ(OHTEST_CreateHkdfParams(infoSpec.params, &params), CRYPTO_SUCCESS);
            break;
        case OHTEST_KDF_SCRYPT:
            EXPECT_EQ(OHTEST_CreateScryptParams(infoSpec.params, &params), CRYPTO_SUCCESS);
            break;
        case OHTEST_KDF_X963:
            EXPECT_EQ(OHTEST_CreateX963Params(infoSpec.params, &params), CRYPTO_SUCCESS);
            break;
        default:
            break;
    }
    EXPECT_EQ(OH_CryptoKdf_Create(algoName, &ctx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoKdf_Derive(ctx, params, keySize, &key), CRYPTO_SUCCESS);
    EXPECT_EQ(key.len, keySize);

    OH_CryptoKdfParams_Destroy(params);
    OH_CryptoKdf_Destroy(ctx);
    OH_Crypto_FreeDataBlob(&key);
}

/**
 * @tc.name   SUB_Security_CryptoFramework_NAPI_Kdf_Test_0200
 * @tc.number SUB_Security_CryptoFramework_NAPI_Kdf_Test_0200
 * @tc.desc   algorithm is Kdf
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(OHCryptoFrameworkKdfNapiTest, SUB_Security_CryptoFramework_NAPI_Kdf_Test_0200, TestSize.Level0)
{
    KdfSpec infoSpec = {
        .kdfType = OHTEST_KDF_HKDF, .algoName = "HKDF|SM3|EXPAND_ONLY", .keySize = OHTEST_SM3_DIGIESTSIZE * OHTEST_KDF_CONSTANT_LEN - 1,
        .params.hkdfParams = {.key = (uint8_t *)"0123456789", .salt = (uint8_t *)"abcdef", .info = (uint8_t *)"abc"}
    };
    const char *algoName = "SCRYPT";
    int keySize = infoSpec.keySize;
    OH_CryptoKdfParams *params = nullptr;
    OH_CryptoKdf *ctx = nullptr;
    Crypto_DataBlob key = {.data = nullptr, .len = 0};

    EXPECT_EQ(OHTEST_CreateHkdfParams(infoSpec.params, &params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoKdf_Create(algoName, &ctx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoKdf_Derive(ctx, params, keySize, &key), CRYPTO_PARAMETER_CHECK_FAILED);

    OH_CryptoKdfParams_Destroy(params);
    OH_CryptoKdf_Destroy(ctx);
    OH_Crypto_FreeDataBlob(&key);
}

/**
 * @tc.name   SUB_Security_CryptoFramework_NAPI_Kdf_Test_0300
 * @tc.number SUB_Security_CryptoFramework_NAPI_Kdf_Test_0300
 * @tc.desc   algorithm is Kdf
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(OHCryptoFrameworkKdfNapiTest, SUB_Security_CryptoFramework_NAPI_Kdf_Test_0300, TestSize.Level0)
{
    KdfSpec infoSpec = {
        .kdfType = OHTEST_KDF_SCRYPT, .algoName = "SCRYPT", .keySize = 64,
        // max_mem = p * 128 * r + 32 * r * (n + 2) * 4 + 1
        .params.scryptParams = {.passphrase = (uint8_t *)"0123456789", .salt = (uint8_t *)"abcdef", .n = 1024, .p = 1, .r = 8, .max_mem = 1051649}
    };
    const char *algoName = "HKDF|SHA1|EXPAND_ONLY";
    int keySize = infoSpec.keySize;
    OH_CryptoKdfParams *params = nullptr;
    OH_CryptoKdf *ctx = nullptr;
    Crypto_DataBlob key = {.data = nullptr, .len = 0};

    EXPECT_EQ(OHTEST_CreateScryptParams(infoSpec.params, &params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoKdf_Create(algoName, &ctx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoKdf_Derive(ctx, params, keySize, &key), CRYPTO_PARAMETER_CHECK_FAILED);

    OH_CryptoKdfParams_Destroy(params);
    OH_CryptoKdf_Destroy(ctx);
    OH_Crypto_FreeDataBlob(&key);
}

/**
 * @tc.name   SUB_Security_CryptoFramework_NAPI_Kdf_Test_0400
 * @tc.number SUB_Security_CryptoFramework_NAPI_Kdf_Test_0400
 * @tc.desc   algorithm is Kdf
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(OHCryptoFrameworkKdfNapiTest, SUB_Security_CryptoFramework_NAPI_Kdf_Test_0400, TestSize.Level0)
{
    KdfSpec infoSpec = {
        .kdfType = OHTEST_KDF_HKDF, .algoName = "HKDF|MD5|EXTRACT_ONLY", .keySize = OHTEST_MD5_DIGIESTSIZE,
        .params.hkdfParams = {.key = (uint8_t *)"0123456789", .salt = (uint8_t *)"abcdef", .info = (uint8_t *)"abc"}
    };
    const char *algoName = "PBKDF2|SHA1";
    int keySize = infoSpec.keySize;
    OH_CryptoKdfParams *params = nullptr;
    OH_CryptoKdf *ctx = nullptr;
    Crypto_DataBlob key = {.data = nullptr, .len = 0};

    EXPECT_EQ(OHTEST_CreateHkdfParams(infoSpec.params, &params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoKdf_Create(algoName, &ctx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoKdf_Derive(ctx, params, keySize, &key), CRYPTO_PARAMETER_CHECK_FAILED);

    OH_CryptoKdfParams_Destroy(params);
    OH_CryptoKdf_Destroy(ctx);
    OH_Crypto_FreeDataBlob(&key);
}

/**
 * @tc.name   SUB_Security_CryptoFramework_NAPI_Kdf_Test_0500
 * @tc.number SUB_Security_CryptoFramework_NAPI_Kdf_Test_0500
 * @tc.desc   algorithm is Kdf
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(OHCryptoFrameworkKdfNapiTest, SUB_Security_CryptoFramework_NAPI_Kdf_Test_0500, TestSize.Level0)
{
    KdfSpec infoSpec = {
        .kdfType = OHTEST_KDF_PBKDF2, .algoName = "PBKDF2|SHA1", .keySize = 64,
        .params.pbkdf2Params = {.password = (uint8_t *)"0123456789", .salt = (uint8_t *)"abcdef", .iterations = 16}
    };
    const char *algoName = "HKDF|MD5|EXTRACT_ONLY";
    int keySize = infoSpec.keySize;
    OH_CryptoKdfParams *params = nullptr;
    OH_CryptoKdf *ctx = nullptr;
    Crypto_DataBlob key = {.data = nullptr, .len = 0};

    EXPECT_EQ(OHTEST_CreatePbkdf2Params(infoSpec.params, &params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoKdf_Create(algoName, &ctx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoKdf_Derive(ctx, params, keySize, &key), CRYPTO_PARAMETER_CHECK_FAILED);

    OH_CryptoKdfParams_Destroy(params);
    OH_CryptoKdf_Destroy(ctx);
    OH_Crypto_FreeDataBlob(&key);
}

KdfSpec g_scryptErrorSpec[] = {
    /* RFC7914 */
    {
        .kdfType = OHTEST_KDF_SCRYPT, .algoName = "SCRYPT", .keySize = 64,
        /* N > 2^(128 * r / 8) */
        .params.scryptParams = {
            .passphrase = (uint8_t *)"0123456789",
            .salt = (uint8_t *)"abcdef",
            .n = pow(2, 16),
            .p = 1,
            .r = 1,
            .max_mem = 0
        }
    },
    {
        .kdfType = OHTEST_KDF_SCRYPT, .algoName = "SCRYPT", .keySize = 64,
        /* p > ((2^32 - 1) * 32) / (128 * r) */
        .params.scryptParams = {
            .passphrase = (uint8_t *)"0123456789",
            .salt = (uint8_t *)"abcdef",
            .n = 1024,
            .p = pow(2, 16),
            .r = pow(2, 16),
            .max_mem = 0
        }
    },
    {
        .kdfType = OHTEST_KDF_SCRYPT, .algoName = "SCRYPT", .keySize = 64,
        /* r * p > 2^30 - 1 */
        .params.scryptParams = {
            .passphrase = (uint8_t *)"0123456789",
            .salt = (uint8_t *)"abcdef",
            .n = 1024,
            .p = pow(2, 14),
            .r = pow(2, 16),
            .max_mem = 0
        }
    },
    {
        .kdfType = OHTEST_KDF_SCRYPT, .algoName = "SCRYPT", .keySize = 64,
        /* p * 128 * r > UINT32_MAX */
        .params.scryptParams = {
            .passphrase = (uint8_t *)"0123456789",
            .salt = (uint8_t *)"abcdef",
            .n = 1024,
            .p = pow(2, 14),
            .r = pow(2, 16),
            .max_mem = 0
        }
    },
    {
        .kdfType = OHTEST_KDF_SCRYPT, .algoName = "SCRYPT", .keySize = 64,
        /* n != 2^x */
        .params.scryptParams = {
            .passphrase = (uint8_t *)"0123456789",
            .salt = (uint8_t *)"abcdef",
            .n = 7,
            .p = 1,
            .r = 8,
            .max_mem = 0
        }
    },
};
INSTANTIATE_TEST_CASE_P(OHCryptoFrameworkKdfNapiTest, KDF_SCRYPT_TEST, ::testing::ValuesIn(g_scryptErrorSpec));

HWTEST_P(KDF_SCRYPT_TEST, SUB_Security_CryptoFramework_NAPI_Kdf_Test_0600, TestSize.Level0)
{
    KdfSpec infoSpec = GetParam();
    const char *algoName = infoSpec.algoName;
    int keySize = infoSpec.keySize;
    OH_CryptoKdfParams *params = nullptr;
    OH_CryptoKdf *ctx = nullptr;
    Crypto_DataBlob key = {.data = nullptr, .len = 0};
    uint64_t p = *(uint64_t *)&(infoSpec.params.scryptParams.p);
    uint64_t n = *(uint64_t *)&(infoSpec.params.scryptParams.n);
    uint64_t r = *(uint64_t *)&(infoSpec.params.scryptParams.r);
    /* p * 128 * r + 32 * r * (n + 2) * 4 + 1 */
    uint64_t max_mem = p * 128 * r + 32 * r * (n + 2) * 4 + 1;
    
    infoSpec.params.scryptParams.max_mem = max_mem;
    EXPECT_EQ(OHTEST_CreateScryptParams(infoSpec.params, &params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoKdf_Create(algoName, &ctx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoKdf_Derive(ctx, params, keySize, &key), CRYPTO_OPERTION_ERROR);

    OH_CryptoKdfParams_Destroy(params);
    OH_CryptoKdf_Destroy(ctx);
    OH_Crypto_FreeDataBlob(&key);
}

/**
 * @tc.name   SUB_Security_CryptoFramework_NAPI_Kdf_Test_0700
 * @tc.number SUB_Security_CryptoFramework_NAPI_Kdf_Test_0700
 * @tc.desc   algorithm is Kdf
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(OHCryptoFrameworkKdfNapiTest, SUB_Security_CryptoFramework_NAPI_Kdf_Test_0700, TestSize.Level0)
{
    KdfSpec infoSpec = {
        .kdfType = OHTEST_KDF_SCRYPT, .algoName = "SCRYPT", .keySize = 64,
        /* max_mem < p * 128 * r + 32 * r * (n + 2) * 4 */
        .params.scryptParams = {
            .passphrase = (uint8_t *)"0123456789",
            .salt = (uint8_t *)"abcdef",
            .n = 1024,
            .p = 1,
            .r = 8,
            .max_mem = 0
        }
    };
    const char *algoName = infoSpec.algoName;
    int keySize = infoSpec.keySize;
    OH_CryptoKdfParams *params = nullptr;
    OH_CryptoKdf *ctx = nullptr;
    Crypto_DataBlob key = {.data = nullptr, .len = 0};
    uint64_t p = *(uint64_t *)&(infoSpec.params.scryptParams.p);
    uint64_t n = *(uint64_t *)&(infoSpec.params.scryptParams.n);
    uint64_t r = *(uint64_t *)&(infoSpec.params.scryptParams.r);
    /* p * 128 * r + 32 * r * (n + 2) * 4 - 1 */
    uint64_t max_mem = p * 128 * r + 32 * r * (n + 2) * 4 - 1;
    
    infoSpec.params.scryptParams.max_mem = max_mem;
    EXPECT_EQ(OHTEST_CreateScryptParams(infoSpec.params, &params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoKdf_Create(algoName, &ctx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoKdf_Derive(ctx, params, keySize, &key), CRYPTO_OPERTION_ERROR);

    OH_CryptoKdfParams_Destroy(params);
    OH_CryptoKdf_Destroy(ctx);
    OH_Crypto_FreeDataBlob(&key);
}

/**
 * @tc.name   SUB_Security_CryptoFramework_NAPI_Kdf_Test_0800
 * @tc.number SUB_Security_CryptoFramework_NAPI_Kdf_Test_0800
 * @tc.desc   algorithm is Kdf
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(OHCryptoFrameworkKdfNapiTest, SUB_Security_CryptoFramework_NAPI_Kdf_Test_0800, TestSize.Level0)
{
    KdfSpec infoSpec = {
        .kdfType = OHTEST_KDF_SCRYPT, .algoName = "SCRYPT", .keySize = 64,
        /* max_mem < p * 128 * r + 32 * r * (n + 2) * 4 */
        .params.scryptParams = {
            .passphrase = nullptr,
            .salt = (uint8_t *)"abcdef",
            .n = 1024,
            .p = 1,
            .r = 8,
            .max_mem = 1051649
        }
    };
    const char *algoName = infoSpec.algoName;
    int keySize = infoSpec.keySize;
    OH_CryptoKdfParams *params = nullptr;
    OH_CryptoKdf *ctx = nullptr;
    Crypto_DataBlob key = {.data = nullptr, .len = 0};

    EXPECT_EQ(OHTEST_CreateScryptParams(infoSpec.params, &params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoKdf_Create(algoName, &ctx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoKdf_Derive(ctx, params, keySize, &key), CRYPTO_PARAMETER_CHECK_FAILED);

    OH_CryptoKdfParams_Destroy(params);
    OH_CryptoKdf_Destroy(ctx);
    OH_Crypto_FreeDataBlob(&key);
}

/**
 * @tc.name   SUB_Security_CryptoFramework_NAPI_Kdf_Test_0900
 * @tc.number SUB_Security_CryptoFramework_NAPI_Kdf_Test_0900
 * @tc.desc   algorithm is Kdf
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(OHCryptoFrameworkKdfNapiTest, SUB_Security_CryptoFramework_NAPI_Kdf_Test_0900, TestSize.Level0)
{
    KdfSpec infoSpec = {
        .kdfType = OHTEST_KDF_SCRYPT, .algoName = "SCRYPT", .keySize = 64,
        /* max_mem < p * 128 * r + 32 * r * (n + 2) * 4 */
        .params.scryptParams = {
            .passphrase = (uint8_t *)"0123456789",
            .salt = nullptr,
            .n = 1024,
            .p = 1,
            .r = 8,
            .max_mem = 1051649
        }
    };
    const char *algoName = infoSpec.algoName;
    int keySize = infoSpec.keySize;
    OH_CryptoKdfParams *params = nullptr;
    OH_CryptoKdf *ctx = nullptr;
    Crypto_DataBlob key = {.data = nullptr, .len = 0};

    EXPECT_EQ(OHTEST_CreateScryptParams(infoSpec.params, &params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoKdf_Create(algoName, &ctx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoKdf_Derive(ctx, params, keySize, &key), CRYPTO_SUCCESS);

    OH_CryptoKdfParams_Destroy(params);
    OH_CryptoKdf_Destroy(ctx);
    OH_Crypto_FreeDataBlob(&key);
}

KdfSpec g_hkdfErrorSpec[] = {
    {
        .kdfType = OHTEST_KDF_HKDF, .algoName = "HKDF|SHA1|EXPAND_ONLY", .keySize = OHTEST_SHA1_DIGIESTSIZE * OHTEST_KDF_CONSTANT_LEN - 1,
        .params.hkdfParams = {
            .key = (uint8_t *)"0123456789",
            .salt = nullptr,
            .info = (uint8_t *)"abc"
        }
    },
    {
        .kdfType = OHTEST_KDF_HKDF, .algoName = "HKDF|SHA1|EXPAND_ONLY", .keySize = OHTEST_SHA1_DIGIESTSIZE * OHTEST_KDF_CONSTANT_LEN - 1,
        .params.hkdfParams = {
            .key = nullptr,
            .salt = (uint8_t *)"abcdef",
            .info = (uint8_t *)"abc"
        }
    },
    {
        .kdfType = OHTEST_KDF_HKDF, .algoName = "HKDF|SHA1|EXPAND_ONLY", .keySize = OHTEST_SHA1_DIGIESTSIZE * OHTEST_KDF_CONSTANT_LEN - 1,
        .params.hkdfParams = {
            .key = (uint8_t *)"0123456789",
            .salt = (uint8_t *)"abcdef",
            .info = nullptr
        }
    },
    {
        .kdfType = OHTEST_KDF_HKDF, .algoName = "HKDF|SHA1|EXPAND_ONLY", .keySize = OHTEST_SHA1_DIGIESTSIZE * OHTEST_KDF_CONSTANT_LEN + 1,
        .params.hkdfParams = {
            .key = (uint8_t *)"0123456789",
            .salt = (uint8_t *)"abcdef",
            .info = (uint8_t *)"abc"
        }
    },
    {
        .kdfType = OHTEST_KDF_HKDF, .algoName = "HKDF|SHA1|EXTRACT_ONLY", .keySize = OHTEST_SHA1_DIGIESTSIZE + 1,
        .params.hkdfParams = {
            .key = (uint8_t *)"0123456789",
            .salt = (uint8_t *)"abcdef",
            .info = (uint8_t *)"abc"
        }
    },
    {
        .kdfType = OHTEST_KDF_HKDF, .algoName = "HKDF|SHA1|EXTRACT_ONLY", .keySize = OHTEST_SHA1_DIGIESTSIZE - 1,
        .params.hkdfParams = {
            .key = (uint8_t *)"0123456789",
            .salt = (uint8_t *)"abcdef",
            .info = (uint8_t *)"abc"
        }
    },
    {
        .kdfType = OHTEST_KDF_HKDF, .algoName = "HKDF|SHA1|EXTRACT_AND_EXPAND", .keySize = OHTEST_SHA1_DIGIESTSIZE * OHTEST_KDF_CONSTANT_LEN + 1,
        .params.hkdfParams = {
            .key = (uint8_t *)"0123456789",
            .salt = (uint8_t *)"abcdef",
            .info = (uint8_t *)"abc"
        }
    },
};
INSTANTIATE_TEST_CASE_P(OHCryptoFrameworkKdfNapiTest, KDF_HKDF_TEST, ::testing::ValuesIn(g_hkdfErrorSpec));

HWTEST_P(KDF_HKDF_TEST, SUB_Security_CryptoFramework_NAPI_Kdf_Test_1000, TestSize.Level0)
{
    KdfSpec infoSpec = GetParam();
    const char *algoName = infoSpec.algoName;
    int keySize = infoSpec.keySize;
    OH_CryptoKdfParams *params = nullptr;
    OH_CryptoKdf *ctx = nullptr;
    Crypto_DataBlob key = {.data = nullptr, .len = 0};

    EXPECT_EQ(OHTEST_CreateHkdfParams(infoSpec.params, &params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoKdf_Create(algoName, &ctx), CRYPTO_SUCCESS);
    if (infoSpec.params.hkdfParams.key && infoSpec.params.hkdfParams.salt && infoSpec.params.hkdfParams.info) {
        EXPECT_EQ(OH_CryptoKdf_Derive(ctx, params, keySize, &key), CRYPTO_OPERTION_ERROR);
    } else if (infoSpec.params.hkdfParams.key) {
        EXPECT_EQ(OH_CryptoKdf_Derive(ctx, params, keySize, &key), CRYPTO_SUCCESS);
    } else {
        EXPECT_EQ(OH_CryptoKdf_Derive(ctx, params, keySize, &key), CRYPTO_PARAMETER_CHECK_FAILED);
    }

    OH_CryptoKdfParams_Destroy(params);
    OH_CryptoKdf_Destroy(ctx);
    OH_Crypto_FreeDataBlob(&key);
}

KdfSpec g_pbkdf2ErrorSpec[] = {
    {
        .kdfType = OHTEST_KDF_PBKDF2, .algoName = "PBKDF2|SHA1", .keySize = 64,
        .params.pbkdf2Params = {.password = nullptr, .salt = (uint8_t *)"abcdef", .iterations = 16}
    },
    {
        .kdfType = OHTEST_KDF_PBKDF2, .algoName = "PBKDF2|SHA1", .keySize = 64,
        .params.pbkdf2Params = {.password = (uint8_t *)"0123456789", .salt = nullptr, .iterations = 16}
    },
    {
        .kdfType = OHTEST_KDF_PBKDF2, .algoName = "PBKDF2|SHA1", .keySize = 64,
        .params.pbkdf2Params = {.password = (uint8_t *)"0123456789", .salt = (uint8_t *)"abcdef", .iterations = 0}
    },
    {
        .kdfType = OHTEST_KDF_PBKDF2, .algoName = "PBKDF2|SHA1", .keySize = -1,
        .params.pbkdf2Params = {.password = (uint8_t *)"0123456789", .salt = (uint8_t *)"abcdef", .iterations = 16}
    }
};
INSTANTIATE_TEST_CASE_P(OHCryptoFrameworkKdfNapiTest, KDF_PBKDF2_TEST, ::testing::ValuesIn(g_pbkdf2ErrorSpec));

HWTEST_P(KDF_PBKDF2_TEST, SUB_Security_CryptoFramework_NAPI_Kdf_Test_1100, TestSize.Level0)
{
    KdfSpec infoSpec = GetParam();
    const char *algoName = infoSpec.algoName;
    int keySize = infoSpec.keySize;
    OH_CryptoKdfParams *params = nullptr;
    OH_CryptoKdf *ctx = nullptr;
    Crypto_DataBlob key = {.data = nullptr, .len = 0};

    EXPECT_EQ(OHTEST_CreatePbkdf2Params(infoSpec.params, &params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoKdf_Create(algoName, &ctx), CRYPTO_SUCCESS);
    if (infoSpec.keySize < 0) {
        EXPECT_EQ(OH_CryptoKdf_Derive(ctx, params, keySize, &key), CRYPTO_PARAMETER_CHECK_FAILED);
    } else if (*(int *)&(infoSpec.params.pbkdf2Params.iterations)) {
        EXPECT_EQ(OH_CryptoKdf_Derive(ctx, params, keySize, &key), CRYPTO_SUCCESS);
    } else {
        EXPECT_EQ(OH_CryptoKdf_Derive(ctx, params, keySize, &key), CRYPTO_PARAMETER_CHECK_FAILED);
    }

    OH_CryptoKdfParams_Destroy(params);
    OH_CryptoKdf_Destroy(ctx);
    OH_Crypto_FreeDataBlob(&key);
}

/**
 * @tc.name   SUB_Security_CryptoFramework_NAPI_Kdf_Test_1200
 * @tc.number SUB_Security_CryptoFramework_NAPI_Kdf_Test_1200
 * @tc.desc   algorithm is Kdf
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(OHCryptoFrameworkKdfNapiTest, SUB_Security_CryptoFramework_NAPI_Kdf_Test_1200, TestSize.Level0)
{
    const char *algoName = "KDF_TLS12";
    OH_CryptoKdfParams *params = nullptr;
    OH_CryptoKdf *ctx = nullptr;

    EXPECT_EQ(OH_CryptoKdfParams_Create(algoName, &params), CRYPTO_PARAMETER_CHECK_FAILED);
    EXPECT_EQ(OH_CryptoKdf_Create(algoName, &ctx), CRYPTO_PARAMETER_CHECK_FAILED);

    OH_CryptoKdfParams_Destroy(params);
    OH_CryptoKdf_Destroy(ctx);
}

static OH_Crypto_ErrCode OHTEST_CreateVectorPbkdf2Params(paramsVectorSpec paramInfo, OH_CryptoKdfParams **params)
{
    OH_Crypto_ErrCode ret = CRYPTO_SUCCESS;
    Crypto_DataBlob password = {.data = paramInfo.pbkdf2Params.password, .len = paramInfo.pbkdf2Params.passLen};
    Crypto_DataBlob salt = {.data = paramInfo.pbkdf2Params.salt, .len = paramInfo.pbkdf2Params.saltLen};
    Crypto_DataBlob iterations = {.data = (uint8_t *)&(paramInfo.pbkdf2Params.iterations), .len = sizeof(int)};

    ret = OH_CryptoKdfParams_Create("PBKDF2", params);
    if (ret != CRYPTO_SUCCESS) {
        return ret;
    }
    if (paramInfo.pbkdf2Params.password) {
        ret = OH_CryptoKdfParams_SetParam(*params, CRYPTO_KDF_KEY_DATABLOB, &password);
        if (ret != CRYPTO_SUCCESS) {
            OH_CryptoKdfParams_Destroy(*params);
            *params = nullptr;
            return ret;
        }
    }
    if (paramInfo.pbkdf2Params.salt) {
        ret = OH_CryptoKdfParams_SetParam(*params, CRYPTO_KDF_SALT_DATABLOB, &salt);
        if (ret != CRYPTO_SUCCESS) {
            OH_CryptoKdfParams_Destroy(*params);
            *params = nullptr;
            return ret;
        }
    }
    ret = OH_CryptoKdfParams_SetParam(*params, CRYPTO_KDF_ITER_COUNT_INT, &iterations);
    if (ret != CRYPTO_SUCCESS) {
        OH_CryptoKdfParams_Destroy(*params);
        *params = nullptr;
        return ret;
    }

    return ret;
}

static OH_Crypto_ErrCode OHTEST_CreateVectorHkdfParams(paramsVectorSpec paramInfo, OH_CryptoKdfParams **params)
{
    OH_Crypto_ErrCode ret = CRYPTO_SUCCESS;
    Crypto_DataBlob key = {.data = paramInfo.hkdfParams.key, .len = paramInfo.hkdfParams.keyLen};
    Crypto_DataBlob salt = {.data = paramInfo.hkdfParams.salt, .len = paramInfo.hkdfParams.saltLen};
    Crypto_DataBlob info = {.data = paramInfo.hkdfParams.info, .len = paramInfo.hkdfParams.infoLen};

    ret = OH_CryptoKdfParams_Create("HKDF", params);
    if (ret != CRYPTO_SUCCESS) {
        return ret;
    }
    if (paramInfo.hkdfParams.key) {
        ret = OH_CryptoKdfParams_SetParam(*params, CRYPTO_KDF_KEY_DATABLOB, &key);
        if (ret != CRYPTO_SUCCESS) {
            OH_CryptoKdfParams_Destroy(*params);
            *params = nullptr;
            return ret;
        }
    }
    if (paramInfo.hkdfParams.salt) {
        ret = OH_CryptoKdfParams_SetParam(*params, CRYPTO_KDF_SALT_DATABLOB, &salt);
        if (ret != CRYPTO_SUCCESS) {
            OH_CryptoKdfParams_Destroy(*params);
            *params = nullptr;
            return ret;
        }
    }
    if (paramInfo.hkdfParams.info) {
        ret = OH_CryptoKdfParams_SetParam(*params, CRYPTO_KDF_INFO_DATABLOB, &info);
        if (ret != CRYPTO_SUCCESS) {
            OH_CryptoKdfParams_Destroy(*params);
            *params = nullptr;
            return ret;
        }
    }

    return ret;
}

static OH_Crypto_ErrCode OHTEST_CreateVectorX963Params(paramsVectorSpec paramInfo, OH_CryptoKdfParams **params)
{
    OH_Crypto_ErrCode ret = CRYPTO_SUCCESS;
    Crypto_DataBlob key = {.data = paramInfo.x963Params.key, .len = paramInfo.x963Params.keyLen};
    Crypto_DataBlob info = {.data = paramInfo.x963Params.info, .len = paramInfo.x963Params.infoLen};

    ret = OH_CryptoKdfParams_Create("X963KDF", params);
    if (ret != CRYPTO_SUCCESS) {
        return ret;
    }
    if (paramInfo.x963Params.key) {
        ret = OH_CryptoKdfParams_SetParam(*params, CRYPTO_KDF_KEY_DATABLOB, &key);
        if (ret != CRYPTO_SUCCESS) {
            OH_CryptoKdfParams_Destroy(*params);
            *params = nullptr;
            return ret;
        }
    }
    if (paramInfo.x963Params.info) {
        ret = OH_CryptoKdfParams_SetParam(*params, CRYPTO_KDF_INFO_DATABLOB, &info);
        if (ret != CRYPTO_SUCCESS) {
            OH_CryptoKdfParams_Destroy(*params);
            *params = nullptr;
            return ret;
        }
    }

    return ret;
}

KdfVectorSpec g_vectors[] = {
    {
        .kdfType = OHTEST_KDF_PBKDF2, .algoName = "PBKDF2|SHA1", .keySize = 20,
        .params.pbkdf2Params = {
            .password = pbhdf2_sha1_password, .passLen = sizeof(pbhdf2_sha1_password),
            .salt = pbhdf2_sha1_salt, .saltLen = sizeof(pbhdf2_sha1_salt),
            .iterations = 2
        },
        .expectSecret = pbhdf2_sha1_expectSecret
    }, // 0
    {
        .kdfType = OHTEST_KDF_PBKDF2, .algoName = "PBKDF2|SHA224", .keySize = 20,
        .params.pbkdf2Params = {
            .password = pbhdf2_sha224_password, .passLen = sizeof(pbhdf2_sha224_password),
            .salt = pbhdf2_sha224_salt, .saltLen = sizeof(pbhdf2_sha224_salt),
            .iterations = 1
        },
        .expectSecret = pbhdf2_sha224_expectSecret
    }, // 1
    {
        .kdfType = OHTEST_KDF_PBKDF2, .algoName = "PBKDF2|SHA256", .keySize = 64,
        .params.pbkdf2Params = {
            .password = pbhdf2_sha256_password, .passLen = sizeof(pbhdf2_sha256_password),
            .salt = pbhdf2_sha256_salt, .saltLen = sizeof(pbhdf2_sha256_salt),
            .iterations = 1
        },
        .expectSecret = pbhdf2_sha256_expectSecret
    }, // 2
    {
        .kdfType = OHTEST_KDF_PBKDF2, .algoName = "PBKDF2|SHA384", .keySize = 20,
        .params.pbkdf2Params = {
            .password = pbhdf2_sha384_password, .passLen = sizeof(pbhdf2_sha384_password),
            .salt = pbhdf2_sha384_salt, .saltLen = sizeof(pbhdf2_sha384_salt),
            .iterations = 1
        },
        .expectSecret = pbhdf2_sha384_expectSecret
    }, // 3
    {
        .kdfType = OHTEST_KDF_PBKDF2, .algoName = "PBKDF2|SHA512", .keySize = 20,
        .params.pbkdf2Params = {
            .password = pbhdf2_sha512_password, .passLen = sizeof(pbhdf2_sha512_password),
            .salt = pbhdf2_sha512_salt, .saltLen = sizeof(pbhdf2_sha512_salt),
            .iterations = 1
        },
        .expectSecret = pbhdf2_sha512_expectSecret
    }, // 4
    {
        .kdfType = OHTEST_KDF_PBKDF2, .algoName = "PBKDF2|SM3", .keySize = 20,
        .params.pbkdf2Params = {
            .password = pbhdf2_sm3_password, .passLen = sizeof(pbhdf2_sm3_password),
            .salt = pbhdf2_sm3_salt, .saltLen = sizeof(pbhdf2_sm3_salt),
            .iterations = 10000
        },
        .expectSecret = pbhdf2_sm3_expectSecret
    }, // 5
    {
        .kdfType = OHTEST_KDF_HKDF, .algoName = "HKDF|SHA1", .keySize = 42,
        .params.hkdfParams = {
            .key = hkdf_sha1_key, .keyLen = sizeof(hkdf_sha1_key),
            .salt = hkdf_sha1_salt, .saltLen = sizeof(hkdf_sha1_salt),
            .info = hkdf_sha1_info, .infoLen = sizeof(hkdf_sha1_info),
        },
        .expectSecret = hkdf_sha1_expectSecret
    }, // 6
    {
        .kdfType = OHTEST_KDF_HKDF, .algoName = "HKDF|SHA224", .keySize = 32,
        .params.hkdfParams = {
            .key = hkdf_sha224_key, .keyLen = sizeof(hkdf_sha224_key),
            .salt = hkdf_sha224_salt, .saltLen = sizeof(hkdf_sha224_salt),
            .info = hkdf_sha224_info, .infoLen = sizeof(hkdf_sha224_info),
        },
        .expectSecret = hkdf_sha224_expectSecret
    }, // 7
    {
        .kdfType = OHTEST_KDF_HKDF, .algoName = "HKDF|SHA256", .keySize = 42,
        .params.hkdfParams = {
            .key = hkdf_sha256_key, .keyLen = sizeof(hkdf_sha256_key),
            .salt = hkdf_sha256_salt, .saltLen = sizeof(hkdf_sha256_salt),
            .info = hkdf_sha256_info, .infoLen = sizeof(hkdf_sha256_info),
        },
        .expectSecret = hkdf_sha256_expectSecret
    }, // 8
    {
        .kdfType = OHTEST_KDF_HKDF, .algoName = "HKDF|SHA384", .keySize = 32,
        .params.hkdfParams = {
            .key = hkdf_sha384_key, .keyLen = sizeof(hkdf_sha384_key),
            .salt = hkdf_sha384_salt, .saltLen = sizeof(hkdf_sha384_salt),
            .info = hkdf_sha384_info, .infoLen = sizeof(hkdf_sha384_info),
        },
        .expectSecret = hkdf_sha384_expectSecret
    }, // 9
    {
        .kdfType = OHTEST_KDF_HKDF, .algoName = "HKDF|SHA512", .keySize = 32,
        .params.hkdfParams = {
            .key = hkdf_sha512_key, .keyLen = sizeof(hkdf_sha512_key),
            .salt = hkdf_sha512_salt, .saltLen = sizeof(hkdf_sha512_salt),
            .info = hkdf_sha512_info, .infoLen = sizeof(hkdf_sha512_info),
        },
        .expectSecret = hkdf_sha512_expectSecret
    }, // 10
    {
        .kdfType = OHTEST_KDF_HKDF, .algoName = "HKDF|SM3", .keySize = 16,
        .params.hkdfParams = {
            .key = hkdf_sm3_key, .keyLen = sizeof(hkdf_sm3_key),
            .salt = hkdf_sm3_salt, .saltLen = sizeof(hkdf_sm3_salt),
            .info = hkdf_sm3_info, .infoLen = sizeof(hkdf_sm3_info),
        },
        .expectSecret = hkdf_sm3_expectSecret
    }, // 11
    /* X963 */
    {
        .kdfType = OHTEST_KDF_X963, .algoName = "X963KDF|SHA1", .keySize = 128,
        .params.x963Params = {
            .key = x963_sha1_key, .keyLen = sizeof(x963_sha1_key),
            .info = x963_sha1_info, .infoLen = sizeof(x963_sha1_info),
        },
        .expectSecret = x963_sha1_expectSecret
    },
    {
        .kdfType = OHTEST_KDF_X963, .algoName = "X963KDF|SHA224", .keySize = 128,
        .params.x963Params = {
            .key = x963_sha224_key, .keyLen = sizeof(x963_sha224_key),
            .info = x963_sha224_info, .infoLen = sizeof(x963_sha224_info),
        },
        .expectSecret = x963_sha224_expectSecret
    },
    {
        .kdfType = OHTEST_KDF_X963, .algoName = "X963KDF|SHA256", .keySize = 128,
        .params.x963Params = {
            .key = x963_sha256_key, .keyLen = sizeof(x963_sha256_key),
            .info = x963_sha256_info, .infoLen = sizeof(x963_sha256_info),
        },
        .expectSecret = x963_sha256_expectSecret
    },
    {
        .kdfType = OHTEST_KDF_X963, .algoName = "X963KDF|SHA384", .keySize = 128,
        .params.x963Params = {
            .key = x963_sha384_key, .keyLen = sizeof(x963_sha384_key),
            .info = x963_sha384_info, .infoLen = sizeof(x963_sha384_info),
        },
        .expectSecret = x963_sha384_expectSecret
    },
    {
        .kdfType = OHTEST_KDF_X963, .algoName = "X963KDF|SHA512", .keySize = 128,
        .params.x963Params = {
            .key = x963_sha512_key, .keyLen = sizeof(x963_sha512_key),
            .info = x963_sha512_info, .infoLen = sizeof(x963_sha512_info),
        },
        .expectSecret = x963_sha512_expectSecret
    },
    {
        .kdfType = OHTEST_KDF_X963, .algoName = "X963KDF|SHA1", .keySize = 16,
        .params.x963Params = {
            .key = x963_sha1_key2, .keyLen = sizeof(x963_sha1_key2),
            .info = nullptr, .infoLen = 0,
        },
        .expectSecret = x963_sha1_expectSecret2
    },
    {
        .kdfType = OHTEST_KDF_X963, .algoName = "X963KDF|SHA224", .keySize = 16,
        .params.x963Params = {
            .key = x963_sha224_key2, .keyLen = sizeof(x963_sha224_key2),
            .info = nullptr, .infoLen = 0,
        },
        .expectSecret = x963_sha224_expectSecret2
    },
    {
        .kdfType = OHTEST_KDF_X963, .algoName = "X963KDF|SHA256", .keySize = 16,
        .params.x963Params = {
            .key = x963_sha256_key2, .keyLen = sizeof(x963_sha256_key2),
            .info = nullptr, .infoLen = 0,
        },
        .expectSecret = x963_sha256_expectSecret2
    },
    {
        .kdfType = OHTEST_KDF_X963, .algoName = "X963KDF|SHA384", .keySize = 16,
        .params.x963Params = {
            .key = x963_sha384_key2, .keyLen = sizeof(x963_sha384_key2),
            .info = nullptr, .infoLen = 0,
        },
        .expectSecret = x963_sha384_expectSecret2
    },
    {
        .kdfType = OHTEST_KDF_X963, .algoName = "X963KDF|SHA512", .keySize = 16,
        .params.x963Params = {
            .key = x963_sha512_key2, .keyLen = sizeof(x963_sha512_key2),
            .info = nullptr, .infoLen = 0,
        },
        .expectSecret = x963_sha512_expectSecret2
    },
};
INSTANTIATE_TEST_CASE_P(OHCryptoFrameworkKdfNapiTest, KDF_VECTOR_TEST, ::testing::ValuesIn(g_vectors));

HWTEST_P(KDF_VECTOR_TEST, SUB_Security_CryptoFramework_NAPI_Kdf_Vector_Test_0100, TestSize.Level0)
{
    KdfVectorSpec infoSpec = GetParam();
    KdfType kdfType = infoSpec.kdfType;
    const char *algoName = infoSpec.algoName;
    int keySize = infoSpec.keySize;
    OH_CryptoKdfParams *params = nullptr;
    OH_CryptoKdf *ctx = nullptr;
    Crypto_DataBlob key = {.data = nullptr, .len = 0};

    switch(kdfType) {
        case OHTEST_KDF_PBKDF2:
            EXPECT_EQ(OHTEST_CreateVectorPbkdf2Params(infoSpec.params, &params), CRYPTO_SUCCESS);
            break;
        case OHTEST_KDF_HKDF:
            EXPECT_EQ(OHTEST_CreateVectorHkdfParams(infoSpec.params, &params), CRYPTO_SUCCESS);
            break;
        case OHTEST_KDF_X963:
            EXPECT_EQ(OHTEST_CreateVectorX963Params(infoSpec.params, &params), CRYPTO_SUCCESS);
            break;
        default:
            break;
    }
    EXPECT_EQ(OH_CryptoKdf_Create(algoName, &ctx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoKdf_Derive(ctx, params, keySize, &key), CRYPTO_SUCCESS);
    if (key.len == keySize) {
        EXPECT_TRUE(memcmp(key.data, infoSpec.expectSecret, keySize) == 0);
    }
    EXPECT_EQ(key.len, keySize);

    OH_CryptoKdfParams_Destroy(params);
    OH_CryptoKdf_Destroy(ctx);
    OH_Crypto_FreeDataBlob(&key);
}

/**
 * @tc.name   SUB_Security_CryptoFramework_NAPI_Kdf_Test_1300
 * @tc.number SUB_Security_CryptoFramework_NAPI_Kdf_Test_1300
 * @tc.desc   algorithm is Kdf
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(OHCryptoFrameworkKdfNapiTest, SUB_Security_CryptoFramework_NAPI_Kdf_Test_1300, TestSize.Level0)
{
    KdfSpec infoSpec = {
        .kdfType = OHTEST_KDF_X963, .algoName = "X963KDF|SHA256", .keySize = 64,
        .params.x963Params = {.key = nullptr, .info = (uint8_t *)"abcdef"}
    };
    int keySize = infoSpec.keySize;
    OH_CryptoKdfParams *params = nullptr;
    OH_CryptoKdf *ctx = nullptr;
    Crypto_DataBlob key = {.data = nullptr, .len = 0};

    EXPECT_EQ(OHTEST_CreateX963Params(infoSpec.params, &params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoKdf_Create(infoSpec.algoName, &ctx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoKdf_Derive(ctx, params, keySize, &key), CRYPTO_OPERTION_ERROR);

    OH_CryptoKdfParams_Destroy(params);
    OH_CryptoKdf_Destroy(ctx);
    OH_Crypto_FreeDataBlob(&key);
}

} // namespace Unittest::CryptoFrameworkKdfNapiTest
