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

#include "include/CryptoFrameworkAgreementTest.h"
#include <native_drawing/drawing_text_blob.h>
#include <hilog/log.h>
#include "include/CommonToolTest.h"

namespace Unittest::CryptoFramework {
class OHCryptoFrameworkAgreementNapiTest {
public:
    static void SetUpTestCase(void) {};
    static void TearDownTestCase(void) {};
    void SetUp() {};
    void TearDown() {};
};

class AGREEMENT_TEST {
    public:
        static void SetUpTestCase() {};
        static void TearDownTestCase() {};
};

class AGREEMENT_VECTOR_TEST {
    public:
        static void SetUpTestCase() {};
        static void TearDownTestCase() {};
};

class AGREEMENT_VECTOR_ECC_TEST {
    public:
        static void SetUpTestCase() {};
        static void TearDownTestCase() {};
};

class AGREEMENT_VECTOR_DH_TEST {
    public:
        static void SetUpTestCase() {};
        static void TearDownTestCase() {};
};

const int32_t VALUE_1 = 1;
const int32_t VALUE_2 = 2;
const int32_t VALUE_9 = 9;
const int32_t VALUE_15 = 15;
const int32_t VALUE_16 = 16;
const int32_t VALUE_25 = 25;
const int32_t VALUE_32 = 32;

static OH_Crypto_ErrCode OHTEST_GetAgreementKeyPair(const char *algoNameA, const char *algoNameB,
    OH_CryptoKeyPair **keyPairA, OH_CryptoKeyPair **keyPairB)
{
    OH_CryptoAsymKeyGenerator *ctxA = nullptr;
    OH_CryptoAsymKeyGenerator *ctxB = nullptr;
    OH_Crypto_ErrCode ret = CRYPTO_SUCCESS;

    ret = OH_CryptoAsymKeyGenerator_Create(algoNameA, &ctxA);
    if (ret != CRYPTO_SUCCESS) {
        goto EXIT;
    }
    ret = OH_CryptoAsymKeyGenerator_Create(algoNameB, &ctxB);
    if (ret != CRYPTO_SUCCESS) {
        goto EXIT;
    }
    ret = OH_CryptoAsymKeyGenerator_Generate(ctxA, keyPairA);
    if (ret != CRYPTO_SUCCESS) {
        goto EXIT;
    }
    ret = OH_CryptoAsymKeyGenerator_Generate(ctxB, keyPairB);
    if (ret != CRYPTO_SUCCESS) {
        if (*keyPairA != nullptr) {
            OH_CryptoKeyPair_Destroy(*keyPairA);
            *keyPairA = nullptr;
        }
        goto EXIT;
    }

EXIT:
    OH_CryptoAsymKeyGenerator_Destroy(ctxA);
    OH_CryptoAsymKeyGenerator_Destroy(ctxB);
    return ret;
}

static OH_Crypto_ErrCode OHTEST_GetAgreementKey(OH_CryptoKeyPair *keyPair,
    OH_CryptoPrivKey **privkey, OH_CryptoPubKey **pubkey)
{
    OH_Crypto_ErrCode ret = CRYPTO_SUCCESS;
    
    *privkey = OH_CryptoKeyPair_GetPrivKey(keyPair);
    if (*privkey == nullptr) {
        ret = CRYPTO_OPERTION_ERROR;
        goto EXIT;
    }
    *pubkey = OH_CryptoKeyPair_GetPubKey(keyPair);
    if (*pubkey == nullptr) {
        ret = CRYPTO_OPERTION_ERROR;
        goto EXIT;
    }

EXIT:
    return ret;
}

AgreementSpec g_agreementSpec[] = {
    /* ECC */
    {"ECC224", "ECC224"},
    {"ECC256", "ECC256"},
    {"ECC384", "ECC384"},
    {"ECC521", "ECC521"},
    {"ECC_BrainPoolP160r1", "ECC_BrainPoolP160r1"},
    {"ECC_BrainPoolP160t1", "ECC_BrainPoolP160t1"},
    {"ECC_BrainPoolP192r1", "ECC_BrainPoolP192r1"},
    {"ECC_BrainPoolP192t1", "ECC_BrainPoolP192t1"},
    {"ECC_BrainPoolP224r1", "ECC_BrainPoolP224r1"},
    {"ECC_BrainPoolP224t1", "ECC_BrainPoolP224t1"},
    {"ECC_BrainPoolP256r1", "ECC_BrainPoolP256r1"},
    {"ECC_BrainPoolP256t1", "ECC_BrainPoolP256t1"},
    {"ECC_BrainPoolP320r1", "ECC_BrainPoolP320r1"},
    {"ECC_BrainPoolP320t1", "ECC_BrainPoolP320t1"},
    {"ECC_BrainPoolP384r1", "ECC_BrainPoolP384r1"},
    {"ECC_BrainPoolP384t1", "ECC_BrainPoolP384t1"},
    {"ECC_BrainPoolP512r1", "ECC_BrainPoolP512r1"},
    {"ECC_BrainPoolP512t1", "ECC_BrainPoolP512t1"},
    {"ECC_Secp256k1", "ECC_Secp256k1"},
    /* X25519 */
    {"X25519", "X25519"},
    /* DH */
    {"DH_modp1536", "DH_modp1536"},
    {"DH_modp2048", "DH_modp2048"},
    {"DH_modp3072", "DH_modp3072"},
    {"DH_modp4096", "DH_modp4096"},
    {"DH_modp6144", "DH_modp6144"},
    {"DH_modp8192", "DH_modp8192"},
    {"DH_ffdhe2048", "DH_ffdhe2048"},
    {"DH_ffdhe3072", "DH_ffdhe3072"},
    {"DH_ffdhe4096", "DH_ffdhe4096"},
    {"DH_ffdhe6144", "DH_ffdhe6144"},
    {"DH_ffdhe8192", "DH_ffdhe8192"},
};

int SubCryptoFrameworkNapiAgreementTest0100()
{
    const int agreementSpecCount = sizeof(g_agreementSpec) / sizeof(g_agreementSpec[0]);
    for (int i = 0; i < agreementSpecCount; i++) {
        AgreementSpec infoSpec = g_agreementSpec[i];
        const char *algoNameA = infoSpec.algoNameA;
        const char *algoNameB = infoSpec.algoNameB;
        OH_CryptoKeyPair *keyPairA = nullptr;
        OH_CryptoKeyPair *keyPairB = nullptr;
        OH_CryptoPrivKey *privkeyA = nullptr;
        OH_CryptoPubKey *pubkeyA = nullptr;
        OH_CryptoPrivKey *privkeyB = nullptr;
        OH_CryptoPubKey *pubkeyB = nullptr;
        OH_CryptoKeyAgreement *ctx = nullptr;
        Crypto_DataBlob secretA = {.data = nullptr, .len = 0};
        Crypto_DataBlob secretB = {.data = nullptr, .len = 0};

        EXPECT_EQ(OHTEST_GetAgreementKeyPair(algoNameA, algoNameB, &keyPairA, &keyPairB), CRYPTO_SUCCESS);
        EXPECT_EQ(OHTEST_GetAgreementKey(keyPairA, &privkeyA, &pubkeyA), CRYPTO_SUCCESS);
        EXPECT_EQ(OHTEST_GetAgreementKey(keyPairB, &privkeyB, &pubkeyB), CRYPTO_SUCCESS);
        EXPECT_EQ(OH_CryptoKeyAgreement_Create(algoNameA, &ctx), CRYPTO_SUCCESS);
        EXPECT_EQ(OH_CryptoKeyAgreement_GenerateSecret(ctx, privkeyA, pubkeyB, &secretA), CRYPTO_SUCCESS);
        EXPECT_EQ(OH_CryptoKeyAgreement_GenerateSecret(ctx, privkeyB, pubkeyA, &secretB), CRYPTO_SUCCESS);
        EXPECT_TRUE(memcmp(secretB.data, secretA.data, secretB.len) == 0);
        EXPECT_EQ(secretB.len, secretA.len);

        OH_CryptoKeyPair_Destroy(keyPairA);
        OH_CryptoKeyPair_Destroy(keyPairB);
        OH_CryptoKeyAgreement_Destroy(ctx);
        OH_Crypto_FreeDataBlob(&secretA);
        OH_Crypto_FreeDataBlob(&secretB);
    }
    return 0;
}

int SubCryptoFrameworkNapiAgreementTest0200()
{
    const char *algoNameA = "ECC224";
    const char *algoNameB = "ECC256";
    OH_CryptoKeyPair *keyPairA = nullptr;
    OH_CryptoKeyPair *keyPairB = nullptr;
    OH_CryptoPrivKey *privkeyA = nullptr;
    OH_CryptoPubKey *pubkeyA = nullptr;
    OH_CryptoPrivKey *privkeyB = nullptr;
    OH_CryptoPubKey *pubkeyB = nullptr;
    OH_CryptoKeyAgreement *ctx = nullptr;
    Crypto_DataBlob secretA = {.data = nullptr, .len = 0};
    Crypto_DataBlob secretB = {.data = nullptr, .len = 0};

    EXPECT_EQ(OHTEST_GetAgreementKeyPair(algoNameA, algoNameB, &keyPairA, &keyPairB), CRYPTO_SUCCESS);
    EXPECT_EQ(OHTEST_GetAgreementKey(keyPairA, &privkeyA, &pubkeyA), CRYPTO_SUCCESS);
    EXPECT_EQ(OHTEST_GetAgreementKey(keyPairB, &privkeyB, &pubkeyB), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoKeyAgreement_Create(algoNameA, &ctx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoKeyAgreement_GenerateSecret(ctx, privkeyA, pubkeyB, &secretA), CRYPTO_OPERTION_ERROR);
    EXPECT_EQ(OH_CryptoKeyAgreement_GenerateSecret(ctx, privkeyB, pubkeyA, &secretB), CRYPTO_OPERTION_ERROR);

    OH_CryptoKeyPair_Destroy(keyPairA);
    OH_CryptoKeyPair_Destroy(keyPairB);
    OH_CryptoKeyAgreement_Destroy(ctx);
    OH_Crypto_FreeDataBlob(&secretA);
    OH_Crypto_FreeDataBlob(&secretB);
    return 0;
}

int SubCryptoFrameworkNapiAgreementTest0300()
{
    const char *algoNameA = "X25519";
    const char *algoNameB = "ECC256";
    OH_CryptoKeyPair *keyPairA = nullptr;
    OH_CryptoKeyPair *keyPairB = nullptr;
    OH_CryptoPrivKey *privkeyA = nullptr;
    OH_CryptoPubKey *pubkeyA = nullptr;
    OH_CryptoPrivKey *privkeyB = nullptr;
    OH_CryptoPubKey *pubkeyB = nullptr;
    OH_CryptoKeyAgreement *ctx = nullptr;
    Crypto_DataBlob secretA = {.data = nullptr, .len = 0};
    Crypto_DataBlob secretB = {.data = nullptr, .len = 0};

    EXPECT_EQ(OHTEST_GetAgreementKeyPair(algoNameA, algoNameB, &keyPairA, &keyPairB), CRYPTO_SUCCESS);
    EXPECT_EQ(OHTEST_GetAgreementKey(keyPairA, &privkeyA, &pubkeyA), CRYPTO_SUCCESS);
    EXPECT_EQ(OHTEST_GetAgreementKey(keyPairB, &privkeyB, &pubkeyB), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoKeyAgreement_Create(algoNameA, &ctx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoKeyAgreement_GenerateSecret(ctx, privkeyA, pubkeyB, &secretA), CRYPTO_PARAMETER_CHECK_FAILED);
    EXPECT_EQ(OH_CryptoKeyAgreement_GenerateSecret(ctx, privkeyB, pubkeyA, &secretB), CRYPTO_PARAMETER_CHECK_FAILED);

    OH_CryptoKeyPair_Destroy(keyPairA);
    OH_CryptoKeyPair_Destroy(keyPairB);
    OH_CryptoKeyAgreement_Destroy(ctx);
    OH_Crypto_FreeDataBlob(&secretA);
    OH_Crypto_FreeDataBlob(&secretB);
    return 0;
}

int SubCryptoFrameworkNapiAgreementTest0400()
{
    const char *algoNameA = "DH_modp2048";
    const char *algoNameB = "DH_ffdhe2048";
    OH_CryptoKeyPair *keyPairA = nullptr;
    OH_CryptoKeyPair *keyPairB = nullptr;
    OH_CryptoPrivKey *privkeyA = nullptr;
    OH_CryptoPubKey *pubkeyA = nullptr;
    OH_CryptoPrivKey *privkeyB = nullptr;
    OH_CryptoPubKey *pubkeyB = nullptr;
    OH_CryptoKeyAgreement *ctx = nullptr;
    Crypto_DataBlob secretA = {.data = nullptr, .len = 0};
    Crypto_DataBlob secretB = {.data = nullptr, .len = 0};

    EXPECT_EQ(OHTEST_GetAgreementKeyPair(algoNameA, algoNameB, &keyPairA, &keyPairB), CRYPTO_SUCCESS);
    EXPECT_EQ(OHTEST_GetAgreementKey(keyPairA, &privkeyA, &pubkeyA), CRYPTO_SUCCESS);
    EXPECT_EQ(OHTEST_GetAgreementKey(keyPairB, &privkeyB, &pubkeyB), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoKeyAgreement_Create(algoNameA, &ctx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoKeyAgreement_GenerateSecret(ctx, privkeyA, pubkeyB, &secretA), CRYPTO_OPERTION_ERROR);
    EXPECT_EQ(OH_CryptoKeyAgreement_GenerateSecret(ctx, privkeyB, pubkeyA, &secretB), CRYPTO_OPERTION_ERROR);

    OH_CryptoKeyPair_Destroy(keyPairA);
    OH_CryptoKeyPair_Destroy(keyPairB);
    OH_CryptoKeyAgreement_Destroy(ctx);
    OH_Crypto_FreeDataBlob(&secretA);
    OH_Crypto_FreeDataBlob(&secretB);
    return 0;
}

int SubCryptoFrameworkNapiAgreementTest0500()
{
    const char *algoName = "SM2";
    OH_CryptoKeyAgreement *ctx = nullptr;

    EXPECT_EQ(OH_CryptoKeyAgreement_Create(algoName, &ctx), CRYPTO_NOT_SUPPORTED);

    OH_CryptoKeyAgreement_Destroy(ctx);
    return 0;
}

static VectorAgreementSpec g_vec[] = {
    {
        .algoName = "X25519",
        .vectorSource = "RFC7748",
        .localPrivKey = "ebe088ff278b2f1cfdb6182629b13b6fe60e80838b7fe1794b8a4a627e08ab5d", // Big-end sequence
        .localPubKey = "4f2b886f147efcad4d67785bc843833f3735e4ecc2615bd3b4c17d7b7ddb9ede", // Big-end sequence
        .peerPrivKey = "2a2cb91da5fb77b12a99c0eb872f4cdf4566b25172c1163c7da518730a6d0777", // Big-end sequence
        .peerPubKey = "6a4e9baa8ea9a4ebf41a38260d3abf0d5af73eb4dc7d8b7454a7308909f02085", // Big-end sequence
        .sharedKey = "4a5d9d5ba4ce2de1728e3bf480350f25e07e21c947d19e3376f09b3c1e161742"
    },
};
static OH_Crypto_ErrCode OHTEST_HexStringToDataBlob(const char *in, Crypto_DataBlob *out, bool isBigEnd)
{
    uint32_t inLen = static_cast<uint32_t>(strlen(in));
    if (in == nullptr) {
        return CRYPTO_PARAMETER_CHECK_FAILED;
    }
    if (inLen % VALUE_2 != 0) {
        return CRYPTO_PARAMETER_CHECK_FAILED;
    }
    out->data = (uint8_t *)malloc(inLen / VALUE_2);
    if (out->data == nullptr) {
        return CRYPTO_MEMORY_ERROR;
    }
    for (int i = 0; i < inLen; i += VALUE_2) {
        uint32_t bit1 = ((static_cast<uint8_t>(in[i] % VALUE_32 + VALUE_9) % VALUE_25));
        uint32_t bit2 = ((static_cast<uint8_t>(in[i + VALUE_1] % VALUE_32 + VALUE_9) % VALUE_25));
        if (bit1 > VALUE_15 || bit2 > VALUE_15) {
            free(out->data);
            out->data = nullptr;
            return CRYPTO_PARAMETER_CHECK_FAILED;
        }
        if (isBigEnd) {
            out->data[i/VALUE_2] = bit1 * VALUE_16 + bit2;
        } else {
            out->data[inLen / VALUE_2 - i/VALUE_2 - VALUE_1] = bit1 * VALUE_16 + bit2;
        }
    }
    out->len = inLen / VALUE_2;

    return CRYPTO_SUCCESS;
}

static OH_CryptoKeyPair *OHTEST_ConvertX25519AsymKey(VectorAgreementSpec *vec, bool isLocal)
{
    OH_CryptoKeyPair *keyPair = nullptr;
    OH_CryptoAsymKeySpec *specCtx = nullptr;
    OH_CryptoAsymKeyGeneratorWithSpec *generator = nullptr;
    Crypto_DataBlob sk = {.data = nullptr, .len = 0};
    Crypto_DataBlob pk = {.data = nullptr, .len = 0};
    if (isLocal) {
        if (OHTEST_HexStringToDataBlob(vec->localPrivKey, &sk, true) != CRYPTO_SUCCESS
            || OHTEST_HexStringToDataBlob(vec->localPubKey, &pk, true) != CRYPTO_SUCCESS) {
            goto EXIT;
        }
    } else {
        if (OHTEST_HexStringToDataBlob(vec->peerPrivKey, &sk, true) != CRYPTO_SUCCESS
            || OHTEST_HexStringToDataBlob(vec->peerPubKey, &pk, true) != CRYPTO_SUCCESS) {
            goto EXIT;
        }
    }
    if (OH_CryptoAsymKeySpec_Create(vec->algoName, CRYPTO_ASYM_KEY_KEY_PAIR_SPEC, &specCtx) != CRYPTO_SUCCESS
        || OH_CryptoAsymKeySpec_SetParam(specCtx, CRYPTO_X25519_SK_DATABLOB, &sk) != CRYPTO_SUCCESS
        || OH_CryptoAsymKeySpec_SetParam(specCtx, CRYPTO_X25519_PK_DATABLOB, &pk) != CRYPTO_SUCCESS
        || OH_CryptoAsymKeyGeneratorWithSpec_Create(specCtx, &generator) != CRYPTO_SUCCESS
        || OH_CryptoAsymKeyGeneratorWithSpec_GenKeyPair(generator, &keyPair) != CRYPTO_SUCCESS) {
        goto EXIT;
    }

EXIT:
    OH_CryptoAsymKeyGeneratorWithSpec_Destroy(generator);
    OH_CryptoAsymKeySpec_Destroy(specCtx);
    OH_Crypto_FreeDataBlob(&sk);
    OH_Crypto_FreeDataBlob(&pk);
    return keyPair;
}

int SubCryptoFrameworkNapiAgreementVectorTest0100()
{
    const int vectorAgreementSpecCount = sizeof(g_vec) / sizeof(g_vec[0]);
    for (int i = 0; i < vectorAgreementSpecCount; i++) {
        VectorAgreementSpec vecInfo = g_vec[i];
        Crypto_DataBlob localSharedKey = {.data = nullptr, .len = 0};
        Crypto_DataBlob peerSharedKey = {.data = nullptr, .len = 0};
        Crypto_DataBlob sharedKey = {.data = nullptr, .len = 0};
        OH_CryptoKeyAgreement *localCtx = nullptr;
        OH_CryptoKeyAgreement *peerCtx = nullptr;
        OH_CryptoKeyPair *localKeyPair = OHTEST_ConvertX25519AsymKey(&vecInfo, true);
        OH_CryptoKeyPair *peerKeyPair = OHTEST_ConvertX25519AsymKey(&vecInfo, false);
        EXPECT_TRUE(localKeyPair != nullptr && peerKeyPair != nullptr);
        OH_CryptoPrivKey *localPrivkey = OH_CryptoKeyPair_GetPrivKey(localKeyPair);
        OH_CryptoPubKey *localPubkey = OH_CryptoKeyPair_GetPubKey(localKeyPair);
        EXPECT_TRUE(localPrivkey != nullptr && localPubkey != nullptr);
        OH_CryptoPrivKey *peerPrivkey = OH_CryptoKeyPair_GetPrivKey(peerKeyPair);
        OH_CryptoPubKey *peerPubkey = OH_CryptoKeyPair_GetPubKey(peerKeyPair);
        EXPECT_TRUE(peerPrivkey != nullptr && peerPubkey != nullptr);
        EXPECT_EQ(OH_CryptoKeyAgreement_Create(vecInfo.algoName, &localCtx), CRYPTO_SUCCESS);
        EXPECT_EQ(OH_CryptoKeyAgreement_GenerateSecret(localCtx, localPrivkey, peerPubkey,
            &localSharedKey), CRYPTO_SUCCESS);
        EXPECT_EQ(OH_CryptoKeyAgreement_Create(vecInfo.algoName, &peerCtx), CRYPTO_SUCCESS);
        EXPECT_EQ(OH_CryptoKeyAgreement_GenerateSecret(peerCtx, peerPrivkey, localPubkey,
            &peerSharedKey), CRYPTO_SUCCESS);
        if (localSharedKey.len == peerSharedKey.len) {
            EXPECT_TRUE(memcmp(peerSharedKey.data, localSharedKey.data, localSharedKey.len) == 0);
        }
        EXPECT_EQ(localSharedKey.len, peerSharedKey.len);
        EXPECT_EQ(OHTEST_HexStringToDataBlob(vecInfo.sharedKey, &sharedKey, true), CRYPTO_SUCCESS);
        EXPECT_TRUE(memcmp(peerSharedKey.data, sharedKey.data, sharedKey.len) == 0);

        OH_CryptoKeyAgreement_Destroy(peerCtx);
        OH_CryptoKeyAgreement_Destroy(localCtx);
        OH_Crypto_FreeDataBlob(&sharedKey);
        OH_Crypto_FreeDataBlob(&peerSharedKey);
        OH_Crypto_FreeDataBlob(&localSharedKey);
        OH_CryptoKeyPair_Destroy(localKeyPair);
        OH_CryptoKeyPair_Destroy(peerKeyPair);
    }
    return 0;
}

static OH_CryptoKeyPair *OHTEST_ConvertEccAsymKey(VectorEccAgreementSpec *infoSpec, bool isBob)
{
    OH_CryptoAsymKeySpec *commonSpec = nullptr;
    OH_CryptoAsymKeySpec *specCtx = nullptr;
    OH_CryptoAsymKeyGeneratorWithSpec *generator = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    Crypto_DataBlob sk = { .data = nullptr, .len = 0};
    Crypto_DataBlob pkX = { .data = nullptr, .len = 0};
    Crypto_DataBlob pkY = { .data = nullptr, .len = 0};

    if (isBob) {
        if (OHTEST_HexStringToDataBlob(infoSpec->bobD, &sk, true) != CRYPTO_SUCCESS
            || OHTEST_HexStringToDataBlob(infoSpec->bobX, &pkX, true) != CRYPTO_SUCCESS
            || OHTEST_HexStringToDataBlob(infoSpec->bobY, &pkY, true) != CRYPTO_SUCCESS) {
            goto EXIT;
        }
    } else {
        if (OHTEST_HexStringToDataBlob(infoSpec->aliceD, &sk, true) != CRYPTO_SUCCESS
            || OHTEST_HexStringToDataBlob(infoSpec->aliceX, &pkX, true) != CRYPTO_SUCCESS
            || OHTEST_HexStringToDataBlob(infoSpec->aliceY, &pkY, true) != CRYPTO_SUCCESS) {
            goto EXIT;
        }
    }
    if (OH_CryptoAsymKeySpec_Create("ECC", CRYPTO_ASYM_KEY_KEY_PAIR_SPEC, &specCtx) != CRYPTO_SUCCESS
        || OH_CryptoAsymKeySpec_GenEcCommonParamsSpec(infoSpec->nidName, &commonSpec) != CRYPTO_SUCCESS) {
        goto EXIT;
    }
    if (OH_CryptoAsymKeySpec_SetCommonParamsSpec(specCtx, commonSpec) != CRYPTO_SUCCESS
        || OH_CryptoAsymKeySpec_SetParam(specCtx, CRYPTO_ECC_SK_DATABLOB, &sk) != CRYPTO_SUCCESS
        || OH_CryptoAsymKeySpec_SetParam(specCtx, CRYPTO_ECC_PK_X_DATABLOB, &pkX) != CRYPTO_SUCCESS
        || OH_CryptoAsymKeySpec_SetParam(specCtx, CRYPTO_ECC_PK_Y_DATABLOB, &pkY) != CRYPTO_SUCCESS
        || OH_CryptoAsymKeyGeneratorWithSpec_Create(specCtx, &generator) != CRYPTO_SUCCESS
        || OH_CryptoAsymKeyGeneratorWithSpec_GenKeyPair(generator, &keyPair) != CRYPTO_SUCCESS) {
        goto EXIT;
    }

EXIT:
    OH_Crypto_FreeDataBlob(&sk);
    OH_Crypto_FreeDataBlob(&pkX);
    OH_Crypto_FreeDataBlob(&pkY);
    OH_CryptoAsymKeyGeneratorWithSpec_Destroy(generator);
    OH_CryptoAsymKeySpec_Destroy(specCtx);
    OH_CryptoAsymKeySpec_Destroy(commonSpec);
    return keyPair;
}

static VectorEccAgreementSpec g_vectors[] = {
    {
        .algoName = "ECC224",
        .nidName = "NID_secp224r1",
        .vectorSource = "https://csrc.nist.gov",
        .bobD = "d58751997b3a551ccdc6f507bf6ab87e2be7f8267067a455a5815a54",
        .bobX = "c7893ced15c3009b93cb0abeaea2ede308b67fbbd902c6c5d94c24a4",
        .bobY = "858afc2edd61fcefef3469dd5a004e74a3c727d16498a9408a8e3224",
        .aliceD = "e935434303d842605d07112b3b7789ccbe4c6d987db5fa15ea1cdadb",
        .aliceX = "784028a2246950401ec81f8e4e03fd3765c4da4d45eba652ed5ba2b5",
        .aliceY = "d071c32634bcf058f072493b6943453a0bd117f5ee5c5866f037f6ab",
        .sharedKey = "dfd0570d4ae5c9f690c757aead04f7e14758fdc4ee05d8f0d089b91a"
    },
    {
        .algoName = "ECC256",
        .nidName = "NID_X9_62_prime256v1",
        .vectorSource = "https://csrc.nist.gov",
        .bobD = "346be42646f881c24da1e9fcfa214f36d32f2a72c9c053032496836bab168dd5",
        .bobX = "b2240711b80d28f7b22b9c0e17efbcb6c11d1aca3e1fb5f1c3de9e9e8a612c9a",
        .bobY = "597a619dc69436837e0d05e9974da9ea83bc03aa9aae3b1156f5b2a02f0df780",
        .aliceD = "d10f3f9b31bd3dc826b215344ba1746090cf11d5476bf8eafc0b5bfdbb7182b5",
        .aliceX = "8c1934b6688635531a54a049755417865db7d93d5cab1b2b3360eda96032f07c",
        .aliceY = "bfdd434a49e78c13886bd3d0b5322e74b35b6905f65274266cd3b0dc18645733",
        .sharedKey = "b2936bd75eee3f815742a7a545c080485bea730997fae4422aacdadf238d7afb"
    },
    {
        .algoName = "ECC384",
        .nidName = "NID_secp384r1",
        .vectorSource = "https://csrc.nist.gov",
        .bobD = "d164e6e7491a7f01aae746b133d54215edc63b22105c8379e465d7fb7ce4c652"
            "a70d0c15b8c195d77c2344ba0c547827",
        .bobX = "9272c72001bcc2265e9573a8f8d778bafcf54b524a13255dcb112f6f0982280a"
            "972d68be67f3b665f55a96e3953bada8",
        .bobY = "1712493a0c84c35bd8dc073521a205040a2e414d4176da6bbc10acc56cd72952"
            "785073d3a56401ccdb62f4b24d52207c",
        .aliceD = "03f6a1d42a029cfa05c5ef0fab8cdffb85e487053d464b700eeb5ed78097c9f3"
            "0c633bd3db89f4f48258a32440f215df",
        .aliceX = "d324916ec06a97f632c962c6f29721ff8b6ad10cb5374a8b031e43a8b8a16e3b"
            "c9d78190d9d57498d06c0970fc08ea10",
        .aliceY = "3dcea5e6478d3ad599f8d58197704b35039e685c13333e5b213c3d0b6fd56873"
            "70af858b29443d9a828314f2dce52c37",
        .sharedKey = "ef1104cfde9c34dc4b3e6ec69a85ff2ef850cb8e935cbefb8b00a4a64d90c9fd"
            "0049470234b2bbf91c5359575ed01f01",
    },
    {
        .algoName = "ECC521",
        .nidName = "NID_secp521r1",
        .vectorSource = "https://csrc.nist.gov",
        .bobD = "0000002601f8c65f750bd5aa1099a2eba1197ec6e4001d5b6b4bfd06a2c9344c"
            "0b8504157d071f46cd611bae8fa5b39dddd81d4e458def2682d6ab8a68e5dc83dbf1bd24",
        .bobX = "000001405fe4fa19287fad4b929195cd6aa06800fddaaa3ff07c3e6344751adc"
            "4de373c9546c43162ed862a4461c1cb24843ec8e945663e7c9765fbe77423fa362063147",
        .bobY = "00000080f8fdf9ad2a276b68bcfd42c5412d3460856e3a4724292e4c63c4b03f"
            "51c8f82b4503c10be04070f66561983b6e9596806730e48cd0a97628b55d6ffd4c7406eb",
        .aliceD = "00000143253d19be2489ab254f71a1ee0e294c2b73ca65dcc9929a2de741d886"
            "b878459bf595d7b7620ada2a797b429219e926b49daa9a4a8d2de7bcf885bba5b7949e77",
        .aliceX = "00000031b99843ddfc55e807c20c506c934c93ad5711f00ec0045483fd74b351"
            "3696a49ae00153bcaa263b9d86ae1d1eec587d366e614385373449191be385761a0c1b0e",
        .aliceY = "00000012a7fed0fc77d6fe888f346f18eb34c33d63ea63ae384e21545a1a934b"
            "416cb403a7c67a51a4c9f98aa40987e7619dc349960b0cd21911cf82bfe6ef4eb5080e2c",
        .sharedKey = "00c59aa457630c8490bbb25d3a7e26cf62122516e508920e153151a9019cfc67"
            "9271b0edbe5cf22f439c127bf1a20cb088557c9bb566f295338c475d8e7883f96a61",
    },
    {
        .algoName = "ECC521",
        .nidName = "NID_secp521r1",
        .vectorSource = "https://csrc.nist.gov",
        .bobD = "00000116b6cf2ee3b79bbec7aee5bfb631e333c675002a41b2a49745fc01b9e2"
            "4c32403b78d520fac3f56d2e0fcec3c00484931c24fc9a84cdcaf694deb3c69352e17a70",
        .bobX = "000000e5c00427691ea7c1b49c56c94baaabc0850e4af59e886c92b121590b74"
            "5aa04ffc87c39673d8ebb66ec7f21ded402f69d4138950b5e5f346880b7d08c9ba69ea30",
        .bobY = "000000ce7e1d3c7b66979578e5c40903895de8f2fd283542a6386ff2a4728f0b"
            "51f0cd7e202a15eed37b0e8f543238ac00fd25f4c51b6b935756c3067d0200602a1e59da",
        .aliceD = "00000116274c4e5ad28a1de66a7e1b655ace107b575e71e8885e6708a38da344"
            "f307ebc30b4febfd4f14af64eac79ac08259dc527c0b760b9fe7f77c4bdad007cebf0587",
        .aliceX = "000000ebda84610caa6aabd577cfa529045c6f78a3ff0f1c19f2e667be22bee2"
            "edac6dcfaa60c97af212b79cb118b2720d2eb45398efdceacf55f3d907e7c070d96db1de",
        .aliceY = "000001be5ce182f299d7131ad24f363e8ae5fe34da1e3ba213b57f17eae640d0"
            "4188b5955dbe139560b7f7700b8f017872d48b8ecadb032055e91d8b86ceca5e6981edda",
        .sharedKey = "01b5aca8c27eebbb704707222f408bd1e7f2fe40cbb976433cd5f5e66eaa0ca1"
            "ef812f1b4ad6e5f400f2e3d707aeac3b4bed3bb04668014372009d6654098599d70e",
    },
};

int SubCryptoFrameworkNapiAgreementVectorTest0200()
{
    const int vectorEccAgreementSpecCount = sizeof(g_vectors) / sizeof(g_vectors[0]);
    for (int i = 0; i < vectorEccAgreementSpecCount; i++) {
        VectorEccAgreementSpec vecInfo = g_vectors[i];
        Crypto_DataBlob localSharedKey = {.data = nullptr, .len = 0};
        Crypto_DataBlob peerSharedKey = {.data = nullptr, .len = 0};
        Crypto_DataBlob sharedKey = {.data = nullptr, .len = 0};
        OH_CryptoKeyAgreement *localCtx = nullptr;
        OH_CryptoKeyAgreement *peerCtx = nullptr;
        OH_CryptoKeyPair *localKeyPair = OHTEST_ConvertEccAsymKey(&vecInfo, true);
        OH_CryptoKeyPair *peerKeyPair = OHTEST_ConvertEccAsymKey(&vecInfo, false);
        EXPECT_TRUE(localKeyPair != nullptr && peerKeyPair != nullptr);
        OH_CryptoPrivKey *localPrivkey = OH_CryptoKeyPair_GetPrivKey(localKeyPair);
        OH_CryptoPubKey *localPubkey = OH_CryptoKeyPair_GetPubKey(localKeyPair);
        EXPECT_TRUE(localPrivkey != nullptr && localPubkey != nullptr);
        OH_CryptoPrivKey *peerPrivkey = OH_CryptoKeyPair_GetPrivKey(peerKeyPair);
        OH_CryptoPubKey *peerPubkey = OH_CryptoKeyPair_GetPubKey(peerKeyPair);
        EXPECT_TRUE(peerPrivkey != nullptr && peerPubkey != nullptr);
        EXPECT_EQ(OH_CryptoKeyAgreement_Create(vecInfo.algoName, &localCtx), CRYPTO_SUCCESS);
        EXPECT_EQ(OH_CryptoKeyAgreement_GenerateSecret(localCtx, localPrivkey, peerPubkey,
            &localSharedKey), CRYPTO_SUCCESS);
        EXPECT_EQ(OH_CryptoKeyAgreement_Create(vecInfo.algoName, &peerCtx), CRYPTO_SUCCESS);
        EXPECT_EQ(OH_CryptoKeyAgreement_GenerateSecret(peerCtx, peerPrivkey, localPubkey,
            &peerSharedKey), CRYPTO_SUCCESS);
        if (localSharedKey.len == peerSharedKey.len) {
            EXPECT_TRUE(memcmp(peerSharedKey.data, localSharedKey.data, localSharedKey.len) == 0);
        }
        EXPECT_EQ(localSharedKey.len, peerSharedKey.len);
        EXPECT_EQ(OHTEST_HexStringToDataBlob(vecInfo.sharedKey, &sharedKey, true), CRYPTO_SUCCESS);
        EXPECT_TRUE(memcmp(peerSharedKey.data, sharedKey.data, sharedKey.len) == 0);

        OH_CryptoKeyAgreement_Destroy(peerCtx);
        OH_CryptoKeyAgreement_Destroy(localCtx);
        OH_Crypto_FreeDataBlob(&sharedKey);
        OH_Crypto_FreeDataBlob(&peerSharedKey);
        OH_Crypto_FreeDataBlob(&localSharedKey);
        OH_CryptoKeyPair_Destroy(localKeyPair);
        OH_CryptoKeyPair_Destroy(peerKeyPair);
    }
    return 0;
}

static OH_CryptoKeyPair *OHTEST_ConvertDhAsymKey(VectorDhAgreementSpec *infoSpec, bool isBob)
{
    OH_CryptoAsymKeySpec *specCtx = nullptr;
    OH_CryptoAsymKeyGeneratorWithSpec *generator = nullptr;
    OH_CryptoKeyPair *keyPair = nullptr;
    Crypto_DataBlob sk = { .data = nullptr, .len = 0};
    Crypto_DataBlob pk = { .data = nullptr, .len = 0};
    Crypto_DataBlob p = { .data = nullptr, .len = 0};
    Crypto_DataBlob g = { .data = nullptr, .len = 0};

    if (isBob) {
        if (OHTEST_HexStringToDataBlob(infoSpec->bobSk, &sk, true) != CRYPTO_SUCCESS
            || OHTEST_HexStringToDataBlob(infoSpec->bobPk, &pk, true) != CRYPTO_SUCCESS
            || OHTEST_HexStringToDataBlob(infoSpec->g, &g, true) != CRYPTO_SUCCESS
            || OHTEST_HexStringToDataBlob(infoSpec->p, &p, true) != CRYPTO_SUCCESS) {
            goto EXIT;
        }
    } else {
        if (OHTEST_HexStringToDataBlob(infoSpec->aliceSk, &sk, true) != CRYPTO_SUCCESS
            || OHTEST_HexStringToDataBlob(infoSpec->alicePk, &pk, true) != CRYPTO_SUCCESS
            || OHTEST_HexStringToDataBlob(infoSpec->g, &g, true) != CRYPTO_SUCCESS
            || OHTEST_HexStringToDataBlob(infoSpec->p, &p, true) != CRYPTO_SUCCESS) {
            goto EXIT;
        }
    }
    if (OH_CryptoAsymKeySpec_Create("DH", CRYPTO_ASYM_KEY_KEY_PAIR_SPEC, &specCtx) != CRYPTO_SUCCESS
        || OH_CryptoAsymKeySpec_SetParam(specCtx, CRYPTO_DH_P_DATABLOB, &p) != CRYPTO_SUCCESS
        || OH_CryptoAsymKeySpec_SetParam(specCtx, CRYPTO_DH_G_DATABLOB, &g) != CRYPTO_SUCCESS
        || OH_CryptoAsymKeySpec_SetParam(specCtx, CRYPTO_DH_SK_DATABLOB, &sk) != CRYPTO_SUCCESS
        || OH_CryptoAsymKeySpec_SetParam(specCtx, CRYPTO_DH_PK_DATABLOB, &pk) != CRYPTO_SUCCESS) {
        goto EXIT;
    }
    
    if (OH_CryptoAsymKeyGeneratorWithSpec_Create(specCtx, &generator) != CRYPTO_SUCCESS
        || OH_CryptoAsymKeyGeneratorWithSpec_GenKeyPair(generator, &keyPair) != CRYPTO_SUCCESS) {
        goto EXIT;
    }

EXIT:
    OH_Crypto_FreeDataBlob(&sk);
    OH_Crypto_FreeDataBlob(&pk);
    OH_Crypto_FreeDataBlob(&g);
    OH_Crypto_FreeDataBlob(&p);
    OH_CryptoAsymKeyGeneratorWithSpec_Destroy(generator);
    OH_CryptoAsymKeySpec_Destroy(specCtx);
    return keyPair;
}

static VectorDhAgreementSpec g_dhVectors[] = {
    {
        .algoName = "DH",
        .vectorSource = "NIST",
        .p = "ec6d9f4922c4b88d8d1918ced6f9eb56bcfd2bf5ab4578c0074918d9196ea9b9"
            "0b9d56c23d981646953ce04afe702fa10d4190e676fa9e37330ca0aa0c79bd1f"
            "271cbcbf8f8d4e27d3078113aed0f7f9b6514f1d70e88392ce3675577cf20d29"
            "a9bac7297be781bf8b27ffa3e862b4f17a99c5881fbf473fa277219322859b2d"
            "6caf73704f4d5c2f5d6aa53e5debec4c580a717f51e1e654f1d7334900c3e7c8"
            "8b08fff04e4eb3a17552b671c6ec44556008bb65bdd7ee82c1f614bd8060bafb"
            "da7f6f2fd8b53a2c2a00edf2d5b1f3283393d196567feeae5ea8d2ceeabe53fd"
            "c9edfc9a2483d9ba47c79b54da03dd884ec447b367161efd6b3cc62e3ed9977d",
        .g = "aecb0bce4bfc90dadda6353533f7214ad4f9abc2e2fa67da3e7785c26f9b44c3"
            "3c46caa99f1ade901d6af729d437b9500df739047de7d92f751d49a622569d5f"
            "1c882f28bd5b54e8ffe57fc43675bf58c40becb93fb988b7eea49b6fb5d63cd7"
            "f7a96572ce4e2b2da9b9e46ff70ac4e68b90684602d882363925f0b836062f7f"
            "12c3e639d09e3ea34251ff30b9ea1f4bd19199d371ef41d8017dff39cffb2b56"
            "dc2d7f20cb8ea074421d9f083e2e5a340454877459d8ee82c5d2eed9b6d6d99c"
            "245b9ab1fc76e99363eab561bf110288c470a23cc6f415bff26f3d808ebf0644"
            "2da31c100fce731c282477184c1a8fd2d27bcab967e33bd3ce3d2a6dd57f3bff",
        .bobSk = "3abef2371deeb26adfd40c1788b514c5f420eb09fa5e1bc0f9a552b1",
        .bobPk = "6088cd6a9308c4418d17f3c2764c5ac98d62c5655a3128b6bd2d81a6f2937347"
            "ad8d8dc6d01ca6a231bee08c187261ca963470e0cce76c14cf05e9b7b391642a"
            "e9d5c5cfe99d49d352d5f8e772815355800550c76c1072098216183e580f973c"
            "1aca1244a3a0cdd322ef6a70bb3d9d6067b8405191c7c217e11e47eee85adee1"
            "ef73b4aa565233eb323da013b9fa00b0664de3aa289ff70fc6339ef2b94ecd2b"
            "dba9017e9503b149559348d1cf461f41e8a12937157b71b14b7e514f907d07e9"
            "5496874b559ce25eb6c6318b4ba050ffaa521b8b8233ce5c93cf0c2aafd4a59b"
            "27268f943feabc81e15daee6ac847036cc962d28b4d1d40f3968c695432881bd",
        .aliceSk = "6f01b4a219e081b50f856aebc011e41680692e805a498df408960dba",
        .alicePk = "e796a148656a2b391a6f81dd7f83ad4a3a72f629a87fad6ec9f4616e0ae0b3de"
            "34cfb0640c0c92c1e8d845c517258bebcc9d8ae7fdd77dc72c6edc0ee05c2561"
            "294c0ef50ab90ba3b740bac32c9a2df17294f22bf5fea474e7ff48daea6abf48"
            "dba6f6c7562a6ddfaaf9c2146d3ae2f1de8b9e68092ad76caa767a2c96975fc8"
            "b1a88e8848eb089c438d5f932d633e79da19808fa3a1e411ad260565c4954ad3"
            "2bb0d94b0b746f5266241928f3f0a4441f318700d9e93c6d0f7d57e883eb8b37"
            "3f4e7893285967028e9e09c774344c05418d6359236fb092f2e3a45448365681"
            "7317abf309cd7f8016c501133bb8b40875a0ff3b04580abe4d4e717151105bd2",
        .sharedKey = "b5f47d4a7dabd5e69c2890df50c0cd6f4ab9568fc66779381fae5385b80d7577"
            "d5eae00f307ab39b7efc68f885c365e19f0a30c65ecb46b95fd08e0ebeac55d3"
            "d012b9f70294a268a254069574fb07a31625077b720cc1b943ab205e7a29e3db"
            "efaa4701a5afbb05e3d90ffe7c5f1b9ca9ad77d14a7d4448d7b7f552ec18aba4"
            "7dc034a8268b0438cc2ee4f1dad9f08000bf371dffeb8be77a7521e786add031"
            "44be775ce1c3425a62226b1aacef10476e6936b831828d9c545ddd9d6c4e7686"
            "1ba1825deff55d4bd3b0c4a9a938fdef3adbbea48206902b5665b9bed6b7c12e"
            "b5fd8c0b6da425654b41235d7852e139073bfb2cb7dce01294eec20f85847cac",
    },
    {
        .algoName = "DH",
        .vectorSource = "NIST",
        .p = "ec6d9f4922c4b88d8d1918ced6f9eb56bcfd2bf5ab4578c0074918d9196ea9b9"
            "0b9d56c23d981646953ce04afe702fa10d4190e676fa9e37330ca0aa0c79bd1f"
            "271cbcbf8f8d4e27d3078113aed0f7f9b6514f1d70e88392ce3675577cf20d29"
            "a9bac7297be781bf8b27ffa3e862b4f17a99c5881fbf473fa277219322859b2d"
            "6caf73704f4d5c2f5d6aa53e5debec4c580a717f51e1e654f1d7334900c3e7c8"
            "8b08fff04e4eb3a17552b671c6ec44556008bb65bdd7ee82c1f614bd8060bafb"
            "da7f6f2fd8b53a2c2a00edf2d5b1f3283393d196567feeae5ea8d2ceeabe53fd"
            "c9edfc9a2483d9ba47c79b54da03dd884ec447b367161efd6b3cc62e3ed9977d",
        .g = "aecb0bce4bfc90dadda6353533f7214ad4f9abc2e2fa67da3e7785c26f9b44c3"
            "3c46caa99f1ade901d6af729d437b9500df739047de7d92f751d49a622569d5f"
            "1c882f28bd5b54e8ffe57fc43675bf58c40becb93fb988b7eea49b6fb5d63cd7"
            "f7a96572ce4e2b2da9b9e46ff70ac4e68b90684602d882363925f0b836062f7f"
            "12c3e639d09e3ea34251ff30b9ea1f4bd19199d371ef41d8017dff39cffb2b56"
            "dc2d7f20cb8ea074421d9f083e2e5a340454877459d8ee82c5d2eed9b6d6d99c"
            "245b9ab1fc76e99363eab561bf110288c470a23cc6f415bff26f3d808ebf0644"
            "2da31c100fce731c282477184c1a8fd2d27bcab967e33bd3ce3d2a6dd57f3bff",
        .bobSk = "13309c3a9d824a4fb0e6c103bcf33504e98a4e52474a62a28e68269e",
        .bobPk = "4ede61e9c7444400fcacf1d91e4a6d1bdbb68166668a60b2f54593ee9cd9861c"
            "ae788e0d8c1deb8e109f4f051cc339477acc08b77d5540bbbeb290dbe1f560b6"
            "c4d35223a8ffea34d91c5075e11e2439f58ba2ef606347588250ecfc909e27d8"
            "b43c4d8765e51ee9a147fdcf829062dfe99b342e0e3a253561ea6107236760b7"
            "334b46749aa85e96493f5c1e1e52177840aaedcb64b98987571154095130ceb2"
            "49de8f2410e6ab511273b02dbf733bdb8134d5a19a28690b38ba8e0802cf9414"
            "d28c1db4864a5c65876aa364aa80dae00df7ecd01fa2089f1dcd843a9f6d87dd"
            "018dfdb171e7d5b4e67d0e9d8564019367bf726ce21f08aa52bf0bdd619523f7",
        .aliceSk = "2cefac774b820ffff233f843981f00feb396095bc4dc6462398d5251",
        .alicePk = "97dffa91e261f7d56ce9d3cf014de4fe76f101ab02c63966cf2a4aaeb26f8c50"
            "06d4a9c664c472c24c683b26852a8dc89fcc517261ada6f365bc625f2e5d223e"
            "6f6e81ce451a97143e6d8c5c6db5ca62af32a6eb178ac027504c03f96f5c5448"
            "ee527ad639dd4e54de239ac9e2104672af2b0884ef951cc0b50a5af225457cb7"
            "364d90dcbc0e357d46309203a387769ca6dc24903bf108d01d975546405863e0"
            "d1ff61460e158254fd4af495badffc167742df5be8c8228fe038fea95342f762"
            "769cddb74b109f90d60b2a5e2a17c791ad3ea71fb48f064e1a0ae1f901953294"
            "394a7cd54a08de0ae52c9c0805c0d862c830c60d4ac66551e5dbdcbb439de29e",
        .sharedKey = "9731a340d8511a83cfee6497b5bb9cc089678e0be85df16b4afb36bc597a949f"
            "8bf49941f3cd514faba6a2cf41928ed87b4aafd4d0febc3774c868e02e0bbf64"
            "4c2f675573a048583babfb4eb11d41921d392c4f10bd81f096af9510a76eeab6"
            "52fede4ba4288e876122e265aa7f9415830f8274958f106d24246b488cd0d80a"
            "d117bc631d800db5e059db630769a86f99e87d483006358a6faeb44a8e1646d7"
            "e9c44a60d8d8a1a36106f01484fa3da93b56e4145c7f156ce848939f79069cbef"
            "22bb52df7008adb32880d4da2e803fce901498d8cdcb7fc317ab129ea1a74387"
            "0b82ab4c5b5acb20dbd4e7f0dbda93ca5faa84aeb556237d25fe56ee21d6b5d",
    },
    {
    .algoName = "DH",
    .vectorSource = "NIST",
    .p = "ec6d9f4922c4b88d8d1918ced6f9eb56bcfd2bf5ab4578c0074918d9196ea9b9"
        "0b9d56c23d981646953ce04afe702fa10d4190e676fa9e37330ca0aa0c79bd1f"
        "271cbcbf8f8d4e27d3078113aed0f7f9b6514f1d70e88392ce3675577cf20d29"
        "a9bac7297be781bf8b27ffa3e862b4f17a99c5881fbf473fa277219322859b2d"
        "6caf73704f4d5c2f5d6aa53e5debec4c580a717f51e1e654f1d7334900c3e7c8"
        "8b08fff04e4eb3a17552b671c6ec44556008bb65bdd7ee82c1f614bd8060bafb"
        "da7f6f2fd8b53a2c2a00edf2d5b1f3283393d196567feeae5ea8d2ceeabe53fd"
        "c9edfc9a2483d9ba47c79b54da03dd884ec447b367161efd6b3cc62e3ed9977d",
    .g = "aecb0bce4bfc90dadda6353533f7214ad4f9abc2e2fa67da3e7785c26f9b44c3"
        "3c46caa99f1ade901d6af729d437b9500df739047de7d92f751d49a622569d5f"
        "1c882f28bd5b54e8ffe57fc43675bf58c40becb93fb988b7eea49b6fb5d63cd7"
        "f7a96572ce4e2b2da9b9e46ff70ac4e68b90684602d882363925f0b836062f7f"
        "12c3e639d09e3ea34251ff30b9ea1f4bd19199d371ef41d8017dff39cffb2b56"
        "dc2d7f20cb8ea074421d9f083e2e5a340454877459d8ee82c5d2eed9b6d6d99c"
        "245b9ab1fc76e99363eab561bf110288c470a23cc6f415bff26f3d808ebf0644"
        "2da31c100fce731c282477184c1a8fd2d27bcab967e33bd3ce3d2a6dd57f3bff",
    .bobSk = "991b062bd3d604203eeba196d94642150c07e9ea17ebe6b571f5bc9e",
    .bobPk = "93e4cb6d5f2fa98600ca6e99d2e1882f8fcbe55adc15bdc71df925427f1b832b"
        "80e545abd9022b65fe691846c1cc0400bd13e54aacde58f1067c73d67fb252b4"
        "d789acd65d899ffeb6fb32e9ec6e0de882f108345fd2c653c1d212e84d789373"
        "60a2da6f3bff24ffd5f30915dfaae84ba91b17e9dafd9bbe39a56cc53c932ad7"
        "2fb7dd45538bc9e4faf13b21843e04d5dc86681db97d6b9cd83c6d39c8c67cf9"
        "385ae05c55f3669f7fee7f18736b7fb6a1d8ff55210485f777d7ef5aca6c5af3"
        "e2a2f2975e5c9f9ecad22f88181bbf77f16e8c45bfe7934fc81a554295c6fbd1"
        "8d2e5b7cf3370b746a17a1010c3f1466594649bce01a13f805a36d24dd7bc7c6",
    .aliceSk = "77227c7376005860f62b3d1269e339f0f62f3a57efedb5636835d613",
    .alicePk = "5cdf1e3247c60fc224eacfdc5a6753224d029eb0680a4cf855e4da86b0d92efd"
        "3fe59292871cd16fee4afa89d525b40218d4971241297a9e1f2490b58fa0d6c7"
        "46e2e324a0855dc7fffdc30dc1704e946f143ffa208ead22496482faeef56495"
        "46d7e82412f3e7e590a60832c2ba44f359aa2ffcdf6e9201037353346052ffe5"
        "f8532c9b3b0bebd0bf03247f07c3cff5167aeb7e8d842cb810f15f62a3460aea"
        "fa63c208e4189acfdb3ea3f9476a8df1dbe9cc2265f41c78c6a7fe02708313fe"
        "151f0e38a70cead01cfc1df1c54975f97ab21e2f0b09582034e9799e04f42aea"
        "04c2f496ddc2b1ff4bae0c4a84e1468c15e4b0a2fe8f7d7bbb553a00eafddb19",
    .sharedKey = "66257222d2cc3a25f7f5a6174fb11362875e74aba8d342a782dd981f677bc9d4"
        "f98387c835c3de999f80b077866098c7939d58f1253a76f9f92dae298b42ff60"
        "c7e5e03bc685458d5637b17f6f8f80710ea3887061d621fe18ad7335f31aa4d8"
        "7eee568d90c3c1c4924136152ac166e13cb4c56ee19d2b0f4acd6930cfcdaca2"
        "3be49781e88d28d6e172f656b08fb4f32303b60ff8bd8b7b61d4e22e427e1fb9"
        "498123285535effd9c74af7af7fc6fb431013363be8b85627a51edf45470fd36"
        "9ea7300156dac3465ede79f91c0f0c2c3563f1e151b20567c97aac3033e55068"
        "f91afaa0f39f84436c179c5c2f27588b982c5c9dfeb3675bdd600c46a736a997",
    },
    {
        .algoName = "DH",
        .vectorSource = "NIST",
        .p = "ec6d9f4922c4b88d8d1918ced6f9eb56bcfd2bf5ab4578c0074918d9196ea9b9"
            "0b9d56c23d981646953ce04afe702fa10d4190e676fa9e37330ca0aa0c79bd1f"
            "271cbcbf8f8d4e27d3078113aed0f7f9b6514f1d70e88392ce3675577cf20d29"
            "a9bac7297be781bf8b27ffa3e862b4f17a99c5881fbf473fa277219322859b2d"
            "6caf73704f4d5c2f5d6aa53e5debec4c580a717f51e1e654f1d7334900c3e7c8"
            "8b08fff04e4eb3a17552b671c6ec44556008bb65bdd7ee82c1f614bd8060bafb"
            "da7f6f2fd8b53a2c2a00edf2d5b1f3283393d196567feeae5ea8d2ceeabe53fd"
            "c9edfc9a2483d9ba47c79b54da03dd884ec447b367161efd6b3cc62e3ed9977d",
        .g = "aecb0bce4bfc90dadda6353533f7214ad4f9abc2e2fa67da3e7785c26f9b44c3"
            "3c46caa99f1ade901d6af729d437b9500df739047de7d92f751d49a622569d5f"
            "1c882f28bd5b54e8ffe57fc43675bf58c40becb93fb988b7eea49b6fb5d63cd7"
            "f7a96572ce4e2b2da9b9e46ff70ac4e68b90684602d882363925f0b836062f7f"
            "12c3e639d09e3ea34251ff30b9ea1f4bd19199d371ef41d8017dff39cffb2b56"
            "dc2d7f20cb8ea074421d9f083e2e5a340454877459d8ee82c5d2eed9b6d6d99c"
            "245b9ab1fc76e99363eab561bf110288c470a23cc6f415bff26f3d808ebf0644"
            "2da31c100fce731c282477184c1a8fd2d27bcab967e33bd3ce3d2a6dd57f3bff",
        .bobSk = "90304ebe3fe2cfc052fa7a8e8907c9d53b9c95fee2a7934ccabd15bd",
        .bobPk = "d9bda4c8d4d7d678ed57d5fa534ebe302a1537ca1006b6b271a9ed76feff75ba"
            "f70b162724ac53a7282b59c7ba4e03efb0b8c2112f8e5b7af6f9ddb40d67b065"
            "db9576c6fad05db4dd4ebd66fb9b61ac26c9118ea919faf4ab1e956759d149ea"
            "809fed69200bff850f3fc94498956ba5e84cd091925b0e8b0495bfbf0fbfec14"
            "b52512809a675bd7982a19f3a9bd9791fb23934adbd2625789a53f3baca53dc7"
            "1837c7f949d7dd37f1ee61fa2a6910df7674db49f48e3725f7a6828270d89b75"
            "716f6ad1831008e405c547ee218c38816f253bf773ad046389516bdae7e44002"
            "6a02bf42c56c22323ab6fdeeee8cd8ba9cd01e096aab87bd264c6499e5640bad",
        .aliceSk = "48561d8c5f969cb0b70c037d119bbdd339e900bc075d82e54a3a2187",
        .alicePk = "c65d07a6ede99c32713b8b20a2f29b52c81a3c68c0230a190836b7a129c35f79"
            "c0ecf70787846bd36f7ea910498b94bbe2a1e47fadca535ab4ec26e41de4f43d"
            "de4430598638054b08cf547009c8fb780695133a1f424c885cce914efcc3bb81"
            "d4cc97b2ab44f1bf1824639f264d6647cb3a5aeedf6f743ea768c1a96a01376f"
            "64c251fd9669c9a64dd330020bd15039f9bb68666b646e1fd1f1d24f7b214043"
            "140968b66fe2ccec9c653584dc8adbaabdf232a86dcf7fc9f675b35fe0689768"
            "a88614af3ef8e0b18ee5e50c8575aa62f1af5bd17f34d133f13bf4e7dc7eaed2"
            "12ac6760946a0163caddabad68d3dd9561c0f66ccd75068d50bc93a642c6dd53",
        .sharedKey = "b288765f0c306ad3f439f0eff63667795c53929bcb885ec61522d6caa8f43fb8"
            "6f135dfe6efd0357a738802af8b87bce442c8673d4dab0dcf28c005aee821d17"
            "b281fe7d7376c7b0a7c634d53f06b67acc9795baeee72cf95fad97ff4dc6b645"
            "4f0af157fc9ad5b5aa8e21cda68c90fa0839c3dcc1dd51550b7c926f455ae663"
            "f97fff135376dedf0fd22c2d4366c474c03e1a559f3858c35b3f01e7f53b7456"
            "c7efeef2abc039cf97a4fbed6e144de09f9d1426bf76cf1b17f3195acde1d40f"
            "59be6e126a87c59a414afb392b1f8af6d78b0dd8c598bad5a55a5dcf4660f0a8"
            "52a43a1a4d4a8f11d91c82ed47b658d03917e88b8dc3cdda938a1f5075634d8e",
    },
    {
        .algoName = "DH",
        .vectorSource = "NIST",
        .p = "ec6d9f4922c4b88d8d1918ced6f9eb56bcfd2bf5ab4578c0074918d9196ea9b9"
            "0b9d56c23d981646953ce04afe702fa10d4190e676fa9e37330ca0aa0c79bd1f"
            "271cbcbf8f8d4e27d3078113aed0f7f9b6514f1d70e88392ce3675577cf20d29"
            "a9bac7297be781bf8b27ffa3e862b4f17a99c5881fbf473fa277219322859b2d"
            "6caf73704f4d5c2f5d6aa53e5debec4c580a717f51e1e654f1d7334900c3e7c8"
            "8b08fff04e4eb3a17552b671c6ec44556008bb65bdd7ee82c1f614bd8060bafb"
            "da7f6f2fd8b53a2c2a00edf2d5b1f3283393d196567feeae5ea8d2ceeabe53fd"
            "c9edfc9a2483d9ba47c79b54da03dd884ec447b367161efd6b3cc62e3ed9977d",
        .g = "aecb0bce4bfc90dadda6353533f7214ad4f9abc2e2fa67da3e7785c26f9b44c3"
            "3c46caa99f1ade901d6af729d437b9500df739047de7d92f751d49a622569d5f"
            "1c882f28bd5b54e8ffe57fc43675bf58c40becb93fb988b7eea49b6fb5d63cd7"
            "f7a96572ce4e2b2da9b9e46ff70ac4e68b90684602d882363925f0b836062f7f"
            "12c3e639d09e3ea34251ff30b9ea1f4bd19199d371ef41d8017dff39cffb2b56"
            "dc2d7f20cb8ea074421d9f083e2e5a340454877459d8ee82c5d2eed9b6d6d99c"
            "245b9ab1fc76e99363eab561bf110288c470a23cc6f415bff26f3d808ebf0644"
            "2da31c100fce731c282477184c1a8fd2d27bcab967e33bd3ce3d2a6dd57f3bff",
        .bobSk = "45e344e143fd629e6dbc9ea3856227e9bc85a05bf204cc076bca0d14",
        .bobPk = "1e7eeeb1f82425b04fec5268e50f123bb9bcb00c4dd5d154a869f4f0e9cbfc7c"
            "3cc2220764a7da885148f0b621a72aff827dca426572d500e22e36cb76eb1db5"
            "0adfdec678271c4a811b25dbe653801a1ce5f3744a75a3b8a5c3b252f2c70275"
            "d3995fad65daca10f6056dea8122ecca1b7ad5814b623e4ab1fbf7254b3b25b8"
            "c4a47639d7d3887cc627b4f89291dfdf8d8fb60630b370ebd944d528e44f6682"
            "d62f1438a86f5ea339ed511258d230f7b5eeab8263ee6522c98a6bd1261321d0"
            "5e77dabce970ca062ea199bd3383e89cc61de4057a737207933bf32ea418fab4"
            "24ba7b608b5d3991833ee5742e9417b11f5f41c9aa420563e9f654ef6b751bf5",
        .aliceSk = "21b48fa77080e8fe23887a8b5539c821c8cfb0023993a145f9380e09",
        .alicePk = "502c9154b03197a8d992d7c63f3e3e140b00a8bf49d8d3c4e79d0f2a3163bc0f"
            "3b73fe6e72b92bfa9abc1d4f9f81190e89383383b709c1352f328c524bd036a5"
            "4a685fc6e231d9addcc20069e5a972d0372f362285e41a099345ccf7e3460afe"
            "2482b0bc41558f7e887b58ceb3ddb9a77d42aaaedac7565d8f4201f338fe87d2"
            "7b9438058fd342740a30ce776f40266b019acf3ced9b414b842a0322821d171c"
            "bfdba711410ce7c3f3a5225344088f9c581033cb382aedbcd964841dece56376"
            "495ff1d1525aaf6f46c045ed7719f723d4bff6a3abb030fa7f625e4eb8199692"
            "c9a83a9278a294dfdbb1ce3ddc9f33064b5b061704d9fe7478bfe755ddaa1f4d",
        .sharedKey = "231073548f845acfffe37aaf04af10ecf4dede34508521ddf8800dbdb637cfaf"
            "f9ac47870050eb0be7a4cb44173528dc37ca1d696ce227067fc628bb0d8634df"
            "38ef8a2aa913d7d72260aac7aa2f8aec0814fba0477e2812d689f785e2ca4e84"
            "db29612f95a668c25c9cfb932fc307f63e0fa6ecc7d0778d486cf29c322d12c5"
            "afac31b5779d86ed9f696c1b6235a09f6fe29207defd4be2bdfafe9f9f8d5698"
            "f8193ca852d49e9dfda293fd5ff872c23e71874bb0b897019ce7e1d6a5e208dc"
            "cb1b541158c70a5be029283fa26d5a5d311d9f82cf4714782ddeb4bba48f716b"
            "c8ca812557e78cb2244e5a1fd98f67e1bbade66efc8c2119db3b090a6d5717f4",
    },
    {
        .algoName = "DH",
        .vectorSource = "NIST",
        .p = "bbe983d501d1c8f328ff361a82c89b9f72be14205e1513a02489790a6744d905"
            "59905183f0edb57d1a9af4696d82c35fe2979459b9b27a7bac6dba21e9b4e964"
            "d9885ce0bf625bd44c0ec90dab62e6f323f0a1d1da836606d3771400761121b6"
            "a56ac54d38bc506a9f89d69173ee2f7745ebcf0266d5d6c994246b99880d5fe6"
            "1953303d01409f4c75ae7bfdd8ea2d776d0a3a6161cb284da6c92cbe459ec5ee"
            "42cfde8668014234c363ddeb5244e25eefdd96176690c4c9d8524508c2c26a44"
            "7316ad12bf90ac48d3d0658a18c96c2324614201c5e58e1d85b74072536d3c15"
            "5152093805c7f58e9da0f0b9415054c67046313ec64d6f4885a46b161586a699",
        .g = "34499084ea17683867394ada44d286ac8c9c755050dd7e8f1f4235b0466e40a0"
            "2f55a09eb8f68bc862437f5f45b69fb12a923eff93d1a96c0a55513591cca837"
            "7ca2ddb50da0bd4adda14d8ba21e59734958b723f2673e5007abce8e4ef6df09"
            "984004652598a2939b1e151b8dbf0c8780eea40fd9e808b6ae1ecffa730d193f"
            "78c9eb7fd728391fa6ec6515d284c08c2ac11b273dc9709dd763b3e18dbb9d5e"
            "611bc783c337382aea6a6622e7045b878b3dc58c45d6502280beca16637cdc0b"
            "ad352eb59bf736fc6b17f0e28cb68f816dfa498c5e706e5d5fdd4981e4752fe3"
            "71b42d10b5a27e25422e7c70005efc2ec03f21026fe5008bdeee9b1a5a8a1940",
        .bobSk = "d72a8b812b227a7e0ec1be32fedcdaf4da4ee2e36e73402872f94620b6d4b1dc",
        .bobPk = "b40d9a6860c30f0c2ad3304f4b548126b9ba583ceb7745e110c6faceb9c69155"
            "213bea8a86cd5b9fc19f64cc0d66fe332128bc7ffeafd3188c5273b4e7ba505e"
            "981eac7db5f12ad95047fb6f1e34aa9dff3120b8550fc571b9349f2339cd96de"
            "9c119d0e6be10f690a77c75aedc52a9590c79294f80381aafc343cec6b624d03"
            "7a6a7c92f72c3884337ef3fdae20b0c660765360f37750960dbc40e499fce579"
            "da3b6598fe286868c687bbc8127c1d0b42e9b46cd91b23ba34593b866045b625"
            "48537cc7f824b8f671b54298de8c6e617e1bf9ab524f03d1de30b485a73b97da"
            "975fbe8ad62e199129b4666d037343be134782208021f23ebc66a607387177e4",
        .aliceSk = "641f5aa7c7394af1b21a975dfb692094078eee35cafce0f5605863431a6da681",
        .alicePk = "43888d2ef03e8b1e709fe5803b7f258b785515547151e5a91805344e6f0fbd7c"
            "dfe5c21b77404fc70989e635c7215ce5e5116884efe29818bbc0ee95d1858b3c"
            "9734d4595dee0ac275b1cee1ad119595666a420ac170b2bdf973671d6772eaaaf"
            "c8a310422852eb16d1fe2f278dc70f0baddeb5cba5ad7b8c2d7a60fb485bc9da"
            "9d35d954d1ce469f211136fa2001d7864a57effb00857891d810b8f36d468474"
            "14575d0538eedc46dc991eda739f42a9b7f362717795e586ab95105946429f10"
            "f00456771387d65a8923da9969559742bf265b683e001fe65c3ee0598979565b"
            "49e8393a761be8a8a5a254d3b391257a7dcf4204d58152aced1ee0be943e211",
        .sharedKey = "8ad927defbd51c3f0010486493a6016c91f7b462552a1688e4f6b49747da924c"
            "b8eacace8efa194cd563397e0bb5e38b7248992b7fb51579e12ea85061e6688b"
            "302e9a5e2e0d61e55ac08b30f7a63276d79e65249a473f3f852b7caadb3ff44d"
            "5561b27a24d43f850e2065c39bb8d187fcb6e8c8c37a9f5e8b00fa5e8f337328"
            "57d49b591884fa50bf55e24dd0d63a9b586da470dc51509b884956a373d9bb0e"
            "0fec33602793d514aba435e8b5bcffc93f32f92b22ed995c54483abf1bf202e9"
            "7b51eb985c19efb41ad371784494b788f318144e793faab766c9bfadcafcb858"
            "a0a4c279539e0d5064fe8e78b70d8e866132d62c35fd779f725a1123596db8c4",
    },
    {
        .algoName = "DH",
        .vectorSource = "NIST",
        .p = "c170a05419ed997cfe34143808f447a982c91cfa8238ba3fc12d1bfb717843aa"
            "99a4a27e1d1a9797440be156391be3bb2636c2bbbdf60aa3b80bf9df700fe583"
            "22b6c6c18e813b213d64709b4178a54ebc8feb39766c1b7d93fd55db01b8e284"
            "ba68f528f0b004aa436a9e3b7fb30f4b86d050aba98cdb17556eeb4e6c2c963b"
            "00da63d739185d0cc4ac52232d288945dd1c50e02930c3b186869325e987defa"
            "04d6e5363a2f5b5e7e1b9246199f493fbb4cd018c06777f5138a21c0fa8b1112"
            "48520977b472ca4c95456979bce3dcf483102a58b1dc21f78a5f23a13c72458a"
            "eebd0b685497c91a66b70d3ad2f2f009c22cf60f23e5a47985cd4f5731094515",
        .g = "0b3eb89f51aee5f9008b0712d0b8312985f864f1e2cd112fd945ed82928a688d"
            "baf83a23e73ea84dff0ad532b8d9e04df8103ed771a6342f0ecb5e4364cacca3"
            "d1a1aa41f12444f1fbd4c6a0d7620fdcd378affeb9802db0730c3ac82ec99641"
            "d733450360cb84c7150b07ba7b6a3247eeb63b5d35b16ebc026f32bfd8bdef1e"
            "3cc2c41abecf36f39909d9e3d1fe7e6eac0b94b925249b7a4c1cdab82e5937d9"
            "93c960d8fd88860b999691bea622fd2850c72d1c10b35a32c7a7b662523750da"
            "17b6d6992606f179467c36aa6b2a1777843c3e72e066c77ccce82f3791e7ecf8"
            "5ca3d5a41a5695e7e7ae333ab1d6f6cbd23d2ee0956346c31f67b4a0c9ae04c5",
        .bobSk = "ba55f824ff37b9e2ca94d2f5b5756c592a74aed1895e2a64b8ee47cd6b6e8c05",
        .bobPk = "b7896bad94401daf346901f6b3b48d6d82bb86fac1f7038dc795d7d131494b2d"
            "6957fc4a85476a9ea28659c00371e8b81f83a9d55506488dc7f964f5a7cf7479"
            "06262e8940b9359c623af445a9d82478b6a9946c6e28d55e2f29827179715b8c"
            "e0269eb21dce3a112ed3e38091559adb7f4cc5bc8cc719c3cad6adbba9a02019"
            "32a3589476d69171ae6c18354a6cc5f7ed8aa60d5239b20fa852c65ae57801c0"
            "867be164ca7c199a88fe5fcb33b81601761340d7e124a7a3b70b7fd371e93375"
            "0a43bb741d631e4dde965a373895e0be090838585f3698beab147675519d9b36"
            "cab1265d8ea550a1a9ef018bfb2d222ed4da99880ab54e321f98e65bbea72575",
        .aliceSk = "65fae866df2f463bd596159fe88efdfc9bf76bb47ded413a176902bb8fe1b9ff",
        .alicePk = "0aef33da26c75f03261b2ce928765ac3a546eef8d07242fd8a7e3bad8760a534"
            "9c90db18880e9165fbd11631c6b07f88cdad2be71f21dbb95be744ad7b62d4a4"
            "a226d16429877dc60ecba4067a398a2d434ab9e63195987ba1d73a9b9d0dbd0f"
            "bd6c938084657bc35b3b5c2d4037789969344c58f452654057421486355c806b"
            "c8f6d2c3ee6b0694b012241f2d739a349043d46342e72e2da8ad15e92005986e"
            "cfc90b93c2c1100081dc2eedcf8f9180d53c1d7a81e3a4dfe71f233a04db0f10"
            "680c0fa2d087c647b9758f2f1e347388524b8865479da7aa2f736ee8f828fa15"
            "7f405d6abb762f62a6d83deaf7092ba06996018455234d1673b86a63320ff9ba",
        .sharedKey = "ca89b9c87e4233aabda6cf39cb3ad74c02ba29fc7a35ee6d7a3ee05261704d18"
            "34c24f42a695d470494f66e373f87dfeaa414478150ea54560db0dee5f4a4701"
            "1a6a2e522c23a33aeeb567f881ea05522de1b1173d3713e6ebd7e63d8939afed"
            "c728021e2ea613d4899e3187391d4c838f3ac979fa11cb704b71f9d586cf1134"
            "e039546cd243c935f19ef04614f7d58c808bbe33aa71578019cc5b665aa4c7e6"
            "d23249fc7202046c059386c0e85076dd4f2371c6ce16df7804d8002561c69fab"
            "27160316f45cfa9b3b3645014ed22ea38eb8720dfcc2616cf32cd6454c911c64"
            "a4cbf3b38f6608d2604a7e6549184391c52348c14b2e5f282cecea583dc65d",
    },
};

int SubCryptoFrameworkNapiAgreementVectorTest0300()
{
    const int vectorDhAgreementSpecCount = sizeof(g_dhVectors) / sizeof(g_dhVectors[0]);
    for (int i = 0; i < vectorDhAgreementSpecCount; i++) {
        VectorDhAgreementSpec vecInfo = g_dhVectors[i];
        Crypto_DataBlob localSharedKey = {.data = nullptr, .len = 0};
        Crypto_DataBlob peerSharedKey = {.data = nullptr, .len = 0};
        Crypto_DataBlob sharedKey = {.data = nullptr, .len = 0};
        OH_CryptoKeyAgreement *localCtx = nullptr;
        OH_CryptoKeyAgreement *peerCtx = nullptr;
        OH_CryptoKeyPair *localKeyPair = OHTEST_ConvertDhAsymKey(&vecInfo, true);
        OH_CryptoKeyPair *peerKeyPair = OHTEST_ConvertDhAsymKey(&vecInfo, false);
        EXPECT_TRUE(localKeyPair != nullptr && peerKeyPair != nullptr);
        OH_CryptoPrivKey *localPrivkey = OH_CryptoKeyPair_GetPrivKey(localKeyPair);
        OH_CryptoPubKey *localPubkey = OH_CryptoKeyPair_GetPubKey(localKeyPair);
        EXPECT_TRUE(localPrivkey != nullptr && localPubkey != nullptr);
        OH_CryptoPrivKey *peerPrivkey = OH_CryptoKeyPair_GetPrivKey(peerKeyPair);
        OH_CryptoPubKey *peerPubkey = OH_CryptoKeyPair_GetPubKey(peerKeyPair);
        EXPECT_TRUE(peerPrivkey != nullptr && peerPubkey != nullptr);
        EXPECT_EQ(OH_CryptoKeyAgreement_Create(vecInfo.algoName, &localCtx), CRYPTO_SUCCESS);
        EXPECT_EQ(OH_CryptoKeyAgreement_GenerateSecret(localCtx, localPrivkey, peerPubkey,
            &localSharedKey), CRYPTO_SUCCESS);
        EXPECT_EQ(OH_CryptoKeyAgreement_Create(vecInfo.algoName, &peerCtx), CRYPTO_SUCCESS);
        EXPECT_EQ(OH_CryptoKeyAgreement_GenerateSecret(peerCtx, peerPrivkey, localPubkey,
            &peerSharedKey), CRYPTO_SUCCESS);
        if (localSharedKey.len == peerSharedKey.len) {
            EXPECT_TRUE(memcmp(peerSharedKey.data, localSharedKey.data, localSharedKey.len) == 0);
        }
        EXPECT_EQ(localSharedKey.len, peerSharedKey.len);
        EXPECT_EQ(OHTEST_HexStringToDataBlob(vecInfo.sharedKey, &sharedKey, true), CRYPTO_SUCCESS);
        EXPECT_TRUE(memcmp(peerSharedKey.data, sharedKey.data, sharedKey.len) == 0);

        OH_CryptoKeyAgreement_Destroy(peerCtx);
        OH_CryptoKeyAgreement_Destroy(localCtx);
        OH_Crypto_FreeDataBlob(&sharedKey);
        OH_Crypto_FreeDataBlob(&peerSharedKey);
        OH_Crypto_FreeDataBlob(&localSharedKey);
        OH_CryptoKeyPair_Destroy(localKeyPair);
        OH_CryptoKeyPair_Destroy(peerKeyPair);
    }
    return 0;
}

} // namespace Unittest::CryptoFrameworkAgreementNapiTest
