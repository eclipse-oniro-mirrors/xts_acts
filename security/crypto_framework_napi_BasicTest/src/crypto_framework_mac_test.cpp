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

#include "crypto_framework_mac_test.h"
#include "blob.h"
#include "log.h"

#include <gtest/gtest.h>

using namespace testing::ext;
namespace Unittest::CryptoFrameworkMacNapiTest {
class OHCryptoFrameworkMacNapiTest : public testing::Test {
public:
    static void SetUpTestCase(void) {};
    static void TearDownTestCase(void) {};
    void SetUp() {};
    void TearDown() {};
};

class MAC_TEST : public testing::TestWithParam<MacSpec> {
    public:
        static void SetUpTestCase() {};
        static void TearDownTestCase() {};
};

class MAC_VECTOR_TEST : public testing::TestWithParam<VectorMacSpec> {
    public:
        static void SetUpTestCase() {};
        static void TearDownTestCase() {};
};

static OH_Crypto_ErrCode OHTEST_GenSymKey(const char *algName, OH_CryptoSymKey **keyCtx)
{
    OH_CryptoSymKeyGenerator *ctx = nullptr;
    OH_Crypto_ErrCode ret = CRYPTO_SUCCESS;

    ret = OH_CryptoSymKeyGenerator_Create(algName, &ctx);
    if (ret != CRYPTO_SUCCESS) {
        goto EXIT;
    }
    ret = OH_CryptoSymKeyGenerator_Generate(ctx, keyCtx);
    if (ret != CRYPTO_SUCCESS) {
        goto EXIT;
    }

EXIT:
    OH_CryptoSymKeyGenerator_Destroy(ctx);
    return ret;
}

static OH_Crypto_ErrCode OHTEST_CryptoCmac_SetParam(OH_CryptoMac *ctx, const char *cipherName)
{
    OH_Crypto_ErrCode ret = CRYPTO_SUCCESS;
    const Crypto_DataBlob value = {
        .data = (uint8_t *)cipherName,
        .len = strlen(cipherName)
    };

    ret = OH_CryptoMac_SetParam(ctx, CRYPTO_MAC_CIPHER_NAME_STR, &value);

    return ret;
}

static OH_Crypto_ErrCode OHTEST_CryptoHmac_SetParam(OH_CryptoMac *ctx, const char *degistName)
{
    OH_Crypto_ErrCode ret = CRYPTO_SUCCESS;
    const Crypto_DataBlob value = {
        .data = (uint8_t *)degistName,
        .len = strlen(degistName)
    };

    ret = OH_CryptoMac_SetParam(ctx, CRYPTO_MAC_DIGEST_NAME_STR, &value);

    return ret;
}

static OH_Crypto_ErrCode OHTEST_GenRandomMsg(size_t msgLen, Crypto_DataBlob *msgBlob)
{
    OH_CryptoRand *randCtx = nullptr;
    OH_Crypto_ErrCode ret = CRYPTO_SUCCESS;

    ret = OH_CryptoRand_Create(&randCtx);
    if (randCtx != nullptr && ret != CRYPTO_SUCCESS) {
        goto EXIT;
    }
    ret = OH_CryptoRand_GenerateRandom(randCtx, msgLen, msgBlob);

EXIT:
    OH_CryptoRand_Destroy(randCtx);
    return ret;
}

static OH_Crypto_ErrCode OHTEST_DoMac(OH_CryptoMac **ctx, MacSpec macInfo,
    OH_CryptoSymKey *key, Crypto_DataBlob *msgBlob, Crypto_DataBlob *out)
{
    OH_Crypto_ErrCode ret = CRYPTO_SUCCESS;

    ret = OH_CryptoMac_Create(macInfo.type, ctx);
    if (ret != CRYPTO_SUCCESS) {
        goto EXIT;
    }
    if (strcmp(macInfo.type, "CMAC") == 0) {
        ret = OHTEST_CryptoCmac_SetParam(*ctx, macInfo.paramType.cipherName);
    } else {
        ret = OHTEST_CryptoHmac_SetParam(*ctx, macInfo.paramType.degistName);
    }
    if (ret != CRYPTO_SUCCESS) {
        goto EXIT;
    }
    if ((OH_CryptoMac_Init(*ctx, key) != CRYPTO_SUCCESS)
        || (OH_CryptoMac_Update(*ctx, msgBlob) != CRYPTO_SUCCESS)
        || (OH_CryptoMac_Final(*ctx, out) != CRYPTO_SUCCESS)) {
        ret = CRYPTO_OPERTION_ERROR;
        goto EXIT;
    }

EXIT:
    return ret;
}

static OH_Crypto_ErrCode OHTEST_DoSegmentMac(OH_CryptoMac **ctx,
    MacSpec macInfo, OH_CryptoSymKey *key, int blockSize, Crypto_DataBlob *msgBlob, Crypto_DataBlob *out)
{
    OH_Crypto_ErrCode ret = CRYPTO_SUCCESS;
    int quotient = msgBlob->len / blockSize;
    int remainder = msgBlob->len % blockSize;
    uint8_t *data = msgBlob->data;
    size_t msgLen = msgBlob->len;
    Crypto_DataBlob *dataBlob = msgBlob;

    ret = OH_CryptoMac_Create(macInfo.type, ctx);
    if (ret != CRYPTO_SUCCESS) {
        goto EXIT;
    }
    if (strcmp(macInfo.type, "CMAC") == 0) {
        ret = OHTEST_CryptoCmac_SetParam(*ctx, macInfo.paramType.cipherName);
    } else {
        ret = OHTEST_CryptoHmac_SetParam(*ctx, macInfo.paramType.degistName);
    }
    if (ret != CRYPTO_SUCCESS) {
        goto EXIT;
    }
    ret = OH_CryptoMac_Init(*ctx, key);
    if (ret != CRYPTO_SUCCESS) {
        goto EXIT;
    }
    for (int i = 0; i < quotient; i++) {
        dataBlob->len = blockSize;
        ret = OH_CryptoMac_Update(*ctx, dataBlob);
        if (ret != CRYPTO_SUCCESS) {
            goto EXIT;
        }
        dataBlob->data += blockSize;
    }
    if (remainder) {
        dataBlob->len = remainder;
        ret = OH_CryptoMac_Update(*ctx, dataBlob);
        if (ret != CRYPTO_SUCCESS) {
            goto EXIT;
        }
    }
    ret = OH_CryptoMac_Final(*ctx, out);

EXIT:
    dataBlob->data = data;
    dataBlob->len = msgLen; 
    return ret;
}

MacSpec g_macSpec[] = {
    /* HMAC */
    {.type = OHTEST_MAC_HMAC, .algoKeyName = "HMAC|SHA1", .paramType.degistName = "SHA1"},
    {.type = OHTEST_MAC_HMAC, .algoKeyName = "HMAC|SHA224", .paramType.degistName = "SHA224"},
    {.type = OHTEST_MAC_HMAC, .algoKeyName = "HMAC|SHA256", .paramType.degistName = "SHA256"},
    {.type = OHTEST_MAC_HMAC, .algoKeyName = "HMAC|SHA384", .paramType.degistName = "SHA384"},
    {.type = OHTEST_MAC_HMAC, .algoKeyName = "HMAC|SHA512", .paramType.degistName = "SHA512"},
    {.type = OHTEST_MAC_HMAC, .algoKeyName = "HMAC|SM3", .paramType.degistName = "SM3"},
    {.type = OHTEST_MAC_HMAC, .algoKeyName = "HMAC|MD5", .paramType.degistName = "MD5"},
    {.type = OHTEST_MAC_HMAC, .algoKeyName = "AES256", .paramType.degistName = "SHA256"},
    {.type = OHTEST_MAC_HMAC, .algoKeyName = "AES128", .paramType.degistName = "SHA256"},
    /* CMAC */
    {.type = OHTEST_MAC_CMAC, .algoKeyName = "AES128", .paramType.cipherName = "AES128"},
    {.type = OHTEST_MAC_CMAC, .algoKeyName = "AES256", .paramType.cipherName = "AES256"},
    {.type = OHTEST_MAC_CMAC, .algoKeyName = "HMAC|SHA256", .paramType.cipherName = "AES256"},
    {.type = OHTEST_MAC_CMAC, .algoKeyName = "HMAC|MD5", .paramType.cipherName = "AES128"},
};
INSTANTIATE_TEST_CASE_P(OHCryptoFrameworkMacNapiTest, MAC_TEST, ::testing::ValuesIn(g_macSpec));

HWTEST_P(MAC_TEST, SUB_Security_CryptoFramework_NAPI_Mac_Test_0100, TestSize.Level0)
{
    MacSpec macInfo = GetParam();
    OH_CryptoSymKey *key = nullptr;
    OH_CryptoMac *ctx = nullptr;
    size_t msgLen = 16;
    Crypto_DataBlob msgBlob = {.data = nullptr, .len = 0};
    Crypto_DataBlob out = {.data = nullptr, .len = 0};
    uint32_t macLength = 0;

    EXPECT_EQ(OHTEST_GenRandomMsg(msgLen, &msgBlob), CRYPTO_SUCCESS);
    EXPECT_TRUE(msgBlob.len == msgLen);
    EXPECT_EQ(OHTEST_GenSymKey(macInfo.algoKeyName, &key), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoMac_Create(macInfo.type, &ctx), CRYPTO_SUCCESS);
    if (strcmp(macInfo.type, "CMAC") == 0) {
        EXPECT_EQ(OHTEST_CryptoCmac_SetParam(ctx, macInfo.paramType.cipherName), CRYPTO_SUCCESS);
    } else {
        EXPECT_EQ(OHTEST_CryptoHmac_SetParam(ctx, macInfo.paramType.degistName), CRYPTO_SUCCESS);
    }
    EXPECT_EQ(OH_CryptoMac_Init(ctx, key), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoMac_Update(ctx, &msgBlob), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoMac_Final(ctx, &out), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoMac_GetLength(ctx, &macLength), CRYPTO_SUCCESS);
    EXPECT_TRUE(out.len == macLength);

    OH_Crypto_FreeDataBlob(&out);
    OH_Crypto_FreeDataBlob(&msgBlob);
    OH_CryptoSymKey_Destroy(key);
    OH_CryptoMac_Destroy(ctx);
}

HWTEST_P(MAC_TEST, SUB_Security_CryptoFramework_NAPI_Mac_Test_0200, TestSize.Level0)
{
    MacSpec macInfo = GetParam();
    OH_CryptoSymKey *key = nullptr;
    OH_CryptoMac *ctx = nullptr;
    size_t msgLen = 64;
    Crypto_DataBlob msgBlob = {.data = nullptr, .len = 0};
    Crypto_DataBlob out1 = {.data = nullptr, .len = 0};
    Crypto_DataBlob out2 = {.data = nullptr, .len = 0};
    uint32_t macLength = 0;
    int blockSize = 30;

    EXPECT_EQ(OHTEST_GenRandomMsg(msgLen, &msgBlob), CRYPTO_SUCCESS);
    EXPECT_TRUE(msgBlob.len == msgLen);
    EXPECT_EQ(OHTEST_GenSymKey(macInfo.algoKeyName, &key), CRYPTO_SUCCESS);
    EXPECT_EQ(OHTEST_DoMac(&ctx, macInfo, key, &msgBlob, &out1), CRYPTO_SUCCESS);
    OH_CryptoMac_Destroy(ctx);
    ctx = nullptr;
    EXPECT_EQ(OHTEST_DoSegmentMac(&ctx, macInfo, key, blockSize, &msgBlob, &out2), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoMac_GetLength(ctx, &macLength), CRYPTO_SUCCESS);
    EXPECT_TRUE(out1.len == macLength);
    EXPECT_TRUE(out1.len == out2.len);
    EXPECT_TRUE(memcmp(out2.data, out1.data, out2.len) == 0);

    OH_Crypto_FreeDataBlob(&out1);
    OH_Crypto_FreeDataBlob(&out2);
    OH_Crypto_FreeDataBlob(&msgBlob);
    OH_CryptoSymKey_Destroy(key);
    OH_CryptoMac_Destroy(ctx);
}

/**
 * @tc.name   SUB_Security_CryptoFramework_NAPI_Mac_Test_0300
 * @tc.number SUB_Security_CryptoFramework_NAPI_Mac_Test_0300
 * @tc.desc   algorithm is Mac
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(OHCryptoFrameworkMacNapiTest, SUB_Security_CryptoFramework_NAPI_Mac_Test_0300, TestSize.Level0)
{
    OH_CryptoMac *ctx = nullptr;
    const Crypto_DataBlob value = {
        .data = reinterpret_cast<uint8_t *>(const_cast<char *>("SHA256")),
        .len = strlen("SHA256")
    };

    EXPECT_EQ(OH_CryptoMac_Create("CMAC", &ctx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoMac_SetParam(ctx, CRYPTO_MAC_DIGEST_NAME_STR, &value), CRYPTO_PARAMETER_CHECK_FAILED);
    
    OH_CryptoMac_Destroy(ctx);
}

HWTEST_P(MAC_TEST, SUB_Security_CryptoFramework_NAPI_Mac_Test_0400, TestSize.Level0)
{
    MacSpec macInfo = GetParam();
    OH_CryptoSymKey *key = nullptr;
    OH_CryptoMac *ctx = nullptr;
    Crypto_DataBlob out = {.data = nullptr, .len = 0};
    uint32_t macLength = 0;

    EXPECT_EQ(OHTEST_GenSymKey(macInfo.algoKeyName, &key), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoMac_Create(macInfo.type, &ctx), CRYPTO_SUCCESS);
    if (strcmp(macInfo.type, "CMAC") == 0) {
        EXPECT_EQ(OHTEST_CryptoCmac_SetParam(ctx, macInfo.paramType.cipherName), CRYPTO_SUCCESS);
    } else {
        EXPECT_EQ(OHTEST_CryptoHmac_SetParam(ctx, macInfo.paramType.degistName), CRYPTO_SUCCESS);
    }
    EXPECT_EQ(OH_CryptoMac_Init(ctx, key), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoMac_Final(ctx, &out), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoMac_GetLength(ctx, &macLength), CRYPTO_SUCCESS);
    EXPECT_TRUE(out.len == macLength);

    OH_Crypto_FreeDataBlob(&out);
    OH_CryptoSymKey_Destroy(key);
    OH_CryptoMac_Destroy(ctx);
}

/**
 * @tc.name   SUB_Security_CryptoFramework_NAPI_Mac_Test_0500
 * @tc.number SUB_Security_CryptoFramework_NAPI_Mac_Test_0500
 * @tc.desc   algorithm is Mac
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(OHCryptoFrameworkMacNapiTest, SUB_Security_CryptoFramework_NAPI_Mac_Test_0500, TestSize.Level0)
{
    OH_CryptoMac *ctx = nullptr;
    const Crypto_DataBlob value = {
        .data = reinterpret_cast<uint8_t *>(const_cast<char *>("AES128")),
        .len = strlen("AES128")
    };

    EXPECT_EQ(OH_CryptoMac_Create("HMAC", &ctx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoMac_SetParam(ctx, CRYPTO_MAC_CIPHER_NAME_STR, &value), CRYPTO_PARAMETER_CHECK_FAILED);
    
    OH_CryptoMac_Destroy(ctx);
}

/**
 * @tc.name   SUB_Security_CryptoFramework_NAPI_Mac_Test_0600
 * @tc.number SUB_Security_CryptoFramework_NAPI_Mac_Test_0600
 * @tc.desc   algorithm is Mac
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(OHCryptoFrameworkMacNapiTest, SUB_Security_CryptoFramework_NAPI_Mac_Test_0600, TestSize.Level0)
{
    MacSpec macInfo = {.type = OHTEST_MAC_HMAC, .algoKeyName = "HMAC|SHA1", .paramType.degistName = "SHA1"};
    OH_CryptoMac *ctx = nullptr;
    size_t msgLen = 16;
    Crypto_DataBlob msgBlob = {.data = nullptr, .len = 0};
    Crypto_DataBlob out = {.data = nullptr, .len = 0};
    uint32_t macLength = 0;

    EXPECT_EQ(OHTEST_GenRandomMsg(msgLen, &msgBlob), CRYPTO_SUCCESS);
    EXPECT_TRUE(msgBlob.len == msgLen);
    EXPECT_EQ(OH_CryptoMac_Create(macInfo.type, &ctx), CRYPTO_SUCCESS);
    EXPECT_EQ(OHTEST_CryptoHmac_SetParam(ctx, macInfo.paramType.degistName), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoMac_Update(ctx, &msgBlob), CRYPTO_OPERTION_ERROR);
    EXPECT_EQ(OH_CryptoMac_Final(ctx, &out), CRYPTO_OPERTION_ERROR);
    EXPECT_EQ(OH_CryptoMac_GetLength(ctx, &macLength), CRYPTO_SUCCESS);

    OH_Crypto_FreeDataBlob(&out);
    OH_Crypto_FreeDataBlob(&msgBlob);
    OH_CryptoMac_Destroy(ctx);
}

/**
 * @tc.name   SUB_Security_CryptoFramework_NAPI_Mac_Test_0700
 * @tc.number SUB_Security_CryptoFramework_NAPI_Mac_Test_0700
 * @tc.desc   algorithm is Mac
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(OHCryptoFrameworkMacNapiTest, SUB_Security_CryptoFramework_NAPI_Mac_Test_0700, TestSize.Level0)
{
    MacSpec macInfo = {.type = OHTEST_MAC_CMAC, .algoKeyName = "AES128", .paramType.cipherName = "AES128"};
    OH_CryptoMac *ctx = nullptr;
    size_t msgLen = 16;
    Crypto_DataBlob msgBlob = {.data = nullptr, .len = 0};
    Crypto_DataBlob out = {.data = nullptr, .len = 0};

    EXPECT_EQ(OHTEST_GenRandomMsg(msgLen, &msgBlob), CRYPTO_SUCCESS);
    EXPECT_TRUE(msgBlob.len == msgLen);
    EXPECT_EQ(OH_CryptoMac_Create(macInfo.type, &ctx), CRYPTO_SUCCESS);
    EXPECT_EQ(OHTEST_CryptoCmac_SetParam(ctx, macInfo.paramType.cipherName), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoMac_Update(ctx, &msgBlob), CRYPTO_OPERTION_ERROR);
    // Final、GetLength: openssl 原生接口也会出现crash

    OH_Crypto_FreeDataBlob(&out);
    OH_Crypto_FreeDataBlob(&msgBlob);
    OH_CryptoMac_Destroy(ctx);
}

/**
 * @tc.name   SUB_Security_CryptoFramework_NAPI_Mac_Test_0800
 * @tc.number SUB_Security_CryptoFramework_NAPI_Mac_Test_0800
 * @tc.desc   algorithm is Mac
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(OHCryptoFrameworkMacNapiTest, SUB_Security_CryptoFramework_NAPI_Mac_Test_0800, TestSize.Level0)
{
    MacSpec macInfo = {.type = OHTEST_MAC_CMAC, .algoKeyName = "AES128", .paramType.cipherName = "AES128"};
    OH_CryptoSymKey *key = nullptr;
    OH_CryptoMac *ctx = nullptr;

    EXPECT_EQ(OHTEST_GenSymKey(macInfo.algoKeyName, &key), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoMac_Create(macInfo.type, &ctx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoMac_Init(ctx, key), CRYPTO_PARAMETER_CHECK_FAILED);

    OH_CryptoSymKey_Destroy(key);
    OH_CryptoMac_Destroy(ctx);
}

/**
 * @tc.name   SUB_Security_CryptoFramework_NAPI_Mac_Test_0900
 * @tc.number SUB_Security_CryptoFramework_NAPI_Mac_Test_0900
 * @tc.desc   algorithm is Mac
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST_F(OHCryptoFrameworkMacNapiTest, SUB_Security_CryptoFramework_NAPI_Mac_Test_0900, TestSize.Level0)
{
    MacSpec macInfo = {.type = OHTEST_MAC_HMAC, .algoKeyName = "HMAC|SHA1", .paramType.degistName = "SHA1"};
    OH_CryptoSymKey *key = nullptr;
    OH_CryptoMac *ctx = nullptr;

    EXPECT_EQ(OHTEST_GenSymKey(macInfo.algoKeyName, &key), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoMac_Create(macInfo.type, &ctx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoMac_Init(ctx, key), CRYPTO_PARAMETER_CHECK_FAILED);

    OH_CryptoSymKey_Destroy(key);
    OH_CryptoMac_Destroy(ctx);
}

static VectorMacSpec g_vectors[] = {
    {
        .macType = "CMAC",
        .vectorSource = "RFC4493",
        .algoName = "AES128",
        .key = {
            0x2b, 0x7e, 0x15, 0x16, 0x28, 0xae, 0xd2, 0xa6, 0xab, 0xf7, 0x15, 0x88, 0x09, 0xcf, 0x4f, 0x3c
        },
        .keyLen = 16,
        .msg = {0},
        .msgLen = 0,
        .expectMac = {
            0xbb, 0x1d, 0x69, 0x29, 0xe9, 0x59, 0x37, 0x28, 0x7f, 0xa3, 0x7d, 0x12, 0x9b, 0x75, 0x67, 0x46
        },
        .macLen = 16
    },
    {
        .macType = "CMAC",
        .vectorSource = "RFC4493",
        .algoName = "AES128",
        .key = {
            0x2b, 0x7e, 0x15, 0x16, 0x28, 0xae, 0xd2, 0xa6, 0xab, 0xf7, 0x15, 0x88, 0x09, 0xcf, 0x4f, 0x3c
        },
        .keyLen = 16,
        .msg = {
            0x6b, 0xc1, 0xbe, 0xe2, 0x2e, 0x40, 0x9f, 0x96, 0xe9, 0x3d, 0x7e, 0x11, 0x73, 0x93, 0x17, 0x2a
        },
        .msgLen = 16,
        .expectMac = {
            0x07, 0x0a, 0x16, 0xb4, 0x6b, 0x4d, 0x41, 0x44, 0xf7, 0x9b, 0xdd, 0x9d, 0xd0, 0x4a, 0x28, 0x7c
        },
        .macLen = 16
    },
    {
        .macType = "CMAC",
        .vectorSource = "nistspecialpublication800-38b.pdf",
        .algoName = "AES256",
        .key = {
            0x60, 0x3d, 0xeb, 0x10, 0x15, 0xca, 0x71, 0xbe, 0x2b, 0x73, 0xae, 0xf0, 0x85, 0x7d, 0x77, 0x81,
            0x1f, 0x35, 0x2c, 0x07, 0x3b, 0x61, 0x08, 0xd7, 0x2d, 0x98, 0x10, 0xa3, 0x09, 0x14, 0xdf, 0xf4
        },
        .keyLen = 32,
        .msg = {
            0x6b, 0xc1, 0xbe, 0xe2, 0x2e, 0x40, 0x9f, 0x96, 0xe9, 0x3d, 0x7e, 0x11, 0x73, 0x93, 0x17, 0x2a
        },
        .msgLen = 16,
        .expectMac = {
            0x28, 0xa7, 0x02, 0x3f, 0x45, 0x2e, 0x8f, 0x82, 0xbd, 0x4b, 0xf2, 0x8d, 0x8c, 0x37, 0xc3, 0x5c
        },
        .macLen = 16
    },
    {
        .macType = "HMAC",
        .vectorSource = "RFC2104",
        .algoName = "MD5",
        .key = {
            0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b
        },
        .keyLen = 16,
        .msg = {
            0x48, 0x69, 0x20, 0x54, 0x68, 0x65, 0x72, 0x65
        },
        .msgLen = strlen("Hi There"),
        .expectMac = {
            0x92, 0x94, 0x72, 0x7a, 0x36, 0x38, 0xbb, 0x1c, 0x13, 0xf4, 0x8e, 0xf8, 0x15, 0x8b, 0xfc, 0x9d
        },
        .macLen = 16
    },
    {
        .macType = "HMAC",
        .vectorSource = "RFC2202",
        .algoName = "SHA1",
        .key = {
            0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b,
            0x0b, 0x0b, 0x0b, 0x0b
        },
        .keyLen = 20,
        .msg = {
            0x48, 0x69, 0x20, 0x54, 0x68, 0x65, 0x72, 0x65
        },
        .msgLen = strlen("Hi There"),
        .expectMac = {
            0xb6, 0x17, 0x31, 0x86, 0x55, 0x05, 0x72, 0x64, 0xe2, 0x8b, 0xc0, 0xb6, 0xfb, 0x37, 0x8c, 0x8e,
            0xf1, 0x46, 0xbe, 0x00
        },
        .macLen = 20
    },
    {
        .macType = "HMAC",
        .vectorSource = "RFC6234",
        .algoName = "SHA224",
        .key = {
            0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b,
            0x0b, 0x0b, 0x0b, 0x0b
        },
        .keyLen = 20,
        .msg = {
            0x48, 0x69, 0x20, 0x54, 0x68, 0x65, 0x72, 0x65
        },
        .msgLen = strlen("Hi There"),
        .expectMac = {
            0x89, 0x6F, 0xB1, 0x12, 0x8A, 0xBB, 0xDF, 0x19, 0x68, 0x32, 0x10, 0x7C, 0xD4, 0x9D, 0xF3, 0x3F,
            0x47, 0xB4, 0xB1, 0x16, 0x99, 0x12, 0xBA, 0x4F, 0x53, 0x68, 0x4B, 0x22
        },
        .macLen = 28
    },
    {
        .macType = "HMAC",
        .vectorSource = "RFC6234",
        .algoName = "SHA256",
        .key = {
            0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b,
            0x0b, 0x0b, 0x0b, 0x0b
        },
        .keyLen = 20,
        .msg = {
            0x48, 0x69, 0x20, 0x54, 0x68, 0x65, 0x72, 0x65
        },
        .msgLen = strlen("Hi There"),
        .expectMac = {
            0xB0, 0x34, 0x4C, 0x61, 0xD8, 0xDB, 0x38, 0x53, 0x5C, 0xA8, 0xAF, 0xCE, 0xAF, 0x0B, 0xF1, 0x2B,
            0x88, 0x1D, 0xC2, 0x00, 0xC9, 0x83, 0x3D, 0xA7, 0x26, 0xE9, 0x37, 0x6C, 0x2E, 0x32, 0xCF, 0xF7
        },
        .macLen = 32
    },
    {
        .macType = "HMAC",
        .vectorSource = "RFC6234",
        .algoName = "SHA384",
        .key = {
            0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b,
            0x0b, 0x0b, 0x0b, 0x0b
        },
        .keyLen = 20,
        .msg = {
            0x48, 0x69, 0x20, 0x54, 0x68, 0x65, 0x72, 0x65
        },
        .msgLen = strlen("Hi There"),
        .expectMac = {
            0xAF, 0xD0, 0x39, 0x44, 0xD8, 0x48, 0x95, 0x62, 0x6B, 0x08, 0x25, 0xF4, 0xAB, 0x46, 0x90, 0x7F,
            0x15, 0xF9, 0xDA, 0xDB, 0xE4, 0x10, 0x1E, 0xC6, 0x82, 0xAA, 0x03, 0x4C, 0x7C, 0xEB, 0xC5, 0x9C,
            0xFA, 0xEA, 0x9E, 0xA9, 0x07, 0x6E, 0xDE, 0x7F, 0x4A, 0xF1, 0x52, 0xE8, 0xB2, 0xFA, 0x9C, 0xB6
        },
        .macLen = 48
    },
    {
        .macType = "HMAC",
        .vectorSource = "RFC6234",
        .algoName = "SHA512",
        .key = {
            0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b,
            0x0b, 0x0b, 0x0b, 0x0b
        },
        .keyLen = 20,
        .msg = {
            0x48, 0x69, 0x20, 0x54, 0x68, 0x65, 0x72, 0x65
        },
        .msgLen = strlen("Hi There"),
        .expectMac = {
            0x87, 0xAA, 0x7C, 0xDE, 0xA5, 0xEF, 0x61, 0x9D, 0x4F, 0xF0, 0xB4, 0x24, 0x1A, 0x1D, 0x6C, 0xB0,
            0x23, 0x79, 0xF4, 0xE2, 0xCE, 0x4E, 0xC2, 0x78, 0x7A, 0xD0, 0xB3, 0x05, 0x45, 0xE1, 0x7C, 0xDE,
            0xDA, 0xA8, 0x33, 0xB7, 0xD6, 0xB8, 0xA7, 0x02, 0x03, 0x8B, 0x27, 0x4E, 0xAE, 0xA3, 0xF4, 0xE4,
            0xBE, 0x9D, 0x91, 0x4E, 0xEB, 0x61, 0xF1, 0x70, 0x2E, 0x69, 0x6C, 0x20, 0x3A, 0x12, 0x68, 0x54
        },
        .macLen = 64
    },
    {
        .macType = "HMAC",
        .vectorSource = "HiTLS",
        .algoName = "SM3",
        .key = {
            0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b, 0x0b,
            0x0b, 0x0b, 0x0b, 0x0b
        },
        .keyLen = 20,
        .msg = {
            0x48, 0x69, 0x20, 0x54, 0x68, 0x65, 0x72, 0x65
        },
        .msgLen = strlen("Hi There"),
        .expectMac = {
            0x51, 0xb0, 0x0d, 0x1f, 0xb4, 0x98, 0x32, 0xbf, 0xb0, 0x1c, 0x3c, 0xe2, 0x78, 0x48, 0xe5, 0x9f,
            0x87, 0x1d, 0x9b, 0xa9, 0x38, 0xdc, 0x56, 0x3b, 0x33, 0x8c, 0xa9, 0x64, 0x75, 0x5c, 0xce, 0x70
        },
        .macLen = 32
    },
};
INSTANTIATE_TEST_CASE_P(OHCryptoFrameworkMacNapiTest, MAC_VECTOR_TEST, ::testing::ValuesIn(g_vectors));

HWTEST_P(MAC_VECTOR_TEST, SUB_Security_CryptoFramework_NAPI_Mac_Vector_Test_0100, TestSize.Level0)
{
    VectorMacSpec macInfo = GetParam();
    OH_CryptoSymKey *key = nullptr;
    OH_CryptoMac *macCtx = nullptr;
    Crypto_DataBlob out = {.data = nullptr, .len = 0};
    uint32_t macLength = 0;
    OH_CryptoSymKeyGenerator *ctx = nullptr;
    Crypto_DataBlob symKey = {
        .data = macInfo.key,
        .len = macInfo.keyLen
    };
    if (memcmp((const char *)macInfo.macType, "HMAC", strlen("HMAC")) == 0) {
        EXPECT_EQ(OH_CryptoSymKeyGenerator_Create(macInfo.macType, &ctx), CRYPTO_SUCCESS);
    } else {
        EXPECT_EQ(OH_CryptoSymKeyGenerator_Create(macInfo.algoName, &ctx), CRYPTO_SUCCESS);
    }
    EXPECT_EQ(OH_CryptoSymKeyGenerator_Convert(ctx, &symKey, &key), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoMac_Create(macInfo.macType, &macCtx), CRYPTO_SUCCESS);
    if (memcmp((const char *)macInfo.macType, "HMAC", strlen("HMAC")) == 0) {
        EXPECT_EQ(OHTEST_CryptoHmac_SetParam(macCtx, macInfo.algoName), CRYPTO_SUCCESS);
    } else {
        EXPECT_EQ(OHTEST_CryptoCmac_SetParam(macCtx, macInfo.algoName), CRYPTO_SUCCESS);
    }
    EXPECT_EQ(OH_CryptoMac_Init(macCtx, key), CRYPTO_SUCCESS);
    if (macInfo.msgLen != 0) {
        Crypto_DataBlob msgBlob = {.data = macInfo.msg, .len = macInfo.msgLen};
        EXPECT_EQ(OH_CryptoMac_Update(macCtx, &msgBlob), CRYPTO_SUCCESS);
    }
    EXPECT_EQ(OH_CryptoMac_Final(macCtx, &out), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoMac_GetLength(macCtx, &macLength), CRYPTO_SUCCESS);
    if (out.len == macInfo.macLen) {
        EXPECT_TRUE(memcmp(out.data, macInfo.expectMac, out.len) == 0);
    }
    EXPECT_TRUE(out.len == macLength);
    EXPECT_TRUE(out.len == macInfo.macLen);

    OH_Crypto_FreeDataBlob(&out);
    OH_CryptoSymKey_Destroy(key);
    OH_CryptoMac_Destroy(macCtx);
    OH_CryptoSymKeyGenerator_Destroy(ctx);
}

} // namespace Unittest::CryptoFrameworkMacNapiTest