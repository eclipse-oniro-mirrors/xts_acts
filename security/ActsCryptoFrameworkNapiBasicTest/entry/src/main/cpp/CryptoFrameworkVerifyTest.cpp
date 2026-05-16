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

#include "include/CryptoFrameworkVerifyTest.h"
#include "include/CryptoFrameworkDigestTest.h"
#include "include/CommonToolTest.h"
#include <CryptoArchitectureKit/crypto_asym_key.h>
#include <CryptoArchitectureKit/crypto_signature.h>
#include <CryptoArchitectureKit/crypto_rand.h>
#include "include/Result.h"

namespace Unittest::CryptoFramework {

class OHCryptoFrameworkVerifyNapiTest {
public:
    static void SetUpTestCase() {};

    static void TearDownTestCase() {};
};

class VERIFY_PKCS1_TEST {
    public:
        static void SetUpTestCase() {}
        static void TearDownTestCase() {}
};

class VERIFY_PSS_TEST {
    public:
        static void SetUpTestCase() {}
        static void TearDownTestCase() {}
};

class VERIFY_ECC_TEST {
    public:
        static void SetUpTestCase() {}
        static void TearDownTestCase() {}
};

class VERIFY_DSA_TEST {
    public:
        static void SetUpTestCase() {}
        static void TearDownTestCase() {}
};

class VERIFY_RSA_ONLY_SIGN_TEST {
    public:
        static void SetUpTestCase() {}
        static void TearDownTestCase() {}
};

const int VALUE_0 = 0;
const int VALUE_1 = 1;
const int VALUE_2 = 2;
const int VALUE_3 = 3;
const int VALUE_16 = 16;
const int VALUE_20 = 20;
const int VALUE_64 = 64;
const int32_t VALUE_NEGATIVE = -1;
const int32_t VALUE_32 = 32;

static void InitVerifyMsg(int32_t msgLen, Crypto_DataBlob *msgBlob)
{
    OH_CryptoRand *randomObj = nullptr;
    OH_CryptoRand_Create(&randomObj);
    EXPECT_TRUE(randomObj != nullptr);
    EXPECT_EQ(OH_CryptoRand_GenerateRandom(randomObj, msgLen, msgBlob), HCF_SUCCESS);
    OH_CryptoRand_Destroy(randomObj);
}
static OH_CryptoKeyPair* CreateVerifyKey(VerifySpec data, OH_CryptoAsymKeyGenerator **keyCtx)
{
    OH_CryptoKeyPair *keyPair = nullptr;
    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Create(reinterpret_cast<const char*>(data.keyAlgName),
        keyCtx), CRYPTO_SUCCESS);
    if (!strcmp(reinterpret_cast<const char*>(data.keyAlgName), "RSA8192")) {
        Crypto_DataBlob p = {g_rsa8192PubKey, sizeof(g_rsa8192PubKey)};
        Crypto_DataBlob s = {g_rsa8192PriKey, sizeof(g_rsa8192PriKey)};
        EXPECT_EQ(OH_CryptoAsymKeyGenerator_Convert(*keyCtx, CRYPTO_DER, &p, &s, &keyPair),
            CRYPTO_SUCCESS);
    } else if (!strcmp(reinterpret_cast<const char*>(data.keyAlgName), "RSA4096")) {
        Crypto_DataBlob p = {g_rsa4096PubKey, sizeof(g_rsa4096PubKey)};
        Crypto_DataBlob s = {g_rsa4096PriKey, sizeof(g_rsa4096PriKey)};
        EXPECT_EQ(OH_CryptoAsymKeyGenerator_Convert(*keyCtx, CRYPTO_DER, &p, &s, &keyPair),
            CRYPTO_SUCCESS);
    } else if (!strcmp(reinterpret_cast<const char*>(data.keyAlgName), "RSA3072")) {
        Crypto_DataBlob p = {g_rsa3072PubKey, sizeof(g_rsa3072PubKey)};
        Crypto_DataBlob s = {g_rsa3072PriKey, sizeof(g_rsa3072PriKey)};
        EXPECT_EQ(OH_CryptoAsymKeyGenerator_Convert(*keyCtx, CRYPTO_DER, &p, &s, &keyPair),
            CRYPTO_SUCCESS);
    } else {
        EXPECT_EQ(OH_CryptoAsymKeyGenerator_Generate(*keyCtx, &keyPair), CRYPTO_SUCCESS);
    }
    return keyPair;
}
static void TestSignData(VerifySpec data, OH_CryptoKeyPair *pair, Crypto_DataBlob *msg,
    Crypto_DataBlob *sign)
{
    OH_CryptoSign *signObj = nullptr;
    EXPECT_EQ(OH_CryptoSign_Create(reinterpret_cast<const char*>(data.signAlgName), &signObj),
        HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_Init(signObj, OH_CryptoKeyPair_GetPrivKey(pair)), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_Final(signObj, msg, sign), HCF_SUCCESS);
    OH_CryptoSign_Destroy(signObj);
}
static void TestVerifyFinal(VerifySpec data, OH_CryptoPubKey *pub, Crypto_DataBlob *msg,
    Crypto_DataBlob *sign)
{
    OH_CryptoVerify *verify = nullptr;
    EXPECT_EQ(OH_CryptoVerify_Create(reinterpret_cast<const char*>(data.verifyAlgName),
        &verify), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoVerify_Init(verify, pub), CRYPTO_SUCCESS);
    EXPECT_TRUE(OH_CryptoVerify_Final(verify, msg, sign));
    const char *name = OH_CryptoVerify_GetAlgoName(verify);
    EXPECT_TRUE(!memcmp(name, reinterpret_cast<const char*>(data.verifyAlgName),
        strlen(reinterpret_cast<const char*>(data.verifyAlgName))));
    OH_CryptoVerify_Destroy(verify);
}
static void ReleaseVerifyAll(OH_CryptoAsymKeyGenerator *ctx, OH_CryptoKeyPair *pair,
    Crypto_DataBlob *msg, Crypto_DataBlob *sign)
{
    Crypto_DataBlob tmpBlob = {
        .data = nullptr,
        .len = 0
    };
    OH_Crypto_FreeDataBlob(&tmpBlob);
    OH_CryptoAsymKeyGenerator_Destroy(ctx);
    OH_CryptoKeyPair_Destroy(pair);
    HcfBlobDataClearAndFree(msg);
    HcfBlobDataClearAndFree(sign);
}
int SubCryptoFrameworkNapiVerifyTest0100()
{
    int count = VERIFY_PKCS1_DATA_COUNT;
    for (int i = 0; i < count; i++) {
        VerifySpec data = g_verifyPkcs1Data[i];
        OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
        OH_CryptoKeyPair *keyPair = nullptr;
        Crypto_DataBlob msgBlob = {0};
        Crypto_DataBlob signData = {.data = nullptr, .len = 0};
        Crypto_DataBlob n = {.data = nullptr, .len = 0};

        InitVerifyMsg(data.msgLen, &msgBlob);
        keyPair = CreateVerifyKey(data, &keyCtx);
        OH_CryptoPubKey *pub = OH_CryptoKeyPair_GetPubKey(keyPair);
        EXPECT_EQ(OH_CryptoPubKey_GetParam(pub, CRYPTO_RSA_N_DATABLOB, &n), CRYPTO_SUCCESS);

        TestSignData(data, keyPair, &msgBlob, &signData);
        TestVerifyFinal(data, pub, &msgBlob, &signData);
        ReleaseVerifyAll(keyCtx, keyPair, &msgBlob, &signData);
    }
    return 0;
}

int32_t GenerateKeyPairByAlg(const VerifySpec& verifyData, OH_CryptoAsymKeyGenerator** keyCtx,
    OH_CryptoKeyPair** keyPair)
{
    const char* keyAlg = reinterpret_cast<const char*>(verifyData.keyAlgName);
    int32_t ret = OH_CryptoAsymKeyGenerator_Create(keyAlg, keyCtx);
    if (ret != CRYPTO_SUCCESS) {
        return ret;
    }

    if (strcmp(keyAlg, "RSA8192") == 0) {
        Crypto_DataBlob pubKeyBlob = { .data = g_rsa8192PubKey, .len = sizeof(g_rsa8192PubKey) };
        Crypto_DataBlob priKeyBlob = { .data = g_rsa8192PriKey, .len = sizeof(g_rsa8192PriKey) };
        return OH_CryptoAsymKeyGenerator_Convert(*keyCtx, CRYPTO_DER, &pubKeyBlob, &priKeyBlob, keyPair);
    } else if (strcmp(keyAlg, "RSA4096") == 0) {
        Crypto_DataBlob pubKeyBlob = { .data = g_rsa4096PubKey, .len = sizeof(g_rsa4096PubKey) };
        Crypto_DataBlob priKeyBlob = { .data = g_rsa4096PriKey, .len = sizeof(g_rsa4096PriKey) };
        return OH_CryptoAsymKeyGenerator_Convert(*keyCtx, CRYPTO_DER, &pubKeyBlob, &priKeyBlob, keyPair);
    } else if (strcmp(keyAlg, "RSA3072") == 0) {
        Crypto_DataBlob pubKeyBlob = { .data = g_rsa3072PubKey, .len = sizeof(g_rsa3072PubKey) };
        Crypto_DataBlob priKeyBlob = { .data = g_rsa3072PriKey, .len = sizeof(g_rsa3072PriKey) };
        return OH_CryptoAsymKeyGenerator_Convert(*keyCtx, CRYPTO_DER, &pubKeyBlob, &priKeyBlob, keyPair);
    } else {
        return OH_CryptoAsymKeyGenerator_Generate(*keyCtx, keyPair);
    }
}

