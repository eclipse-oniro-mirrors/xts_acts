/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
#include <cstdlib>
#include <cstdio>
#include <pthread.h>
#include <cstring>
#include <cmath>

#include "include/CryptoFrameworkKdfTest.h"
#include "include/CommonToolTest.h"
#include <native_drawing/drawing_text_blob.h>
#include <hilog/log.h>

namespace Unittest::CryptoFramework {
class OHCryptoFrameworkKdfNapiTest {
public:
    static void SetUpTestCase(void) {};
    static void TearDownTestCase(void) {};
    void SetUp() {};
    void TearDown() {};
};

class KDF_TEST {
    public:
        static void SetUpTestCase() {};
        static void TearDownTestCase() {};
};

class KDF_SCRYPT_TEST {
    public:
        static void SetUpTestCase() {};
        static void TearDownTestCase() {};
};

class KDF_HKDF_TEST {
    public:
        static void SetUpTestCase() {};
        static void TearDownTestCase() {};
};

class KDF_PBKDF2_TEST {
    public:
        static void SetUpTestCase() {};
        static void TearDownTestCase() {};
};

class KDF_VECTOR_TEST {
    public:
        static void SetUpTestCase() {};
        static void TearDownTestCase() {};
};

static OH_Crypto_ErrCode OHTEST_CreatePbkdf2Params(ParamsSpec paramInfo,
    OH_CryptoKdfParams **params)
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
        password.len = strlen(reinterpret_cast<const char*>(paramInfo.pbkdf2Params.password));
        ret = OH_CryptoKdfParams_SetParam(*params, CRYPTO_KDF_KEY_DATABLOB, &password);
        if (ret != CRYPTO_SUCCESS) {
            OH_CryptoKdfParams_Destroy(*params);
            *params = nullptr;
            return ret;
        }
    }
    if (paramInfo.pbkdf2Params.salt) {
        salt.len = strlen(reinterpret_cast<const char*>(paramInfo.pbkdf2Params.salt));
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

static OH_Crypto_ErrCode OHTEST_CreateHkdfParams(ParamsSpec paramInfo,
    OH_CryptoKdfParams **params)
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
        key.len = strlen(reinterpret_cast<const char*>(paramInfo.hkdfParams.key));
        ret = OH_CryptoKdfParams_SetParam(*params, CRYPTO_KDF_KEY_DATABLOB, &key);
        if (ret != CRYPTO_SUCCESS) {
            OH_CryptoKdfParams_Destroy(*params);
            *params = nullptr;
            return ret;
        }
    }
    if (paramInfo.hkdfParams.salt) {
        salt.len = strlen(reinterpret_cast<const char*>(paramInfo.hkdfParams.salt));
        ret = OH_CryptoKdfParams_SetParam(*params, CRYPTO_KDF_SALT_DATABLOB, &salt);
        if (ret != CRYPTO_SUCCESS) {
            OH_CryptoKdfParams_Destroy(*params);
            *params = nullptr;
            return ret;
        }
    }
    if (paramInfo.hkdfParams.info) {
        info.len = strlen(reinterpret_cast<const char*>(paramInfo.hkdfParams.info));
        ret = OH_CryptoKdfParams_SetParam(*params, CRYPTO_KDF_INFO_DATABLOB, &info);
        if (ret != CRYPTO_SUCCESS) {
            OH_CryptoKdfParams_Destroy(*params);
            *params = nullptr;
            return ret;
        }
    }

    return ret;
}

static OH_Crypto_ErrCode SetScryptPassphraseAndSalt(OH_CryptoKdfParams *params, ParamsSpec paramInfo)
{
    OH_Crypto_ErrCode ret = CRYPTO_SUCCESS;
    if (paramInfo.scryptParams.passphrase) {
        Crypto_DataBlob passphrase = {
            .data = paramInfo.scryptParams.passphrase,
            .len = strlen(reinterpret_cast<const char*>(paramInfo.scryptParams.passphrase))
        };
        ret = OH_CryptoKdfParams_SetParam(params, CRYPTO_KDF_KEY_DATABLOB, &passphrase);
        if (ret != CRYPTO_SUCCESS) return ret;
    }
    if (paramInfo.scryptParams.salt) {
        Crypto_DataBlob salt = {
            .data = paramInfo.scryptParams.salt,
            .len = strlen(reinterpret_cast<const char*>(paramInfo.scryptParams.salt))
        };
        ret = OH_CryptoKdfParams_SetParam(params, CRYPTO_KDF_SALT_DATABLOB, &salt);
    }
    return ret;
}

static OH_Crypto_ErrCode SetScryptCoreParams(OH_CryptoKdfParams *params, ParamsSpec paramInfo)
{
    OH_Crypto_ErrCode ret;
    Crypto_DataBlob n = {.data = (uint8_t *)&paramInfo.scryptParams.n, .len = sizeof(uint64_t)};
    ret = OH_CryptoKdfParams_SetParam(params, CRYPTO_KDF_SCRYPT_N_UINT64, &n);
    if (ret != CRYPTO_SUCCESS) return ret;

    Crypto_DataBlob p = {.data = (uint8_t *)&paramInfo.scryptParams.p, .len = sizeof(uint64_t)};
    ret = OH_CryptoKdfParams_SetParam(params, CRYPTO_KDF_SCRYPT_P_UINT64, &p);
    if (ret != CRYPTO_SUCCESS) return ret;

    Crypto_DataBlob r = {.data = (uint8_t *)&paramInfo.scryptParams.r, .len = sizeof(uint64_t)};
    ret = OH_CryptoKdfParams_SetParam(params, CRYPTO_KDF_SCRYPT_R_UINT64, &r);
    return ret;
}
static OH_Crypto_ErrCode SetScryptMaxMem(OH_CryptoKdfParams *params, ParamsSpec paramInfo)
{
    if (*reinterpret_cast<uint64_t*>(&paramInfo.scryptParams.maxMem)) {
        Crypto_DataBlob maxMem = {
            .data = (uint8_t *)&paramInfo.scryptParams.maxMem,
            .len = sizeof(uint64_t)
        };
        return OH_CryptoKdfParams_SetParam(params, CRYPTO_KDF_SCRYPT_MAX_MEM_UINT64, &maxMem);
    }
    return CRYPTO_SUCCESS;
}
static OH_Crypto_ErrCode OHTEST_CreateScryptParams(ParamsSpec paramInfo, OH_CryptoKdfParams **params)
{
    OH_Crypto_ErrCode ret = OH_CryptoKdfParams_Create("SCRYPT", params);
    if (ret != CRYPTO_SUCCESS) {
        return ret;
    }
    ret = SetScryptPassphraseAndSalt(*params, paramInfo);
    if (ret == CRYPTO_SUCCESS) {
        ret = SetScryptCoreParams(*params, paramInfo);
    }
    if (ret == CRYPTO_SUCCESS) {
        ret = SetScryptMaxMem(*params, paramInfo);
    }
    if (ret != CRYPTO_SUCCESS) {
        OH_CryptoKdfParams_Destroy(*params);
        *params = nullptr;
    }
    return ret;
}

