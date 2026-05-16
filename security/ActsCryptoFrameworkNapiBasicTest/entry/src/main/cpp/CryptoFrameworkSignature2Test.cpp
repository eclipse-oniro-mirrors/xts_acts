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


#include "include/CryptoFrameworkSignature2Test.h"
#include "include/CommonToolTest.h"
#include "include/Result.h"
#include <CryptoArchitectureKit/crypto_rand.h>
#include <native_drawing/drawing_text_blob.h>

namespace Unittest::CryptoFramework {
    
const int VALUE_2 = 2;
const int VALUE_16 = 16;

static OH_Crypto_ErrCode OHTEST_DoNoSegmentSign(const char *algoName,
    OH_CryptoPrivKey *privKey, Crypto_DataBlob *msgBlob, Crypto_DataBlob *signData)
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

static OH_Crypto_ErrCode OHTEST_DoSegmentSign(const char *algoName, OH_CryptoPrivKey *privKey,
    Crypto_DataBlob *msgBlob, Crypto_DataBlob *signData, int blockSize)
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

static bool OHTEST_DoSegmentVerify(const char *algoName, OH_CryptoPubKey *pubKey,
    Crypto_DataBlob *msgBlob, Crypto_DataBlob *signData, int blockSize)
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

int SubCryptoFrameworkNapiSignature2Test0100()
{
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_CryptoPrivKey *privKey = nullptr;
    const char *algoName = reinterpret_cast<const char*>("RSA512|PKCS1|SHA256|OnlySign");
    const char *asymAlgoName = reinterpret_cast<const char*>("RSA512");
    OH_CryptoRand *randomObj = nullptr;
    Crypto_DataBlob msgBlob = {.data = nullptr, .len = 0};
    Crypto_DataBlob signData = {.data = nullptr, .len = 0};
    int32_t msgLen = 32 + 1;
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

int SubCryptoFrameworkNapiSignature2Test0200()
{
    OH_CryptoSign *sign = nullptr;
    const char *algoName = reinterpret_cast<const char*>("SM9");

    EXPECT_EQ(OH_CryptoSign_Create(algoName, &sign), CRYPTO_PARAMETER_CHECK_FAILED);
    
    OH_CryptoSign_Destroy(sign);
    return 0;
}

int SubCryptoFrameworkNapiSignature2Test0300()
{
    OH_CryptoSign *sign = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_CryptoPrivKey *privKey = nullptr;
    const char *algoName = reinterpret_cast<const char*>("RSA512|PSS|SHA256|MGF1_SHA256");
    const char *asymAlgoName = reinterpret_cast<const char*>("RSA512");
    OH_CryptoRand *randomObj = nullptr;
    Crypto_DataBlob msgBlob = {.data = nullptr, .len = 0};
    Crypto_DataBlob signData = {.data = nullptr, .len = 0};
    int32_t msgLen = 16;
    int32_t saltText = 32;
    Crypto_DataBlob saltBlob = {
        .data = (uint8_t *)&saltText,
        .len = sizeof(int32_t)
    };
    int32_t trailerText = 1;
    Crypto_DataBlob trailerBlob = {
        .data = (uint8_t *)&trailerText,
        .len = sizeof(int32_t)
    };

    OH_CryptoRand_Create(&randomObj);
    EXPECT_TRUE(randomObj != nullptr);
    EXPECT_EQ(OH_CryptoRand_GenerateRandom(randomObj, msgLen, &msgBlob), HCF_SUCCESS);
    keyPair = OHTEST_GenAsymKey(asymAlgoName);
    EXPECT_TRUE(keyPair != nullptr);
    privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    EXPECT_TRUE(privKey != nullptr);
    EXPECT_EQ(OH_CryptoSign_Create(algoName, &sign), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_SetParam(sign, CRYPTO_PSS_SALT_LEN_INT, &saltBlob), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_SetParam(sign, CRYPTO_PSS_TRAILER_FIELD_INT, &trailerBlob), CRYPTO_PARAMETER_CHECK_FAILED);
    EXPECT_EQ(OH_CryptoSign_Init(sign, privKey), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_Final(sign, (Crypto_DataBlob *)&msgBlob, &signData), CRYPTO_OPERTION_ERROR);

    OH_CryptoSign_Destroy(sign);
    OH_CryptoRand_Destroy(randomObj);
    OH_CryptoKeyPair_Destroy(keyPair);
    OH_Crypto_FreeDataBlob((Crypto_DataBlob *)&msgBlob);
    OH_Crypto_FreeDataBlob(&signData);
    return 0;
}

int SubCryptoFrameworkNapiSignature2Test0400()
{
    OH_CryptoSign *sign = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_CryptoPrivKey *privKey = nullptr;
    OH_CryptoRand *randomObj = nullptr;
    const char *algoName = reinterpret_cast<const char*>("RSA512|PKCS1|SHA512");
    const char *asymAlgoName = reinterpret_cast<const char*>("RSA512");
    int32_t msgLen = 16;
    Crypto_DataBlob msgBlob = {.data = nullptr, .len = 0};
    Crypto_DataBlob signData = {.data = nullptr, .len = 0};

    OH_CryptoRand_Create(&randomObj);
    EXPECT_TRUE(randomObj != nullptr);
    EXPECT_EQ(OH_CryptoRand_GenerateRandom(randomObj, msgLen, &msgBlob), HCF_SUCCESS);
    keyPair = OHTEST_GenAsymKey(asymAlgoName);
    EXPECT_TRUE(keyPair != nullptr);
    privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    EXPECT_TRUE(privKey != nullptr);
    EXPECT_EQ(OH_CryptoSign_Create(algoName, &sign), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_Init(sign, privKey), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSign_Final(sign, (Crypto_DataBlob *)&msgBlob, &signData), CRYPTO_OPERTION_ERROR);
    
    OH_CryptoSign_Destroy(sign);
    OH_CryptoRand_Destroy(randomObj);
    OH_CryptoKeyPair_Destroy(keyPair);
    OH_Crypto_FreeDataBlob((Crypto_DataBlob *)&msgBlob);
    OH_Crypto_FreeDataBlob(&signData);
    return 0;
}

static void InitTestDataBlobs(Crypto_DataBlob *mdBlob, Crypto_DataBlob *mfgBlob,
    Crypto_DataBlob *mgf1MdBlob, Crypto_DataBlob *saltBlob1, Crypto_DataBlob *tarilerBlob)
{
    uint8_t mdText[] = "MD5";
    *mdBlob = (Crypto_DataBlob){.data = reinterpret_cast<uint8_t *>(mdText), .len = sizeof(mdText)};
    uint8_t mfgText[] = "MGF1";
    *mfgBlob = (Crypto_DataBlob){.data = reinterpret_cast<uint8_t *>(mfgText), .len = sizeof(mfgText)};
    uint8_t mfG1MdText[] = "SHA1";
    *mgf1MdBlob = (Crypto_DataBlob){.data = reinterpret_cast<uint8_t *>(mfG1MdText), .len = sizeof(mfG1MdText)};
    int32_t saltText1 = 32;
    *saltBlob1 = (Crypto_DataBlob){.data = (uint8_t *)&saltText1, .len = sizeof(int32_t)};
    int32_t tarilerText = -1;
    *tarilerBlob = (Crypto_DataBlob){.data = (uint8_t *)&tarilerText, .len = sizeof(int32_t)};
}

static OH_CryptoSign* PrepareSignContext(const char *algoName, OH_CryptoPrivKey *privKey)
{
    OH_CryptoSign *sign = nullptr;
    EXPECT_EQ(OH_CryptoSign_Create(algoName, &sign), CRYPTO_SUCCESS);
    return sign;
}

static void TestSignSetParams(OH_CryptoSign *sign, Crypto_DataBlob *mdBlob,
    Crypto_DataBlob *mfgBlob, Crypto_DataBlob *mgf1MdBlob, Crypto_DataBlob *tarilerBlob)
{
    EXPECT_EQ(OH_CryptoSign_SetParam(sign, CRYPTO_PSS_MD_NAME_STR, mdBlob), CRYPTO_NOT_SUPPORTED);
    EXPECT_EQ(OH_CryptoSign_SetParam(sign, CRYPTO_PSS_MGF_NAME_STR, mfgBlob), CRYPTO_NOT_SUPPORTED);
    EXPECT_EQ(OH_CryptoSign_SetParam(sign, CRYPTO_PSS_MGF1_NAME_STR, mgf1MdBlob), CRYPTO_NOT_SUPPORTED);
    EXPECT_EQ(OH_CryptoSign_SetParam(sign, CRYPTO_PSS_TRAILER_FIELD_INT, tarilerBlob), CRYPTO_PARAMETER_CHECK_FAILED);
}

static void TestSignInitAndExtraParams(OH_CryptoSign *sign, OH_CryptoPrivKey *privKey, Crypto_DataBlob *saltBlob1)
{
    EXPECT_EQ(OH_CryptoSign_Init(sign, privKey), CRYPTO_SUCCESS);
    Crypto_DataBlob data = {.data = nullptr, .len = 0};
    EXPECT_EQ(OH_CryptoSign_GetParam(sign, CRYPTO_PSS_SALT_LEN_INT, &data), CRYPTO_PARAMETER_CHECK_FAILED);
    EXPECT_EQ(OH_CryptoSign_SetParam(sign, CRYPTO_PSS_SALT_LEN_INT, saltBlob1), CRYPTO_PARAMETER_CHECK_FAILED);
}

static void TestSignFinalAndGetParams(OH_CryptoSign *sign, Crypto_DataBlob *msgBlob, Crypto_DataBlob *signData)
{
    EXPECT_EQ(OH_CryptoSign_Final(sign, msgBlob, signData), CRYPTO_SUCCESS);
    Crypto_DataBlob data = {.data = nullptr, .len = 0};
    EXPECT_EQ(OH_CryptoSign_GetParam(sign, CRYPTO_PSS_MD_NAME_STR, &data), CRYPTO_PARAMETER_CHECK_FAILED);
    EXPECT_EQ(OH_CryptoSign_GetParam(sign, CRYPTO_PSS_MGF_NAME_STR, &data), CRYPTO_PARAMETER_CHECK_FAILED);
    EXPECT_EQ(OH_CryptoSign_GetParam(sign, CRYPTO_PSS_MGF1_NAME_STR, &data), CRYPTO_PARAMETER_CHECK_FAILED);
    EXPECT_EQ(OH_CryptoSign_GetParam(sign, CRYPTO_PSS_SALT_LEN_INT, &data), CRYPTO_PARAMETER_CHECK_FAILED);
    EXPECT_EQ(OH_CryptoSign_GetParam(sign, CRYPTO_PSS_TRAILER_FIELD_INT, &data), CRYPTO_PARAMETER_CHECK_FAILED);
    EXPECT_EQ(OH_CryptoSign_GetParam(sign, CRYPTO_SM2_USER_ID_DATABLOB, &data), CRYPTO_PARAMETER_CHECK_FAILED);
}

static void CleanTestResources(OH_CryptoSign *sign, OH_CryptoRand *randomObj,
    OH_CryptoKeyPair *keyPair, Crypto_DataBlob *blobs[], int count)
{
    OH_CryptoSign_Destroy(sign);
    OH_CryptoRand_Destroy(randomObj);
    OH_CryptoKeyPair_Destroy(keyPair);
    for (int i = 0; i < count; i++) {
        OH_Crypto_FreeDataBlob(blobs[i]);
    }
}

int SubCryptoFrameworkNapiSignature2Test0500()
{
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_CryptoPrivKey *privKey = nullptr;
    OH_CryptoSign *sign = nullptr;
    const char *algoName = reinterpret_cast<const char*>("RSA512|PKCS1|SHA256");
    const char *asymAlgoName = reinterpret_cast<const char*>("RSA512");
    OH_CryptoRand *randomObj = nullptr;
    Crypto_DataBlob msgBlob = {.data = nullptr, .len = 0};
    Crypto_DataBlob signData = {.data = nullptr, .len = 0};
    Crypto_DataBlob mdBlob;
    Crypto_DataBlob mfgBlob;
    Crypto_DataBlob mgf1MdBlob;
    Crypto_DataBlob saltBlob1;
    Crypto_DataBlob tarilerBlob;

    OH_CryptoRand_Create(&randomObj);
    EXPECT_TRUE(randomObj != nullptr);
    EXPECT_EQ(OH_CryptoRand_GenerateRandom(randomObj, VALUE_16, &msgBlob), HCF_SUCCESS);
    msgBlob.data[0] = 0;
    keyPair = OHTEST_GenAsymKey(asymAlgoName);
    EXPECT_TRUE(keyPair != nullptr);
    privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    EXPECT_TRUE(privKey != nullptr);

    InitTestDataBlobs(&mdBlob, &mfgBlob, &mgf1MdBlob, &saltBlob1, &tarilerBlob);
    sign = PrepareSignContext(algoName, privKey);
    TestSignSetParams(sign, &mdBlob, &mfgBlob, &mgf1MdBlob, &tarilerBlob);
    TestSignInitAndExtraParams(sign, privKey, &saltBlob1);
    TestSignFinalAndGetParams(sign, &msgBlob, &signData);

    Crypto_DataBlob *blobs[] = {&signData, &msgBlob};
    CleanTestResources(sign, randomObj, keyPair, blobs, VALUE_2);
    return 0;
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

int SubCryptoFrameworkNapiSignature2Test0600()
{
    uint8_t sm2Asn1[] = {
        0x30, 0x43, 0x02, 0x20, 0x00, 0xDE, 0x4F, 0x43, 0xEF, 0x29, 0xFA, 0xBA, 0x54, 0xE2, 0x27, 0x6C,
        0xD2, 0xFB, 0x25, 0x0B, 0x9C, 0xFE, 0x38, 0x19, 0x12, 0xE4, 0xCB, 0x7B, 0x4D, 0x98, 0xCA, 0x52,
        0x7F, 0xA5, 0x44, 0xFE, 0x02, 0x1F, 0x35, 0x07, 0xF6, 0x7F, 0x76, 0xDE, 0x94, 0x22, 0x34, 0x9F,
        0x57, 0xFE, 0x36, 0x03, 0xC6, 0xC2, 0x54, 0xCC, 0xEF, 0x76, 0x26, 0x74, 0x38, 0xD7, 0x30, 0xBC,
        0xB4, 0xB1, 0xF1, 0x59, 0xE8
    };
    size_t len = sizeof(sm2Asn1);
    
    bool ret = OHTEST_Sm2SignatureAsn1ToRS(sm2Asn1, len);
    EXPECT_TRUE(ret);
    return 0;
}

int SubCryptoFrameworkNapiSignature2Test0700()
{
    uint8_t sm2Asn1[] = {
        0x30, 0x45, 0x02, 0x20, 0x71, 0xA0, 0xF5, 0x4F, 0x43, 0xEF, 0x29, 0xFA, 0xBA, 0x54, 0xE2, 0x27,
        0x6C, 0xD2, 0xFB, 0x25, 0x0B, 0x9C, 0xFE, 0x38, 0x19, 0x12, 0xE4, 0xCB, 0x7B, 0x4D, 0x98, 0xCA,
        0x52, 0x7F, 0xA5, 0x44, 0x02, 0x21, 0x00, 0xDF, 0x35, 0x07, 0xF6, 0x7F, 0x76, 0xDE, 0x94, 0x22,
        0x34, 0x9F, 0x57, 0xFE, 0x36, 0x03, 0xC6, 0xC2, 0x54, 0xCC, 0xEF, 0x76, 0x26, 0x74, 0x38, 0xD7,
        0x30, 0xBC, 0xB4, 0xB1, 0xF1, 0x59, 0x99
    };
    size_t len = sizeof(sm2Asn1);
    
    bool ret = OHTEST_Sm2SignatureAsn1ToRS(sm2Asn1, len);
    EXPECT_TRUE(ret);
    return 0;
}

int SubCryptoFrameworkNapiSignature2Test0800()
{
    uint8_t sm2Asn1[] = {
        0x30, 0x46, 0x02, 0x21, 0x00, 0xE8, 0xF5, 0x4F, 0x43, 0xEF, 0x29, 0xFA, 0xBA, 0x54, 0xE2, 0x27,
        0x6C, 0xD2, 0xFB, 0x25, 0x0B, 0x9C, 0xFE, 0x38, 0x19, 0x12, 0xE4, 0xCB, 0x7B, 0x4D, 0x98, 0xCA,
        0x52, 0x7F, 0xA5, 0x44, 0xFE, 0x02, 0x21, 0x00, 0xDF, 0x35, 0x07, 0xF6, 0x7F, 0x76, 0xDE, 0x94,
        0x22, 0x34, 0x9F, 0x57, 0xFE, 0x36, 0x03, 0xC6, 0xC2, 0x54, 0xCC, 0xEF, 0x76, 0x26, 0x74, 0x38,
        0xD7, 0x30, 0xBC, 0xB4, 0xB1, 0xF1, 0x59, 0xE8
    };
    size_t len = sizeof(sm2Asn1);
    
    bool ret = OHTEST_Sm2SignatureAsn1ToRS(sm2Asn1, len);
    EXPECT_TRUE(ret);
    return 0;
}

int SubCryptoFrameworkNapiSignature2Test0900()
{
    uint8_t sm2Asn1[] = {
        0x30, 0x44, 0x02, 0x21, 0x00, 0xEA, 0xDE, 0x4F, 0x43, 0xEF, 0x29, 0xFA, 0xBA, 0x54, 0xE2, 0x27,
        0x6C, 0xD2, 0xFB, 0x25, 0x0B, 0x9C, 0xFE, 0x38, 0x19, 0x12, 0xE4, 0xCB, 0x7B, 0x4D, 0x98, 0xCA,
        0x52, 0x7F, 0xA5, 0x44, 0xFE, 0x02, 0x1F, 0x35, 0x07, 0xF6, 0x7F, 0x76, 0xDE, 0x94, 0x22, 0x34,
        0x9F, 0x57, 0xFE, 0x36, 0x03, 0xC6, 0xC2, 0x54, 0xCC, 0xEF, 0x76, 0x26, 0x74, 0x38, 0xD7, 0x30,
        0xBC, 0xB4, 0xB1, 0xF1, 0x59, 0xE8
    };
    size_t len = sizeof(sm2Asn1);
    
    bool ret = OHTEST_Sm2SignatureAsn1ToRS(sm2Asn1, len);
    EXPECT_TRUE(ret);
    return 0;
}

int SubCryptoFrameworkNapiSignature2Test1000()
{
    uint8_t eccAsn1[] = {
        0x30, 0x3c, 0x02, 0x1c, 0x53, 0x99, 0xa4, 0xd7, 0xf5, 0x0f, 0x25, 0xe2, 0xe1, 0x88, 0xcb, 0xe2,
        0x81, 0xfe, 0x1e, 0xc5, 0x1a, 0xc2, 0xac, 0xee, 0xc6, 0xf6, 0x80, 0xbd, 0xf3, 0xb8, 0x20, 0xcf,
        0x02, 0x1c, 0x39, 0xf1, 0xe0, 0x93, 0xe1, 0xef, 0x10, 0x39, 0x07, 0xd0, 0xa8, 0x88, 0x7d, 0x36,
        0xa6, 0x29, 0x6b, 0x45, 0x19, 0xd4, 0x7b, 0x42, 0xa3, 0xf4, 0xa0, 0x39, 0xee, 0xa4
    };
    size_t len = sizeof(eccAsn1);
    
    bool ret = OHTEST_Sm2SignatureAsn1ToRS(eccAsn1, len);
    EXPECT_TRUE(ret);
    return 0;
}

int SubCryptoFrameworkNapiSignature2Test1100()
{
    uint8_t sm2Asn1[] = {
        0x30, 0xff, 0x23, 0x1c, 0x53, 0x99, 0xa4, 0xd7, 0xf5, 0x0f, 0x25, 0xe2, 0xe1, 0x88, 0xcb, 0xe2,
        0x81, 0xfe, 0x1e, 0xc5, 0x1a, 0xc2, 0xac, 0xee, 0xc6, 0xf6, 0x80, 0xbd, 0xf3, 0xb8, 0x20, 0xcf,
        0x12, 0x1c, 0x39, 0xf1, 0xe0, 0x93, 0xe1, 0xef, 0x10, 0x39, 0x07, 0xd0, 0xa8, 0x88, 0x7d, 0x36,
        0xa6, 0x29, 0x6b, 0x45, 0x19, 0xd4, 0x7b, 0x42, 0xa3, 0xf4, 0xa0, 0x39, 0xee, 0xa4
    };
    size_t len = sizeof(sm2Asn1);
    OH_CryptoEccSignatureSpec *spec = nullptr;
    Crypto_DataBlob sm2Signature = {
        .data = sm2Asn1,
        .len = len
    };

    EXPECT_EQ(OH_CryptoEccSignatureSpec_Create(&sm2Signature, &spec), CRYPTO_OPERTION_ERROR);

    OH_CryptoEccSignatureSpec_Destroy(spec);
    return 0;
}

int SubCryptoFrameworkNapiSignature2Test1200()
{
    uint8_t sm2Asn1[] = {
        0x30, 0x44, 0x02, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x02, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    };
    uint8_t sm2Asn1F[] = {
        0x30, 0x44, 0x02, 0x20, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
        0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
        0xFF, 0xFF, 0xFF, 0xFF, 0x02, 0x20, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
        0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
        0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
    };
    size_t len = sizeof(sm2Asn1);
    OH_CryptoEccSignatureSpec *spec = nullptr;
    Crypto_DataBlob sm2Signature1 = {
        .data = sm2Asn1,
        .len = len
    };
    Crypto_DataBlob sm2Signature2 = {
        .data = sm2Asn1F,
        .len = len
    };

    EXPECT_EQ(OH_CryptoEccSignatureSpec_Create(&sm2Signature1, &spec), CRYPTO_OPERTION_ERROR);
    EXPECT_EQ(OH_CryptoEccSignatureSpec_Create(&sm2Signature2, &spec), CRYPTO_OPERTION_ERROR);

    OH_CryptoEccSignatureSpec_Destroy(spec);
    return 0;
}

int SubCryptoFrameworkNapiSignature2Test1300()
{
    uint8_t sm2Asn1[] = {
        0x31, 0x44, 0x02, 0x21, 0x00, 0xEA, 0xDE, 0x4F, 0x43, 0xEF, 0x29, 0xFA, 0xBA, 0x54, 0xE2, 0x27,
        0x6C, 0xD2, 0xFB, 0x25, 0x0B, 0x9C, 0xFE, 0x38, 0x19, 0x12, 0xE4, 0xCB, 0x7B, 0x4D, 0x98, 0xCA,
        0x52, 0x7F, 0xA5, 0x44, 0xFE, 0x02, 0x1F, 0x35, 0x07, 0xF6, 0x7F, 0x76, 0xDE, 0x94, 0x22, 0x34,
        0x9F, 0x57, 0xFE, 0x36, 0x03, 0xC6, 0xC2, 0x54, 0xCC, 0xEF, 0x76, 0x26, 0x74, 0x38, 0xD7, 0x30,
        0xBC, 0xB4, 0xB1, 0xF1, 0x59, 0xE8
    };
    size_t len = sizeof(sm2Asn1);
    OH_CryptoEccSignatureSpec *spec = nullptr;
    Crypto_DataBlob sm2Signature = {
        .data = sm2Asn1,
        .len = len
    };

    EXPECT_EQ(OH_CryptoEccSignatureSpec_Create(&sm2Signature, &spec), CRYPTO_OPERTION_ERROR);

    OH_CryptoEccSignatureSpec_Destroy(spec);
    return 0;
}

int SubCryptoFrameworkNapiSignature2Test1400()
{
    uint8_t sm2Asn1[] = {
        0x30, 0x45, 0x02, 0x21, 0x00, 0xEA, 0xDE, 0x4F, 0x43, 0xEF, 0x29, 0xFA, 0xBA, 0x54, 0xE2, 0x27,
        0x6C, 0xD2, 0xFB, 0x25, 0x0B, 0x9C, 0xFE, 0x38, 0x19, 0x12, 0xE4, 0xCB, 0x7B, 0x4D, 0x98, 0xCA,
        0x52, 0x7F, 0xA5, 0x44, 0xFE, 0x02, 0x1F, 0x35, 0x07, 0xF6, 0x7F, 0x76, 0xDE, 0x94, 0x22, 0x34,
        0x9F, 0x57, 0xFE, 0x36, 0x03, 0xC6, 0xC2, 0x54, 0xCC, 0xEF, 0x76, 0x26, 0x74, 0x38, 0xD7, 0x30,
        0xBC, 0xB4, 0xB1, 0xF1, 0x59, 0xE8
    };
    size_t len = sizeof(sm2Asn1);
    OH_CryptoEccSignatureSpec *spec = nullptr;
    Crypto_DataBlob sm2Signature = {
        .data = sm2Asn1,
        .len = len
    };

    EXPECT_EQ(OH_CryptoEccSignatureSpec_Create(&sm2Signature, &spec), CRYPTO_OPERTION_ERROR);

    OH_CryptoEccSignatureSpec_Destroy(spec);
    return 0;
}

int SubCryptoFrameworkNapiSignature2Test1500()
{
    uint8_t sm2Asn1[] = {
        0x30, 0x44, 0x12, 0x21, 0x00, 0xEA, 0xDE, 0x4F, 0x43, 0xEF, 0x29, 0xFA, 0xBA, 0x54, 0xE2, 0x27,
        0x6C, 0xD2, 0xFB, 0x25, 0x0B, 0x9C, 0xFE, 0x38, 0x19, 0x12, 0xE4, 0xCB, 0x7B, 0x4D, 0x98, 0xCA,
        0x52, 0x7F, 0xA5, 0x44, 0xFE, 0x02, 0x1F, 0x35, 0x07, 0xF6, 0x7F, 0x76, 0xDE, 0x94, 0x22, 0x34,
        0x9F, 0x57, 0xFE, 0x36, 0x03, 0xC6, 0xC2, 0x54, 0xCC, 0xEF, 0x76, 0x26, 0x74, 0x38, 0xD7, 0x30,
        0xBC, 0xB4, 0xB1, 0xF1, 0x59, 0xE8
    };
    size_t len = sizeof(sm2Asn1);
    OH_CryptoEccSignatureSpec *spec = nullptr;
    Crypto_DataBlob sm2Signature = {
        .data = sm2Asn1,
        .len = len
    };

    EXPECT_EQ(OH_CryptoEccSignatureSpec_Create(&sm2Signature, &spec), CRYPTO_OPERTION_ERROR);

    OH_CryptoEccSignatureSpec_Destroy(spec);
    return 0;
}

int SubCryptoFrameworkNapiSignature2Test1600()
{
    uint8_t sm2Asn1[] = {
        0x30, 0x43, 0x02, 0x20, 0xEA, 0xDE, 0x4F, 0x43, 0xEF, 0x29, 0xFA, 0xBA, 0x54, 0xE2, 0x27,
        0x6C, 0xD2, 0xFB, 0x25, 0x0B, 0x9C, 0xFE, 0x38, 0x19, 0x12, 0xE4, 0xCB, 0x7B, 0x4D, 0x98, 0xCA,
        0x52, 0x7F, 0xA5, 0x44, 0xFE, 0x02, 0x1F, 0x35, 0x07, 0xF6, 0x7F, 0x76, 0xDE, 0x94, 0x22, 0x34,
        0x9F, 0x57, 0xFE, 0x36, 0x03, 0xC6, 0xC2, 0x54, 0xCC, 0xEF, 0x76, 0x26, 0x74, 0x38, 0xD7, 0x30,
        0xBC, 0xB4, 0xB1, 0xF1, 0x59, 0xE8
    };
    size_t len = sizeof(sm2Asn1);
    OH_CryptoEccSignatureSpec *spec = nullptr;
    Crypto_DataBlob sm2Signature = {
        .data = sm2Asn1,
        .len = len
    };

    EXPECT_EQ(OH_CryptoEccSignatureSpec_Create(&sm2Signature, &spec), CRYPTO_OPERTION_ERROR);

    OH_CryptoEccSignatureSpec_Destroy(spec);
    return 0;
}

int SubCryptoFrameworkNapiSignature2Test1700()
{
    uint8_t sm2Asn1[] = {
        0x30, 0x44, 0x02, 0x21, 0x00, 0xEA, 0xDE, 0x4F, 0x43, 0xEF, 0x29, 0xFA, 0xBA, 0x54, 0xE2, 0x27,
        0x6C, 0xD2, 0xFB, 0x25, 0x0B, 0x9C, 0xFE, 0x38, 0x19, 0x12, 0xE4, 0xCB, 0x7B, 0x4D, 0x98, 0xCA,
        0x52, 0x7F, 0xA5, 0x44, 0xFE, 0x02, 0x20, 0x00, 0x35, 0x07, 0xF6, 0x7F, 0x76, 0xDE, 0x94, 0x22, 0x34,
        0x9F, 0x57, 0xFE, 0x36, 0x03, 0xC6, 0xC2, 0x54, 0xCC, 0xEF, 0x76, 0x26, 0x74, 0x38, 0xD7, 0x30,
        0xBC, 0xB4, 0xB1, 0xF1, 0x59, 0xE8
    };
    size_t len = sizeof(sm2Asn1);
    OH_CryptoEccSignatureSpec *spec = nullptr;
    Crypto_DataBlob sm2Signature = {
        .data = sm2Asn1,
        .len = len
    };

    EXPECT_EQ(OH_CryptoEccSignatureSpec_Create(&sm2Signature, &spec), CRYPTO_OPERTION_ERROR);

    OH_CryptoEccSignatureSpec_Destroy(spec);
    return 0;
}

int SubCryptoFrameworkNapiSignature2Test1800()
{
    uint8_t sm2Asn1[] = {
        0x30, 0xFF, 0xFF, 0xFF, 0x02, 0x21, 0x00, 0xEA, 0xDE, 0x4F, 0x43, 0xEF, 0x29, 0xFA, 0xBA, 0x54, 0xE2, 0x27,
        0x6C, 0xD2, 0xFB, 0x25, 0x0B, 0x9C, 0xFE, 0x38, 0x19, 0x12, 0xE4, 0xCB, 0x7B, 0x4D, 0x98, 0xCA,
        0x52, 0x7F, 0xA5, 0x44, 0xFE, 0x02, 0x1F, 0x35, 0x07, 0xF6, 0x7F, 0x76, 0xDE, 0x94, 0x22, 0x34,
        0x9F, 0x57, 0xFE, 0x36, 0x03, 0xC6, 0xC2, 0x54, 0xCC, 0xEF, 0x76, 0x26, 0x74, 0x38, 0xD7, 0x30,
        0xBC, 0xB4, 0xB1, 0xF1, 0x59, 0xE8
    };
    size_t len = sizeof(sm2Asn1);
    OH_CryptoEccSignatureSpec *spec = nullptr;
    Crypto_DataBlob sm2Signature = {
        .data = sm2Asn1,
        .len = len
    };

    EXPECT_EQ(OH_CryptoEccSignatureSpec_Create(&sm2Signature, &spec), CRYPTO_OPERTION_ERROR);

    OH_CryptoEccSignatureSpec_Destroy(spec);
    return 0;
}

int SubCryptoFrameworkNapiSignature2Test1900()
{
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_CryptoPrivKey *privKey = nullptr;
    const char *algoName = reinterpret_cast<const char*>("RSA512|PKCS1|NoHash|OnlySign");
    const char *asymAlgoName = reinterpret_cast<const char*>("RSA512");
    OH_CryptoRand *randomObj = nullptr;
    Crypto_DataBlob msgBlob = {.data = nullptr, .len = 0};
    Crypto_DataBlob signData = {.data = nullptr, .len = 0};
    int32_t msgLen = 64 - 11 + 1;
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

int SubCryptoFrameworkNapiSignature2Test2000()
{
    OH_Crypto_ErrCode ret = CRYPTO_SUCCESS;
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_CryptoAsymKeyGenerator *ctx = nullptr;
    OH_CryptoPrivKey *privKey = nullptr;
    const char *algoName = reinterpret_cast<const char*>("RSA512|NoPadding|NoHash|OnlySign");
    const char *asymAlgoName = reinterpret_cast<const char*>("RSA512");
    Crypto_DataBlob signData = {.data = nullptr, .len = 0};

    uint8_t rsaNModified[sizeof(RSA512_PUB_KEY_N)];
    SafeMemcpy(rsaNModified, sizeof(rsaNModified), RSA512_PUB_KEY_N,
        sizeof(RSA512_PUB_KEY_N));
    rsaNModified[0]++;
        
    Crypto_DataBlob msgBlob = {
        .data = rsaNModified,
        .len = sizeof(rsaNModified)
    };

    Crypto_DataBlob pubKeyBlob = {
        .data = const_cast<uint8_t*>(RSA512_PUB_KEY),
        .len = sizeof(RSA512_PUB_KEY)
    };
    Crypto_DataBlob priKeyBlob = {
        .data = const_cast<uint8_t*>(RSA512_PRI_KEY),
        .len = sizeof(RSA512_PRI_KEY)
    };

    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Create(asymAlgoName, &ctx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoAsymKeyGenerator_Convert(ctx, CRYPTO_DER, &pubKeyBlob,
        &priKeyBlob, &keyPair), CRYPTO_SUCCESS);
    EXPECT_TRUE(keyPair != nullptr);
    privKey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    EXPECT_TRUE(privKey != nullptr);
    ret = OHTEST_DoNoSegmentSign(algoName, privKey, &msgBlob, &signData);
    EXPECT_EQ(ret, CRYPTO_OPERTION_ERROR);

    OH_CryptoKeyPair_Destroy(keyPair);
    OH_Crypto_FreeDataBlob(&signData);
    OH_CryptoAsymKeyGenerator_Destroy(ctx);
    return 0;
}

} // namespace Unittest::CryptoFramework