int32_t ExecuteSignVerifyProcess(const VerifySpec& verifyData, OH_CryptoKeyPair* keyPair)
{
    OH_CryptoRand *randomObj = nullptr;
    Crypto_DataBlob msgBlob = {0};
    Crypto_DataBlob signData = {.data = nullptr, .len = 0};
    OH_CryptoSign *signObj = nullptr;
    OH_CryptoVerify *verify = nullptr;
    int32_t msgLen = verifyData.msgLen;

    OH_CryptoRand_Create(&randomObj);
    EXPECT_TRUE(randomObj != nullptr);
    EXPECT_EQ(OH_CryptoRand_GenerateRandom(randomObj, msgLen, &msgBlob), HCF_SUCCESS);

    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    EXPECT_TRUE(pubKey != nullptr);

    const char* signAlg = reinterpret_cast<const char*>(verifyData.signAlgName);
    EXPECT_EQ(OH_CryptoSign_Create(signAlg, &signObj), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_Init(signObj, OH_CryptoKeyPair_GetPrivKey(keyPair)), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_Final(signObj, &msgBlob, &signData), HCF_SUCCESS);

    const char* verifyAlg = reinterpret_cast<const char*>(verifyData.verifyAlgName);
    EXPECT_EQ(OH_CryptoVerify_Create(verifyAlg, &verify), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoVerify_Init(verify, pubKey), CRYPTO_SUCCESS);
    EXPECT_TRUE(OH_CryptoVerify_Final(verify, &msgBlob, &signData));

    const char* getVerifyAlgName = OH_CryptoVerify_GetAlgoName(verify);
    EXPECT_TRUE(memcmp(getVerifyAlgName, verifyAlg, strlen(verifyAlg)) == 0);

    OH_CryptoSign_Destroy(signObj);
    OH_CryptoVerify_Destroy(verify);
    OH_CryptoRand_Destroy(randomObj);
    HcfBlobDataClearAndFree(&msgBlob);
    HcfBlobDataClearAndFree(&signData);

    return HCF_SUCCESS;
}

int SubCryptoFrameworkNapiVerifyTest0200()
{
    const int verifySpecCount = VERIFY_PSS_DATA_COUNT;
    for (int i = 0; i < verifySpecCount; i++) {
        VerifySpec verifyData = g_verifyPssData[i];
        OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
        OH_CryptoKeyPair *keyPair = nullptr;

        int32_t ret = GenerateKeyPairByAlg(verifyData, &keyCtx, &keyPair);
        EXPECT_EQ(ret, CRYPTO_SUCCESS);
        EXPECT_TRUE(keyPair != nullptr);

        ret = ExecuteSignVerifyProcess(verifyData, keyPair);
        EXPECT_EQ(ret, HCF_SUCCESS);

        OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
        OH_CryptoKeyPair_Destroy(keyPair);
    }
    return 0;
}

int SubCryptoFrameworkNapiVerifyTest2800()
{
    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    Crypto_DataBlob pubKeyBlob = { .data = g_rsa8192PubKey, .len = sizeof(g_rsa8192PubKey) };
    Crypto_DataBlob priKeyBlob = { .data = g_rsa8192PriKey, .len = sizeof(g_rsa8192PriKey) };

    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Create(reinterpret_cast<const char*>("RSA8192"), &keyCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Convert(keyCtx, CRYPTO_DER, &pubKeyBlob, &priKeyBlob,
        &keyPair), CRYPTO_SUCCESS);

    OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
    OH_CryptoKeyPair_Destroy(keyPair);
    return 0;
}

int SubCryptoFrameworkNapiVerifyTest0300()
{
    const int verifySpecCount = VERIFY_ECC_DATA_COUNT;
    for (int i = 0;i < verifySpecCount; i++) {
        VerifySpec verifyData = g_verifyEccData[i];
        OH_CryptoSign *signObj = nullptr;
        OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
        OH_CryptoKeyPair *keyPair = nullptr;
        int32_t msgLen = verifyData.msgLen;
        OH_CryptoRand *randomObj = nullptr;
        Crypto_DataBlob msgBlob = {0};
        Crypto_DataBlob signData = {.data = nullptr, .len = 0};
        OH_CryptoVerify *verify = nullptr;
    
        OH_CryptoRand_Create(&randomObj);
        EXPECT_TRUE(randomObj != nullptr);
        EXPECT_EQ(OH_CryptoRand_GenerateRandom(randomObj, msgLen, &msgBlob), HCF_SUCCESS);
        EXPECT_EQ(OH_CryptoAsymKeyGenerator_Create(reinterpret_cast<const char*>(verifyData.keyAlgName),
            &keyCtx), CRYPTO_SUCCESS);
        EXPECT_EQ(OH_CryptoAsymKeyGenerator_Generate(keyCtx, &keyPair), CRYPTO_SUCCESS);
        OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
        EXPECT_EQ(OH_CryptoSign_Create(reinterpret_cast<const char*>(verifyData.signAlgName), &signObj), HCF_SUCCESS);
        EXPECT_EQ(OH_CryptoSign_Init(signObj, OH_CryptoKeyPair_GetPrivKey(keyPair)), HCF_SUCCESS);
        EXPECT_EQ(OH_CryptoSign_Final(signObj, &msgBlob, &signData), HCF_SUCCESS);
        
        EXPECT_EQ(OH_CryptoVerify_Create(reinterpret_cast<const char*>(verifyData.verifyAlgName),
            &verify), CRYPTO_SUCCESS);
        EXPECT_EQ(OH_CryptoVerify_Init(verify, pubKey), CRYPTO_SUCCESS);
        EXPECT_TRUE(OH_CryptoVerify_Final(verify, (Crypto_DataBlob *)&msgBlob, (Crypto_DataBlob *)&signData));
        const char* getVerifyAlgName = OH_CryptoVerify_GetAlgoName(verify);
        EXPECT_TRUE(memcmp(getVerifyAlgName, reinterpret_cast<const char*>(verifyData.verifyAlgName),
            strlen(reinterpret_cast<const char*>(verifyData.verifyAlgName))) == 0);
    
        OH_CryptoSign_Destroy(signObj);
        OH_CryptoVerify_Destroy(verify);
        OH_CryptoRand_Destroy(randomObj);
        OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
        OH_CryptoKeyPair_Destroy(keyPair);
        HcfBlobDataClearAndFree(&msgBlob);
        HcfBlobDataClearAndFree(&signData);
    }
    return 0;
}

int SubCryptoFrameworkNapiVerifyTest0400()
{
    const int verifySpecCount = VERIFY_DSA_DATA_COUNT;
    for (int i = 0;i < verifySpecCount; i++) {
        VerifySpec verifyData = g_verifyDsaData[i];
        OH_CryptoSign *signObj = nullptr;
        OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
        OH_CryptoKeyPair *keyPair = nullptr;
        int32_t msgLen = verifyData.msgLen;
        OH_CryptoRand *randomObj = nullptr;
        Crypto_DataBlob msgBlob = {0};
        Crypto_DataBlob signData = {.data = nullptr, .len = 0};
        OH_CryptoVerify *verify = nullptr;
    
        OH_CryptoRand_Create(&randomObj);
        EXPECT_TRUE(randomObj != nullptr);
        EXPECT_EQ(OH_CryptoRand_GenerateRandom(randomObj, msgLen, &msgBlob), HCF_SUCCESS);
        EXPECT_EQ(OH_CryptoAsymKeyGenerator_Create(reinterpret_cast<const char*>(verifyData.keyAlgName),
            &keyCtx), CRYPTO_SUCCESS);
        EXPECT_EQ(OH_CryptoAsymKeyGenerator_Generate(keyCtx, &keyPair), CRYPTO_SUCCESS);
        OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
        EXPECT_EQ(OH_CryptoSign_Create(reinterpret_cast<const char*>(verifyData.signAlgName), &signObj), HCF_SUCCESS);
        EXPECT_EQ(OH_CryptoSign_Init(signObj, OH_CryptoKeyPair_GetPrivKey(keyPair)), HCF_SUCCESS);
        EXPECT_EQ(OH_CryptoSign_Final(signObj, &msgBlob, &signData), HCF_SUCCESS);
        EXPECT_EQ(OH_CryptoVerify_Create(reinterpret_cast<const char*>(verifyData.verifyAlgName),
            &verify), CRYPTO_SUCCESS);
        EXPECT_EQ(OH_CryptoVerify_Init(verify, pubKey), CRYPTO_SUCCESS);
        EXPECT_TRUE(OH_CryptoVerify_Final(verify, (Crypto_DataBlob *)&msgBlob, (Crypto_DataBlob *)&signData));
        const char* getVerifyAlgName = OH_CryptoVerify_GetAlgoName(verify);
        EXPECT_TRUE(memcmp(getVerifyAlgName, reinterpret_cast<const char*>(verifyData.verifyAlgName),
            strlen(reinterpret_cast<const char*>(verifyData.verifyAlgName))) == 0);
    
        OH_CryptoSign_Destroy(signObj);
        OH_CryptoVerify_Destroy(verify);
        OH_CryptoRand_Destroy(randomObj);
        OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
        OH_CryptoKeyPair_Destroy(keyPair);
        HcfBlobDataClearAndFree(&msgBlob);
        HcfBlobDataClearAndFree(&signData);
    }
    return 0;
}