static OH_Crypto_ErrCode OHTEST_CreateX963Params(ParamsSpec paramInfo,
    OH_CryptoKdfParams **params)
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
        key.len = strlen(reinterpret_cast<const char*>(paramInfo.x963Params.key));
        ret = OH_CryptoKdfParams_SetParam(*params, CRYPTO_KDF_KEY_DATABLOB, &key);
        if (ret != CRYPTO_SUCCESS) {
            printf("OH_CryptoKdfParams_SetParam key failed\n");
            OH_CryptoKdfParams_Destroy(*params);
            *params = nullptr;
            return ret;
        }
    }
    if (paramInfo.x963Params.info) {
        info.len = strlen(reinterpret_cast<const char*>(paramInfo.x963Params.info));
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
        .params.pbkdf2Params = {.password = reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
            .salt = reinterpret_cast<uint8_t*>(const_cast<char*>("abcdef")), .iterations = 16}
    }, // 0
    {
        .kdfType = OHTEST_KDF_PBKDF2, .algoName = "PBKDF2|SHA224", .keySize = 64,
        .params.pbkdf2Params = {.password = reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
            .salt = reinterpret_cast<uint8_t*>(const_cast<char*>("abcdef")), .iterations = 16}
    },
    {
        .kdfType = OHTEST_KDF_PBKDF2, .algoName = "PBKDF2|SHA256", .keySize = 64,
        .params.pbkdf2Params = {.password = reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
            .salt = reinterpret_cast<uint8_t*>(const_cast<char*>("abcdef")), .iterations = 16}
    },
    {
        .kdfType = OHTEST_KDF_PBKDF2, .algoName = "PBKDF2|SHA384", .keySize = 64,
        .params.pbkdf2Params = {.password = reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
            .salt = reinterpret_cast<uint8_t*>(const_cast<char*>("abcdef")), .iterations = 16}
    },
    {
        .kdfType = OHTEST_KDF_PBKDF2, .algoName = "PBKDF2|SHA512", .keySize = 64,
        .params.pbkdf2Params = {.password = reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
            .salt = reinterpret_cast<uint8_t*>(const_cast<char*>("abcdef")), .iterations = 16}
    },
    {
        .kdfType = OHTEST_KDF_PBKDF2, .algoName = "PBKDF2|SM3", .keySize = 64,
        .params.pbkdf2Params = {.password = reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
            .salt = reinterpret_cast<uint8_t*>(const_cast<char*>("abcdef")), .iterations = 16}
    },
    /* HKDF */
    {
        .kdfType = OHTEST_KDF_HKDF, .algoName = "HKDF|SHA1|EXPAND_ONLY",
        .keySize = OHTEST_SHA1_DIGIESTSIZE * OHTEST_KDF_CONSTANT_LEN - 1,
        .params.hkdfParams = {.key = reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
            .salt = reinterpret_cast<uint8_t*>(const_cast<char*>("abcdef")),
            .info = reinterpret_cast<uint8_t*>(const_cast<char*>("abc"))}
    }, // 6
    {
        .kdfType = OHTEST_KDF_HKDF, .algoName = "HKDF|SHA1|EXTRACT_ONLY",
        .keySize = OHTEST_SHA1_DIGIESTSIZE, .params.hkdfParams = {
            .key = reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
            .salt = reinterpret_cast<uint8_t*>(const_cast<char*>("abcdef")),
            .info = reinterpret_cast<uint8_t*>(const_cast<char*>("abc"))
        }
    },
    {
        .kdfType = OHTEST_KDF_HKDF, .algoName = "HKDF|SHA1|EXTRACT_AND_EXPAND",
        .keySize = OHTEST_SHA1_DIGIESTSIZE * OHTEST_KDF_CONSTANT_LEN - 1,
        .params.hkdfParams = {.key = reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
            .salt = reinterpret_cast<uint8_t*>(const_cast<char*>("abcdef")),
            .info = reinterpret_cast<uint8_t*>(const_cast<char*>("abc"))}
    },
    {
        .kdfType = OHTEST_KDF_HKDF, .algoName = "HKDF|SHA224|EXPAND_ONLY",
        .keySize = OHTEST_SHA224_DIGIESTSIZE * OHTEST_KDF_CONSTANT_LEN - 1,
        .params.hkdfParams = {.key = reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
            .salt = reinterpret_cast<uint8_t*>(const_cast<char*>("abcdef")),
            .info = reinterpret_cast<uint8_t*>(const_cast<char*>("abc"))}
    },
    {
        .kdfType = OHTEST_KDF_HKDF, .algoName = "HKDF|SHA224|EXTRACT_ONLY",
        .keySize = OHTEST_SHA224_DIGIESTSIZE,
        .params.hkdfParams = {.key = reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
            .salt = reinterpret_cast<uint8_t*>(const_cast<char*>("abcdef")),
            .info = reinterpret_cast<uint8_t*>(const_cast<char*>("abc"))}
    },
    {
        .kdfType = OHTEST_KDF_HKDF, .algoName = "HKDF|SHA224|EXTRACT_AND_EXPAND",
        .keySize = OHTEST_SHA224_DIGIESTSIZE * OHTEST_KDF_CONSTANT_LEN - 1,
        .params.hkdfParams = {.key = reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
            .salt = reinterpret_cast<uint8_t*>(const_cast<char*>("abcdef")),
            .info = reinterpret_cast<uint8_t*>(const_cast<char*>("abc"))}
    },
    {
        .kdfType = OHTEST_KDF_HKDF, .algoName = "HKDF|SHA256|EXPAND_ONLY",
        .keySize = OHTEST_SHA256_DIGIESTSIZE * OHTEST_KDF_CONSTANT_LEN - 1,
        .params.hkdfParams = {.key = reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
            .salt = reinterpret_cast<uint8_t*>(const_cast<char*>("abcdef")),
            .info = reinterpret_cast<uint8_t*>(const_cast<char*>("abc"))}
    },
    {
        .kdfType = OHTEST_KDF_HKDF, .algoName = "HKDF|SHA256|EXTRACT_ONLY",
        .keySize = OHTEST_SHA256_DIGIESTSIZE,
        .params.hkdfParams = {.key = reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
            .salt = reinterpret_cast<uint8_t*>(const_cast<char*>("abcdef")),
            .info = reinterpret_cast<uint8_t*>(const_cast<char*>("abc"))}
    },
    {
        .kdfType = OHTEST_KDF_HKDF, .algoName = "HKDF|SHA256|EXTRACT_AND_EXPAND",
        .keySize = OHTEST_SHA256_DIGIESTSIZE * OHTEST_KDF_CONSTANT_LEN - 1,
        .params.hkdfParams = {.key = reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
            .salt = reinterpret_cast<uint8_t*>(const_cast<char*>("abcdef")),
            .info = reinterpret_cast<uint8_t*>(const_cast<char*>("abc"))}
    },
    {
        .kdfType = OHTEST_KDF_HKDF, .algoName = "HKDF|SHA384|EXPAND_ONLY",
        .keySize = OHTEST_SHA384_DIGIESTSIZE * OHTEST_KDF_CONSTANT_LEN - 1,
        .params.hkdfParams = {.key = reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
            .salt = reinterpret_cast<uint8_t*>(const_cast<char*>("abcdef")),
            .info = reinterpret_cast<uint8_t*>(const_cast<char*>("abc"))}
    },
    {
        .kdfType = OHTEST_KDF_HKDF, .algoName = "HKDF|SHA384|EXTRACT_ONLY",
        .keySize = OHTEST_SHA384_DIGIESTSIZE,
        .params.hkdfParams = {.key = reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
            .salt = reinterpret_cast<uint8_t*>(const_cast<char*>("abcdef")),
            .info = reinterpret_cast<uint8_t*>(const_cast<char*>("abc"))}
    },
    {
        .kdfType = OHTEST_KDF_HKDF, .algoName = "HKDF|SHA384|EXTRACT_AND_EXPAND",
        .keySize = OHTEST_SHA384_DIGIESTSIZE * OHTEST_KDF_CONSTANT_LEN - 1,
        .params.hkdfParams = {.key = reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
            .salt = reinterpret_cast<uint8_t*>(const_cast<char*>("abcdef")),
            .info = reinterpret_cast<uint8_t*>(const_cast<char*>("abc"))}
    },
    {
        .kdfType = OHTEST_KDF_HKDF, .algoName = "HKDF|SHA512|EXPAND_ONLY",
        .keySize = OHTEST_SHA512_DIGIESTSIZE * OHTEST_KDF_CONSTANT_LEN - 1,
        .params.hkdfParams = {.key = reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
            .salt = reinterpret_cast<uint8_t*>(const_cast<char*>("abcdef")),
            .info = reinterpret_cast<uint8_t*>(const_cast<char*>("abc"))}
    },
    {
        .kdfType = OHTEST_KDF_HKDF, .algoName = "HKDF|SHA512|EXTRACT_ONLY",
        .keySize = OHTEST_SHA512_DIGIESTSIZE,
        .params.hkdfParams = {.key = reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
            .salt = reinterpret_cast<uint8_t*>(const_cast<char*>("abcdef")),
            .info = reinterpret_cast<uint8_t*>(const_cast<char*>("abc"))}
    },
    {
        .kdfType = OHTEST_KDF_HKDF, .algoName = "HKDF|SHA512|EXTRACT_AND_EXPAND",
        .keySize = OHTEST_SHA512_DIGIESTSIZE * OHTEST_KDF_CONSTANT_LEN - 1,
        .params.hkdfParams = {.key = reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
            .salt = reinterpret_cast<uint8_t*>(const_cast<char*>("abcdef")),
            .info = reinterpret_cast<uint8_t*>(const_cast<char*>("abc"))}
    },
    {
        .kdfType = OHTEST_KDF_HKDF, .algoName = "HKDF|SM3|EXPAND_ONLY",
        .keySize = OHTEST_SM3_DIGIESTSIZE * OHTEST_KDF_CONSTANT_LEN - 1,
        .params.hkdfParams = {.key = reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
            .salt = reinterpret_cast<uint8_t*>(const_cast<char*>("abcdef")),
            .info = reinterpret_cast<uint8_t*>(const_cast<char*>("abc"))}
    },
    {
        .kdfType = OHTEST_KDF_HKDF, .algoName = "HKDF|SM3|EXTRACT_ONLY",
        .keySize = OHTEST_SM3_DIGIESTSIZE,
        .params.hkdfParams = {.key = reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
            .salt = reinterpret_cast<uint8_t*>(const_cast<char*>("abcdef")),
            .info = reinterpret_cast<uint8_t*>(const_cast<char*>("abc"))}
    },
    {
        .kdfType = OHTEST_KDF_HKDF, .algoName = "HKDF|SM3|EXTRACT_AND_EXPAND",
        .keySize = OHTEST_SM3_DIGIESTSIZE * OHTEST_KDF_CONSTANT_LEN - 1,
        .params.hkdfParams = {.key = reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
            .salt = reinterpret_cast<uint8_t*>(const_cast<char*>("abcdef")),
            .info = reinterpret_cast<uint8_t*>(const_cast<char*>("abc"))}
    },
    {
        .kdfType = OHTEST_KDF_HKDF, .algoName = "HKDF|MD5|EXPAND_ONLY",
        .keySize = OHTEST_MD5_DIGIESTSIZE * OHTEST_KDF_CONSTANT_LEN - 1,
        .params.hkdfParams = {.key = reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
            .salt = reinterpret_cast<uint8_t*>(const_cast<char*>("abcdef")),
            .info = reinterpret_cast<uint8_t*>(const_cast<char*>("abc"))}
    },
    {
        .kdfType = OHTEST_KDF_HKDF, .algoName = "HKDF|MD5|EXTRACT_ONLY",
        .keySize = OHTEST_MD5_DIGIESTSIZE,
        .params.hkdfParams = {.key = reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
            .salt = reinterpret_cast<uint8_t*>(const_cast<char*>("abcdef")),
            .info = reinterpret_cast<uint8_t*>(const_cast<char*>("abc"))}
    },
    {
        .kdfType = OHTEST_KDF_HKDF, .algoName = "HKDF|MD5|EXTRACT_AND_EXPAND",
        .keySize = OHTEST_MD5_DIGIESTSIZE * OHTEST_KDF_CONSTANT_LEN - 1,
        .params.hkdfParams = {.key = reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
            .salt = reinterpret_cast<uint8_t*>(const_cast<char*>("abcdef")),
            .info = reinterpret_cast<uint8_t*>(const_cast<char*>("abc"))}
    },
    {
        .kdfType = OHTEST_KDF_HKDF, .algoName = "HKDF|MD5",
        .keySize = OHTEST_MD5_DIGIESTSIZE * OHTEST_KDF_CONSTANT_LEN - 1,
        .params.hkdfParams = {.key = reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
            .salt = reinterpret_cast<uint8_t*>(const_cast<char*>("abcdef")),
            .info = reinterpret_cast<uint8_t*>(const_cast<char*>("abc"))}
    },
    /* SCRYPT */
    {
        .kdfType = OHTEST_KDF_SCRYPT, .algoName = "SCRYPT", .keySize = 64,
        // maxMem = p * 128 * r + 32 * r * (n + 2) * 4 + 1
        .params.scryptParams = {.passphrase = reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
            .salt = reinterpret_cast<uint8_t*>(const_cast<char*>("abcdef")),
            .n = 1024, .p = 1, .r = 8, .maxMem = 1051649}
    }, // 28
    /* X963 with info*/
    {
        .kdfType = OHTEST_KDF_X963, .algoName = "X963KDF|SHA1", .keySize = 64,
        .params.x963Params = {.key = reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
            .info = reinterpret_cast<uint8_t*>(const_cast<char*>("abcdef"))}
    },
    {
        .kdfType = OHTEST_KDF_X963, .algoName = "X963KDF|SHA224", .keySize = 27,
        .params.x963Params = {.key = reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
            .info = reinterpret_cast<uint8_t*>(const_cast<char*>("abcdef"))}
    },
    {
        .kdfType = OHTEST_KDF_X963, .algoName = "X963KDF|SHA256", .keySize = 33,
        .params.x963Params = {.key = reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
            .info = reinterpret_cast<uint8_t*>(const_cast<char*>("abcdef"))}
    },
    {
        .kdfType = OHTEST_KDF_X963, .algoName = "X963KDF|SHA384", .keySize = 64,
        .params.x963Params = {.key = reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
            .info = reinterpret_cast<uint8_t*>(const_cast<char*>("abcdef"))}
    },
    {
        .kdfType = OHTEST_KDF_X963, .algoName = "X963KDF|SHA512", .keySize = 16,
        .params.x963Params = {.key = reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
            .info = reinterpret_cast<uint8_t*>(const_cast<char*>("abcdef"))}
    },
    /* X963 without info*/
    {
        .kdfType = OHTEST_KDF_X963, .algoName = "X963KDF|SHA1", .keySize = 64,
        .params.x963Params = {.key = reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
            .info = nullptr}
    },
    {
        .kdfType = OHTEST_KDF_X963, .algoName = "X963KDF|SHA224", .keySize = 27,
        .params.x963Params = {.key = reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
            .info = nullptr}
    },
    {
        .kdfType = OHTEST_KDF_X963, .algoName = "X963KDF|SHA256", .keySize = 33,
        .params.x963Params = {.key = reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
            .info = nullptr}
    },
    {
        .kdfType = OHTEST_KDF_X963, .algoName = "X963KDF|SHA384", .keySize = 64,
        .params.x963Params = {.key = reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
            .info = nullptr}
    },
    {
        .kdfType = OHTEST_KDF_X963, .algoName = "X963KDF|SHA512", .keySize = 16,
        .params.x963Params = {.key = reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
            .info = nullptr}
    },
};

