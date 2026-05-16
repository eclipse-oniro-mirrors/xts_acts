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
#include <cstdbool>
#include <hilog/log.h>
#include "include/CryptoFrameworkSignatureTest.h"
#include "include/CommonToolTest.h"
#include "include/Result.h"
#include <CryptoArchitectureKit/crypto_rand.h>

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0x0000
#define LOG_TAG "ActsCryptoFrameworkNapiBasicTestTag"

#define OH_CRYPTO_SIGN_TEST_DATA_SIZE 200

namespace Unittest::CryptoFramework {

const int VALUE_3 = 3;
const int VALUE_4 = 4;
const int VALUE_16 = 16;
const int VALUE_20 = 20;
const int VALUE_30 = 30;
const uint8_t VALUE_0 = 0;
const int32_t MSGLEN_16 = 16;
const int32_t MSGLEN_65 = 65;
const int32_t NONE = -1;

class OHCryptoFrameworkSignatureNapiTest {
public:
    static void SetUpTestCase(void);
    static void TearDownTestCase(void);
    void SetUp();
    void TearDown();
};

void OHCryptoFrameworkSignatureNapiTest::SetUpTestCase(void)
{
}

void OHCryptoFrameworkSignatureNapiTest::TearDownTestCase(void)
{
}

void OHCryptoFrameworkSignatureNapiTest::SetUp()
{
}

void OHCryptoFrameworkSignatureNapiTest::TearDown()
{
}

AsymSignSpec g_signOtherData[] = {
    /* SM2 */
    {reinterpret_cast<uint8_t*>(const_cast<char*>("SM2_256|SM3")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SM2_256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SM3")), 62},      // 0
    {reinterpret_cast<uint8_t*>(const_cast<char*>("SM2|SM3")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SM2_256")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("SM3")), 62},          // 1
    /* Ed25519 */
    {reinterpret_cast<uint8_t*>(const_cast<char*>("Ed25519")),
        reinterpret_cast<uint8_t*>(const_cast<char*>("Ed25519")), nullptr, 62},                   // 2
};

class SIGNATURE_RSA_PKCS1_TEST {
    public:
        static void SetUpTestCase() {}
        static void TearDownTestCase() {}
};

class SIGNATURE_RSA_PSS_TEST {
    public:
        static void SetUpTestCase() {}
        static void TearDownTestCase() {}
};

class SIGNATURE_RSA_ONLYSIGN_TEST {
    public:
        static void SetUpTestCase() {}
        static void TearDownTestCase() {}
};

class SIGNATURE_DSA_TEST {
    public:
        static void SetUpTestCase() {}
        static void TearDownTestCase() {}
};

class SIGNATURE_ECDSA_TEST {
    public:
        static void SetUpTestCase() {}
        static void TearDownTestCase() {}
};

class SIGNATURE_SM2_ED25519_TEST {
    public:
        static void SetUpTestCase() {}
        static void TearDownTestCase() {}
};

static OH_Crypto_ErrCode OHTEST_DoNoSegmentSign(const char *algoName,
    OH_CryptoPrivKey *privKey, Crypto_DataBlob *msgBlob,
    Crypto_DataBlob *signData)
{
    OH_CryptoSign *sign = nullptr;
    OH_Crypto_ErrCode ret = CRYPTO_SUCCESS;

    ret = OH_CryptoSign_Create(algoName, &sign);
    if (ret != CRYPTO_SUCCESS) {
        goto EXIT;
    }
    ret = OH_CryptoSign_Init(sign, privKey);
    if (ret != CRYPTO_SUCCESS) {
        goto EXIT;
    }
    ret = OH_CryptoSign_Final(sign, msgBlob, signData);
    if (ret != CRYPTO_SUCCESS) {
        goto EXIT;
    } else {
        const char *signName = OH_CryptoSign_GetAlgoName(sign);
        EXPECT_TRUE(signName != nullptr);
    }

EXIT:
    OH_CryptoSign_Destroy(sign);
    return ret;
}

static OH_Crypto_ErrCode OHTEST_DoSegmentSign(const char *algoName,
    OH_CryptoPrivKey *privKey, Crypto_DataBlob *msgBlob,
    Crypto_DataBlob *signData, int blockSize)
{
    OH_CryptoSign *sign = nullptr;
    OH_Crypto_ErrCode ret = CRYPTO_SUCCESS;

    if (blockSize == 0) {
        // block size must be greater than 0
        ret = CRYPTO_INVALID_PARAMS;
        return ret;
    }
    int quotient = msgBlob->len / blockSize;
    int remainder = msgBlob->len % blockSize;
    uint8_t *data = msgBlob->data;
    size_t len = msgBlob->len;
    Crypto_DataBlob *dataBlob = msgBlob;

    ret = OH_CryptoSign_Create(algoName, &sign);
    if (ret != CRYPTO_SUCCESS) {
        goto EXIT;
    }
    ret = OH_CryptoSign_Init(sign, privKey);
    if (ret != CRYPTO_SUCCESS) {
        goto EXIT;
    }
    for (int i = 0; i < quotient; i++) {
        dataBlob->len = blockSize;
        ret = OH_CryptoSign_Update(sign, dataBlob);
        if (ret != CRYPTO_SUCCESS) {
            goto EXIT;
        }
        dataBlob->data += blockSize;
    }
    dataBlob->len = remainder;
    ret = OH_CryptoSign_Final(sign, dataBlob, signData);
    if (ret != CRYPTO_SUCCESS) {
        goto EXIT;
    }

EXIT:
    dataBlob->data = data;
    dataBlob->len = len;
    OH_CryptoSign_Destroy(sign);
    return ret;
}

static bool OHTEST_DoVerify(const char *algoName, OH_CryptoPubKey *pubKey,
    Crypto_DataBlob *msgBlob, Crypto_DataBlob *signData)
{
    OH_CryptoVerify *verify = nullptr;
    OH_Crypto_ErrCode ret = CRYPTO_SUCCESS;
    bool res = false;

    ret = OH_CryptoVerify_Create(algoName, &verify);
    if (ret != CRYPTO_SUCCESS) {
        goto EXIT;
    }
    ret = OH_CryptoVerify_Init(verify, pubKey);
    if (ret != CRYPTO_SUCCESS) {
        goto EXIT;
    }
    res = OH_CryptoVerify_Final(verify, msgBlob, signData);

EXIT:
    OH_CryptoVerify_Destroy(verify);
    return res;
}

static OH_Crypto_ErrCode OHTEST_DoRecover(const char *algoName, OH_CryptoPubKey *pubKey,
    Crypto_DataBlob *signData, Crypto_DataBlob *rawBlob)
{
    OH_CryptoVerify *recover = nullptr;
    OH_Crypto_ErrCode ret = CRYPTO_SUCCESS;

    ret = OH_CryptoVerify_Create(algoName, &recover);
    if (ret != CRYPTO_SUCCESS) {
        goto EXIT;
    }
    ret = OH_CryptoVerify_Init(recover, pubKey);
    if (ret != CRYPTO_SUCCESS) {
        goto EXIT;
    }
    ret = OH_CryptoVerify_Recover(recover, signData, rawBlob);

EXIT:
    OH_CryptoVerify_Destroy(recover);
    return ret;
}

static bool OHTEST_DoSegmentVerify(const char *algoName,
    OH_CryptoPubKey *pubKey, Crypto_DataBlob *msgBlob,
    Crypto_DataBlob *signData, int blockSize)
{
    OH_CryptoVerify *verify = nullptr;
    OH_Crypto_ErrCode ret = CRYPTO_SUCCESS;
    bool res = false;
    if (blockSize == 0) {
        // block size must be greater than 0
        ret = CRYPTO_INVALID_PARAMS;
        return ret;
    }
    int quotient = msgBlob->len / blockSize;
    int remainder = msgBlob->len % blockSize;
    Crypto_DataBlob *dataBlob = msgBlob;
    uint8_t *data = msgBlob->data;
    size_t len = msgBlob->len;

    ret = OH_CryptoVerify_Create(algoName, &verify);
    if (ret != CRYPTO_SUCCESS) {
        goto EXIT;
    }
    ret = OH_CryptoVerify_Init(verify, pubKey);
    if (ret != CRYPTO_SUCCESS) {
        goto EXIT;
    }
    for (int i = 0; i < quotient; i++) {
        dataBlob->len = blockSize;
        ret = OH_CryptoVerify_Update(verify, dataBlob);
        if (ret != CRYPTO_SUCCESS) {
            goto EXIT;
        }
        dataBlob->data += blockSize;
    }
    dataBlob->len = remainder;
    res = OH_CryptoVerify_Final(verify, dataBlob, signData);

EXIT:
    dataBlob->data = data;
    dataBlob->len = len;
    OH_CryptoVerify_Destroy(verify);
    return res;
}

static OH_CryptoKeyPair *OHTEST_GenAsymKey(const char *algoName)
{
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_CryptoAsymKeyGenerator *ctx = nullptr;

    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Create(algoName, &ctx), CRYPTO_SUCCESS);
    if (strcmp(algoName, "RSA8192") == 0) {
        Crypto_DataBlob pubKeyBlob = { .data = g_rsa8192PubKey, .len = sizeof(g_rsa8192PubKey) };
        Crypto_DataBlob priKeyBlob = { .data = g_rsa8192PriKey, .len = sizeof(g_rsa8192PriKey) };
        EXPECT_EQ(OH_CryptoAsymKeyGenerator_Convert(ctx, CRYPTO_DER, &pubKeyBlob,
            &priKeyBlob, &keyPair), CRYPTO_SUCCESS);
    } else if (strcmp(algoName, "RSA4096") == 0) {
        Crypto_DataBlob pubKeyBlob = { .data = g_rsa4096PubKey, .len = sizeof(g_rsa4096PubKey) };
        Crypto_DataBlob priKeyBlob = { .data = g_rsa4096PriKey, .len = sizeof(g_rsa4096PriKey) };
        EXPECT_EQ(OH_CryptoAsymKeyGenerator_Convert(ctx, CRYPTO_DER, &pubKeyBlob,
            &priKeyBlob, &keyPair), CRYPTO_SUCCESS);
    } else if (strcmp(algoName, "RSA3072") == 0) {
        Crypto_DataBlob pubKeyBlob = { .data = g_rsa3072PubKey, .len = sizeof(g_rsa3072PubKey) };
        Crypto_DataBlob priKeyBlob = { .data = g_rsa3072PriKey, .len = sizeof(g_rsa3072PriKey) };
        EXPECT_EQ(OH_CryptoAsymKeyGenerator_Convert(ctx, CRYPTO_DER, &pubKeyBlob,
            &priKeyBlob, &keyPair), CRYPTO_SUCCESS);
    } else {
        EXPECT_EQ(OH_CryptoAsymKeyGenerator_Generate(ctx, &keyPair), CRYPTO_SUCCESS);
    }

    OH_CryptoAsymKeyGenerator_Destroy(ctx);
    return keyPair;
}
    
static bool OHTEST_Sm2SignatureAsn1ToRS(uint8_t *sm2Asn1, size_t len)
{
    bool res = false;
    OH_Crypto_ErrCode ret = CRYPTO_SUCCESS;
    OH_CryptoEccSignatureSpec *spec = nullptr;
    Crypto_DataBlob r = {.data = nullptr, .len = 0};
    Crypto_DataBlob s = {.data = nullptr, .len = 0};
    Crypto_DataBlob out = {.data = nullptr, .len = 0};
    Crypto_DataBlob sm2Signature = {
        .data = sm2Asn1,
        .len = len
    };

    ret = OH_CryptoEccSignatureSpec_Create(&sm2Signature, &spec);
    if (ret != CRYPTO_SUCCESS) {
        goto EXIT;
    }
    ret = OH_CryptoEccSignatureSpec_GetRAndS(spec, &r, &s);
    if (ret != CRYPTO_SUCCESS) {
        goto EXIT;
    }
    OH_CryptoEccSignatureSpec_Destroy(spec);
    spec = nullptr;
    ret = OH_CryptoEccSignatureSpec_Create(nullptr, &spec);
    if (ret != CRYPTO_SUCCESS) {
        goto EXIT;
    }
    ret = OH_CryptoEccSignatureSpec_SetRAndS(spec, &r, &s);
    if (ret != CRYPTO_SUCCESS) {
        goto EXIT;
    }
    ret = OH_CryptoEccSignatureSpec_Encode(spec, &out);
    if (ret != CRYPTO_SUCCESS) {
        goto EXIT;
    }
    res = memcmp(sm2Asn1, out.data, len) == 0 ? (len != out.len ? false : true) : false;

EXIT:
    OH_CryptoEccSignatureSpec_Destroy(spec);
    OH_Crypto_FreeDataBlob(&out);
    OH_Crypto_FreeDataBlob(&r);
    OH_Crypto_FreeDataBlob(&s);
    return res;
}

int SubCryptoFrameworkNapiSignatureTest0100()
{
    const int signSpecCount = SIGN_PKCS1_DATA_COUNT;
    for (int i = 0; i < signSpecCount; i++) {
        SignSpec specInfo = g_signPkcs1Data[i];
        OH_Crypto_ErrCode ret = CRYPTO_SUCCESS;
        OH_CryptoKeyPair *keyPair = nullptr;
        OH_CryptoPrivKey *privKey = nullptr;
        OH_CryptoPubKey *pubKey = nullptr;
        const char *algoName = reinterpret_cast<const char*>(specInfo.algoName);
        const char *asymAlgoName = reinterpret_cast<const char*>(specInfo.asymAlgoName);
        int32_t msgLen = specInfo.msgLen;
        OH_CryptoRand *randomObj = nullptr;
        Crypto_DataBlob msgBlob = {.data = nullptr, .len = 0};
        Crypto_DataBlob signData = {.data = nullptr, .len = 0};

        OH_CryptoRand_Create(&randomObj);
        EXPECT_TRUE(randomObj != nullptr);
        EXPECT_EQ(OH_CryptoRand_GenerateRandom(randomObj, msgLen, &msgBlob), HCF_SUCCESS);
        msgBlob.data[0] = 0;
        keyPair = OHTEST_GenAsymKey(asymAlgoName);
        EXPECT_TRUE(keyPair != nullptr);
        privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
        pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
        EXPECT_TRUE(privKey != nullptr);
        EXPECT_TRUE(pubKey != nullptr);
        ret = OHTEST_DoNoSegmentSign(algoName, privKey, (Crypto_DataBlob *)&msgBlob, &signData);
        EXPECT_EQ(ret, CRYPTO_SUCCESS);
        EXPECT_TRUE(OHTEST_DoVerify(algoName, pubKey, (Crypto_DataBlob *)&msgBlob, &signData));

        OH_CryptoRand_Destroy(randomObj);
        OH_CryptoKeyPair_Destroy(keyPair);
        OH_Crypto_FreeDataBlob(&signData);
        OH_Crypto_FreeDataBlob((Crypto_DataBlob *)&msgBlob);
    }
    return 0;
}

int SubCryptoFrameworkNapiSignatureTest0200()
{
    const int signSpecCount = SIGN_PKCS1_DATA_COUNT;
    for (int i = 0; i < signSpecCount; i++) {
        SignSpec specInfo = g_signPkcs1Data[i];
        OH_Crypto_ErrCode ret = CRYPTO_SUCCESS;
        OH_CryptoKeyPair *keyPair = nullptr;
        OH_CryptoPrivKey *privKey = nullptr;
        OH_CryptoPubKey *pubKey = nullptr;
        const char *algoName = reinterpret_cast<const char*>(specInfo.algoName);
        const char *asymAlgoName = reinterpret_cast<const char*>(specInfo.asymAlgoName);
        int32_t msgLen = specInfo.msgLen;
        OH_CryptoRand *randomObj = nullptr;
        Crypto_DataBlob msgBlob = {.data = nullptr, .len = 0};
        Crypto_DataBlob signData1 = {.data = nullptr, .len = 0};
        Crypto_DataBlob signData2 = {.data = nullptr, .len = 0};
        int blockSize = VALUE_20;

        OH_CryptoRand_Create(&randomObj);
        EXPECT_TRUE(randomObj != nullptr);
        EXPECT_EQ(OH_CryptoRand_GenerateRandom(randomObj, msgLen, &msgBlob), HCF_SUCCESS);
        msgBlob.data[0] = 0;
        keyPair = OHTEST_GenAsymKey(asymAlgoName);
        EXPECT_TRUE(keyPair != nullptr);
        privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
        pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
        EXPECT_TRUE(privKey != nullptr);
        EXPECT_TRUE(pubKey != nullptr);
        ret = OHTEST_DoSegmentSign(algoName, privKey, (Crypto_DataBlob *)&msgBlob, &signData2, blockSize);
        EXPECT_EQ(ret, CRYPTO_SUCCESS);
        ret = OHTEST_DoNoSegmentSign(algoName, privKey, (Crypto_DataBlob *)&msgBlob, &signData1);
        EXPECT_EQ(ret, CRYPTO_SUCCESS);
        EXPECT_TRUE(memcmp(signData1.data, signData2.data, signData1.len) == 0);
        EXPECT_TRUE(signData1.len == signData2.len);
        EXPECT_TRUE(OHTEST_DoSegmentVerify(algoName, pubKey, (Crypto_DataBlob *)&msgBlob, &signData1, blockSize));

        OH_CryptoRand_Destroy(randomObj);
        OH_CryptoKeyPair_Destroy(keyPair);
        OH_Crypto_FreeDataBlob(&signData1);
        OH_Crypto_FreeDataBlob(&signData2);
        OH_Crypto_FreeDataBlob((Crypto_DataBlob *)&msgBlob);
    }
    return 0;
}

int SubCryptoFrameworkNapiSignatureTest0300()
{
    const int signSpecCount = SIGN_PSS_DATA_COUNT;
    for (int i = 0; i < signSpecCount; i++) {
        SignSpec specInfo = g_signPssData[i];
        OH_Crypto_ErrCode ret = CRYPTO_SUCCESS;
        OH_CryptoKeyPair *keyPair = nullptr;
        OH_CryptoPrivKey *privKey = nullptr;
        OH_CryptoPubKey *pubKey = nullptr;
        const char *algoName = reinterpret_cast<const char*>(specInfo.algoName);
        const char *asymAlgoName = reinterpret_cast<const char*>(specInfo.asymAlgoName);
        int32_t msgLen = specInfo.msgLen;
        OH_CryptoRand *randomObj = nullptr;
        Crypto_DataBlob msgBlob = {.data = nullptr, .len = 0};
        Crypto_DataBlob signData = {.data = nullptr, .len = 0};
        OH_CryptoRand_Create(&randomObj);
        EXPECT_TRUE(randomObj != nullptr);
        EXPECT_EQ(OH_CryptoRand_GenerateRandom(randomObj, msgLen, &msgBlob), HCF_SUCCESS);
        msgBlob.data[0] = 0;
        keyPair = OHTEST_GenAsymKey(asymAlgoName);
        EXPECT_TRUE(keyPair != nullptr);
        privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
        pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
        EXPECT_TRUE(privKey != nullptr);
        EXPECT_TRUE(pubKey != nullptr);
        ret = OHTEST_DoNoSegmentSign(algoName, privKey, (Crypto_DataBlob *)&msgBlob, &signData);
        EXPECT_EQ(ret, CRYPTO_SUCCESS);
        EXPECT_TRUE(OHTEST_DoVerify(algoName, pubKey, (Crypto_DataBlob *)&msgBlob, &signData));
        OH_CryptoRand_Destroy(randomObj);
        OH_CryptoKeyPair_Destroy(keyPair);
        OH_Crypto_FreeDataBlob(&signData);
        OH_Crypto_FreeDataBlob((Crypto_DataBlob *)&msgBlob);
    }
    return 0;
}

int SubCryptoFrameworkNapiSignatureTest0400()
{
    const int signSpecCount = SIGN_PSS_DATA_COUNT;
    for (int i = 0; i < signSpecCount; i++) {
        SignSpec specInfo = g_signPssData[i];
        OH_Crypto_ErrCode ret = CRYPTO_SUCCESS;
        OH_CryptoKeyPair *keyPair = nullptr;
        OH_CryptoPrivKey *privKey = nullptr;
        OH_CryptoPubKey *pubKey = nullptr;
        const char *algoName = reinterpret_cast<const char*>(specInfo.algoName);
        const char *asymAlgoName = reinterpret_cast<const char*>(specInfo.asymAlgoName);
        int32_t msgLen = specInfo.msgLen;
        OH_CryptoRand *randomObj = nullptr;
        Crypto_DataBlob msgBlob = {.data = nullptr, .len = 0};
        Crypto_DataBlob signData1 = {.data = nullptr, .len = 0};
        Crypto_DataBlob signData2 = {.data = nullptr, .len = 0};
        int blockSize = VALUE_20;

        OH_CryptoRand_Create(&randomObj);
        EXPECT_TRUE(randomObj != nullptr);
        EXPECT_EQ(OH_CryptoRand_GenerateRandom(randomObj, msgLen, &msgBlob), HCF_SUCCESS);
        msgBlob.data[0] = 0;
        keyPair = OHTEST_GenAsymKey(asymAlgoName);
        EXPECT_TRUE(keyPair != nullptr);
        privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
        pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
        EXPECT_TRUE(privKey != nullptr);
        EXPECT_TRUE(pubKey != nullptr);
        ret = OHTEST_DoSegmentSign(algoName, privKey, (Crypto_DataBlob *)&msgBlob, &signData2, blockSize);
        EXPECT_EQ(ret, CRYPTO_SUCCESS);
        ret = OHTEST_DoNoSegmentSign(algoName, privKey, (Crypto_DataBlob *)&msgBlob, &signData1);
        EXPECT_EQ(ret, CRYPTO_SUCCESS);
        EXPECT_TRUE(signData1.len == signData2.len);
        EXPECT_TRUE(OHTEST_DoSegmentVerify(algoName, pubKey, (Crypto_DataBlob *)&msgBlob, &signData1, blockSize));
        EXPECT_TRUE(OHTEST_DoVerify(algoName, pubKey, (Crypto_DataBlob *)&msgBlob, &signData2));

        OH_CryptoRand_Destroy(randomObj);
        OH_CryptoKeyPair_Destroy(keyPair);
        OH_Crypto_FreeDataBlob(&signData1);
        OH_Crypto_FreeDataBlob(&signData2);
        OH_Crypto_FreeDataBlob((Crypto_DataBlob *)&msgBlob);
    }
    return 0;
}

int SubCryptoFrameworkNapiSignatureTest0500()
{
    const int onlySignSpecCount = ONLY_SIGN_DATA_COUNT;
    for (int i = 0; i < onlySignSpecCount; i++) {
        OnlySignSpec specInfo = g_onlySignData[i];
        OH_Crypto_ErrCode ret = CRYPTO_SUCCESS;
        OH_CryptoKeyPair *keyPair = nullptr;
        OH_CryptoPrivKey *privKey = nullptr;
        OH_CryptoPubKey *pubKey = nullptr;
        const char *signAlgoName = reinterpret_cast<const char*>(specInfo.signAlgoName);
        const char *verifyAlgoName = reinterpret_cast<const char*>(specInfo.verifyAlgoName);
        const char *asymAlgoName = reinterpret_cast<const char*>(specInfo.asymAlgoName);
        int32_t msgLen = specInfo.msgLen;
        OH_CryptoRand *randomObj = nullptr;
        Crypto_DataBlob msgBlob = {.data = nullptr, .len = 0};
        Crypto_DataBlob signData = {.data = nullptr, .len = 0};
        Crypto_DataBlob rawData = {.data = nullptr, .len = 0};

        OH_CryptoRand_Create(&randomObj);
        EXPECT_TRUE(randomObj != nullptr);
        EXPECT_EQ(OH_CryptoRand_GenerateRandom(randomObj, msgLen, &msgBlob), HCF_SUCCESS);
        msgBlob.data[0] = 0;
        keyPair = OHTEST_GenAsymKey(asymAlgoName);
        EXPECT_TRUE(keyPair != nullptr);
        privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
        pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
        EXPECT_TRUE(privKey != nullptr);
        EXPECT_TRUE(pubKey != nullptr);
        ret = OHTEST_DoNoSegmentSign(signAlgoName, privKey, (Crypto_DataBlob *)&msgBlob, &signData);
        EXPECT_EQ(ret, CRYPTO_SUCCESS);
        EXPECT_EQ(OHTEST_DoRecover(verifyAlgoName, pubKey, &signData, &rawData), CRYPTO_SUCCESS);
        EXPECT_TRUE(memcmp(rawData.data, msgBlob.data, msgBlob.len) == 0);
        EXPECT_EQ(msgBlob.len, rawData.len);

        OH_CryptoRand_Destroy(randomObj);
        OH_CryptoKeyPair_Destroy(keyPair);
        OH_Crypto_FreeDataBlob(&signData);
        OH_Crypto_FreeDataBlob(&rawData);
        OH_Crypto_FreeDataBlob((Crypto_DataBlob *)&msgBlob);
    }
    return 0;
}

int SubCryptoFrameworkNapiSignatureTest0600()
{
    const int asymSignSpecCount = DSA_DATA_COUNT;
    for (int i = 0; i < asymSignSpecCount; i++) {
        AsymSignSpec specInfo = g_dsaData[i];
        OH_Crypto_ErrCode ret = CRYPTO_SUCCESS;
        OH_CryptoKeyPair *keyPair = nullptr;
        OH_CryptoPrivKey *privKey = nullptr;
        OH_CryptoPubKey *pubKey = nullptr;
        const char *algoName = reinterpret_cast<const char*>(specInfo.algoName);
        const char *asymAlgoName = reinterpret_cast<const char*>(specInfo.asymAlgoName);
        int32_t msgLen = specInfo.msgLen;
        OH_CryptoRand *randomObj = nullptr;
        Crypto_DataBlob msgBlob = {.data = nullptr, .len = 0};
        Crypto_DataBlob signData = {.data = nullptr, .len = 0};

        OH_CryptoRand_Create(&randomObj);
        EXPECT_TRUE(randomObj != nullptr);
        EXPECT_EQ(OH_CryptoRand_GenerateRandom(randomObj, msgLen, &msgBlob), HCF_SUCCESS);
        msgBlob.data[0] = 0;
        keyPair = OHTEST_GenAsymKey(asymAlgoName);
        EXPECT_TRUE(keyPair != nullptr);
        privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
        pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
        EXPECT_TRUE(privKey != nullptr);
        EXPECT_TRUE(pubKey != nullptr);
        ret = OHTEST_DoNoSegmentSign(algoName, privKey, (Crypto_DataBlob *)&msgBlob, &signData);
        EXPECT_EQ(ret, CRYPTO_SUCCESS);
        EXPECT_TRUE(OHTEST_DoVerify(algoName, pubKey, (Crypto_DataBlob *)&msgBlob, &signData));

        OH_CryptoRand_Destroy(randomObj);
        OH_CryptoKeyPair_Destroy(keyPair);
        OH_Crypto_FreeDataBlob(&signData);
        OH_Crypto_FreeDataBlob((Crypto_DataBlob *)&msgBlob);
    }
    return 0;
}

int SubCryptoFrameworkNapiSignatureTest0700()
{
    const int asymSignSpecCount = DSA_DATA_COUNT;
    for (int i = 0; i < asymSignSpecCount; i++) {
        AsymSignSpec specInfo = g_dsaData[i];
        OH_Crypto_ErrCode ret = CRYPTO_SUCCESS;
        OH_CryptoKeyPair *keyPair = nullptr;
        OH_CryptoPrivKey *privKey = nullptr;
        OH_CryptoPubKey *pubKey = nullptr;
        const char *algoName = reinterpret_cast<const char*>(specInfo.algoName);
        const char *asymAlgoName = reinterpret_cast<const char*>(specInfo.asymAlgoName);
        const char *digestAlgoName = reinterpret_cast<const char*>(specInfo.digestAlgoName);
        int32_t msgLen = specInfo.msgLen;
        OH_CryptoRand *randomObj = nullptr;
        Crypto_DataBlob msgBlob = {.data = nullptr, .len = 0};
        Crypto_DataBlob signData = {.data = nullptr, .len = 0};
        int blockSize = VALUE_20;
        /* NoHash Not Support Update*/
        if (SkipNoHashTest(digestAlgoName)) {
            return 0;
        }

        OH_CryptoRand_Create(&randomObj);
        EXPECT_TRUE(randomObj != nullptr);
        EXPECT_EQ(OH_CryptoRand_GenerateRandom(randomObj, msgLen, &msgBlob), HCF_SUCCESS);
        msgBlob.data[0] = 0;
        keyPair = OHTEST_GenAsymKey(asymAlgoName);
        EXPECT_TRUE(keyPair != nullptr);
        privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
        pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
        EXPECT_TRUE(privKey != nullptr);
        EXPECT_TRUE(pubKey != nullptr);
        ret = OHTEST_DoSegmentSign(algoName, privKey, (Crypto_DataBlob *)&msgBlob, &signData, blockSize);
        EXPECT_EQ(ret, CRYPTO_SUCCESS);
        EXPECT_TRUE(OHTEST_DoVerify(algoName, pubKey, (Crypto_DataBlob *)&msgBlob, &signData));

        OH_CryptoRand_Destroy(randomObj);
        OH_CryptoKeyPair_Destroy(keyPair);
        OH_Crypto_FreeDataBlob(&signData);
        OH_Crypto_FreeDataBlob((Crypto_DataBlob *)&msgBlob);
    }
    return 0;
}

int SubCryptoFrameworkNapiSignatureTest0800()
{
    const int asymSignSpecCount = ECDSA_DATA_COUNT;
    for (int i = 0; i < asymSignSpecCount; i++) {
        AsymSignSpec specInfo = g_ecdsaData[i];
        OH_Crypto_ErrCode ret = CRYPTO_SUCCESS;
        OH_CryptoKeyPair *keyPair = nullptr;
        OH_CryptoPrivKey *privKey = nullptr;
        OH_CryptoPubKey *pubKey = nullptr;
        const char *algoName = reinterpret_cast<const char*>(specInfo.algoName);
        const char *asymAlgoName = reinterpret_cast<const char*>(specInfo.asymAlgoName);
        int32_t msgLen = specInfo.msgLen;
        OH_CryptoRand *randomObj = nullptr;
        Crypto_DataBlob msgBlob = {.data = nullptr, .len = 0};
        Crypto_DataBlob signData = {.data = nullptr, .len = 0};

        OH_CryptoRand_Create(&randomObj);
        EXPECT_TRUE(randomObj != nullptr);
        EXPECT_EQ(OH_CryptoRand_GenerateRandom(randomObj, msgLen, &msgBlob), HCF_SUCCESS);
        msgBlob.data[0] = 0;
        keyPair = OHTEST_GenAsymKey(asymAlgoName);
        EXPECT_TRUE(keyPair != nullptr);
        privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
        pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
        EXPECT_TRUE(privKey != nullptr);
        EXPECT_TRUE(pubKey != nullptr);
        ret = OHTEST_DoNoSegmentSign(algoName, privKey, (Crypto_DataBlob *)&msgBlob, &signData);
        EXPECT_EQ(ret, CRYPTO_SUCCESS);
        EXPECT_TRUE(OHTEST_DoVerify(algoName, pubKey, (Crypto_DataBlob *)&msgBlob, &signData));

        OH_CryptoRand_Destroy(randomObj);
        OH_CryptoKeyPair_Destroy(keyPair);
        OH_Crypto_FreeDataBlob(&signData);
        OH_Crypto_FreeDataBlob((Crypto_DataBlob *)&msgBlob);
    }
    return 0;
}

int SubCryptoFrameworkNapiSignatureTest0900()
{
    const int asymSignSpecCount = ECDSA_DATA_COUNT;
    for (int i = 0; i < asymSignSpecCount; i++) {
        AsymSignSpec specInfo = g_ecdsaData[i];
        OH_Crypto_ErrCode ret = CRYPTO_SUCCESS;
        OH_CryptoKeyPair *keyPair = nullptr;
        OH_CryptoPrivKey *privKey = nullptr;
        OH_CryptoPubKey *pubKey = nullptr;
        const char *algoName = reinterpret_cast<const char*>(specInfo.algoName);
        const char *asymAlgoName = reinterpret_cast<const char*>(specInfo.asymAlgoName);
        int32_t msgLen = specInfo.msgLen;
        OH_CryptoRand *randomObj = nullptr;
        Crypto_DataBlob msgBlob = {.data = nullptr, .len = 0};
        Crypto_DataBlob signData = {.data = nullptr, .len = 0};
        int blockSize = VALUE_20;

        OH_CryptoRand_Create(&randomObj);
        EXPECT_TRUE(randomObj != nullptr);
        EXPECT_EQ(OH_CryptoRand_GenerateRandom(randomObj, msgLen, &msgBlob), HCF_SUCCESS);
        msgBlob.data[0] = 0;
        keyPair = OHTEST_GenAsymKey(asymAlgoName);
        EXPECT_TRUE(keyPair != nullptr);
        privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
        pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
        EXPECT_TRUE(privKey != nullptr);
        EXPECT_TRUE(pubKey != nullptr);
        ret = OHTEST_DoSegmentSign(algoName, privKey, (Crypto_DataBlob *)&msgBlob, &signData, blockSize);
        EXPECT_EQ(ret, CRYPTO_SUCCESS);
        EXPECT_TRUE(OHTEST_DoVerify(algoName, pubKey, (Crypto_DataBlob *)&msgBlob, &signData));

        OH_CryptoRand_Destroy(randomObj);
        OH_CryptoKeyPair_Destroy(keyPair);
        OH_Crypto_FreeDataBlob(&signData);
        OH_Crypto_FreeDataBlob((Crypto_DataBlob *)&msgBlob);
    }
    return 0;
}

int SubCryptoFrameworkNapiSignatureTest1000()
{
    const int asymSignSpecCount = sizeof(g_signOtherData) / sizeof(g_signOtherData[0]);
    for (int i = 0; i < asymSignSpecCount; i++) {
        AsymSignSpec specInfo = g_signOtherData[i];
        OH_Crypto_ErrCode ret = CRYPTO_SUCCESS;
        OH_CryptoKeyPair *keyPair = nullptr;
        OH_CryptoPrivKey *privKey = nullptr;
        OH_CryptoPubKey *pubKey = nullptr;
        const char *algoName = reinterpret_cast<const char*>(specInfo.algoName);
        const char *asymAlgoName = reinterpret_cast<const char*>(specInfo.asymAlgoName);
        int32_t msgLen = specInfo.msgLen;
        OH_CryptoRand *randomObj = nullptr;
        Crypto_DataBlob msgBlob = {.data = nullptr, .len = 0};
        Crypto_DataBlob signData = {.data = nullptr, .len = 0};

        OH_CryptoRand_Create(&randomObj);
        EXPECT_TRUE(randomObj != nullptr);
        EXPECT_EQ(OH_CryptoRand_GenerateRandom(randomObj, msgLen, &msgBlob), HCF_SUCCESS);
        msgBlob.data[0] = 0;
        keyPair = OHTEST_GenAsymKey(asymAlgoName);
        EXPECT_TRUE(keyPair != nullptr);
        privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
        pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
        EXPECT_TRUE(privKey != nullptr);
        EXPECT_TRUE(pubKey != nullptr);
        ret = OHTEST_DoNoSegmentSign(algoName, privKey, (Crypto_DataBlob *)&msgBlob, &signData);
        EXPECT_EQ(ret, CRYPTO_SUCCESS);
        EXPECT_TRUE(OHTEST_DoVerify(algoName, pubKey, (Crypto_DataBlob *)&msgBlob, &signData));
        
        OH_CryptoRand_Destroy(randomObj);
        OH_CryptoKeyPair_Destroy(keyPair);
        OH_Crypto_FreeDataBlob(&signData);
        OH_Crypto_FreeDataBlob((Crypto_DataBlob *)&msgBlob);
    }
    return 0;
}

int SubCryptoFrameworkNapiSignatureTest1100()
{
    const int asymSignSpecCount = sizeof(g_signOtherData) / sizeof(g_signOtherData[0]);
    for (int i = 0; i < asymSignSpecCount; i++) {
        AsymSignSpec specInfo = g_signOtherData[i];
        OH_Crypto_ErrCode ret = CRYPTO_SUCCESS;
        OH_CryptoKeyPair *keyPair = nullptr;
        OH_CryptoPrivKey *privKey = nullptr;
        OH_CryptoPubKey *pubKey = nullptr;
        const char *algoName = reinterpret_cast<const char*>(specInfo.algoName);
        const char *asymAlgoName = reinterpret_cast<const char*>(specInfo.asymAlgoName);
        int32_t msgLen = specInfo.msgLen;
        OH_CryptoRand *randomObj = nullptr;
        Crypto_DataBlob msgBlob = {.data = nullptr, .len = 0};
        Crypto_DataBlob signData = {.data = nullptr, .len = 0};
        int blockSize = VALUE_20;

        if (SkipEd25519Test(asymAlgoName)) {
            return 0;
        }

        OH_CryptoRand_Create(&randomObj);
        EXPECT_TRUE(randomObj != nullptr);
        EXPECT_EQ(OH_CryptoRand_GenerateRandom(randomObj, msgLen, &msgBlob), HCF_SUCCESS);
        msgBlob.data[0] = 0;
        keyPair = OHTEST_GenAsymKey(asymAlgoName);
        EXPECT_TRUE(keyPair != nullptr);
        privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
        pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
        EXPECT_TRUE(privKey != nullptr);
        EXPECT_TRUE(pubKey != nullptr);
        ret = OHTEST_DoSegmentSign(algoName, privKey, (Crypto_DataBlob *)&msgBlob, &signData, blockSize);
        EXPECT_EQ(ret, CRYPTO_SUCCESS);
        EXPECT_TRUE(OHTEST_DoVerify(algoName, pubKey, (Crypto_DataBlob *)&msgBlob, &signData));

        OH_CryptoRand_Destroy(randomObj);
        OH_CryptoKeyPair_Destroy(keyPair);
        OH_Crypto_FreeDataBlob(&signData);
        OH_Crypto_FreeDataBlob((Crypto_DataBlob *)&msgBlob);
    }
    return 0;
}

typedef struct {
    // 句柄类
    OH_CryptoKeyPair *keyPair;
    OH_CryptoPrivKey *privKey;
    OH_CryptoSign *sign;
    OH_CryptoRand *randomObj;

    // 动态数据Blob
    Crypto_DataBlob msgBlob;
    Crypto_DataBlob signData;
    Crypto_DataBlob mdData;
    Crypto_DataBlob mgfData;
    Crypto_DataBlob mgf1Data;
    Crypto_DataBlob saltLenData;
    Crypto_DataBlob trailerData;
    Crypto_DataBlob sm2UserIdData;

    // 静态参数Blob
    Crypto_DataBlob mdBlob;
    Crypto_DataBlob mfgBlob;
    Crypto_DataBlob mgf1MdBlob;
    Crypto_DataBlob saltBlob1;
    Crypto_DataBlob trailerBlob;

    // 配置字符串
    const char *algoName;
    const char *asymAlgoName;
    int32_t msgLen;

    // 静态缓存数组
    uint8_t mdText[4];      // "MD5"
    uint8_t mfgText[5];     // "MGF1"
    uint8_t mgf1MdText[5];  // "SHA1"
    int32_t saltText1;      // salt=30
    int32_t trailerText;    // trailer=-1
} SignatureTestCtx;

// 上下文初始化
static void SignatureTestCtxInit(SignatureTestCtx *ctx)
{
    uint8_t zero = VALUE_0;
    SafeMemset(ctx, sizeof(SignatureTestCtx), &zero, sizeof(SignatureTestCtx));

    // 算法配置
    ctx->algoName = "RSA512|PSS|SHA256|MGF1_SHA256";
    ctx->asymAlgoName = "RSA512";
    ctx->msgLen = MSGLEN_16;

    // MD5 blob
    SafeMemcpy(ctx->mdText, sizeof(ctx->mdText), "MD5", VALUE_3);
    ctx->mdBlob.data = ctx->mdText;
    ctx->mdBlob.len = VALUE_3;

    // MGF1 blob
    SafeMemcpy(ctx->mfgText, sizeof(ctx->mfgText), "MGF1", VALUE_4);
    ctx->mfgBlob.data = ctx->mfgText;
    ctx->mfgBlob.len = VALUE_4;

    // SHA1 blob
    SafeMemcpy(ctx->mgf1MdText, sizeof(ctx->mgf1MdText), "SHA1", VALUE_4);
    ctx->mgf1MdBlob.data = ctx->mgf1MdText;
    ctx->mgf1MdBlob.len = VALUE_4;

    // salt = 30
    ctx->saltText1 = VALUE_30;
    ctx->saltBlob1.data = reinterpret_cast<uint8_t *>(&ctx->saltText1);
    ctx->saltBlob1.len = sizeof(int32_t);

    // trailer = -1
    ctx->trailerText = NONE;
    ctx->trailerBlob.data = reinterpret_cast<uint8_t *>(&ctx->trailerText);
    ctx->trailerBlob.len = sizeof(int32_t);
}

// 创建随机数 + 生成消息
static void SignatureInitRandomAndMsg(SignatureTestCtx *ctx)
{
    OH_CryptoRand_Create(&ctx->randomObj);
    EXPECT_TRUE(ctx->randomObj != nullptr);
    EXPECT_EQ(OH_CryptoRand_GenerateRandom(ctx->randomObj, ctx->msgLen, &ctx->msgBlob), HCF_SUCCESS);
    ctx->msgBlob.data[0] = 0;
}

// 生成非对称密钥
static void SignatureGenKeyPair(SignatureTestCtx *ctx)
{
    ctx->keyPair = OHTEST_GenAsymKey(ctx->asymAlgoName);
    EXPECT_TRUE(ctx->keyPair != nullptr);

    ctx->privKey = OH_CryptoKeyPair_GetPrivKey(ctx->keyPair);
    EXPECT_TRUE(ctx->privKey != nullptr);
}

//创建签名句柄 + 设置参数
static void SignatureInitSignAndSetParams(SignatureTestCtx *ctx)
{
    EXPECT_EQ(OH_CryptoSign_Create(ctx->algoName, &ctx->sign), CRYPTO_SUCCESS);

    EXPECT_EQ(OH_CryptoSign_SetParam(ctx->sign, CRYPTO_PSS_MD_NAME_STR, &ctx->mdBlob), CRYPTO_NOT_SUPPORTED);
    EXPECT_EQ(OH_CryptoSign_SetParam(ctx->sign, CRYPTO_PSS_MGF_NAME_STR, &ctx->mfgBlob), CRYPTO_NOT_SUPPORTED);
    EXPECT_EQ(OH_CryptoSign_SetParam(ctx->sign, CRYPTO_PSS_MGF1_NAME_STR, &ctx->mgf1MdBlob), CRYPTO_NOT_SUPPORTED);
    EXPECT_EQ(OH_CryptoSign_SetParam(ctx->sign, CRYPTO_PSS_TRAILER_FIELD_INT, &ctx->trailerBlob),
        CRYPTO_PARAMETER_CHECK_FAILED);
        
    EXPECT_EQ(OH_CryptoSign_Init(ctx->sign, ctx->privKey), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_GetParam(ctx->sign, CRYPTO_PSS_SALT_LEN_INT, &ctx->saltLenData), CRYPTO_OPERTION_ERROR);
    EXPECT_EQ(OH_CryptoSign_SetParam(ctx->sign, CRYPTO_PSS_SALT_LEN_INT, &ctx->saltBlob1), CRYPTO_SUCCESS);
}
    
// 签名 + 获取所有参数
static void SignatureDoSignAndGetParams(SignatureTestCtx *ctx)
{
    EXPECT_EQ(OH_CryptoSign_Final(ctx->sign, &ctx->msgBlob, &ctx->signData), CRYPTO_SUCCESS);

    EXPECT_EQ(OH_CryptoSign_GetParam(ctx->sign, CRYPTO_PSS_MD_NAME_STR, &ctx->mdData), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_GetParam(ctx->sign, CRYPTO_PSS_MGF_NAME_STR, &ctx->mgfData), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_GetParam(ctx->sign, CRYPTO_PSS_MGF1_NAME_STR, &ctx->mgf1Data), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_GetParam(ctx->sign, CRYPTO_PSS_SALT_LEN_INT, &ctx->saltLenData), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_GetParam(ctx->sign, CRYPTO_PSS_TRAILER_FIELD_INT, &ctx->trailerData), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_GetParam(ctx->sign, CRYPTO_SM2_USER_ID_DATABLOB, &ctx->sm2UserIdData),
        CRYPTO_PARAMETER_CHECK_FAILED);
}

// 资源销毁
static void SignatureTestCtxDestroy(SignatureTestCtx *ctx)
{
    if (ctx->sign) {
        OH_CryptoSign_Destroy(ctx->sign);
    }
    if (ctx->randomObj) {
        OH_CryptoRand_Destroy(ctx->randomObj);
    }
    if (ctx->keyPair) {
        OH_CryptoKeyPair_Destroy(ctx->keyPair);
    }

    OH_Crypto_FreeDataBlob(&ctx->signData);
    OH_Crypto_FreeDataBlob(&ctx->mdData);
    OH_Crypto_FreeDataBlob(&ctx->mgfData);
    OH_Crypto_FreeDataBlob(&ctx->mgf1Data);
    OH_Crypto_FreeDataBlob(&ctx->saltLenData);
    OH_Crypto_FreeDataBlob(&ctx->trailerData);
    OH_Crypto_FreeDataBlob(&ctx->sm2UserIdData);
    OH_Crypto_FreeDataBlob(&ctx->msgBlob);
}

static int32_t SignatureDoTest(SignatureTestCtx *ctx)
{
    SignatureInitRandomAndMsg(ctx);
    SignatureGenKeyPair(ctx);
    SignatureInitSignAndSetParams(ctx);
    SignatureDoSignAndGetParams(ctx);
    return CRYPTO_SUCCESS;
}

int SubCryptoFrameworkNapiSignatureTest1200()
{
    SignatureTestCtx ctx;
    SignatureTestCtxInit(&ctx);

    SignatureDoTest(&ctx);

    SignatureTestCtxDestroy(&ctx);
    return 0;
}

int SubCryptoFrameworkNapiSignatureTest1300()
{
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_CryptoPrivKey *privKey = nullptr;
    OH_CryptoPubKey *pubKey = nullptr;
    OH_CryptoSign *sign = nullptr;
    const char *algoName = reinterpret_cast<const char*>("RSA768|PSS|SHA256|MGF1_SHA256");
    const char *asymAlgoName = reinterpret_cast<const char*>("RSA512");
    int32_t msgLen = MSGLEN_16;
    OH_CryptoRand *randomObj = nullptr;
    Crypto_DataBlob msgBlob = {.data = nullptr, .len = 0};
    Crypto_DataBlob signData = {.data = nullptr, .len = 0};
    uint8_t mdText[] = "SHA224";
    Crypto_DataBlob mdBlob = {
        .data = reinterpret_cast<uint8_t *>(mdText),
        .len = sizeof(mdText)
    };
    uint8_t mfG1MdText[] = "SHA384";
    Crypto_DataBlob mgf1MdBlob = {
        .data = reinterpret_cast<uint8_t *>(mfG1MdText),
        .len = sizeof(mfG1MdText)
    };

    OH_CryptoRand_Create(&randomObj);
    EXPECT_TRUE(randomObj != nullptr);
    EXPECT_EQ(OH_CryptoRand_GenerateRandom(randomObj, msgLen, &msgBlob), HCF_SUCCESS);
    msgBlob.data[0] = 0;
    keyPair = OHTEST_GenAsymKey(asymAlgoName);
    EXPECT_TRUE(keyPair != nullptr);
    privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    EXPECT_TRUE(privKey != nullptr);
    pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    EXPECT_TRUE(pubKey != nullptr);
    EXPECT_EQ(OH_CryptoSign_Create(algoName, &sign), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_SetParam(sign, CRYPTO_PSS_MD_NAME_STR, &mdBlob), CRYPTO_NOT_SUPPORTED);
    EXPECT_EQ(OH_CryptoSign_SetParam(sign, CRYPTO_PSS_MGF1_NAME_STR, &mgf1MdBlob), CRYPTO_NOT_SUPPORTED);
    EXPECT_EQ(OH_CryptoSign_Init(sign, privKey), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_Final(sign, (Crypto_DataBlob *)&msgBlob, &signData), CRYPTO_SUCCESS);
    EXPECT_TRUE(OHTEST_DoVerify(algoName, pubKey, (Crypto_DataBlob *)&msgBlob, &signData));

    OH_CryptoSign_Destroy(sign);
    OH_CryptoRand_Destroy(randomObj);
    OH_CryptoKeyPair_Destroy(keyPair);
    OH_Crypto_FreeDataBlob(&signData);
    OH_Crypto_FreeDataBlob((Crypto_DataBlob *)&msgBlob);
    return 0;
}

int SubCryptoFrameworkNapiSignatureTest1400()
{
    OH_CryptoSign *sign = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_CryptoPrivKey *privKey = nullptr;
    const char *algoName = reinterpret_cast<const char*>("RSA768|NoPadding|SHA256|OnlySign");
    const char *asymAlgoName = reinterpret_cast<const char*>("RSA768");

    keyPair = OHTEST_GenAsymKey(asymAlgoName);
    EXPECT_TRUE(keyPair != nullptr);
    privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    EXPECT_TRUE(privKey != nullptr);
    EXPECT_EQ(OH_CryptoSign_Create(algoName, &sign), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_Init(sign, privKey), CRYPTO_OPERTION_ERROR);
    
    OH_CryptoSign_Destroy(sign);
    OH_CryptoKeyPair_Destroy(keyPair);
    return 0;
}

int SubCryptoFrameworkNapiSignatureTest1500()
{
    OH_CryptoSign *sign = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_CryptoPrivKey *privKey = nullptr;
    OH_CryptoPubKey *pubKey = nullptr;
    const char *algoName = reinterpret_cast<const char*>("RSA768|PKCS1|SHA256");
    const char *asymAlgoName = reinterpret_cast<const char*>("RSA1024");
    OH_CryptoRand *randomObj = nullptr;
    Crypto_DataBlob msgBlob = {.data = nullptr, .len = 0};
    Crypto_DataBlob signData = {.data = nullptr, .len = 0};
    int32_t msgLen = MSGLEN_16;

    OH_CryptoRand_Create(&randomObj);
    EXPECT_TRUE(randomObj != nullptr);
    EXPECT_EQ(OH_CryptoRand_GenerateRandom(randomObj, msgLen, &msgBlob), HCF_SUCCESS);
    keyPair = OHTEST_GenAsymKey(asymAlgoName);
    EXPECT_TRUE(keyPair != nullptr);
    privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    EXPECT_TRUE(privKey != nullptr);
    pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    EXPECT_TRUE(pubKey != nullptr);
    EXPECT_EQ(OH_CryptoSign_Create(algoName, &sign), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_Init(sign, privKey), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_Final(sign, (Crypto_DataBlob *)&msgBlob, &signData), CRYPTO_SUCCESS);
    EXPECT_TRUE(OHTEST_DoVerify(algoName, pubKey, (Crypto_DataBlob *)&msgBlob, &signData));

    OH_CryptoSign_Destroy(sign);
    OH_CryptoRand_Destroy(randomObj);
    OH_CryptoKeyPair_Destroy(keyPair);
    OH_Crypto_FreeDataBlob(&signData);
    OH_Crypto_FreeDataBlob((Crypto_DataBlob *)&msgBlob);
    return 0;
}

int SubCryptoFrameworkNapiSignatureTest1600()
{
    OH_CryptoSign *sign = nullptr;
    const char *algoName = reinterpret_cast<const char*>("RSA768|PKCS1|SHA256");
    OH_CryptoRand *randomObj = nullptr;
    Crypto_DataBlob msgBlob = {.data = nullptr, .len = 0};
    Crypto_DataBlob signData = {.data = nullptr, .len = 0};
    int32_t msgLen = MSGLEN_16;

    OH_CryptoRand_Create(&randomObj);
    EXPECT_TRUE(randomObj != nullptr);
    EXPECT_EQ(OH_CryptoRand_GenerateRandom(randomObj, msgLen, &msgBlob), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_Create(algoName, &sign), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_Update(sign, (Crypto_DataBlob *)&msgBlob), CRYPTO_PARAMETER_CHECK_FAILED);
    EXPECT_EQ(OH_CryptoSign_Final(sign, (Crypto_DataBlob *)&msgBlob, &signData), CRYPTO_PARAMETER_CHECK_FAILED);

    OH_CryptoSign_Destroy(sign);
    OH_CryptoRand_Destroy(randomObj);
    OH_Crypto_FreeDataBlob(&signData);
    OH_Crypto_FreeDataBlob((Crypto_DataBlob *)&msgBlob);
    return 0;
}

int SubCryptoFrameworkNapiSignatureTest1700()
{
    OH_CryptoSign *sign = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_CryptoPrivKey *privKey = nullptr;
    const char *algoName = reinterpret_cast<const char*>("RSA768|PKCS1|SHA256|OnlySign");
    const char *asymAlgoName = reinterpret_cast<const char*>("RSA768");
    OH_CryptoRand *randomObj = nullptr;
    Crypto_DataBlob msgBlob = {.data = nullptr, .len = 0};
    int32_t msgLen = MSGLEN_16;

    OH_CryptoRand_Create(&randomObj);
    EXPECT_TRUE(randomObj != nullptr);
    EXPECT_EQ(OH_CryptoRand_GenerateRandom(randomObj, msgLen, &msgBlob), HCF_SUCCESS);
    keyPair = OHTEST_GenAsymKey(asymAlgoName);
    EXPECT_TRUE(keyPair != nullptr);
    privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    EXPECT_TRUE(privKey != nullptr);
    EXPECT_EQ(OH_CryptoSign_Create(algoName, &sign), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_Init(sign, privKey), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_Update(sign, (Crypto_DataBlob *)&msgBlob), CRYPTO_OPERTION_ERROR);

    OH_CryptoSign_Destroy(sign);
    OH_CryptoRand_Destroy(randomObj);
    OH_CryptoKeyPair_Destroy(keyPair);
    OH_Crypto_FreeDataBlob((Crypto_DataBlob *)&msgBlob);
    return 0;
}

int SubCryptoFrameworkNapiSignatureTest1800()
{
    OH_CryptoSign *sign = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_CryptoPrivKey *privKey = nullptr;
    const char *algoName = reinterpret_cast<const char*>("Ed25519");
    OH_CryptoRand *randomObj = nullptr;
    Crypto_DataBlob msgBlob = {.data = nullptr, .len = 0};
    int32_t msgLen = MSGLEN_16;

    OH_CryptoRand_Create(&randomObj);
    EXPECT_TRUE(randomObj != nullptr);
    EXPECT_EQ(OH_CryptoRand_GenerateRandom(randomObj, msgLen, &msgBlob), HCF_SUCCESS);
    keyPair = OHTEST_GenAsymKey(algoName);
    EXPECT_TRUE(keyPair != nullptr);
    privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    EXPECT_TRUE(privKey != nullptr);
    EXPECT_EQ(OH_CryptoSign_Create(algoName, &sign), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_Init(sign, privKey), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_Update(sign, (Crypto_DataBlob *)&msgBlob), CRYPTO_PARAMETER_CHECK_FAILED);

    OH_CryptoSign_Destroy(sign);
    OH_CryptoRand_Destroy(randomObj);
    OH_CryptoKeyPair_Destroy(keyPair);
    OH_Crypto_FreeDataBlob((Crypto_DataBlob *)&msgBlob);
    return 0;
}

int SubCryptoFrameworkNapiSignatureTest1900()
{
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_CryptoPrivKey *privKey = nullptr;
    const char *algoName = reinterpret_cast<const char*>("RSA512|NoPadding|NoHash|OnlySign");
    const char *asymAlgoName = reinterpret_cast<const char*>("RSA512");
    OH_CryptoRand *randomObj = nullptr;
    Crypto_DataBlob msgBlob = {.data = nullptr, .len = 0};
    Crypto_DataBlob signData = {.data = nullptr, .len = 0};
    int32_t msgLen = MSGLEN_65;
    OH_Crypto_ErrCode ret = CRYPTO_SUCCESS;

    OH_CryptoRand_Create(&randomObj);
    EXPECT_TRUE(randomObj != nullptr);
    EXPECT_EQ(OH_CryptoRand_GenerateRandom(randomObj, msgLen, &msgBlob), HCF_SUCCESS);
    keyPair = OHTEST_GenAsymKey(asymAlgoName);
    EXPECT_TRUE(keyPair != nullptr);
    privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    EXPECT_TRUE(privKey != nullptr);
    ret = OHTEST_DoNoSegmentSign(algoName, privKey, (Crypto_DataBlob *)&msgBlob, &signData);
    EXPECT_EQ(ret, CRYPTO_OPERTION_ERROR);

    OH_CryptoRand_Destroy(randomObj);
    OH_CryptoKeyPair_Destroy(keyPair);
    OH_Crypto_FreeDataBlob((Crypto_DataBlob *)&msgBlob);
    OH_Crypto_FreeDataBlob(&signData);
    return 0;
}

int SubCryptoFrameworkNapiSignatureTest2000()
{
    const int asymSignSpecCount = ECDSA_DATA_COUNT;
    for (int i = 0; i < asymSignSpecCount; i++) {
        AsymSignSpec specInfo = g_ecdsaData[i];
        OH_CryptoKeyPair *keyPair = nullptr;
        OH_CryptoPrivKey *privKey = nullptr;
        OH_CryptoPubKey *pubKey = nullptr;
        const char *algoName = reinterpret_cast<const char*>(specInfo.algoName);
        const char *asymAlgoName = reinterpret_cast<const char*>(specInfo.asymAlgoName);
        int32_t msgLen = specInfo.msgLen;
        OH_CryptoRand *randomObj = nullptr;
        Crypto_DataBlob msgBlob = {.data = nullptr, .len = 0};
        Crypto_DataBlob signData = {.data = nullptr, .len = 0};

        OH_CryptoRand_Create(&randomObj);
        EXPECT_TRUE(randomObj != nullptr);
        EXPECT_EQ(OH_CryptoRand_GenerateRandom(randomObj, msgLen, &msgBlob), HCF_SUCCESS);
        msgBlob.data[0] = 0;
        keyPair = OHTEST_GenAsymKey(asymAlgoName);
        EXPECT_TRUE(keyPair != nullptr);
        privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
        pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
        EXPECT_TRUE(privKey != nullptr);
        EXPECT_TRUE(pubKey != nullptr);
        EXPECT_EQ(OHTEST_DoNoSegmentSign(algoName, privKey, (Crypto_DataBlob *)&msgBlob, &signData), CRYPTO_SUCCESS);
        bool ret = OHTEST_Sm2SignatureAsn1ToRS(signData.data, signData.len);
        EXPECT_TRUE(ret);

        OH_CryptoRand_Destroy(randomObj);
        OH_CryptoKeyPair_Destroy(keyPair);
        OH_Crypto_FreeDataBlob(&signData);
        OH_Crypto_FreeDataBlob((Crypto_DataBlob *)&msgBlob);
    }
    return 0;
}

} // namespace Unittest::CryptoFrameworkSignatureNapiTest