static void InitVerifyMsgBlob(int32_t msgLen, Crypto_DataBlob *msgBlob)
{
    OH_CryptoRand *randomObj = nullptr;
    OH_CryptoRand_Create(&randomObj);
    EXPECT_TRUE(randomObj != nullptr);
    EXPECT_EQ(OH_CryptoRand_GenerateRandom(randomObj, msgLen, msgBlob), HCF_SUCCESS);
    msgBlob->data[0] = 0;
    OH_CryptoRand_Destroy(randomObj);
}
static OH_CryptoKeyPair* CreateVerifyKeyPair(VerifySpec verifyData, OH_CryptoAsymKeyGenerator **keyCtx)
{
    OH_CryptoKeyPair *keyPair = nullptr;
    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Create(reinterpret_cast<const char*>(verifyData.keyAlgName),
        keyCtx), CRYPTO_SUCCESS);
    if (strcmp(reinterpret_cast<const char*>(verifyData.keyAlgName), "RSA8192") == 0) {
        Crypto_DataBlob pubKeyBlob = { .data = g_rsa8192PubKey, .len = sizeof(g_rsa8192PubKey) };
        Crypto_DataBlob priKeyBlob = { .data = g_rsa8192PriKey, .len = sizeof(g_rsa8192PriKey) };
        EXPECT_EQ(OH_CryptoAsymKeyGenerator_Convert(*keyCtx, CRYPTO_DER, &pubKeyBlob, &priKeyBlob,
            &keyPair), CRYPTO_SUCCESS);
    } else if (strcmp(reinterpret_cast<const char*>(verifyData.keyAlgName), "RSA4096") == 0) {
        Crypto_DataBlob pubKeyBlob = { .data = g_rsa4096PubKey, .len = sizeof(g_rsa4096PubKey) };
        Crypto_DataBlob priKeyBlob = { .data = g_rsa4096PriKey, .len = sizeof(g_rsa4096PriKey) };
        EXPECT_EQ(OH_CryptoAsymKeyGenerator_Convert(*keyCtx, CRYPTO_DER, &pubKeyBlob, &priKeyBlob,
            &keyPair), CRYPTO_SUCCESS);
    } else if (strcmp(reinterpret_cast<const char*>(verifyData.keyAlgName), "RSA3072") == 0) {
        Crypto_DataBlob pubKeyBlob = { .data = g_rsa3072PubKey, .len = sizeof(g_rsa3072PubKey) };
        Crypto_DataBlob priKeyBlob = { .data = g_rsa3072PriKey, .len = sizeof(g_rsa3072PriKey) };
        EXPECT_EQ(OH_CryptoAsymKeyGenerator_Convert(*keyCtx, CRYPTO_DER, &pubKeyBlob, &priKeyBlob,
            &keyPair), CRYPTO_SUCCESS);
    } else {
        EXPECT_EQ(OH_CryptoAsymKeyGenerator_Generate(*keyCtx, &keyPair), CRYPTO_SUCCESS);
    }
    return keyPair;
}
static void DoVerifySign(VerifySpec verifyData, OH_CryptoKeyPair *keyPair,
    Crypto_DataBlob *msgBlob, Crypto_DataBlob *signData)
{
    OH_CryptoSign *signObj = nullptr;
    EXPECT_EQ(OH_CryptoSign_Create(reinterpret_cast<const char*>(verifyData.signAlgName),
        &signObj), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_Init(signObj, OH_CryptoKeyPair_GetPrivKey(keyPair)), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_Final(signObj, msgBlob, signData), HCF_SUCCESS);
    OH_CryptoSign_Destroy(signObj);
}

static void DoVerifyRecover(VerifySpec verifyData, OH_CryptoPubKey *pubKey, Crypto_DataBlob *msgBlob,
    Crypto_DataBlob *signData, Crypto_DataBlob *rawSignData)
{
    OH_CryptoVerify *verify = nullptr;
    EXPECT_EQ(OH_CryptoVerify_Create(reinterpret_cast<const char*>(verifyData.verifyAlgName), &verify),
        CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoVerify_Init(verify, pubKey), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoVerify_Recover(verify, signData, rawSignData), CRYPTO_SUCCESS);
    const char *getVerifyAlgName = OH_CryptoVerify_GetAlgoName(verify);
    EXPECT_TRUE(memcmp(getVerifyAlgName, reinterpret_cast<const char*>(verifyData.verifyAlgName),
        strlen(reinterpret_cast<const char*>(verifyData.verifyAlgName))) == 0);
    EXPECT_TRUE(memcmp(msgBlob->data, rawSignData->data, msgBlob->len) == 0);
    EXPECT_EQ(msgBlob->len, rawSignData->len);
    OH_CryptoVerify_Destroy(verify);
}

static void ReleaseVerifyTestResources(OH_CryptoAsymKeyGenerator *keyCtx, OH_CryptoKeyPair *keyPair,
    Crypto_DataBlob *msgBlob, Crypto_DataBlob *signData, Crypto_DataBlob *rawSignData)
{
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
    OH_CryptoKeyPair_Destroy(keyPair);
    HcfBlobDataClearAndFree(msgBlob);
    HcfBlobDataClearAndFree(signData);
    OH_Crypto_FreeDataBlob(rawSignData);
}
int SubCryptoFrameworkNapiVerifyTest0500()
{
    const int verifySpecCount = VERIFY_RSA_ONLY_SIGN_DATA_COUNT;
    for (int i = 0; i < verifySpecCount; i++) {
        VerifySpec verifyData = g_verifyRsaOnlySignData[i];
        OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
        OH_CryptoKeyPair *keyPair = nullptr;
        Crypto_DataBlob msgBlob = {0};
        Crypto_DataBlob signData = {.data = nullptr, .len = 0};
        Crypto_DataBlob rawSignData = {.data = nullptr, .len = 0};
        InitVerifyMsgBlob(verifyData.msgLen, &msgBlob);
        keyPair = CreateVerifyKeyPair(verifyData, &keyCtx);
        OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
        DoVerifySign(verifyData, keyPair, &msgBlob, &signData);
        DoVerifyRecover(verifyData, pubKey, &msgBlob, &signData, &rawSignData);
        ReleaseVerifyTestResources(keyCtx, keyPair, &msgBlob, &signData, &rawSignData);
    }
    return 0;
}

int SubCryptoFrameworkNapiVerifyTest0600()
{
    OH_CryptoVerify *verify = nullptr;

    EXPECT_EQ(OH_CryptoVerify_Create(nullptr, &verify), CRYPTO_INVALID_PARAMS);
    EXPECT_EQ(OH_CryptoVerify_Create(reinterpret_cast<const char*>("RSA512|PKCS1|MD10"), &verify),
        CRYPTO_INVALID_PARAMS);
    EXPECT_EQ(OH_CryptoVerify_Create(reinterpret_cast<const char*>("RSA512|PKCS1|MD5"), nullptr),
        CRYPTO_INVALID_PARAMS);
    EXPECT_EQ(OH_CryptoVerify_Create(reinterpret_cast<const char*>("SM9|SM3"), &verify),
        CRYPTO_INVALID_PARAMS);
    EXPECT_EQ(OH_CryptoVerify_Create(reinterpret_cast<const char*>("RSA512|PKCS6|MD5"),
        &verify), CRYPTO_INVALID_PARAMS);
    return 0;
}

int SubCryptoFrameworkNapiVerifyTest0700()
{
    OH_CryptoVerify *verify = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;

    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Create(reinterpret_cast<const char*>("RSA1024"),
        &keyCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Generate(keyCtx, &keyPair), CRYPTO_SUCCESS);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    EXPECT_EQ(OH_CryptoVerify_Create(reinterpret_cast<const char*>("RSA1024|PKCS1|SHA1"), &verify), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoVerify_Init(nullptr, pubKey), CRYPTO_INVALID_PARAMS);
    EXPECT_EQ(OH_CryptoVerify_Init(verify, nullptr), CRYPTO_INVALID_PARAMS);

    OH_CryptoVerify_Destroy(verify);
    OH_CryptoKeyPair_Destroy(keyPair);
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
    return 0;
}

int SubCryptoFrameworkNapiVerifyTest0800()
{
    OH_CryptoVerify *verify = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    uint8_t testData[] = "0123456789";
    Crypto_DataBlob msgBlob = {
        .data = reinterpret_cast<uint8_t *>(testData),
        .len = sizeof(testData)
    };
    Crypto_DataBlob rawBlob = {
        .data = reinterpret_cast<uint8_t *>(testData),
        .len = sizeof(testData)
    };
    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;

    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Create(reinterpret_cast<const char*>("RSA768"), &keyCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Generate(keyCtx, &keyPair), CRYPTO_SUCCESS);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    EXPECT_EQ(OH_CryptoVerify_Create(reinterpret_cast<const char*>("RSA768|PKCS1|SHA224"), &verify), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoVerify_Update(verify, &msgBlob), CRYPTO_INVALID_PARAMS);
    EXPECT_FALSE(OH_CryptoVerify_Final(verify, &msgBlob, &rawBlob));
    EXPECT_EQ(OH_CryptoVerify_Init(verify, pubKey), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoVerify_Update(nullptr, &msgBlob), CRYPTO_INVALID_PARAMS);
    EXPECT_EQ(OH_CryptoVerify_Update(verify, nullptr), CRYPTO_INVALID_PARAMS);
    EXPECT_FALSE(OH_CryptoVerify_Final(nullptr, &msgBlob, &rawBlob));
    EXPECT_FALSE(OH_CryptoVerify_Final(verify, nullptr, &rawBlob));
    EXPECT_FALSE(OH_CryptoVerify_Final(verify, &msgBlob, nullptr));
    EXPECT_FALSE(OH_CryptoVerify_GetAlgoName(nullptr));

    OH_CryptoVerify_Destroy(verify);
    OH_CryptoKeyPair_Destroy(keyPair);
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
    return 0;
}