int SubCryptoFrameworkNapiKdfTest0100()
{
    const int kdfSpecCount = sizeof(g_kdfSpec) / sizeof(g_kdfSpec[0]);
    for (int i = 0; i < kdfSpecCount; i++) {
        KdfSpec infoSpec = g_kdfSpec[i];
        KdfType kdfType = infoSpec.kdfType;
        const char *algoName = infoSpec.algoName;
        int keySize = infoSpec.keySize;
        OH_CryptoKdfParams *params = nullptr;
        OH_CryptoKdf *ctx = nullptr;
        Crypto_DataBlob key = {.data = nullptr, .len = 0};

        switch (kdfType) {
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
    return 0;
}


int SubCryptoFrameworkNapiKdfTest0200()
{
    KdfSpec infoSpec = {
        .kdfType = OHTEST_KDF_HKDF, .algoName = "HKDF|SM3|EXPAND_ONLY",
        .keySize = OHTEST_SM3_DIGIESTSIZE * OHTEST_KDF_CONSTANT_LEN - 1,
        .params.hkdfParams = {.key = reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
            .salt = reinterpret_cast<uint8_t*>(const_cast<char*>("abcdef")),
            .info = reinterpret_cast<uint8_t*>(const_cast<char*>("abc"))}
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
    return 0;
}

int SubCryptoFrameworkNapiKdfTest0300()
{
    KdfSpec infoSpec = {
        .kdfType = OHTEST_KDF_SCRYPT, .algoName = "SCRYPT", .keySize = 64,
        // maxMem = p * 128 * r + 32 * r * (n + 2) * 4 + 1
        .params.scryptParams = {.passphrase = reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
            .salt = reinterpret_cast<uint8_t*>(const_cast<char*>("abcdef")),
            .n = 1024, .p = 1, .r = 8, .maxMem = 1051649}
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
    return 0;
}

int SubCryptoFrameworkNapiKdfTest0400()
{
    KdfSpec infoSpec = {
        .kdfType = OHTEST_KDF_HKDF, .algoName = "HKDF|MD5|EXTRACT_ONLY", .keySize = OHTEST_MD5_DIGIESTSIZE,
        .params.hkdfParams = {.key = reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
            .salt = reinterpret_cast<uint8_t*>(const_cast<char*>("abcdef")),
            .info = reinterpret_cast<uint8_t*>(const_cast<char*>("abc"))}
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
    return 0;
}

int SubCryptoFrameworkNapiKdfTest0500()
{
    KdfSpec infoSpec = {
        .kdfType = OHTEST_KDF_PBKDF2, .algoName = "PBKDF2|SHA1", .keySize = 64,
        .params.pbkdf2Params = {.password = reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
            .salt = reinterpret_cast<uint8_t*>(const_cast<char*>("abcdef")), .iterations = 16}
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
    return 0;
}

KdfSpec g_scryptErrorSpec[] = {
    /* RFC7914 */
    {
        .kdfType = OHTEST_KDF_SCRYPT, .algoName = "SCRYPT", .keySize = 64,
        /* N > 2^(128 * r / 8) */
        .params.scryptParams = {
            .passphrase = reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
            .salt = reinterpret_cast<uint8_t*>(const_cast<char*>("abcdef")),
            .n = static_cast<uint64_t>(pow(2, 16)),
            .p = 1,
            .r = 1,
            .maxMem = 0
        }
    },
    {
        .kdfType = OHTEST_KDF_SCRYPT, .algoName = "SCRYPT", .keySize = 64,
        /* p > ((2^32 - 1) * 32) / (128 * r) */
        .params.scryptParams = {
            .passphrase = reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
            .salt = reinterpret_cast<uint8_t*>(const_cast<char*>("abcdef")),
            .n = 1024,
            .p = static_cast<uint64_t>(pow(2, 16)),
            .r = static_cast<uint64_t>(pow(2, 16)),
            .maxMem = 0
        }
    },
    {
        .kdfType = OHTEST_KDF_SCRYPT, .algoName = "SCRYPT", .keySize = 64,
        /* r * p > 2^30 - 1 */
        .params.scryptParams = {
            .passphrase = reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
            .salt = reinterpret_cast<uint8_t*>(const_cast<char*>("abcdef")),
            .n = 1024,
            .p = static_cast<uint64_t>(pow(2, 14)),
            .r = static_cast<uint64_t>(pow(2, 16)),
            .maxMem = 0
        }
    },
    {
        .kdfType = OHTEST_KDF_SCRYPT, .algoName = "SCRYPT", .keySize = 64,
        /* p * 128 * r > UINT32_MAX */
        .params.scryptParams = {
            .passphrase = reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
            .salt = reinterpret_cast<uint8_t*>(const_cast<char*>("abcdef")),
            .n = 1024,
            .p = static_cast<uint64_t>(pow(2, 14)),
            .r = static_cast<uint64_t>(pow(2, 16)),
            .maxMem = 0
        }
    },
    {
        .kdfType = OHTEST_KDF_SCRYPT, .algoName = "SCRYPT", .keySize = 64,
        /* n != 2^x */
        .params.scryptParams = {
            .passphrase = reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
            .salt = reinterpret_cast<uint8_t*>(const_cast<char*>("abcdef")),
            .n = 7,
            .p = 1,
            .r = 8,
            .maxMem = 0
        }
    },
};

int SubCryptoFrameworkNapiKdfTest0600()
{
    const int scryptErrorSpecCount = sizeof(g_scryptErrorSpec) / sizeof(g_scryptErrorSpec[0]);
    for (int i = 0; i < scryptErrorSpecCount; i++) {
        KdfSpec infoSpec = g_scryptErrorSpec[i];
        const char *algoName = infoSpec.algoName;
        int keySize = infoSpec.keySize;
        OH_CryptoKdfParams *params = nullptr;
        OH_CryptoKdf *ctx = nullptr;
        Crypto_DataBlob key = {.data = nullptr, .len = 0};
        uint64_t p = *reinterpret_cast<uint64_t*>(&infoSpec.params.scryptParams.p);
        uint64_t n = *reinterpret_cast<uint64_t*>(&infoSpec.params.scryptParams.n);
        uint64_t r = *reinterpret_cast<uint64_t*>(&infoSpec.params.scryptParams.r);
        /* p * 128 * r + 32 * r * (n + 2) * 4 + 1 */
        uint64_t maxMem = p * 128 * r + 32 * r * (n + 2) * 4 + 1;
    
        infoSpec.params.scryptParams.maxMem = maxMem;
        EXPECT_EQ(OHTEST_CreateScryptParams(infoSpec.params, &params), CRYPTO_SUCCESS);
        EXPECT_EQ(OH_CryptoKdf_Create(algoName, &ctx), CRYPTO_SUCCESS);
        EXPECT_EQ(OH_CryptoKdf_Derive(ctx, params, keySize, &key), CRYPTO_OPERTION_ERROR);

        OH_CryptoKdfParams_Destroy(params);
        OH_CryptoKdf_Destroy(ctx);
        OH_Crypto_FreeDataBlob(&key);
    }
    return 0;
}

int SubCryptoFrameworkNapiKdfTest0700()
{
    KdfSpec infoSpec = {
        .kdfType = OHTEST_KDF_SCRYPT, .algoName = "SCRYPT", .keySize = 64,
        /* maxMem < p * 128 * r + 32 * r * (n + 2) * 4 */
        .params.scryptParams = {
            .passphrase = reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
            .salt = reinterpret_cast<uint8_t*>(const_cast<char*>("abcdef")),
            .n = 1024,
            .p = 1,
            .r = 8,
            .maxMem = 0
        }
    };
    const char *algoName = infoSpec.algoName;
    int keySize = infoSpec.keySize;
    OH_CryptoKdfParams *params = nullptr;
    OH_CryptoKdf *ctx = nullptr;
    Crypto_DataBlob key = {.data = nullptr, .len = 0};
    uint64_t p = *reinterpret_cast<uint64_t*>(&infoSpec.params.scryptParams.p);
    uint64_t n = *reinterpret_cast<uint64_t*>(&infoSpec.params.scryptParams.n);
    uint64_t r = *reinterpret_cast<uint64_t*>(&infoSpec.params.scryptParams.r);
    /* p * 128 * r + 32 * r * (n + 2) * 4 - 1 */
    uint64_t maxMem = p * 128 * r + 32 * r * (n + 2) * 4 - 1;
    
    infoSpec.params.scryptParams.maxMem = maxMem;
    EXPECT_EQ(OHTEST_CreateScryptParams(infoSpec.params, &params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoKdf_Create(algoName, &ctx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoKdf_Derive(ctx, params, keySize, &key), CRYPTO_OPERTION_ERROR);

    OH_CryptoKdfParams_Destroy(params);
    OH_CryptoKdf_Destroy(ctx);
    OH_Crypto_FreeDataBlob(&key);
    return 0;
}

int SubCryptoFrameworkNapiKdfTest0800()
{
    KdfSpec infoSpec = {
        .kdfType = OHTEST_KDF_SCRYPT, .algoName = "SCRYPT", .keySize = 64,
        /* maxMem < p * 128 * r + 32 * r * (n + 2) * 4 */
        .params.scryptParams = {
            .passphrase = nullptr,
            .salt = reinterpret_cast<uint8_t*>(const_cast<char*>("abcdef")),
            .n = 1024,
            .p = 1,
            .r = 8,
            .maxMem = 1051649
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
    return 0;
}

int SubCryptoFrameworkNapiKdfTest0900()
{
    KdfSpec infoSpec = {
        .kdfType = OHTEST_KDF_SCRYPT, .algoName = "SCRYPT", .keySize = 64,
        /* maxMem < p * 128 * r + 32 * r * (n + 2) * 4 */
        .params.scryptParams = {
            .passphrase = reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
            .salt = nullptr,
            .n = 1024,
            .p = 1,
            .r = 8,
            .maxMem = 1051649
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
    return 0;
}

KdfSpec g_hkdfErrorSpec[] = {
    {
        .kdfType = OHTEST_KDF_HKDF, .algoName = "HKDF|SHA1|EXPAND_ONLY",
        .keySize = OHTEST_SHA1_DIGIESTSIZE * OHTEST_KDF_CONSTANT_LEN - 1,
        .params.hkdfParams = {
            .key = reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
            .salt = nullptr,
            .info = reinterpret_cast<uint8_t*>(const_cast<char*>("abc"))
        }
    },
    {
        .kdfType = OHTEST_KDF_HKDF, .algoName = "HKDF|SHA1|EXPAND_ONLY",
        .keySize = OHTEST_SHA1_DIGIESTSIZE * OHTEST_KDF_CONSTANT_LEN - 1,
        .params.hkdfParams = {
            .key = nullptr,
            .salt = reinterpret_cast<uint8_t*>(const_cast<char*>("abcdef")),
            .info = reinterpret_cast<uint8_t*>(const_cast<char*>("abc"))
        }
    },
    {
        .kdfType = OHTEST_KDF_HKDF, .algoName = "HKDF|SHA1|EXPAND_ONLY",
        .keySize = OHTEST_SHA1_DIGIESTSIZE * OHTEST_KDF_CONSTANT_LEN - 1,
        .params.hkdfParams = {
            .key = reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
            .salt = reinterpret_cast<uint8_t*>(const_cast<char*>("abcdef")),
            .info = nullptr
        }
    },
    {
        .kdfType = OHTEST_KDF_HKDF, .algoName = "HKDF|SHA1|EXPAND_ONLY",
        .keySize = OHTEST_SHA1_DIGIESTSIZE * OHTEST_KDF_CONSTANT_LEN + 1,
        .params.hkdfParams = {
            .key = reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
            .salt = reinterpret_cast<uint8_t*>(const_cast<char*>("abcdef")),
            .info = reinterpret_cast<uint8_t*>(const_cast<char*>("abc"))
        }
    },
    {
        .kdfType = OHTEST_KDF_HKDF, .algoName = "HKDF|SHA1|EXTRACT_ONLY",
        .keySize = OHTEST_SHA1_DIGIESTSIZE + 1,
        .params.hkdfParams = {
            .key = reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
            .salt = reinterpret_cast<uint8_t*>(const_cast<char*>("abcdef")),
            .info = reinterpret_cast<uint8_t*>(const_cast<char*>("abc"))
        }
    },
    {
        .kdfType = OHTEST_KDF_HKDF, .algoName = "HKDF|SHA1|EXTRACT_ONLY",
        .keySize = OHTEST_SHA1_DIGIESTSIZE - 1,
        .params.hkdfParams = {
            .key = reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
            .salt = reinterpret_cast<uint8_t*>(const_cast<char*>("abcdef")),
            .info = reinterpret_cast<uint8_t*>(const_cast<char*>("abc"))
        }
    },
    {
        .kdfType = OHTEST_KDF_HKDF, .algoName = "HKDF|SHA1|EXTRACT_AND_EXPAND",
        .keySize = OHTEST_SHA1_DIGIESTSIZE * OHTEST_KDF_CONSTANT_LEN + 1,
        .params.hkdfParams = {
            .key = reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
            .salt = reinterpret_cast<uint8_t*>(const_cast<char*>("abcdef")),
            .info = reinterpret_cast<uint8_t*>(const_cast<char*>("abc"))
        }
    },
};

int SubCryptoFrameworkNapiKdfTest1000()
{
    const int hkdfErrorSpecCount = sizeof(g_hkdfErrorSpec) / sizeof(g_hkdfErrorSpec[0]);
    for (int i = 0; i < hkdfErrorSpecCount; i++) {
        KdfSpec infoSpec = g_hkdfErrorSpec[i];
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
    return 0;
}

KdfSpec g_pbkdf2ErrorSpec[] = {
    {
        .kdfType = OHTEST_KDF_PBKDF2, .algoName = "PBKDF2|SHA1", .keySize = 64,
        .params.pbkdf2Params = {.password = nullptr,
            .salt = reinterpret_cast<uint8_t*>(const_cast<char*>("abcdef")), .iterations = 16}
    },
    {
        .kdfType = OHTEST_KDF_PBKDF2, .algoName = "PBKDF2|SHA1", .keySize = 64,
        .params.pbkdf2Params = {.password = reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
            .salt = nullptr, .iterations = 16}
    },
    {
        .kdfType = OHTEST_KDF_PBKDF2, .algoName = "PBKDF2|SHA1", .keySize = 64,
        .params.pbkdf2Params = {.password = reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
            .salt = reinterpret_cast<uint8_t*>(const_cast<char*>("abcdef")), .iterations = 0}
    },
    {
        .kdfType = OHTEST_KDF_PBKDF2, .algoName = "PBKDF2|SHA1", .keySize = -1,
        .params.pbkdf2Params = {.password = reinterpret_cast<uint8_t*>(const_cast<char*>("0123456789")),
            .salt = reinterpret_cast<uint8_t*>(const_cast<char*>("abcdef")), .iterations = 16}
    }
};

int SubCryptoFrameworkNapiKdfTest1100()
{
    const int pbkdf2ErrorSpecCount = sizeof(g_pbkdf2ErrorSpec) / sizeof(g_pbkdf2ErrorSpec[0]);
    for (int i = 0; i < pbkdf2ErrorSpecCount; i++) {
        KdfSpec infoSpec = g_pbkdf2ErrorSpec[i];
        const char *algoName = infoSpec.algoName;
        int keySize = infoSpec.keySize;
        OH_CryptoKdfParams *params = nullptr;
        OH_CryptoKdf *ctx = nullptr;
        Crypto_DataBlob key = {.data = nullptr, .len = 0};

        EXPECT_EQ(OHTEST_CreatePbkdf2Params(infoSpec.params, &params), CRYPTO_SUCCESS);
        EXPECT_EQ(OH_CryptoKdf_Create(algoName, &ctx), CRYPTO_SUCCESS);
        if (infoSpec.keySize < 0) {
            EXPECT_EQ(OH_CryptoKdf_Derive(ctx, params, keySize, &key), CRYPTO_PARAMETER_CHECK_FAILED);
        } else if (*(reinterpret_cast<int *>(&infoSpec.params.pbkdf2Params.iterations))) {
            EXPECT_EQ(OH_CryptoKdf_Derive(ctx, params, keySize, &key), CRYPTO_SUCCESS);
        } else {
            EXPECT_EQ(OH_CryptoKdf_Derive(ctx, params, keySize, &key), CRYPTO_PARAMETER_CHECK_FAILED);
        }

        OH_CryptoKdfParams_Destroy(params);
        OH_CryptoKdf_Destroy(ctx);
        OH_Crypto_FreeDataBlob(&key);
    }
    return 0;
}

int SubCryptoFrameworkNapiKdfTest1200()
{
    const char *algoName = "KDF_TLS12";
    OH_CryptoKdfParams *params = nullptr;
    OH_CryptoKdf *ctx = nullptr;

    EXPECT_EQ(OH_CryptoKdfParams_Create(algoName, &params), CRYPTO_PARAMETER_CHECK_FAILED);
    EXPECT_EQ(OH_CryptoKdf_Create(algoName, &ctx), CRYPTO_PARAMETER_CHECK_FAILED);

    OH_CryptoKdfParams_Destroy(params);
    OH_CryptoKdf_Destroy(ctx);
    return 0;
}

static OH_Crypto_ErrCode OHTEST_CreateVectorPbkdf2Params(ParamsVectorSpec paramInfo,
    OH_CryptoKdfParams **params)
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

static OH_Crypto_ErrCode OHTEST_CreateVectorHkdfParams(ParamsVectorSpec paramInfo,
    OH_CryptoKdfParams **params)
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

static OH_Crypto_ErrCode OHTEST_CreateVectorX963Params(ParamsVectorSpec paramInfo,
    OH_CryptoKdfParams **params)
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
            .password = const_cast<uint8_t*>(PBHDF2SHA1PASSWORD),
            .passLen = sizeof(PBHDF2SHA1PASSWORD),
            .salt = const_cast<uint8_t*>(PBHDF2_SHA1_SALT), .saltLen = sizeof(PBHDF2_SHA1_SALT),
            .iterations = 2
        },
        .expectSecret = const_cast<uint8_t*>(PBHDF2_SHA1_EXPECT_SECRET)
    }, // 0
    {
        .kdfType = OHTEST_KDF_PBKDF2, .algoName = "PBKDF2|SHA224", .keySize = 20,
        .params.pbkdf2Params = {
            .password = const_cast<uint8_t*>(PBHDF2SHA224PASSWORD),
            .passLen = sizeof(PBHDF2SHA224PASSWORD),
            .salt = const_cast<uint8_t*>(PBHDF2SHA224SALT), .saltLen = sizeof(PBHDF2SHA224SALT),
            .iterations = 1
        },
        .expectSecret = const_cast<uint8_t*>(PBHDF2_SHA224_EXPECT_SECRET)
    }, // 1
    {
        .kdfType = OHTEST_KDF_PBKDF2, .algoName = "PBKDF2|SHA256", .keySize = 64,
        .params.pbkdf2Params = {
            .password = const_cast<uint8_t*>(PBHDF2SHA256PASSWORD),
            .passLen = sizeof(PBHDF2SHA256PASSWORD),
            .salt = const_cast<uint8_t*>(PBHDF2SHA256SALT), .saltLen = sizeof(PBHDF2SHA256SALT),
            .iterations = 1
        },
        .expectSecret = const_cast<uint8_t*>(PBHDF2_SHA256_EXPECT_SECRET)
    }, // 2
    {
        .kdfType = OHTEST_KDF_PBKDF2, .algoName = "PBKDF2|SHA384", .keySize = 20,
        .params.pbkdf2Params = {
            .password = const_cast<uint8_t*>(PBHDF2SHA384PASSWORD),
            .passLen = sizeof(PBHDF2SHA384PASSWORD),
            .salt = const_cast<uint8_t*>(PBHDF2SHA384SALT), .saltLen = sizeof(PBHDF2SHA384SALT),
            .iterations = 1
        },
        .expectSecret = const_cast<uint8_t*>(PBHDF2_SHA384_EXPECT_SECRET)
    }, // 3
    {
        .kdfType = OHTEST_KDF_PBKDF2, .algoName = "PBKDF2|SHA512", .keySize = 20,
        .params.pbkdf2Params = {
            .password = const_cast<uint8_t*>(PBHDF2SHA512PASSWORD),
            .passLen = sizeof(PBHDF2SHA512PASSWORD),
            .salt = const_cast<uint8_t*>(PBHDF2SHA512SALT), .saltLen = sizeof(PBHDF2SHA512SALT),
            .iterations = 1
        },
        .expectSecret = const_cast<uint8_t*>(PBHDF2_SHA512_EXPECT_SECRET)
    }, // 4
    {
        .kdfType = OHTEST_KDF_PBKDF2, .algoName = "PBKDF2|SM3", .keySize = 20,
        .params.pbkdf2Params = {
            .password = const_cast<uint8_t*>(PBHDF2_SM3_PASSWORD),
            .passLen = sizeof(PBHDF2_SM3_PASSWORD),
            .salt = const_cast<uint8_t*>(PBHDF2_SM3_SALT), .saltLen = sizeof(PBHDF2_SM3_SALT),
            .iterations = 10000
        },
        .expectSecret = const_cast<uint8_t*>(PBHDF2_SM3_EXPECT_SECRET)
    }, // 5
    {
        .kdfType = OHTEST_KDF_HKDF, .algoName = "HKDF|SHA1", .keySize = 42,
        .params.hkdfParams = {
            .key = const_cast<uint8_t*>(HKDF_SHA1KEY), .keyLen = sizeof(HKDF_SHA1KEY),
            .salt = const_cast<uint8_t*>(HKDF_SHA1SALT), .saltLen = sizeof(HKDF_SHA1SALT),
            .info = const_cast<uint8_t*>(HKDF_SHA1_INFO), .infoLen = sizeof(HKDF_SHA1_INFO),
        },
        .expectSecret = const_cast<uint8_t*>(HKDF_SHA1_EXPECT_SECRET)
    }, // 6
    {
        .kdfType = OHTEST_KDF_HKDF, .algoName = "HKDF|SHA224", .keySize = 32,
        .params.hkdfParams = {
            .key = const_cast<uint8_t*>(HKDF_SHA224_KEY), .keyLen = sizeof(HKDF_SHA224_KEY),
            .salt = const_cast<uint8_t*>(HKDF_SHA224SALT), .saltLen = sizeof(HKDF_SHA224SALT),
            .info = const_cast<uint8_t*>(HKDF_SHA224INFO), .infoLen = sizeof(HKDF_SHA224INFO),
        },
        .expectSecret = const_cast<uint8_t*>(HKDF_SHA224_EXPECT_SECRET)
    }, // 7
    {
        .kdfType = OHTEST_KDF_HKDF, .algoName = "HKDF|SHA256", .keySize = 42,
        .params.hkdfParams = {
            .key = const_cast<uint8_t*>(HKDF_SHA256KEY), .keyLen = sizeof(HKDF_SHA256KEY),
            .salt = const_cast<uint8_t*>(HKDF_SHA256SALT), .saltLen = sizeof(HKDF_SHA256SALT),
            .info = const_cast<uint8_t*>(HKDF_SHA256INFO), .infoLen = sizeof(HKDF_SHA256INFO),
        },
        .expectSecret = const_cast<uint8_t*>(HKDF_SHA256_EXPECT_SECRET)
    }, // 8
    {
        .kdfType = OHTEST_KDF_HKDF, .algoName = "HKDF|SHA384", .keySize = 32,
        .params.hkdfParams = {
            .key = const_cast<uint8_t*>(HKDF_SHA384KEY), .keyLen = sizeof(HKDF_SHA384KEY),
            .salt = const_cast<uint8_t*>(HKDF_SHA384_SALT), .saltLen = sizeof(HKDF_SHA384_SALT),
            .info = const_cast<uint8_t*>(HKDF_SHA384INFO), .infoLen = sizeof(HKDF_SHA384INFO),
        },
        .expectSecret = const_cast<uint8_t*>(HKDF_SHA384_EXPECT_SECRET)
    }, // 9
    {
        .kdfType = OHTEST_KDF_HKDF, .algoName = "HKDF|SHA512", .keySize = 32,
        .params.hkdfParams = {
            .key = const_cast<uint8_t*>(HKDF_SHA512KEY), .keyLen = sizeof(HKDF_SHA512KEY),
            .salt = const_cast<uint8_t*>(HKDF_SHA512_SALT), .saltLen = sizeof(HKDF_SHA512_SALT),
            .info = const_cast<uint8_t*>(HKDF_SHA512INFO), .infoLen = sizeof(HKDF_SHA512INFO),
        },
        .expectSecret = const_cast<uint8_t*>(HKDF_SHA512_EXPECT_SECRET)
    }, // 10
    {
        .kdfType = OHTEST_KDF_HKDF, .algoName = "HKDF|SM3", .keySize = 16,
        .params.hkdfParams = {
            .key = const_cast<uint8_t*>(HKDF_SM3_KEY), .keyLen = sizeof(HKDF_SM3_KEY),
            .salt = const_cast<uint8_t*>(HKDF_SM3_SALT), .saltLen = sizeof(HKDF_SM3_SALT),
            .info = const_cast<uint8_t*>(HKDF_SM3INFO), .infoLen = sizeof(HKDF_SM3INFO),
        },
        .expectSecret = const_cast<uint8_t*>(HKDF_SM3_EXPECT_SECRET)
    }, // 11
    /* X963 */
    {
        .kdfType = OHTEST_KDF_X963, .algoName = "X963KDF|SHA1", .keySize = 128,
        .params.x963Params = {
            .key = const_cast<uint8_t*>(X963_SHA1_KEY), .keyLen = sizeof(X963_SHA1_KEY),
            .info = const_cast<uint8_t*>(X963SHA1INFO), .infoLen = sizeof(X963SHA1INFO),
        },
        .expectSecret = const_cast<uint8_t*>(X963_SHA1_EXPECT_SECRET)
    },
    {
        .kdfType = OHTEST_KDF_X963, .algoName = "X963KDF|SHA224", .keySize = 128,
        .params.x963Params = {
            .key = const_cast<uint8_t*>(X963_SHA224_KEY), .keyLen = sizeof(X963_SHA224_KEY),
            .info = const_cast<uint8_t*>(X963_SHA224_INFO), .infoLen = sizeof(X963_SHA224_INFO),
        },
        .expectSecret = const_cast<uint8_t*>(X963_SHA224_EXPECT_SECRET)
    },
    {
        .kdfType = OHTEST_KDF_X963, .algoName = "X963KDF|SHA256", .keySize = 128,
        .params.x963Params = {
            .key = const_cast<uint8_t*>(X963SHA256KEY), .keyLen = sizeof(X963SHA256KEY),
            .info = const_cast<uint8_t*>(X963SHA256INFO), .infoLen = sizeof(X963SHA256INFO),
        },
        .expectSecret = const_cast<uint8_t*>(X963_SHA256_EXPECT_SECRET)
    },
    {
        .kdfType = OHTEST_KDF_X963, .algoName = "X963KDF|SHA384", .keySize = 128,
        .params.x963Params = {
            .key = const_cast<uint8_t*>(X963SHA384KEY), .keyLen = sizeof(X963SHA384KEY),
            .info = const_cast<uint8_t*>(X963_SHA384_INFO), .infoLen = sizeof(X963_SHA384_INFO),
        },
        .expectSecret = const_cast<uint8_t*>(X963_SHA384_EXPECT_SECRET)
    },
    {
        .kdfType = OHTEST_KDF_X963, .algoName = "X963KDF|SHA512", .keySize = 128,
        .params.x963Params = {
            .key = const_cast<uint8_t*>(X963_SHA512_KEY), .keyLen = sizeof(X963_SHA512_KEY),
            .info = const_cast<uint8_t*>(X963_SHA512_INFO), .infoLen = sizeof(X963_SHA512_INFO),
        },
        .expectSecret = const_cast<uint8_t*>(X963_SHA512_EXPECT_SECRET)
    },
    {
        .kdfType = OHTEST_KDF_X963, .algoName = "X963KDF|SHA1", .keySize = 16,
        .params.x963Params = {
            .key = const_cast<uint8_t*>(X963_SHA1_KEY2), .keyLen = sizeof(X963_SHA1_KEY2),
            .info = nullptr, .infoLen = 0,
        },
        .expectSecret = const_cast<uint8_t*>(X963_SHA1_EXPECT_SECRET2)
    },
    {
        .kdfType = OHTEST_KDF_X963, .algoName = "X963KDF|SHA224", .keySize = 16,
        .params.x963Params = {
            .key = const_cast<uint8_t*>(X963_SHA224_KEY2), .keyLen = sizeof(X963_SHA224_KEY2),
            .info = nullptr, .infoLen = 0,
        },
        .expectSecret = const_cast<uint8_t*>(X963_SHA224_EXPECT_SECRET2)
    },
    {
        .kdfType = OHTEST_KDF_X963, .algoName = "X963KDF|SHA256", .keySize = 16,
        .params.x963Params = {
            .key = const_cast<uint8_t*>(X963_SHA256_KEY2), .keyLen = sizeof(X963_SHA256_KEY2),
            .info = nullptr, .infoLen = 0,
        },
        .expectSecret = const_cast<uint8_t*>(X963_SHA256_EXPECT_SECRET2)
    },
    {
        .kdfType = OHTEST_KDF_X963, .algoName = "X963KDF|SHA384", .keySize = 16,
        .params.x963Params = {
            .key = const_cast<uint8_t*>(X963SHA384KEY2), .keyLen = sizeof(X963SHA384KEY2),
            .info = nullptr, .infoLen = 0,
        },
        .expectSecret = const_cast<uint8_t*>(X963_SHA384_EXPECT_SECRET2)
    },
    {
        .kdfType = OHTEST_KDF_X963, .algoName = "X963KDF|SHA512", .keySize = 16,
        .params.x963Params = {
            .key = const_cast<uint8_t*>(X963SHA512KEY2), .keyLen = sizeof(X963SHA512KEY2),
            .info = nullptr, .infoLen = 0,
        },
        .expectSecret = const_cast<uint8_t*>(X963_SHA512_EXPECT_SECRET2)
    },
};

int SubCryptoFrameworkNapiKdfVectorTest0100()
{
    const int vectorSpecCount = sizeof(g_vectors) / sizeof(g_vectors[0]);
    for (int i = 0; i < vectorSpecCount; i++) {
        KdfVectorSpec infoSpec = g_vectors[i];
        KdfType kdfType = infoSpec.kdfType;
        const char *algoName = infoSpec.algoName;
        int keySize = infoSpec.keySize;
        OH_CryptoKdfParams *params = nullptr;
        OH_CryptoKdf *ctx = nullptr;
        Crypto_DataBlob key = {.data = nullptr, .len = 0};

        switch (kdfType) {
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
    return 0;
}

int SubCryptoFrameworkNapiKdfTest1300()
{
    KdfSpec infoSpec = {
        .kdfType = OHTEST_KDF_X963, .algoName = "X963KDF|SHA256", .keySize = 64,
        .params.x963Params = {.key = nullptr,
            .info = reinterpret_cast<uint8_t*>(const_cast<char*>("abcdef"))}
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
    return 0;
}

} // namespace Unittest::CryptoFrameworkKdfNapiTest