int SubCryptoFrameworkNapiVerifyTest0900()
{
    OH_CryptoSign *signObj = nullptr;
    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    int32_t msgLen = OH_CRYPTO_SHA1_DIGESTSIZE;
    OH_CryptoRand *randomObj = nullptr;
    Crypto_DataBlob msgBlob = {0};
    Crypto_DataBlob signData = {.data = nullptr, .len = 0};
    OH_CryptoVerify *verify = nullptr;
    Crypto_DataBlob rawSignData = {.data = nullptr, .len = 0};

    OH_CryptoRand_Create(&randomObj);
    EXPECT_TRUE(randomObj != nullptr);
    EXPECT_EQ(OH_CryptoRand_GenerateRandom(randomObj, msgLen, &msgBlob), HCF_SUCCESS);
    msgBlob.data[0] = 0;
    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Create(reinterpret_cast<const char*>("RSA1024"),
        &keyCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Generate(keyCtx, &keyPair), CRYPTO_SUCCESS);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    EXPECT_EQ(OH_CryptoSign_Create(reinterpret_cast<const char*>("RSA1024|PKCS1|SHA1|OnlySign"),
        &signObj), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_Init(signObj, OH_CryptoKeyPair_GetPrivKey(keyPair)), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_Final(signObj, &msgBlob, &signData), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoVerify_Create(reinterpret_cast<const char*>("RSA1024|PKCS1|SHA1|Recover"),
        &verify), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoVerify_Init(verify, pubKey), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoVerify_Recover(nullptr, (Crypto_DataBlob *)&signData, &rawSignData),
        CRYPTO_INVALID_PARAMS);
    EXPECT_EQ(OH_CryptoVerify_Recover(verify, nullptr, &rawSignData), CRYPTO_INVALID_PARAMS);
    EXPECT_EQ(OH_CryptoVerify_Recover(verify, (Crypto_DataBlob *)&signData, nullptr),
        CRYPTO_INVALID_PARAMS);

    OH_CryptoSign_Destroy(signObj);
    OH_CryptoVerify_Destroy(verify);
    OH_CryptoRand_Destroy(randomObj);
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
    OH_CryptoKeyPair_Destroy(keyPair);
    HcfBlobDataClearAndFree(&msgBlob);
    HcfBlobDataClearAndFree(&signData);
    OH_Crypto_FreeDataBlob(&rawSignData);
    return 0;
}

int SubCryptoFrameworkNapiVerifyTest1000()
{
    OH_CryptoVerify *verify1 = nullptr;
    OH_CryptoVerify *verify2 = nullptr;
    uint8_t mdName[] = "MD5";
    Crypto_DataBlob inBlob = {
        .data = reinterpret_cast<uint8_t *>(mdName),
        .len = sizeof(mdName)
    };
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;

    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Create(reinterpret_cast<const char*>("RSA768"), &keyCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Generate(keyCtx, &keyPair), CRYPTO_SUCCESS);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    EXPECT_EQ(OH_CryptoVerify_Create(reinterpret_cast<const char*>("RSA768|PSS|MD5|MGF1_SHA384"),
        &verify1), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoVerify_SetParam(nullptr, CRYPTO_PSS_MGF_NAME_STR, &inBlob), CRYPTO_INVALID_PARAMS);
    EXPECT_EQ(OH_CryptoVerify_SetParam(verify1, CRYPTO_PSS_MGF_NAME_STR, nullptr), CRYPTO_INVALID_PARAMS);
    EXPECT_EQ(OH_CryptoVerify_Init(verify1, pubKey), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoVerify_Create(reinterpret_cast<const char*>("RSA1024|PKCS1|SHA256"), &verify2), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoVerify_SetParam(verify2, CRYPTO_PSS_MD_NAME_STR, &inBlob), CRYPTO_NOT_SUPPORTED);
    EXPECT_EQ(OH_CryptoVerify_SetParam(verify2, CRYPTO_SM2_USER_ID_DATABLOB, &inBlob), CRYPTO_NOT_SUPPORTED);
    EXPECT_EQ(OH_CryptoVerify_SetParam(verify1, CRYPTO_PSS_MD_NAME_STR, &inBlob), CRYPTO_NOT_SUPPORTED);
    EXPECT_EQ(OH_CryptoVerify_GetParam(nullptr, CRYPTO_PSS_MGF_NAME_STR, &inBlob), CRYPTO_INVALID_PARAMS);
    EXPECT_EQ(OH_CryptoVerify_GetParam(verify1, CRYPTO_PSS_MGF_NAME_STR, nullptr), CRYPTO_INVALID_PARAMS);

    OH_CryptoVerify_Destroy(verify1);
    OH_CryptoVerify_Destroy(verify2);
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
    OH_CryptoKeyPair_Destroy(keyPair);
    return 0;
}

int SubCryptoFrameworkNapiVerifyTest1100()
{
    OH_CryptoSign *signObj = nullptr;
    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    Crypto_DataBlob signData = {.data = nullptr, .len = 0};
    OH_CryptoVerify *verify = nullptr;
    uint8_t testData[] = "0123456789";
    Crypto_DataBlob msgBlob = {
        .data = reinterpret_cast<uint8_t *>(testData),
        .len = sizeof(testData)
    };

    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Create(reinterpret_cast<const char*>("RSA512"), &keyCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Generate(keyCtx, &keyPair), CRYPTO_SUCCESS);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    EXPECT_EQ(OH_CryptoSign_Create(reinterpret_cast<const char*>("RSA512|PKCS1|MD5"), &signObj), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_Init(signObj, OH_CryptoKeyPair_GetPrivKey(keyPair)), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_Final(signObj, (Crypto_DataBlob *)&msgBlob, &signData), HCF_SUCCESS);
    signData.data[signData.len-1]--;
    EXPECT_EQ(OH_CryptoVerify_Create(reinterpret_cast<const char*>("RSA512|PKCS1|MD5"), &verify), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoVerify_Init(verify, pubKey), CRYPTO_SUCCESS);
    EXPECT_FALSE(OH_CryptoVerify_Final(verify, (Crypto_DataBlob *)&msgBlob, (Crypto_DataBlob *)&signData));
    signData.data[signData.len-1]++;
    msgBlob.data[msgBlob.len-1]--;
    EXPECT_FALSE(OH_CryptoVerify_Final(verify, (Crypto_DataBlob *)&msgBlob, (Crypto_DataBlob *)&signData));
    
    OH_CryptoSign_Destroy(signObj);
    OH_CryptoVerify_Destroy(verify);
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
    OH_CryptoKeyPair_Destroy(keyPair);
    HcfBlobDataClearAndFree(&signData);
    return 0;
}

int SubCryptoFrameworkNapiVerifyTest1200()
{
    OH_CryptoSign *signObj = nullptr;
    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    Crypto_DataBlob signData = {.data = nullptr, .len = 0};
    OH_CryptoVerify *verify = nullptr;
    uint8_t testData[] = "0123456789";
    Crypto_DataBlob msgBlob = {
        .data = reinterpret_cast<uint8_t *>(testData),
        .len = sizeof(testData)
    };

    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Create(reinterpret_cast<const char*>("RSA768"), &keyCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Generate(keyCtx, &keyPair), CRYPTO_SUCCESS);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    EXPECT_EQ(OH_CryptoSign_Create(reinterpret_cast<const char*>("RSA768|PKCS1|SHA1"), &signObj), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_Init(signObj, OH_CryptoKeyPair_GetPrivKey(keyPair)), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_Final(signObj, (Crypto_DataBlob *)&msgBlob, &signData), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoVerify_Create(reinterpret_cast<const char*>("RSA1024|PKCS1|SHA1"), &verify), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoVerify_Init(verify, pubKey), CRYPTO_SUCCESS);
    EXPECT_TRUE(OH_CryptoVerify_Final(verify, (Crypto_DataBlob *)&msgBlob, (Crypto_DataBlob *)&signData));
    
    OH_CryptoSign_Destroy(signObj);
    OH_CryptoVerify_Destroy(verify);
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
    OH_CryptoKeyPair_Destroy(keyPair);
    HcfBlobDataClearAndFree(&signData);
    return 0;
}

int SubCryptoFrameworkNapiVerifyTest1300()
{
    OH_CryptoSign *signObj = nullptr;
    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    Crypto_DataBlob signData = {.data = nullptr, .len = 0};
    OH_CryptoVerify *verify = nullptr;
    uint8_t testData[] = "0123456789";
    Crypto_DataBlob msgBlob = {
        .data = reinterpret_cast<uint8_t *>(testData),
        .len = sizeof(testData)
    };

    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Create(reinterpret_cast<const char*>("RSA1024"), &keyCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Generate(keyCtx, &keyPair), CRYPTO_SUCCESS);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    EXPECT_EQ(OH_CryptoSign_Create(reinterpret_cast<const char*>("RSA1024|PKCS1|SHA224"), &signObj), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_Init(signObj, OH_CryptoKeyPair_GetPrivKey(keyPair)), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_Final(signObj, (Crypto_DataBlob *)&msgBlob, &signData), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoVerify_Create(reinterpret_cast<const char*>("RSA1024|PKCS1|SHA256"), &verify), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoVerify_Init(verify, pubKey), CRYPTO_SUCCESS);
    EXPECT_FALSE(OH_CryptoVerify_Final(verify, (Crypto_DataBlob *)&msgBlob, (Crypto_DataBlob *)&signData));
    
    OH_CryptoSign_Destroy(signObj);
    OH_CryptoVerify_Destroy(verify);
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
    OH_CryptoKeyPair_Destroy(keyPair);
    HcfBlobDataClearAndFree(&signData);
    return 0;
}

int SubCryptoFrameworkNapiVerifyTest1400()
{
    OH_CryptoSign *signObj = nullptr;
    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    Crypto_DataBlob signData = {.data = nullptr, .len = 0};
    OH_CryptoVerify *verify = nullptr;
    int32_t msgLen = OH_CRYPTO_MD5_DIGESTSIZE;
    OH_CryptoRand *randomObj = nullptr;
    Crypto_DataBlob msgBlob = {0};

    OH_CryptoRand_Create(&randomObj);
    EXPECT_TRUE(randomObj != nullptr);
    EXPECT_EQ(OH_CryptoRand_GenerateRandom(randomObj, msgLen, &msgBlob), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Create(reinterpret_cast<const char*>("RSA512"), &keyCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Generate(keyCtx, &keyPair), CRYPTO_SUCCESS);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    EXPECT_EQ(OH_CryptoSign_Create(reinterpret_cast<const char*>("RSA512|PKCS1|MD5|OnlySign"), &signObj), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_Init(signObj, OH_CryptoKeyPair_GetPrivKey(keyPair)), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_Final(signObj, &msgBlob, &signData), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoVerify_Create(reinterpret_cast<const char*>("RSA512|PKCS1|MD5"), &verify), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoVerify_Init(verify, pubKey), CRYPTO_SUCCESS);
    EXPECT_FALSE(OH_CryptoVerify_Final(verify, (Crypto_DataBlob *)&msgBlob, (Crypto_DataBlob *)&signData));
    
    OH_CryptoSign_Destroy(signObj);
    OH_CryptoRand_Destroy(randomObj);
    OH_CryptoVerify_Destroy(verify);
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
    OH_CryptoKeyPair_Destroy(keyPair);
    HcfBlobDataClearAndFree(&signData);
    HcfBlobDataClearAndFree(&msgBlob);
    return 0;
}

int SubCryptoFrameworkNapiVerifyTest1500()
{
    OH_CryptoSign *signObj = nullptr;
    OH_CryptoAsymKeyGenerator *keyCtx_A = nullptr;
    OH_CryptoKeyPair *keyPair_A = nullptr;
    OH_CryptoAsymKeyGenerator *keyCtx_B = nullptr;
    OH_CryptoKeyPair *keyPair_B = nullptr;
    Crypto_DataBlob signData = {.data = nullptr, .len = 0};
    OH_CryptoVerify *verify = nullptr;
    int32_t msgLen = 16;
    OH_CryptoRand *randomObj = nullptr;
    Crypto_DataBlob msgBlob = {0};

    OH_CryptoRand_Create(&randomObj);
    EXPECT_TRUE(randomObj != nullptr);
    EXPECT_EQ(OH_CryptoRand_GenerateRandom(randomObj, msgLen, &msgBlob), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Create(reinterpret_cast<const char*>("RSA768"), &keyCtx_A), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Generate(keyCtx_A, &keyPair_A), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Create(reinterpret_cast<const char*>("RSA768"), &keyCtx_B), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Generate(keyCtx_B, &keyPair_B), CRYPTO_SUCCESS);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair_B);
    EXPECT_EQ(OH_CryptoSign_Create(reinterpret_cast<const char*>("RSA768|PKCS1|SHA256"), &signObj), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_Init(signObj, OH_CryptoKeyPair_GetPrivKey(keyPair_A)), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_Final(signObj, &msgBlob, &signData), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoVerify_Create(reinterpret_cast<const char*>("RSA768|PKCS1|SHA256"), &verify), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoVerify_Init(verify, pubKey), CRYPTO_SUCCESS);
    EXPECT_FALSE(OH_CryptoVerify_Final(verify, (Crypto_DataBlob *)&msgBlob, (Crypto_DataBlob *)&signData));
    
    OH_CryptoSign_Destroy(signObj);
    OH_CryptoRand_Destroy(randomObj);
    OH_CryptoVerify_Destroy(verify);
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx_A);
    OH_CryptoKeyPair_Destroy(keyPair_A);
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx_B);
    OH_CryptoKeyPair_Destroy(keyPair_B);
    HcfBlobDataClearAndFree(&signData);
    HcfBlobDataClearAndFree(&msgBlob);
    return 0;
}

int SubCryptoFrameworkNapiVerifyTest1600()
{
    OH_CryptoSign *signObj = nullptr;
    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    Crypto_DataBlob signData = {.data = nullptr, .len = 0};
    OH_CryptoVerify *verify = nullptr;
    int32_t msgLen = OH_CRYPTO_MD5_DIGESTSIZE;
    OH_CryptoRand *randomObj = nullptr;
    Crypto_DataBlob msgBlob = {0};
    Crypto_DataBlob rawSignData = {.data = nullptr, .len = 0};

    OH_CryptoRand_Create(&randomObj);
    EXPECT_TRUE(randomObj != nullptr);
    EXPECT_EQ(OH_CryptoRand_GenerateRandom(randomObj, msgLen, &msgBlob), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Create(reinterpret_cast<const char*>("RSA512"), &keyCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Generate(keyCtx, &keyPair), CRYPTO_SUCCESS);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    EXPECT_EQ(OH_CryptoSign_Create(reinterpret_cast<const char*>("RSA512|PKCS1|MD5|OnlySign"), &signObj), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_Init(signObj, OH_CryptoKeyPair_GetPrivKey(keyPair)), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_Final(signObj, &msgBlob, &signData), HCF_SUCCESS);
    signData.data[signData.len-1]--;
    EXPECT_EQ(OH_CryptoVerify_Create(reinterpret_cast<const char*>("RSA512|PKCS1|MD5|Recover"),
        &verify), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoVerify_Init(verify, pubKey), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoVerify_Recover(verify, (Crypto_DataBlob *)&signData, &rawSignData), CRYPTO_OPERTION_ERROR);
    
    OH_CryptoSign_Destroy(signObj);
    OH_CryptoRand_Destroy(randomObj);
    OH_CryptoVerify_Destroy(verify);
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
    OH_CryptoKeyPair_Destroy(keyPair);
    HcfBlobDataClearAndFree(&signData);
    OH_Crypto_FreeDataBlob(&rawSignData);
    HcfBlobDataClearAndFree(&msgBlob);
    return 0;
}

int SubCryptoFrameworkNapiVerifyTest1700()
{
    OH_CryptoSign *signObj = nullptr;
    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    Crypto_DataBlob signData = {.data = nullptr, .len = 0};
    OH_CryptoVerify *verify = nullptr;
    int32_t msgLen = OH_CRYPTO_SHA1_DIGESTSIZE;
    OH_CryptoRand *randomObj = nullptr;
    Crypto_DataBlob msgBlob = {0};
    Crypto_DataBlob rawSignData = {.data = nullptr, .len = 0};

    OH_CryptoRand_Create(&randomObj);
    EXPECT_TRUE(randomObj != nullptr);
    EXPECT_EQ(OH_CryptoRand_GenerateRandom(randomObj, msgLen, &msgBlob), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Create(reinterpret_cast<const char*>("RSA768"),
        &keyCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Generate(keyCtx, &keyPair), CRYPTO_SUCCESS);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    EXPECT_EQ(OH_CryptoSign_Create(reinterpret_cast<const char*>("RSA768|PKCS1|SHA1|OnlySign"),
        &signObj), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_Init(signObj, OH_CryptoKeyPair_GetPrivKey(keyPair)), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_Final(signObj, &msgBlob, &signData), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoVerify_Create(reinterpret_cast<const char*>("RSA1024|PKCS1|SHA1|Recover"),
        &verify), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoVerify_Init(verify, pubKey), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoVerify_Recover(verify, (Crypto_DataBlob *)&signData, &rawSignData), CRYPTO_SUCCESS);
    
    OH_CryptoSign_Destroy(signObj);
    OH_CryptoRand_Destroy(randomObj);
    OH_CryptoVerify_Destroy(verify);
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
    OH_CryptoKeyPair_Destroy(keyPair);
    HcfBlobDataClearAndFree(&signData);
    OH_Crypto_FreeDataBlob(&rawSignData);
    HcfBlobDataClearAndFree(&msgBlob);
    return 0;
}

int SubCryptoFrameworkNapiVerifyTest1800()
{
    OH_CryptoSign *signObj = nullptr;
    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    Crypto_DataBlob signData = {.data = nullptr, .len = 0};
    OH_CryptoVerify *verify = nullptr;
    int32_t msgLen = OH_CRYPTO_SHA224_DIGESTSIZE;
    OH_CryptoRand *randomObj = nullptr;
    Crypto_DataBlob msgBlob = {0};
    Crypto_DataBlob rawSignData = {.data = nullptr, .len = 0};

    OH_CryptoRand_Create(&randomObj);
    EXPECT_TRUE(randomObj != nullptr);
    EXPECT_EQ(OH_CryptoRand_GenerateRandom(randomObj, msgLen, &msgBlob), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Create(reinterpret_cast<const char*>("RSA1024"),
        &keyCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Generate(keyCtx, &keyPair), CRYPTO_SUCCESS);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    EXPECT_EQ(OH_CryptoSign_Create(reinterpret_cast<const char*>("RSA1024|PKCS1|SHA224|OnlySign"),
        &signObj), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_Init(signObj, OH_CryptoKeyPair_GetPrivKey(keyPair)), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_Final(signObj, &msgBlob, &signData), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoVerify_Create(reinterpret_cast<const char*>("RSA1024|PKCS1|SHA256|Recover"),
        &verify), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoVerify_Init(verify, pubKey), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoVerify_Recover(verify, (Crypto_DataBlob *)&signData, &rawSignData), CRYPTO_OPERTION_ERROR);
    
    OH_CryptoSign_Destroy(signObj);
    OH_CryptoRand_Destroy(randomObj);
    OH_CryptoVerify_Destroy(verify);
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
    OH_CryptoKeyPair_Destroy(keyPair);
    HcfBlobDataClearAndFree(&signData);
    OH_Crypto_FreeDataBlob(&rawSignData);
    HcfBlobDataClearAndFree(&msgBlob);
    return 0;
}

int SubCryptoFrameworkNapiVerifyTest1900()
{
    OH_CryptoSign *signObj = nullptr;
    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    Crypto_DataBlob signData = {.data = nullptr, .len = 0};
    OH_CryptoVerify *verify = nullptr;
    int32_t msgLen = 64;
    OH_CryptoRand *randomObj = nullptr;
    Crypto_DataBlob msgBlob = {0};
    Crypto_DataBlob rawSignData = {.data = nullptr, .len = 0};
    OH_CryptoDigest *ctx = nullptr;
    Crypto_DataBlob out = {.data = nullptr, .len = 0};

    OH_CryptoRand_Create(&randomObj);
    EXPECT_TRUE(randomObj != nullptr);
    EXPECT_EQ(OH_CryptoRand_GenerateRandom(randomObj, msgLen, &msgBlob), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Create(reinterpret_cast<const char*>("RSA512"),
        &keyCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Generate(keyCtx, &keyPair), CRYPTO_SUCCESS);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    EXPECT_EQ(OH_CryptoSign_Create(reinterpret_cast<const char*>("RSA512|PKCS1|MD5"),
        &signObj), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_Init(signObj, OH_CryptoKeyPair_GetPrivKey(keyPair)),
        HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_Final(signObj, &msgBlob, &signData), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoVerify_Create(reinterpret_cast<const char*>("RSA512|PKCS1|MD5|Recover"),
        &verify), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoVerify_Init(verify, pubKey), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoVerify_Recover(verify, (Crypto_DataBlob *)&signData, &rawSignData),
        CRYPTO_SUCCESS);
    EXPECT_EQ(rawSignData.len, OH_CRYPTO_MD5_DIGESTSIZE);
    EXPECT_EQ(OH_CryptoDigest_Create(reinterpret_cast<const char*>("MD5"), &ctx),
        CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoDigest_Update(ctx, (Crypto_DataBlob *)&msgBlob),
        CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoDigest_Final(ctx, &out), CRYPTO_SUCCESS);
    EXPECT_TRUE(memcmp(out.data, rawSignData.data, out.len) == 0);

    OH_DigestCrypto_Destroy(ctx);
    OH_CryptoSign_Destroy(signObj);
    OH_CryptoRand_Destroy(randomObj);
    OH_CryptoVerify_Destroy(verify);
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
    OH_CryptoKeyPair_Destroy(keyPair);
    HcfBlobDataClearAndFree(&signData);
    OH_Crypto_FreeDataBlob(&rawSignData);
    OH_Crypto_FreeDataBlob(&out);
    HcfBlobDataClearAndFree(&msgBlob);
    return 0;
}

int SubCryptoFrameworkNapiVerifyTest2000()
{
    OH_CryptoSign *signObj = nullptr;
    OH_CryptoAsymKeyGenerator *keyCtx_A = nullptr;
    OH_CryptoKeyPair *keyPair_A = nullptr;
    OH_CryptoAsymKeyGenerator *keyCtx_B = nullptr;
    OH_CryptoKeyPair *keyPair_B = nullptr;
    Crypto_DataBlob signData = {.data = nullptr, .len = 0};
    OH_CryptoVerify *verify = nullptr;
    int32_t msgLen = 20;
    OH_CryptoRand *randomObj = nullptr;
    Crypto_DataBlob msgBlob = {0};
    Crypto_DataBlob rawSignData = {.data = nullptr, .len = 0};

    OH_CryptoRand_Create(&randomObj);
    EXPECT_TRUE(randomObj != nullptr);
    EXPECT_EQ(OH_CryptoRand_GenerateRandom(randomObj, msgLen, &msgBlob), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Create(reinterpret_cast<const char*>("RSA1024"),
        &keyCtx_A), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Generate(keyCtx_A, &keyPair_A), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Create(reinterpret_cast<const char*>("RSA1024"),
        &keyCtx_B), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Generate(keyCtx_B, &keyPair_B), CRYPTO_SUCCESS);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair_B);
    EXPECT_EQ(OH_CryptoSign_Create(reinterpret_cast<const char*>("RSA1024|PKCS1|SHA1|OnlySign"),
        &signObj), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_Init(signObj, OH_CryptoKeyPair_GetPrivKey(keyPair_A)), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_Final(signObj, &msgBlob, &signData), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoVerify_Create(reinterpret_cast<const char*>("RSA1024|PKCS1|SHA1|Recover"),
        &verify), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoVerify_Init(verify, pubKey), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoVerify_Recover(verify, (Crypto_DataBlob *)&signData, &rawSignData),
        CRYPTO_OPERTION_ERROR);

    OH_CryptoSign_Destroy(signObj);
    OH_CryptoRand_Destroy(randomObj);
    OH_CryptoVerify_Destroy(verify);
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx_A);
    OH_CryptoKeyPair_Destroy(keyPair_A);
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx_B);
    OH_CryptoKeyPair_Destroy(keyPair_B);
    HcfBlobDataClearAndFree(&signData);
    OH_Crypto_FreeDataBlob(&rawSignData);
    HcfBlobDataClearAndFree(&msgBlob);
    return 0;
}

int SubCryptoFrameworkNapiVerifyTest2100()
{
    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_CryptoVerify *verify = nullptr;

    uint8_t plainText[] = {
        0xe4, 0x2b, 0xcc, 0x08, 0x11, 0x79, 0x16, 0x1b, 0x35, 0x7f, 0xb3, 0xaf, 0x40, 0x3b, 0x3f, 0x7c
    };
    Crypto_DataBlob msgBlob = {
        .data = reinterpret_cast<uint8_t *>(plainText),
        .len = sizeof(plainText)
    };
    uint8_t pubKeyText[] = {
        0x30, 0x39, 0x30, 0x13, 0x06, 0x07, 0x2a, 0x86, 0x48, 0xce, 0x3d, 0x02, 0x01, 0x06, 0x08, 0x2a,
        0x86, 0x48, 0xce, 0x3d, 0x03, 0x01, 0x07, 0x03, 0x22, 0x00, 0x03, 0x4d, 0xe4, 0xbb, 0x11, 0x10,
        0x1a, 0xd2, 0x05, 0x74, 0xf1, 0x0b, 0xb4, 0x75, 0x57, 0xf4, 0x3e, 0x55, 0x14, 0x17, 0x05, 0x4a,
        0xb2, 0xfb, 0x8c, 0x84, 0x64, 0x38, 0x02, 0xa0, 0x2a, 0xa6, 0xf0
    };
    Crypto_DataBlob keyBlob = {
        .data = reinterpret_cast<uint8_t *>(pubKeyText),
        .len = sizeof(pubKeyText)
    };
    uint8_t signText[] = {
        0x30, 0x44, 0x02, 0x20, 0x21, 0x89, 0x99, 0xb1, 0x56, 0x4e, 0x3a, 0x2c, 0x16, 0x08, 0xb5, 0x8a,
        0x06, 0x6f, 0x67, 0x47, 0x1b, 0x04, 0x18, 0x7d, 0x53, 0x2d, 0xba, 0x00, 0x38, 0xd9, 0xe3, 0xe7,
        0x8c, 0xcf, 0x76, 0x83, 0x02, 0x20, 0x13, 0x54, 0x84, 0x9d, 0x73, 0x40, 0xc3, 0x92, 0x66, 0xdc,
        0x3e, 0xc9, 0xf1, 0x4c, 0x33, 0x84, 0x2a, 0x76, 0xaf, 0xc6, 0x61, 0x84, 0x5c, 0xae, 0x4b, 0x0d,
        0x3c, 0xb0, 0xc8, 0x04, 0x89, 0x71
    };
    Crypto_DataBlob signBlob = {
        .data = reinterpret_cast<uint8_t *>(signText),
        .len = sizeof(signText)
    };
    
    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Create(reinterpret_cast<const char*>("ECC256"), &keyCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Convert(keyCtx, CRYPTO_DER, &keyBlob, nullptr, &keyPair), CRYPTO_SUCCESS);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    EXPECT_EQ(OH_CryptoVerify_Create(reinterpret_cast<const char*>("ECC|SHA256"), &verify), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoVerify_Init(verify, pubKey), CRYPTO_SUCCESS);
    EXPECT_TRUE(OH_CryptoVerify_Final(verify, &msgBlob, &signBlob));

    OH_CryptoVerify_Destroy(verify);
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
    OH_CryptoKeyPair_Destroy(keyPair);
    return 0;
}

static void InitVerifyTestParams(Crypto_DataBlob *mdBlob, Crypto_DataBlob *mfgBlob,
    Crypto_DataBlob *mgf1MddBlob, Crypto_DataBlob *saltBlob1, Crypto_DataBlob *saltBlob2)
{
    uint8_t mdText[] = "MD5";
    *mdBlob = {.data = mdText, .len = sizeof(mdText)};
    uint8_t mfgText[] = "MGF1";
    *mfgBlob = {.data = mfgText, .len = sizeof(mfgText)};
    uint8_t mfG1MdText[] = "SHA1";
    *mgf1MddBlob = {.data = mfG1MdText, .len = sizeof(mfG1MdText)};
    int32_t salt1 = VALUE_32;
    int32_t salt2 = VALUE_NEGATIVE;
    *saltBlob1 = {.data = (uint8_t *)&salt1, .len = sizeof(int32_t)};
    *saltBlob2 = {.data = (uint8_t *)&salt2, .len = sizeof(int32_t)};
}

static void InitVerifyTestData(Crypto_DataBlob *msgBlob)
{
    OH_CryptoRand *randomObj = nullptr;
    OH_CryptoRand_Create(&randomObj);
    EXPECT_TRUE(randomObj != nullptr);
    EXPECT_EQ(OH_CryptoRand_GenerateRandom(randomObj, VALUE_16, msgBlob), HCF_SUCCESS);
    OH_CryptoRand_Destroy(randomObj);
}

static OH_CryptoKeyPair* CreateVerifyKeyPair()
{
    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Create("RSA512", &keyCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Generate(keyCtx, &keyPair), HCF_SUCCESS);
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
    return keyPair;
}

static void SignTestData(OH_CryptoKeyPair *keyPair, Crypto_DataBlob *msgBlob, Crypto_DataBlob *signData)
{
    OH_CryptoSign *signObj = nullptr;
    EXPECT_EQ(OH_CryptoSign_Create("RSA512|PSS|MD5|MGF1_SHA1", &signObj), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_Init(signObj, OH_CryptoKeyPair_GetPrivKey(keyPair)), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_Final(signObj, msgBlob, signData), HCF_SUCCESS);
    OH_CryptoSign_Destroy(signObj);
}

static void VerifyTestParams(OH_CryptoVerify *verify, Crypto_DataBlob *blob[])
{
    EXPECT_EQ(OH_CryptoVerify_SetParam(verify, CRYPTO_PSS_MD_NAME_STR, blob[VALUE_0]),
        CRYPTO_NOT_SUPPORTED);
    EXPECT_EQ(OH_CryptoVerify_SetParam(verify, CRYPTO_PSS_MGF_NAME_STR, blob[VALUE_1]),
        CRYPTO_NOT_SUPPORTED);
    EXPECT_EQ(OH_CryptoVerify_SetParam(verify, CRYPTO_PSS_MGF1_NAME_STR, blob[VALUE_2]),
        CRYPTO_NOT_SUPPORTED);
    EXPECT_EQ(OH_CryptoVerify_SetParam(verify, CRYPTO_PSS_SALT_LEN_INT, blob[VALUE_3]),
        CRYPTO_SUCCESS);
}

static void VerifyFinalCheck(OH_CryptoVerify *verify, OH_CryptoPubKey *pubKey,
    Crypto_DataBlob *msgBlob, Crypto_DataBlob *signData, Crypto_DataBlob *saltBlob2)
{
    EXPECT_EQ(OH_CryptoVerify_Init(verify, pubKey), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoVerify_SetParam(verify, CRYPTO_PSS_SALT_LEN_INT, saltBlob2), CRYPTO_SUCCESS);
    Crypto_DataBlob tmp = {.data = nullptr, .len = 0};
    EXPECT_EQ(OH_CryptoVerify_GetParam(verify, CRYPTO_PSS_MD_NAME_STR, &tmp), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoVerify_GetParam(verify, CRYPTO_PSS_MGF_NAME_STR, &tmp), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoVerify_GetParam(verify, CRYPTO_PSS_MGF1_NAME_STR, &tmp), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoVerify_GetParam(verify, CRYPTO_PSS_TRAILER_FIELD_INT, &tmp), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoVerify_GetParam(verify, CRYPTO_PSS_SALT_LEN_INT, &tmp), CRYPTO_SUCCESS);
    EXPECT_FALSE(OH_CryptoVerify_Final(verify, msgBlob, signData));
}

static void ReleaseVerifyResources(OH_CryptoVerify *verify, OH_CryptoKeyPair *keyPair,
    Crypto_DataBlob blobs[], int count)
{
    OH_CryptoVerify_Destroy(verify);
    OH_CryptoKeyPair_Destroy(keyPair);
    for (int i = 0; i < count; i++) {
        HcfBlobDataClearAndFree(&blobs[i]);
        OH_Crypto_FreeDataBlob(&blobs[i]);
    }
}

int SubCryptoFrameworkNapiVerifyTest2200()
{
    OH_CryptoVerify *verify = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    Crypto_DataBlob msgBlob = {0};
    Crypto_DataBlob signData = {nullptr, 0};
    Crypto_DataBlob mdBlob;
    Crypto_DataBlob mfgBlob;
    Crypto_DataBlob mgf1MddBlob;
    Crypto_DataBlob saltBlob1;
    Crypto_DataBlob saltBlob2;

    InitVerifyTestParams(&mdBlob, &mfgBlob, &mgf1MddBlob, &saltBlob1, &saltBlob2);
    InitVerifyTestData(&msgBlob);
    keyPair = CreateVerifyKeyPair();
    SignTestData(keyPair, &msgBlob, &signData);

    EXPECT_EQ(OH_CryptoVerify_Create("RSA512|PSS|SHA1|MGF1_MD5", &verify), CRYPTO_SUCCESS);
    Crypto_DataBlob *blob[] = {&mdBlob, &mfgBlob, &mgf1MddBlob, &saltBlob1};
    VerifyTestParams(verify, blob);
    VerifyFinalCheck(verify, OH_CryptoKeyPair_GetPubKey(keyPair), &msgBlob, &signData, &saltBlob2);

    Crypto_DataBlob blobs[] = {msgBlob, signData};
    ReleaseVerifyResources(verify, keyPair, blobs, VALUE_2);
    return 0;
}

int SubCryptoFrameworkNapiVerifyTest2300()
{
    OH_CryptoSign *signObj = nullptr;
    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    int32_t msgLen = VALUE_16;
    OH_CryptoRand *randomObj = nullptr;
    Crypto_DataBlob msgBlob = {0};
    Crypto_DataBlob signData = {.data = nullptr, .len = 0};
    OH_CryptoVerify *verify = nullptr;

    OH_CryptoRand_Create(&randomObj);
    EXPECT_TRUE(randomObj != nullptr);
    EXPECT_EQ(OH_CryptoRand_GenerateRandom(randomObj, msgLen, &msgBlob), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Create(reinterpret_cast<const char*>("RSA2048"),
        &keyCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Generate(keyCtx, &keyPair), CRYPTO_SUCCESS);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    Crypto_DataBlob retBlob = { .data = nullptr, .len = 0 };
    EXPECT_EQ(OH_CryptoPubKey_Encode(pubKey, CRYPTO_PEM, "PKCS1", &retBlob), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_Create(reinterpret_cast<const char*>("RSA2048|PSS|SHA256|MGF1_SHA256"),
        &signObj), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_Init(signObj, OH_CryptoKeyPair_GetPrivKey(keyPair)), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_Final(signObj, &msgBlob, &signData), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoVerify_Create(reinterpret_cast<const char*>("RSA2048|PSS|SHA256|MGF1_SHA256"),
        &verify), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoVerify_Init(verify, pubKey), CRYPTO_SUCCESS);
    EXPECT_TRUE(OH_CryptoVerify_Final(verify, (Crypto_DataBlob *)&msgBlob, (Crypto_DataBlob *)&signData));

    OH_CryptoSign_Destroy(signObj);
    OH_CryptoVerify_Destroy(verify);
    OH_CryptoRand_Destroy(randomObj);
    OH_Crypto_FreeDataBlob(&retBlob);
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
    OH_CryptoKeyPair_Destroy(keyPair);
    HcfBlobDataClearAndFree(&msgBlob);
    HcfBlobDataClearAndFree(&signData);
    return 0;
}

int SubCryptoFrameworkNapiVerifyTest2400()
{
    OH_CryptoSign *signObj = nullptr;
    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    Crypto_DataBlob signData = {.data = nullptr, .len = 0};
    OH_CryptoVerify *verify = nullptr;
    int32_t msgLen = 32;
    OH_CryptoRand *randomObj = nullptr;
    Crypto_DataBlob msgBlob = {0};
    Crypto_DataBlob rawSignData = {.data = nullptr, .len = 0};

    OH_CryptoRand_Create(&randomObj);
    EXPECT_TRUE(randomObj != nullptr);
    EXPECT_EQ(OH_CryptoRand_GenerateRandom(randomObj, msgLen, &msgBlob), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Create(reinterpret_cast<const char*>("RSA1024"),
        &keyCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Generate(keyCtx, &keyPair), CRYPTO_SUCCESS);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    Crypto_DataBlob retBlob = { .data = nullptr, .len = 0 };
    EXPECT_EQ(OH_CryptoPubKey_Encode(pubKey, CRYPTO_PEM, "PKCS1", &retBlob), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_Create(reinterpret_cast<const char*>("RSA1024|PKCS1|SHA256|OnlySign"),
        &signObj), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_Init(signObj, OH_CryptoKeyPair_GetPrivKey(keyPair)), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_Final(signObj, &msgBlob, &signData), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoVerify_Create(reinterpret_cast<const char*>("RSA1024|PKCS1|SHA256|Recover"),
        &verify), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoVerify_Init(verify, pubKey), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoVerify_Recover(verify, (Crypto_DataBlob *)&signData, &rawSignData),
        CRYPTO_SUCCESS);
    
    OH_CryptoVerify_Destroy(verify);
    OH_Crypto_FreeDataBlob(&rawSignData);
    OH_CryptoSign_Destroy(signObj);
    OH_Crypto_FreeDataBlob(&retBlob);
    OH_Crypto_FreeDataBlob((Crypto_DataBlob *)&msgBlob);
    OH_CryptoRand_Destroy(randomObj);
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
    OH_CryptoKeyPair_Destroy(keyPair);
    HcfBlobDataClearAndFree(&signData);
    return 0;
}

int SubCryptoFrameworkNapiVerifyTest2500()
{
    OH_CryptoSign *signObj = nullptr;
    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    int32_t msgLen = 32;
    OH_CryptoRand *randomObj = nullptr;
    Crypto_DataBlob msgBlob = {0};
    Crypto_DataBlob signData = {.data = nullptr, .len = 0};
    OH_CryptoVerify *verify = nullptr;

    OH_CryptoRand_Create(&randomObj);
    EXPECT_TRUE(randomObj != nullptr);
    EXPECT_EQ(OH_CryptoRand_GenerateRandom(randomObj, msgLen, &msgBlob), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Create(reinterpret_cast<const char*>("SM2_256"), &keyCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Generate(keyCtx, &keyPair), CRYPTO_SUCCESS);
    OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
    Crypto_DataBlob retBlob = { .data = nullptr, .len = 0 };
    EXPECT_EQ(OH_CryptoPubKey_Encode(pubKey, CRYPTO_DER, nullptr, &retBlob), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_Create(reinterpret_cast<const char*>("SM2_256|SM3"), &signObj), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_Init(signObj, OH_CryptoKeyPair_GetPrivKey(keyPair)), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_Final(signObj, &msgBlob, &signData), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoVerify_Create(reinterpret_cast<const char*>("SM2_256|SM3"), &verify), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoVerify_Init(verify, pubKey), CRYPTO_SUCCESS);
    EXPECT_TRUE(OH_CryptoVerify_Final(verify, (Crypto_DataBlob *)&msgBlob, (Crypto_DataBlob *)&signData));

    OH_CryptoSign_Destroy(signObj);
    OH_CryptoVerify_Destroy(verify);
    OH_CryptoRand_Destroy(randomObj);
    OH_Crypto_FreeDataBlob(&retBlob);
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
    OH_CryptoKeyPair_Destroy(keyPair);
    HcfBlobDataClearAndFree(&msgBlob);
    HcfBlobDataClearAndFree(&signData);
    return 0;
}

static void InitVerifyBlobData(Crypto_DataBlob *msgBlob)
{
    OH_CryptoRand *randomObj = nullptr;
    OH_CryptoRand_Create(&randomObj);
    EXPECT_TRUE(randomObj != nullptr);

    EXPECT_EQ(OH_CryptoRand_GenerateRandom(
        randomObj, VALUE_64, msgBlob), HCF_SUCCESS);
    OH_CryptoRand_Destroy(randomObj);
}
static OH_CryptoKeyPair* CreateVerifyKeyPair(
    OH_CryptoAsymKeyGenerator **keyCtx)
{
    OH_CryptoKeyPair *keyPair = nullptr;
    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Create(
        "RSA1024", keyCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Generate(
        *keyCtx, &keyPair), CRYPTO_SUCCESS);
    return keyPair;
}
static void EncodePubKeyData(OH_CryptoPubKey *pubKey)
{
    Crypto_DataBlob retBlob = { .data = nullptr, .len = 0 };
    EXPECT_EQ(OH_CryptoPubKey_Encode(
        pubKey, CRYPTO_PEM, "PKCS1", &retBlob), CRYPTO_SUCCESS);
    OH_Crypto_FreeDataBlob(&retBlob);
}
static void DoSignUpdateFinal(OH_CryptoSign *signObj,
    Crypto_DataBlob *msgBlob, Crypto_DataBlob *signData)
{
    int blockSize = 20;
    int cntS = 64 / blockSize;
    int remS = 64 % blockSize;
    for (int i = 0; i < cntS; i++) {
        msgBlob->len = blockSize;
        EXPECT_EQ(OH_CryptoSign_Update(
            signObj, msgBlob), HCF_SUCCESS);
        msgBlob->data += blockSize;
    }
    if (remS > 0) {
        msgBlob->len = remS;
        EXPECT_EQ(OH_CryptoSign_Final(
            signObj, msgBlob, signData), HCF_SUCCESS);
    }
}
static void DoVerifyUpdateFinal(OH_CryptoVerify *verify,
    Crypto_DataBlob *msgBlob, Crypto_DataBlob *signData)
{
    int blockSize = 20;
    int cntS = 64 / blockSize;
    int remS = 64 % blockSize;
    for (int i = 0; i < cntS; i++) {
        msgBlob->len = blockSize;
        EXPECT_EQ(OH_CryptoVerify_Update(
            verify, msgBlob), CRYPTO_SUCCESS);
        msgBlob->data += blockSize;
    }
    if (remS > 0) {
        msgBlob->len = remS;
        EXPECT_TRUE(OH_CryptoVerify_Final(
            verify, msgBlob, signData));
    }
}
static void ReleaseVerifyCoreRes(OH_CryptoSign *signObj,
    OH_CryptoVerify *verify, OH_CryptoAsymKeyGenerator *keyCtx,
    OH_CryptoKeyPair *keyPair)
{
    OH_CryptoSign_Destroy(signObj);
    OH_CryptoVerify_Destroy(verify);
    OH_CryptoAsymKeyGenerator_Destroy(keyCtx);
    OH_CryptoKeyPair_Destroy(keyPair);
}
static void FreeVerifyBlobData(Crypto_DataBlob *msgBlob,
    Crypto_DataBlob *signData)
{
    HcfBlobDataClearAndFree(msgBlob);
    HcfBlobDataClearAndFree(signData);
}
int SubCryptoFrameworkNapiVerifyTest2600()
{
    OH_CryptoSign *signObj = nullptr;
    OH_CryptoVerify *verify = nullptr;
    OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    Crypto_DataBlob msgBlob = {0};
    Crypto_DataBlob signData = {
        .data = nullptr, .len = 0
    };
    InitVerifyBlobData(&msgBlob);
    keyPair = CreateVerifyKeyPair(&keyCtx);
    OH_CryptoPubKey *pubKey =
        OH_CryptoKeyPair_GetPubKey(keyPair);
    EncodePubKeyData(pubKey);
    EXPECT_EQ(OH_CryptoSign_Create(
        "RSA1024|PKCS1|SHA256", &signObj), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_Init(
        signObj, OH_CryptoKeyPair_GetPrivKey(keyPair)),
        HCF_SUCCESS);
    DoSignUpdateFinal(signObj, &msgBlob, &signData);
    msgBlob.data -= VALUE_64 - (msgBlob.len % VALUE_20);
    msgBlob.len = VALUE_64;
    EXPECT_EQ(OH_CryptoVerify_Create(
        "RSA1024|PKCS1|SHA256", &verify), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoVerify_Init(
        verify, pubKey), CRYPTO_SUCCESS);
    DoVerifyUpdateFinal(verify, &msgBlob, &signData);
    msgBlob.data -= VALUE_64 - (msgBlob.len % VALUE_20);
    msgBlob.len = VALUE_64;
    ReleaseVerifyCoreRes(signObj, verify, keyCtx, keyPair);
    FreeVerifyBlobData(&msgBlob, &signData);
    return 0;
}

static void InitVerifyMsgData(int32_t msgLen, Crypto_DataBlob *msgBlob)
{
    OH_CryptoRand *randomObj = nullptr;
    OH_CryptoRand_Create(&randomObj);
    EXPECT_TRUE(randomObj != nullptr);
    EXPECT_EQ(OH_CryptoRand_GenerateRandom(randomObj, msgLen, msgBlob), HCF_SUCCESS);
    OH_CryptoRand_Destroy(randomObj);
}

static OH_CryptoKeyPair* CreateVerifyKeyPair2(VerifySpec data, OH_CryptoAsymKeyGenerator **keyCtx)
{
    OH_CryptoKeyPair *keyPair = nullptr;
    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Create(reinterpret_cast<const char*>(data.keyAlgName),
        keyCtx), CRYPTO_SUCCESS);
    if (!strcmp(reinterpret_cast<const char*>(data.keyAlgName), "RSA8192")) {
        Crypto_DataBlob priKeyBlob = {g_rsa8192PriKey, sizeof(g_rsa8192PriKey)};
        EXPECT_EQ(OH_CryptoAsymKeyGenerator_Convert(*keyCtx, CRYPTO_DER, nullptr, &priKeyBlob,
            &keyPair), CRYPTO_SUCCESS);
    } else if (!strcmp(reinterpret_cast<const char*>(data.keyAlgName), "RSA4096")) {
        Crypto_DataBlob priKeyBlob = {g_rsa4096PriKey, sizeof(g_rsa4096PriKey)};
        EXPECT_EQ(OH_CryptoAsymKeyGenerator_Convert(*keyCtx, CRYPTO_DER, nullptr, &priKeyBlob,
            &keyPair), CRYPTO_SUCCESS);
    } else if (!strcmp(reinterpret_cast<const char*>(data.keyAlgName), "RSA3072")) {
        Crypto_DataBlob priKeyBlob = {g_rsa3072PriKey, sizeof(g_rsa3072PriKey)};
        EXPECT_EQ(OH_CryptoAsymKeyGenerator_Convert(*keyCtx, CRYPTO_DER, nullptr, &priKeyBlob,
            &keyPair), CRYPTO_SUCCESS);
    } else {
        EXPECT_EQ(OH_CryptoAsymKeyGenerator_Generate(*keyCtx, &keyPair), CRYPTO_SUCCESS);
    }
    return keyPair;
}

static void GetPubKeyParam(OH_CryptoPubKey *pubKey)
{
    Crypto_DataBlob n = {.data = nullptr, .len = 0};
    EXPECT_NE(pubKey, nullptr);
    EXPECT_EQ(OH_CryptoPubKey_GetParam(pubKey, CRYPTO_RSA_N_DATABLOB, &n), CRYPTO_SUCCESS);
    OH_Crypto_FreeDataBlob(&n);
}

static void DoSignProcess(VerifySpec data, OH_CryptoKeyPair *pair, Crypto_DataBlob *msg, Crypto_DataBlob *sign)
{
    OH_CryptoSign *signObj = nullptr;
    EXPECT_EQ(OH_CryptoSign_Create(reinterpret_cast<const char*>(data.signAlgName), &signObj), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_Init(signObj, OH_CryptoKeyPair_GetPrivKey(pair)), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_Final(signObj, msg, sign), HCF_SUCCESS);
    OH_CryptoSign_Destroy(signObj);
}

static void DoVerifyProcess(VerifySpec data, OH_CryptoPubKey *pub, Crypto_DataBlob *msg, Crypto_DataBlob *sign)
{
    OH_CryptoVerify *verify = nullptr;
    EXPECT_EQ(OH_CryptoVerify_Create(reinterpret_cast<const char*>(data.verifyAlgName), &verify), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoVerify_Init(verify, pub), CRYPTO_SUCCESS);
    EXPECT_TRUE(OH_CryptoVerify_Final(verify, msg, sign));
    const char *name = OH_CryptoVerify_GetAlgoName(verify);
    EXPECT_TRUE(!memcmp(name, reinterpret_cast<const char*>(data.verifyAlgName),
        strlen(reinterpret_cast<const char*>(data.verifyAlgName))));
    OH_CryptoVerify_Destroy(verify);
}

static void ReleaseVerifyAll2(OH_CryptoAsymKeyGenerator *ctx, OH_CryptoKeyPair *pair,
    Crypto_DataBlob *msg, Crypto_DataBlob *sign)
{
    OH_CryptoAsymKeyGenerator_Destroy(ctx);
    OH_CryptoKeyPair_Destroy(pair);
    HcfBlobDataClearAndFree(msg);
    HcfBlobDataClearAndFree(sign);
}

int SubCryptoFrameworkNapiVerifyTest2700()
{
    int count = VERIFY_PKCS1_DATA_COUNT;
    for (int i = 0; i < count; i++) {
        VerifySpec data = g_verifyPkcs1Data[i];
        OH_CryptoAsymKeyGenerator *keyCtx = nullptr;
        OH_CryptoKeyPair *keyPair = nullptr;
        Crypto_DataBlob msgBlob = {0};
        Crypto_DataBlob signData = {.data = nullptr, .len = 0};

        InitVerifyMsgData(data.msgLen, &msgBlob);
        keyPair = CreateVerifyKeyPair2(data, &keyCtx);
        OH_CryptoPubKey *pubKey = OH_CryptoKeyPair_GetPubKey(keyPair);
        GetPubKeyParam(pubKey);
        DoSignProcess(data, keyPair, &msgBlob, &signData);
        DoVerifyProcess(data, pubKey, &msgBlob, &signData);
        ReleaseVerifyAll2(keyCtx, keyPair, &msgBlob, &signData);
    }
    return 0;
}

} // namespace Unittest::CryptoFrameworkVerifyNapiTest