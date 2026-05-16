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
#include <cstddef>
#include <cstdlib>
#include <cstdio>
#include <pthread.h>
#include <cstring>
#include "include/CryptoFrameworkSymCipherTest.h"
#include <CryptoArchitectureKit/crypto_rand.h>
#include <native_drawing/drawing_text_blob.h>
#include <hilog/log.h>
#include "include/CommonToolTest.h"
#include "include/Result.h"

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0x0000
#define LOG_TAG "ActsCryptoFrameworkNapiBasicTestTag"

namespace Unittest::CryptoFramework {
class OHCryptoFrameworkSymCipherNapiTest {
public:
    static void SetUpTestCase() {};

    static void TearDownTestCase() {};
};
class SYMCIPHER_TEST {
public:
    static void SetUpTestCase() {}
    static void TearDownTestCase() {}
};
class SYMCIPHER_AES_WRAP_TEST {
public:
    static void SetUpTestCase() {}
    static void TearDownTestCase() {}
};
class SYMCIPHER_CHACHA20_POLY1305_TEST {
public:
    static void SetUpTestCase() {}
    static void TearDownTestCase() {}
};
class OHCryptoFrameworkSymCipherIvErrorNapiTest {
public:
    static void SetUpTestCase() {};

    static void TearDownTestCase() {};
};
class SYMCIPHER_IV_ERROR_TEST {
public:
    static void SetUpTestCase() {}
    static void TearDownTestCase() {}
};
class SYMCIPHER_CHACHA20_IV_ERROR_TEST {
public:
    static void SetUpTestCase() {}
    static void TearDownTestCase() {}
};
class OHCryptoFrameworkSymCipherGcmNapiTest {
public:
    static void SetUpTestCase() {};

    static void TearDownTestCase() {};
};
class OHCryptoFrameworkSymCipherCcmNapiTest {
public:
    static void SetUpTestCase() {};

    static void TearDownTestCase() {};
};
class SYMCIPHER_GCM_TEST {
public:
    static void SetUpTestCase() {}
    static void TearDownTestCase() {}
};
class SYMCIPHER_CCM_TEST {
public:
    static void SetUpTestCase() {}
    static void TearDownTestCase() {}
};

const int VALUE_3 = 3;
const int VALUE_4 = 4;
const int VALUE_5 = 5;
const int VALUE_6 = 6;
const int VALUE_16 = 16;
const int VALUE_20 = 20;
const int VALUE_63 = 63;
const int VALUE_64 = 64;
const uint8_t PKCS7_PADDING_FLAG = 1;
const uint8_t VALUE_0 = 0;

typedef struct {
    const SymCipherSpec* cipherSpec;  // 对称加密规格参数
    OH_CryptoRand* randomObj;         // 随机数生成器句柄
    OH_CryptoSymKeyGenerator* genCtx; // 密钥生成器句柄
    OH_CryptoSymCipher* encCtx;       // 加密句柄
    OH_CryptoSymCipher* decCtx;       // 解密句柄
    OH_CryptoSymKey* keyCtx;          // 密钥句柄
    OH_CryptoSymCipherParams* params; // 加密参数句柄
    Crypto_DataBlob msgBlob;          // 原始消息数据
    Crypto_DataBlob ivBlob;           // 初始化向量IV
    Crypto_DataBlob outUpdate;        // 加密结果
    Crypto_DataBlob decUpdate;        // 解密结果
} SymCipherTestCtx;

static void SymCipherTestCtxInit(SymCipherTestCtx* ctx, const SymCipherSpec* spec)
{
    uint8_t zero = VALUE_0;
    SafeMemset(ctx, sizeof(SymCipherTestCtx), &zero, sizeof(SymCipherTestCtx));

    ctx->cipherSpec = spec;
    ctx->outUpdate.data = nullptr;
    ctx->outUpdate.len = 0;
    ctx->decUpdate.data = nullptr;
    ctx->decUpdate.len = 0;
}

static int32_t GenerateRandomData(SymCipherTestCtx* ctx)
{
    int32_t ret = HCF_SUCCESS;
    int32_t randomLen = ctx->cipherSpec->msgLen;
    int32_t ivLen = ctx->cipherSpec->ivLen;
    ret = OH_CryptoRand_Create(&ctx->randomObj);
    if (ret != HCF_SUCCESS || ctx->randomObj == nullptr) {
        return ret;
    }
    ret = OH_CryptoRand_GenerateRandom(ctx->randomObj, randomLen, &ctx->msgBlob);
    if (ret != HCF_SUCCESS) {
        return ret;
    }
    if (ivLen != 0) {
        ret = OH_CryptoRand_GenerateRandom(ctx->randomObj, ivLen, &ctx->ivBlob);
    }
    return ret;
}

static int32_t DoSymCipherTest(SymCipherTestCtx* ctx)
{
    const SymCipherSpec* spec = ctx->cipherSpec;
    int32_t ret = CRYPTO_SUCCESS;
    ret = OH_CryptoSymKeyGenerator_Create(reinterpret_cast<const char*>(spec->algName), &ctx->genCtx);
    if (ret != CRYPTO_SUCCESS) {
        return ret;
    }
    ret = OH_CryptoSymKeyGenerator_Generate(ctx->genCtx, &ctx->keyCtx);
    if (ret != CRYPTO_SUCCESS) {
        return ret;
    }
    ret = OH_CryptoSymCipherParams_Create(&ctx->params);
    if (ret != CRYPTO_SUCCESS) {
        return ret;
    }
    if (spec->ivLen != 0) {
        ret = OH_CryptoSymCipherParams_SetParam(ctx->params, CRYPTO_IV_DATABLOB, &ctx->ivBlob);
        if (ret != CRYPTO_SUCCESS) {
            return ret;
        }
    }
    ret = OH_CryptoSymCipher_Create(reinterpret_cast<const char*>(spec->cipherAlgName), &ctx->encCtx);
    if (ret != CRYPTO_SUCCESS) {
        return ret;
    }
    ret = OH_CryptoSymCipher_Init(ctx->encCtx, CRYPTO_ENCRYPT_MODE, ctx->keyCtx, ctx->params);
    if (ret != CRYPTO_SUCCESS) {
        return ret;
    }
    ret = OH_CryptoSymCipher_Final(ctx->encCtx, &ctx->msgBlob, &ctx->outUpdate);
    if (ret != CRYPTO_SUCCESS) {
        return ret;
    }
    ret = OH_CryptoSymCipher_Create(reinterpret_cast<const char*>(spec->cipherAlgName), &ctx->decCtx);
    if (ret != CRYPTO_SUCCESS) {
        return ret;
    }
    ret = OH_CryptoSymCipher_Init(ctx->decCtx, CRYPTO_DECRYPT_MODE, ctx->keyCtx, ctx->params);
    if (ret != CRYPTO_SUCCESS) {
        return ret;
    }
    ret = OH_CryptoSymCipher_Final(ctx->decCtx, &ctx->outUpdate, &ctx->decUpdate);
    if (ret != CRYPTO_SUCCESS) {
        return ret;
    }
    EXPECT_TRUE(memcmp(ctx->msgBlob.data, ctx->decUpdate.data, ctx->msgBlob.len) == 0);
    return ret;
}

static void SymCipherTestCtxDestroy(SymCipherTestCtx* ctx)
{
    if (ctx->params) {
        OH_CryptoSymCipherParams_Destroy(ctx->params);
    }
    if (ctx->encCtx) {
        OH_CryptoSymCipher_Destroy(ctx->encCtx);
    }
    if (ctx->decCtx) {
        OH_CryptoSymCipher_Destroy(ctx->decCtx);
    }
    if (ctx->genCtx) {
        OH_CryptoSymKeyGenerator_Destroy(ctx->genCtx);
    }
    if (ctx->keyCtx) {
        OH_CryptoSymKey_Destroy(ctx->keyCtx);
    }
    if (ctx->randomObj) {
        OH_CryptoRand_Destroy(ctx->randomObj);
    }
    // 释放数据块内存
    HcfBlobDataClearAndFree(&ctx->outUpdate);
    HcfBlobDataClearAndFree(&ctx->msgBlob);
    HcfBlobDataClearAndFree(&ctx->ivBlob);
    HcfBlobDataClearAndFree(&ctx->decUpdate);
}
    
int SubCryptoFrameworkNapiSymCipherTest0100()
{
    const int symCipherSpecCount = SYM_CIPHER_DATA_COUNT;
    for (int i = 0; i < symCipherSpecCount; i++) {
        SymCipherTestCtx testCtx;
        SymCipherTestCtxInit(&testCtx, &g_symCipherData[i]);
        EXPECT_EQ(GenerateRandomData(&testCtx), HCF_SUCCESS);
        EXPECT_TRUE(testCtx.randomObj != nullptr);
        EXPECT_EQ(DoSymCipherTest(&testCtx), CRYPTO_SUCCESS);
        SymCipherTestCtxDestroy(&testCtx);
    }
    return 0;
}

typedef struct {
    SymCipherSpec cipherSpec;
    OH_CryptoSymKeyGenerator *genCtx;
    OH_CryptoSymCipher *encCtx;
    OH_CryptoSymCipher *decCtx;
    OH_CryptoSymKey *keyCtx;
    OH_CryptoSymCipherParams *params;
    OH_CryptoRand *randomObj;
    Crypto_DataBlob msgBlob;
    Crypto_DataBlob ivBlob;
    Crypto_DataBlob aadBlob;
    Crypto_DataBlob outUpdate;
    Crypto_DataBlob decUpdate;
    Crypto_DataBlob tag;
    Crypto_DataBlob tagInit;
    uint8_t tagArr[OH_CRYPTO_GCM_TAG_LEN];
} GcmTestCtx;

static void GcmTestCtxInit(GcmTestCtx *ctx, const SymCipherSpec *spec)
{
    uint8_t zero = VALUE_0;
    SafeMemset(ctx, sizeof(GcmTestCtx), &zero, sizeof(GcmTestCtx));

    ctx->cipherSpec = *spec;
    ctx->tagInit.data = ctx->tagArr;
    ctx->tagInit.len = OH_CRYPTO_GCM_TAG_LEN;
    ctx->outUpdate.data = nullptr;
    ctx->outUpdate.len = 0;
    ctx->decUpdate.data = nullptr;
    ctx->decUpdate.len = 0;
    ctx->tag.data = nullptr;
    ctx->tag.len = 0;
}

// GCM 加解密核心测试逻辑
static int32_t GcmCipherDoTest(GcmTestCtx *ctx)
{
    SymCipherSpec *spec = &ctx->cipherSpec;
    int32_t ret = CRYPTO_SUCCESS;

    OH_CryptoRand_Create(&ctx->randomObj);
    EXPECT_TRUE(ctx->randomObj != nullptr);
    EXPECT_EQ(OH_CryptoRand_GenerateRandom(ctx->randomObj, spec->msgLen, &ctx->msgBlob), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoRand_GenerateRandom(ctx->randomObj, spec->ivLen, &ctx->ivBlob), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoRand_GenerateRandom(ctx->randomObj, spec->aadLen, &ctx->aadBlob), HCF_SUCCESS);

    EXPECT_EQ(OH_CryptoSymKeyGenerator_Create((const char *)spec->algName, &ctx->genCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymKeyGenerator_Generate(ctx->genCtx, &ctx->keyCtx), CRYPTO_SUCCESS);

    EXPECT_EQ(OH_CryptoSymCipherParams_Create(&ctx->params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_SetParam(ctx->params, CRYPTO_IV_DATABLOB, &ctx->ivBlob), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_SetParam(ctx->params, CRYPTO_AAD_DATABLOB, &ctx->aadBlob), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_SetParam(ctx->params, CRYPTO_TAG_DATABLOB, &ctx->tagInit), CRYPTO_SUCCESS);
 
    EXPECT_EQ(OH_CryptoSymCipher_Create((const char *)spec->cipherAlgName, &ctx->encCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Init(ctx->encCtx, CRYPTO_ENCRYPT_MODE, ctx->keyCtx, ctx->params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Update(ctx->encCtx, &ctx->msgBlob, &ctx->outUpdate), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Final(ctx->encCtx, nullptr, &ctx->tag), CRYPTO_SUCCESS);

    EXPECT_EQ(OH_CryptoSymCipher_Create((const char *)spec->cipherAlgName, &ctx->decCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_SetParam(ctx->params, CRYPTO_TAG_DATABLOB, &ctx->tag), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Init(ctx->decCtx, CRYPTO_DECRYPT_MODE, ctx->keyCtx, ctx->params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Final(ctx->decCtx, &ctx->outUpdate, &ctx->decUpdate), CRYPTO_SUCCESS);

    EXPECT_TRUE(memcmp(ctx->msgBlob.data, ctx->decUpdate.data, ctx->msgBlob.len) == 0);
    return ret;
}

// 资源销毁
static void GcmTestCtxDestroy(GcmTestCtx *ctx)
{
    if (ctx->params) {
        OH_CryptoSymCipherParams_Destroy(ctx->params);
    }
    if (ctx->encCtx) {
        OH_CryptoSymCipher_Destroy(ctx->encCtx);
    }
    if (ctx->decCtx) {
        OH_CryptoSymCipher_Destroy(ctx->decCtx);
    }
    if (ctx->genCtx) {
        OH_CryptoSymKeyGenerator_Destroy(ctx->genCtx);
    }
    if (ctx->keyCtx) {
        OH_CryptoSymKey_Destroy(ctx->keyCtx);
    }
    if (ctx->randomObj) {
        OH_CryptoRand_Destroy(ctx->randomObj);
    }

    // 释放内存块
    HcfBlobDataClearAndFree(&ctx->outUpdate);
    HcfBlobDataClearAndFree(&ctx->msgBlob);
    HcfBlobDataClearAndFree(&ctx->ivBlob);
    HcfBlobDataClearAndFree(&ctx->aadBlob);
    HcfBlobDataClearAndFree(&ctx->tag);
    HcfBlobDataClearAndFree(&ctx->decUpdate);
}

int SubCryptoFrameworkNapiSymCipherTest0200()
{
    const int symCipherSpecCount = SYM_CIPHER_GCM_DATA_COUNT;
    for (int i = 0; i < symCipherSpecCount; i++) {
        GcmTestCtx testCtx;

        GcmTestCtxInit(&testCtx, &g_symCipherGCMData[i]);
        GcmCipherDoTest(&testCtx);
        GcmTestCtxDestroy(&testCtx);
    }
    return 0;
}

// CCM测试上下文结构体
typedef struct {
    SymCipherSpec cipherSpec;
    OH_CryptoSymKeyGenerator *genCtx;
    OH_CryptoSymCipher *encCtx;
    OH_CryptoSymCipher *decCtx;
    OH_CryptoSymKey *keyCtx;
    OH_CryptoSymCipherParams *params;
    OH_CryptoRand *randomObj;
    Crypto_DataBlob msgBlob;
    Crypto_DataBlob ivBlob;
    Crypto_DataBlob aadBlob;
    Crypto_DataBlob outUpdate;
    Crypto_DataBlob decUpdate;
    Crypto_DataBlob tag;
    Crypto_DataBlob tagInit;
    uint8_t tagArr[OH_CRYPTO_CCM_TAG_LEN];
} CcmTestCtx;

static void CcmTestCtxInit(CcmTestCtx *ctx, const SymCipherSpec *spec)
{
    uint8_t zero = VALUE_0;
    SafeMemset(ctx, sizeof(CcmTestCtx), &zero, sizeof(CcmTestCtx));

    ctx->cipherSpec = *spec;
    ctx->tagInit.data = ctx->tagArr;
    ctx->tagInit.len = OH_CRYPTO_CCM_TAG_LEN;

    ctx->outUpdate.data = nullptr;
    ctx->outUpdate.len = 0;
    ctx->decUpdate.data = nullptr;
    ctx->decUpdate.len = 0;
    ctx->tag.data = nullptr;
    ctx->tag.len = 0;
}

static int32_t CcmCipherDoTest(CcmTestCtx *ctx)
{
    SymCipherSpec *spec = &ctx->cipherSpec;

    // 创建随机数并生成测试数据
    OH_CryptoRand_Create(&ctx->randomObj);
    EXPECT_TRUE(ctx->randomObj != nullptr);
    EXPECT_EQ(OH_CryptoRand_GenerateRandom(ctx->randomObj, spec->msgLen, &ctx->msgBlob), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoRand_GenerateRandom(ctx->randomObj, spec->ivLen, &ctx->ivBlob), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoRand_GenerateRandom(ctx->randomObj, spec->aadLen, &ctx->aadBlob), HCF_SUCCESS);

    EXPECT_EQ(OH_CryptoSymKeyGenerator_Create((const char *)spec->algName, &ctx->genCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymKeyGenerator_Generate(ctx->genCtx, &ctx->keyCtx), CRYPTO_SUCCESS);

    EXPECT_EQ(OH_CryptoSymCipherParams_Create(&ctx->params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_SetParam(ctx->params, CRYPTO_IV_DATABLOB, &ctx->ivBlob), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_SetParam(ctx->params, CRYPTO_AAD_DATABLOB, &ctx->aadBlob), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_SetParam(ctx->params, CRYPTO_TAG_DATABLOB, &ctx->tagInit), CRYPTO_SUCCESS);

    EXPECT_EQ(OH_CryptoSymCipher_Create((const char *)spec->cipherAlgName, &ctx->encCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Init(ctx->encCtx, CRYPTO_ENCRYPT_MODE, ctx->keyCtx, ctx->params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Update(ctx->encCtx, &ctx->msgBlob, &ctx->outUpdate), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Final(ctx->encCtx, nullptr, &ctx->tag), CRYPTO_SUCCESS);

    EXPECT_EQ(OH_CryptoSymCipher_Create((const char *)spec->cipherAlgName, &ctx->decCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_SetParam(ctx->params, CRYPTO_TAG_DATABLOB, &ctx->tag), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Init(ctx->decCtx, CRYPTO_DECRYPT_MODE, ctx->keyCtx, ctx->params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Final(ctx->decCtx, &ctx->outUpdate, &ctx->decUpdate), CRYPTO_SUCCESS);
        
    EXPECT_TRUE(memcmp(ctx->msgBlob.data, ctx->decUpdate.data, ctx->msgBlob.len) == 0);
    return CRYPTO_SUCCESS;
}
    
static void CcmTestCtxDestroy(CcmTestCtx *ctx)
{
    // 销毁句柄资源
    if (ctx->params) {
        OH_CryptoSymCipherParams_Destroy(ctx->params);
    }
    if (ctx->encCtx) {
        OH_CryptoSymCipher_Destroy(ctx->encCtx);
    }
    if (ctx->decCtx) {
        OH_CryptoSymCipher_Destroy(ctx->decCtx);
    }
    if (ctx->genCtx) {
        OH_CryptoSymKeyGenerator_Destroy(ctx->genCtx);
    }
    if (ctx->keyCtx) {
        OH_CryptoSymKey_Destroy(ctx->keyCtx);
    }
    if (ctx->randomObj) {
        OH_CryptoRand_Destroy(ctx->randomObj);
    }

    // 释放内存块
    HcfBlobDataClearAndFree(&ctx->outUpdate);
    HcfBlobDataClearAndFree(&ctx->msgBlob);
    HcfBlobDataClearAndFree(&ctx->ivBlob);
    HcfBlobDataClearAndFree(&ctx->aadBlob);
    HcfBlobDataClearAndFree(&ctx->tag);
    HcfBlobDataClearAndFree(&ctx->decUpdate);
}
    
int SubCryptoFrameworkNapiSymCipherTest0300()
{
    const int symCipherSpecCount = SYM_CIPHER_CCM_DATA_COUNT;
    for (int i = 0; i < symCipherSpecCount; i++) {
        CcmTestCtx testCtx;

        CcmTestCtxInit(&testCtx, &g_symCipherCCMData[i]);
        CcmCipherDoTest(&testCtx);
        CcmTestCtxDestroy(&testCtx);
    }
    return 0;
}
    
typedef struct {
    SymCipherSpec cipherSpec;
    OH_CryptoSymKeyGenerator *genCtx;
    OH_CryptoSymCipher *encCtx;
    OH_CryptoSymCipher *decCtx;
    OH_CryptoSymKey *keyCtx;
    OH_CryptoSymCipherParams *params;
    OH_CryptoRand *randomObj;

    Crypto_DataBlob msgBlob;
    Crypto_DataBlob ivBlob;
    Crypto_DataBlob outUpdate;
    Crypto_DataBlob decUpdate;
    Crypto_DataBlob cipherBlob;

    uint8_t cipherText[OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE + 16];
    int32_t randomLen;
    int32_t ivLen;
    int blockSize;
    int cnt;
    int rem;
    int cipherLen;
} SymCipherBlockTestCtx;

static void SymCipherBlockTestCtxInit(SymCipherBlockTestCtx *ctx, const SymCipherSpec *spec)
{
    uint8_t zero = VALUE_0;
    SafeMemset(ctx, sizeof(SymCipherBlockTestCtx), &zero, sizeof(SymCipherBlockTestCtx));

    ctx->cipherSpec = *spec;
    ctx->randomLen = OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE;
    ctx->ivLen = spec->ivLen;
    ctx->blockSize = VALUE_20;
    ctx->cipherLen = 0;

    ctx->outUpdate.data = nullptr;
    ctx->outUpdate.len = 0;
    ctx->decUpdate.data = nullptr;
    ctx->decUpdate.len = 0;
}

static void SymCipherBlockEncryptProcess(
    SymCipherBlockTestCtx *ctx,
    SymCipherSpec *spec)
{
    // 循环分段加密
    for (int i = 0; i < ctx->cnt; i++) {
        OH_Crypto_FreeDataBlob(&ctx->outUpdate);
        ctx->msgBlob.len = ctx->blockSize;

        EXPECT_EQ(OH_CryptoSymCipher_Update(ctx->encCtx, &ctx->msgBlob, &ctx->outUpdate),
            CRYPTO_SUCCESS);
        ctx->msgBlob.data += ctx->blockSize;
        SafeMemcpy(&ctx->cipherText[ctx->cipherLen], sizeof(ctx->cipherText) - ctx->cipherLen,
            ctx->outUpdate.data, ctx->outUpdate.len);
        ctx->cipherLen += ctx->outUpdate.len;
    }
    // 处理剩余字节
    if (ctx->rem > 0) {
        ctx->msgBlob.len = ctx->rem;
        OH_Crypto_FreeDataBlob(&ctx->outUpdate);
        EXPECT_EQ(OH_CryptoSymCipher_Update(ctx->encCtx, &ctx->msgBlob, &ctx->outUpdate),
            CRYPTO_SUCCESS);
        SafeMemcpy(&ctx->cipherText[ctx->cipherLen], sizeof(ctx->cipherText) - ctx->cipherLen,
            ctx->outUpdate.data, ctx->outUpdate.len);
        ctx->cipherLen += ctx->outUpdate.len;
    }
    // 处理填充
    if (spec->ispadding) {
        OH_Crypto_FreeDataBlob(&ctx->outUpdate);
        EXPECT_EQ(OH_CryptoSymCipher_Final(ctx->encCtx, nullptr, &ctx->outUpdate),
            CRYPTO_SUCCESS);
        SafeMemcpy(&ctx->cipherText[ctx->cipherLen], sizeof(ctx->cipherText) - ctx->cipherLen,
            ctx->outUpdate.data, ctx->outUpdate.len);
        ctx->cipherLen += ctx->outUpdate.len;
    }
}
    
static int32_t SymCipherBlockDoTest(
    SymCipherBlockTestCtx *ctx)
{
    SymCipherSpec *spec = &ctx->cipherSpec;
    OH_CryptoRand_Create(&ctx->randomObj);
    EXPECT_TRUE(ctx->randomObj != nullptr);
    EXPECT_EQ(OH_CryptoRand_GenerateRandom(ctx->randomObj, ctx->randomLen, &ctx->msgBlob),
        HCF_SUCCESS);
    if (ctx->ivLen != 0) {
        EXPECT_EQ(OH_CryptoRand_GenerateRandom(ctx->randomObj, ctx->ivLen, &ctx->ivBlob),
            HCF_SUCCESS);
    }

    EXPECT_EQ(OH_CryptoSymKeyGenerator_Create((const char *)spec->algName, &ctx->genCtx),
        CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymKeyGenerator_Generate(ctx->genCtx, &ctx->keyCtx),
        CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_Create(&ctx->params), CRYPTO_SUCCESS);
    if (ctx->ivLen != 0) {
        EXPECT_EQ(OH_CryptoSymCipherParams_SetParam(ctx->params, CRYPTO_IV_DATABLOB, &ctx->ivBlob),
            CRYPTO_SUCCESS);
    }
    EXPECT_EQ(OH_CryptoSymCipher_Create((const char *)spec->cipherAlgName, &ctx->encCtx),
        CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Init(ctx->encCtx, CRYPTO_ENCRYPT_MODE, ctx->keyCtx, ctx->params),
        CRYPTO_SUCCESS);
    ctx->cnt = ctx->randomLen / ctx->blockSize;
    ctx->rem = ctx->randomLen % ctx->blockSize;

    SymCipherBlockEncryptProcess(ctx, spec);

    ctx->cipherBlob.data = ctx->cipherText;
    ctx->cipherBlob.len = ctx->cipherLen;
    EXPECT_EQ(OH_CryptoSymCipher_Create((const char *)spec->cipherAlgName, &ctx->decCtx),
        CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Init(ctx->decCtx, CRYPTO_DECRYPT_MODE, ctx->keyCtx, ctx->params),
        CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Update(ctx->decCtx, &ctx->cipherBlob, &ctx->decUpdate),
        CRYPTO_SUCCESS);

    ctx->msgBlob.data -= (ctx->randomLen - ctx->rem);
    ctx->msgBlob.len = ctx->randomLen;

    EXPECT_TRUE(memcmp(ctx->msgBlob.data, ctx->decUpdate.data, ctx->msgBlob.len) == 0);
    return CRYPTO_SUCCESS;
}

static void SymCipherBlockTestCtxDestroy(SymCipherBlockTestCtx *ctx)
{
    // 销毁句柄
    if (ctx->params) {
        OH_CryptoSymCipherParams_Destroy(ctx->params);
    }
    if (ctx->encCtx) {
        OH_CryptoSymCipher_Destroy(ctx->encCtx);
    }
    if (ctx->decCtx) {
        OH_CryptoSymCipher_Destroy(ctx->decCtx);
    }
    if (ctx->genCtx) {
        OH_CryptoSymKeyGenerator_Destroy(ctx->genCtx);
    }
    if (ctx->keyCtx) {
        OH_CryptoSymKey_Destroy(ctx->keyCtx);
    }
    if (ctx->randomObj) {
        OH_CryptoRand_Destroy(ctx->randomObj);
    }

    // 释放内存
    HcfBlobDataClearAndFree(&ctx->outUpdate);
    HcfBlobDataClearAndFree(&ctx->msgBlob);
    HcfBlobDataClearAndFree(&ctx->ivBlob);
    HcfBlobDataClearAndFree(&ctx->decUpdate);
}

int SubCryptoFrameworkNapiSymCipherTest0400()
{
    const int symCipherSpecCount = SYM_CIPHER_DATA_COUNT;
    for (int i = 0; i < symCipherSpecCount; i++) {
        SymCipherBlockTestCtx testCtx;

        SymCipherBlockTestCtxInit(&testCtx, &g_symCipherData[i]);
        SymCipherBlockDoTest(&testCtx);
        SymCipherBlockTestCtxDestroy(&testCtx);
    }
    return 0;
}

typedef struct {
    SymCipherSpec cipherSpec;
    OH_CryptoSymKeyGenerator *genCtx;
    OH_CryptoSymCipher *encCtx;
    OH_CryptoSymCipher *decCtx;
    OH_CryptoSymKey *keyCtx;
    OH_CryptoSymCipherParams *params;
    OH_CryptoRand *randomObj;

    Crypto_DataBlob msgBlob;
    Crypto_DataBlob ivBlob;
    Crypto_DataBlob aadBlob;
    Crypto_DataBlob outUpdate;
    Crypto_DataBlob decUpdate;
    Crypto_DataBlob tag;
    Crypto_DataBlob tagInit;
    Crypto_DataBlob cipherBlob;

    uint8_t tagArr[OH_CRYPTO_GCM_TAG_LEN];
    uint8_t cipherText[OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE + 16];
    int32_t randomLen;
    int32_t ivLen;
    int32_t aadLen;
    int32_t cipherLen;
    int blockSize;
    int cnt;
    int rem;
} GcmBlockTestCtx;

static void GcmBlockTestCtxInit(GcmBlockTestCtx *ctx, const SymCipherSpec *spec)
{
    uint8_t zero = VALUE_0;
    SafeMemset(ctx, sizeof(GcmBlockTestCtx), &zero, sizeof(GcmBlockTestCtx));

    ctx->cipherSpec = *spec;
    ctx->randomLen = OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE;
    ctx->ivLen = spec->ivLen;
    ctx->aadLen = spec->aadLen;
    ctx->blockSize = VALUE_20;
    ctx->cipherLen = 0;

    ctx->tagInit.data = ctx->tagArr;
    ctx->tagInit.len = OH_CRYPTO_GCM_TAG_LEN;

    // 指针显式初始化
    ctx->outUpdate.data = nullptr;
    ctx->outUpdate.len = 0;
    ctx->decUpdate.data = nullptr;
    ctx->decUpdate.len = 0;
    ctx->tag.data = nullptr;
    ctx->tag.len = 0;
}

static int32_t GcmBlockCipherDoTest(GcmBlockTestCtx *ctx)
{
    SymCipherSpec *spec = &ctx->cipherSpec;

    // 创建随机数 & 生成测试数据
    OH_CryptoRand_Create(&ctx->randomObj);
    EXPECT_TRUE(ctx->randomObj != nullptr);
    EXPECT_EQ(OH_CryptoRand_GenerateRandom(ctx->randomObj, ctx->randomLen, &ctx->msgBlob), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoRand_GenerateRandom(ctx->randomObj, ctx->ivLen, &ctx->ivBlob), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoRand_GenerateRandom(ctx->randomObj, ctx->aadLen, &ctx->aadBlob), HCF_SUCCESS);

    EXPECT_EQ(OH_CryptoSymKeyGenerator_Create((const char *)spec->algName, &ctx->genCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymKeyGenerator_Generate(ctx->genCtx, &ctx->keyCtx), CRYPTO_SUCCESS);

    EXPECT_EQ(OH_CryptoSymCipherParams_Create(&ctx->params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_SetParam(ctx->params, CRYPTO_IV_DATABLOB, &ctx->ivBlob), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_SetParam(ctx->params, CRYPTO_AAD_DATABLOB, &ctx->aadBlob), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_SetParam(ctx->params, CRYPTO_TAG_DATABLOB, &ctx->tagInit), CRYPTO_SUCCESS);

    EXPECT_EQ(OH_CryptoSymCipher_Create((const char *)spec->cipherAlgName, &ctx->encCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Init(ctx->encCtx, CRYPTO_ENCRYPT_MODE, ctx->keyCtx, ctx->params), CRYPTO_SUCCESS);

    ctx->cnt = ctx->randomLen / ctx->blockSize;
    ctx->rem = ctx->randomLen % ctx->blockSize;

    // 循环分段加密
    for (int i = 0; i < ctx->cnt; i++) {
        ctx->msgBlob.len = ctx->blockSize;
        OH_Crypto_FreeDataBlob(&ctx->outUpdate);
        EXPECT_EQ(OH_CryptoSymCipher_Update(ctx->encCtx, &ctx->msgBlob, &ctx->outUpdate), CRYPTO_SUCCESS);
        ctx->msgBlob.data += ctx->blockSize;
        SafeMemcpy(&ctx->cipherText[ctx->cipherLen], sizeof(ctx->cipherText) - ctx->cipherLen,
            ctx->outUpdate.data, ctx->outUpdate.len);
        ctx->cipherLen += ctx->outUpdate.len;
    }

    // 处理剩余字节
    if (ctx->rem > 0) {
        OH_Crypto_FreeDataBlob(&ctx->outUpdate);
        ctx->msgBlob.len = ctx->rem;
        EXPECT_EQ(OH_CryptoSymCipher_Update(ctx->encCtx, &ctx->msgBlob, &ctx->outUpdate), CRYPTO_SUCCESS);
        SafeMemcpy(&ctx->cipherText[ctx->cipherLen], sizeof(ctx->cipherText) - ctx->cipherLen,
            ctx->outUpdate.data, ctx->outUpdate.len);
        ctx->cipherLen += ctx->outUpdate.len;
    }

    // 处理填充&Final
    if (spec->ispadding) {
        EXPECT_EQ(OH_CryptoSymCipher_Final(ctx->encCtx, nullptr, &ctx->tag), CRYPTO_SUCCESS);
    }

    // 构造完整密文
    ctx->cipherBlob.data = ctx->cipherText;
    ctx->cipherBlob.len = ctx->cipherLen;

    ctx->msgBlob.data -= (ctx->randomLen - ctx->rem);
    ctx->msgBlob.len = ctx->randomLen;
    EXPECT_EQ(OH_CryptoSymCipher_Create((const char *)spec->cipherAlgName, &ctx->decCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_SetParam(ctx->params, CRYPTO_TAG_DATABLOB, &ctx->tag), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Init(ctx->decCtx, CRYPTO_DECRYPT_MODE, ctx->keyCtx, ctx->params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Final(ctx->decCtx, &ctx->cipherBlob, &ctx->decUpdate), CRYPTO_SUCCESS);

    // 结果校验
    EXPECT_TRUE(memcmp(ctx->msgBlob.data, ctx->decUpdate.data, ctx->msgBlob.len) == 0);
    return CRYPTO_SUCCESS;
}

static void GcmBlockTestCtxDestroy(GcmBlockTestCtx *ctx)
{
    // 销毁句柄资源
    if (ctx->params) {
        OH_CryptoSymCipherParams_Destroy(ctx->params);
    }
    if (ctx->encCtx) {
        OH_CryptoSymCipher_Destroy(ctx->encCtx);
    }
    if (ctx->decCtx) {
        OH_CryptoSymCipher_Destroy(ctx->decCtx);
    }
    if (ctx->genCtx) {
        OH_CryptoSymKeyGenerator_Destroy(ctx->genCtx);
    }
    if (ctx->keyCtx) {
        OH_CryptoSymKey_Destroy(ctx->keyCtx);
    }
    if (ctx->randomObj) {
        OH_CryptoRand_Destroy(ctx->randomObj);
    }

    // 释放内存块
    HcfBlobDataClearAndFree(&ctx->outUpdate);
    HcfBlobDataClearAndFree(&ctx->msgBlob);
    HcfBlobDataClearAndFree(&ctx->ivBlob);
    HcfBlobDataClearAndFree(&ctx->aadBlob);
    HcfBlobDataClearAndFree(&ctx->tag);
    HcfBlobDataClearAndFree(&ctx->decUpdate);
}

int SubCryptoFrameworkNapiSymCipherTest3100()
{
    const int symCipherSpecCount = SYM_CIPHER_GCM_DATA_COUNT;
    for (int i = 0; i < symCipherSpecCount; i++) {
        GcmBlockTestCtx testCtx;

        GcmBlockTestCtxInit(&testCtx, &g_symCipherGCMData[i]);
        GcmBlockCipherDoTest(&testCtx);
        GcmBlockTestCtxDestroy(&testCtx);
    }
    return 0;
}

int SubCryptoFrameworkNapiSymCipherTest0500()
{
    EXPECT_EQ(OH_CryptoSymCipherParams_Create(nullptr), CRYPTO_INVALID_PARAMS);
    return 0;
}

int SubCryptoFrameworkNapiSymCipherTest0600()
{
    OH_CryptoSymCipherParams *params = nullptr;
    Crypto_DataBlob ivBlob = {0};
    
    EXPECT_EQ(OH_CryptoSymCipherParams_Create(&params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_SetParam(nullptr, CRYPTO_IV_DATABLOB,
        (Crypto_DataBlob *)&ivBlob), CRYPTO_INVALID_PARAMS);
    EXPECT_EQ(OH_CryptoSymCipherParams_SetParam(params, CRYPTO_IV_DATABLOB, nullptr),
        CRYPTO_INVALID_PARAMS);

    OH_CryptoSymCipherParams_Destroy(params);
    return 0;
}

int SubCryptoFrameworkNapiSymCipherTest0700()
{
    OH_CryptoSymCipher *encCtx = nullptr;

    EXPECT_EQ(OH_CryptoSymCipher_Create(reinterpret_cast<const char*>("AES128|GCM|NoPadding"), nullptr),
        CRYPTO_INVALID_PARAMS);
    EXPECT_EQ(OH_CryptoSymCipher_Create(nullptr, &encCtx), CRYPTO_INVALID_PARAMS);
    EXPECT_EQ(OH_CryptoSymCipher_Create(reinterpret_cast<const char*>("AES128|XTSS|NoPadding"), &encCtx),
        CRYPTO_NOT_SUPPORTED);
    EXPECT_EQ(OH_CryptoSymCipher_Create(reinterpret_cast<const char*>("aes128|GCM|NoPadding"), &encCtx),
        CRYPTO_NOT_SUPPORTED);
    EXPECT_EQ(OH_CryptoSymCipher_Create(reinterpret_cast<const char*>("RSA512"), &encCtx),
        CRYPTO_INVALID_PARAMS);
    return 0;
}

int SubCryptoFrameworkNapiSymCipherTest0800()
{
    OH_CryptoSymKeyGenerator *genCtx = nullptr;
    OH_CryptoSymCipher *encCtx = nullptr;
    OH_CryptoSymKey *keyCtx = nullptr;
    OH_CryptoSymCipherParams *params = nullptr;
    OH_CryptoSymCipherParams *paramsGcm = nullptr;
    OH_CryptoRand *randomObj = nullptr;
    int32_t ivLen = 16;
    int32_t aadLen = 16;
    Crypto_DataBlob ivBlob = {0};
    Crypto_DataBlob aadBlob = {0};
    uint8_t tagArr[OH_CRYPTO_CCM_TAG_LEN] = {0};
    Crypto_DataBlob tagInit = {.data = reinterpret_cast<uint8_t *>(tagArr),
        .len = OH_CRYPTO_CCM_TAG_LEN};

    OH_CryptoRand_Create(&randomObj);
    EXPECT_TRUE(randomObj != nullptr);
    EXPECT_EQ(OH_CryptoRand_GenerateRandom(randomObj, aadLen, &aadBlob), HCF_SUCCESS);

    if (ivLen != 0) {
        EXPECT_EQ(OH_CryptoRand_GenerateRandom(randomObj, ivLen, &ivBlob), HCF_SUCCESS);
    }
    EXPECT_EQ(OH_CryptoSymKeyGenerator_Create(reinterpret_cast<const char*>("AES256"), &genCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymKeyGenerator_Generate(genCtx, &keyCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_Create(&params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_Create(&paramsGcm), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_SetParam(paramsGcm, CRYPTO_IV_DATABLOB,
        (Crypto_DataBlob *)&ivBlob), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_SetParam(paramsGcm, CRYPTO_AAD_DATABLOB,
        (Crypto_DataBlob *)&aadBlob), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_SetParam(paramsGcm, CRYPTO_TAG_DATABLOB, &tagInit), CRYPTO_SUCCESS);
    if (ivLen != 0) {
        EXPECT_EQ(OH_CryptoSymCipherParams_SetParam(params, CRYPTO_IV_DATABLOB, (Crypto_DataBlob *)&ivBlob),
            CRYPTO_SUCCESS);
    }
    EXPECT_EQ(OH_CryptoSymCipher_Create(reinterpret_cast<const char*>("AES256|CBC|PKCS7"), &encCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Init(nullptr, CRYPTO_ENCRYPT_MODE, keyCtx, params), CRYPTO_INVALID_PARAMS);
    EXPECT_EQ(OH_CryptoSymCipher_Init(encCtx, CRYPTO_ENCRYPT_MODE, nullptr, params), CRYPTO_INVALID_PARAMS);
    EXPECT_EQ(OH_CryptoSymCipher_Init(encCtx, CRYPTO_ENCRYPT_MODE, keyCtx, nullptr), CRYPTO_INVALID_PARAMS);
    EXPECT_EQ(OH_CryptoSymCipher_Init(encCtx, CRYPTO_ENCRYPT_MODE, keyCtx, paramsGcm), CRYPTO_SUCCESS);

    OH_CryptoSymCipherParams_Destroy(params);
    OH_CryptoSymCipherParams_Destroy(paramsGcm);
    OH_CryptoSymCipher_Destroy(encCtx);
    OH_CryptoSymKeyGenerator_Destroy(genCtx);
    OH_CryptoSymKey_Destroy(keyCtx);
    HcfBlobDataClearAndFree(&aadBlob);
    HcfBlobDataClearAndFree(&ivBlob);
    OH_CryptoRand_Destroy(randomObj);
    return 0;
}

int SubCryptoFrameworkNapiSymCipherTest0900()
{
    OH_CryptoSymCipher *encCtx = nullptr;
    OH_CryptoSymCipherParams *params = nullptr;
    OH_CryptoSymKeyGenerator *genCtx = nullptr;
    OH_CryptoSymKey *keyCtx = nullptr;
    Crypto_DataBlob outUpdate = {.data = nullptr, .len = 0};
    uint8_t testData[] = "0123456789";
    Crypto_DataBlob msgBlob = {
        .data = reinterpret_cast<uint8_t *>(testData),
        .len = sizeof(testData)
    };

    EXPECT_EQ(OH_CryptoSymKeyGenerator_Create(reinterpret_cast<const char*>("AES256"), &genCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymKeyGenerator_Generate(genCtx, &keyCtx), CRYPTO_SUCCESS);

    EXPECT_EQ(OH_CryptoSymCipherParams_Create(&params), CRYPTO_SUCCESS);

    EXPECT_EQ(OH_CryptoSymCipher_Create(reinterpret_cast<const char*>("AES256|ECB|PKCS7"), &encCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Init(encCtx, CRYPTO_ENCRYPT_MODE, keyCtx, params), CRYPTO_SUCCESS);

    EXPECT_EQ(OH_CryptoSymCipher_Update(nullptr, (Crypto_DataBlob *)&msgBlob, &outUpdate), CRYPTO_INVALID_PARAMS);
    EXPECT_EQ(OH_CryptoSymCipher_Update(encCtx, nullptr, &outUpdate), CRYPTO_INVALID_PARAMS);
    EXPECT_EQ(OH_CryptoSymCipher_Update(encCtx, (Crypto_DataBlob *)&msgBlob, nullptr), CRYPTO_INVALID_PARAMS);

    OH_CryptoSymCipherParams_Destroy(params);
    OH_CryptoSymCipher_Destroy(encCtx);
    OH_CryptoSymKeyGenerator_Destroy(genCtx);
    OH_CryptoSymKey_Destroy(keyCtx);
    return 0;
}

int SubCryptoFrameworkNapiSymCipherTest1000()
{
    OH_CryptoSymCipher *encCtx = nullptr;
    Crypto_DataBlob out = {.data = nullptr, .len = 0};
    uint8_t testData[] = "0123456789";
    Crypto_DataBlob msgBlob = {
        .data = reinterpret_cast<uint8_t *>(testData),
        .len = sizeof(testData)
    };

    EXPECT_EQ(OH_CryptoSymCipher_Create(reinterpret_cast<const char*>("AES256|ECB|PKCS7"), &encCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Final(encCtx, nullptr, &out), CRYPTO_INVALID_PARAMS);
    EXPECT_EQ(OH_CryptoSymCipher_Final(nullptr, &msgBlob, &out), CRYPTO_INVALID_PARAMS);
    EXPECT_EQ(OH_CryptoSymCipher_Final(encCtx, &msgBlob, nullptr), CRYPTO_INVALID_PARAMS);
    EXPECT_EQ(OH_CryptoSymCipher_Final(encCtx, &msgBlob, &out), CRYPTO_INVALID_PARAMS);

    EXPECT_EQ(OH_CryptoSymCipher_GetAlgoName(nullptr), nullptr);

    OH_CryptoSymCipher_Destroy(encCtx);
    return 0;
}

int SubCryptoFrameworkNapiSymCipherTest1100()
{
    const int symCipherSpecCount = SYM_CIPHER_IV_ERROR_COUNT;
    for (int i = 0; i < symCipherSpecCount; i++) {
        SymCipherSpec symCipherData = g_symCipherIvError[i];
        OH_CryptoSymKeyGenerator *genCtx = nullptr;
        OH_CryptoSymCipher *encCtx = nullptr;
        OH_CryptoSymKey *keyCtx = nullptr;
        OH_CryptoSymCipherParams *params = nullptr;
        int32_t ivLen = symCipherData.ivLen;
        OH_CryptoRand *randomObj = nullptr;
        Crypto_DataBlob ivBlob = {0};
    
        OH_CryptoRand_Create(&randomObj);
        EXPECT_TRUE(randomObj != nullptr);
        EXPECT_EQ(OH_CryptoRand_GenerateRandom(randomObj, ivLen, &ivBlob), HCF_SUCCESS);
        EXPECT_EQ(OH_CryptoSymKeyGenerator_Create(reinterpret_cast<const char*>(symCipherData.algName),
            &genCtx), CRYPTO_SUCCESS);
        EXPECT_EQ(OH_CryptoSymKeyGenerator_Generate(genCtx, &keyCtx), CRYPTO_SUCCESS);
        EXPECT_EQ(OH_CryptoSymCipherParams_Create(&params), CRYPTO_SUCCESS);
        EXPECT_EQ(OH_CryptoSymCipherParams_SetParam(params, CRYPTO_IV_DATABLOB, (Crypto_DataBlob *)&ivBlob),
            CRYPTO_SUCCESS);
        EXPECT_EQ(OH_CryptoSymCipher_Create(reinterpret_cast<const char*>(symCipherData.cipherAlgName),
            &encCtx), CRYPTO_SUCCESS);
        EXPECT_EQ(OH_CryptoSymCipher_Init(encCtx, CRYPTO_ENCRYPT_MODE, keyCtx, params), CRYPTO_INVALID_PARAMS);
    
        OH_CryptoSymCipherParams_Destroy(params);
        OH_CryptoSymCipher_Destroy(encCtx);
        OH_CryptoSymKeyGenerator_Destroy(genCtx);
        OH_CryptoSymKey_Destroy(keyCtx);
        HcfBlobDataClearAndFree(&ivBlob);
        OH_CryptoRand_Destroy(randomObj);
    }
    return 0;
}

int SubCryptoFrameworkNapiSymCipherTest1200()
{
    OH_CryptoSymKeyGenerator *genCtx = nullptr;
    OH_CryptoSymCipher *encCtx = nullptr;
    OH_CryptoSymKey *keyCtx = nullptr;
    OH_CryptoSymCipherParams *params = nullptr;
    int32_t ivLen = 7;
    int32_t aadLen = 9;
    OH_CryptoRand *randomObj = nullptr;
    Crypto_DataBlob ivBlob = {0};
    Crypto_DataBlob aadBlob = {0};
    uint8_t tagArr[OH_CRYPTO_CCM_TAG_LEN] = {0};
    Crypto_DataBlob tagInit = {.data = reinterpret_cast<uint8_t *>(tagArr),
        .len = OH_CRYPTO_CCM_TAG_LEN};

    OH_CryptoRand_Create(&randomObj);
    EXPECT_TRUE(randomObj != nullptr);
    EXPECT_EQ(OH_CryptoRand_GenerateRandom(randomObj, ivLen, &ivBlob), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoRand_GenerateRandom(randomObj, aadLen, &aadBlob), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoSymKeyGenerator_Create(reinterpret_cast<const char*>("AES128"), &genCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymKeyGenerator_Generate(genCtx, &keyCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_Create(&params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_SetParam(params, CRYPTO_IV_DATABLOB,
        (Crypto_DataBlob *)&ivBlob), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_SetParam(params, CRYPTO_AAD_DATABLOB,
        (Crypto_DataBlob *)&aadBlob), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_SetParam(params, CRYPTO_TAG_DATABLOB, &tagInit), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Create(reinterpret_cast<const char*>("AES128|CCM|PKCS7"),
        &encCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Init(encCtx, CRYPTO_ENCRYPT_MODE, keyCtx, params), CRYPTO_SUCCESS);

    OH_CryptoSymCipherParams_Destroy(params);
    OH_CryptoSymCipher_Destroy(encCtx);
    OH_CryptoSymKeyGenerator_Destroy(genCtx);
    OH_CryptoSymKey_Destroy(keyCtx);
    HcfBlobDataClearAndFree(&ivBlob);
    HcfBlobDataClearAndFree(&aadBlob);
    OH_CryptoRand_Destroy(randomObj);
    return 0;
}

int SubCryptoFrameworkNapiSymCipherTest1300()
{
    OH_CryptoSymKeyGenerator *genCtx = nullptr;
    OH_CryptoSymCipher *encCtx = nullptr;
    OH_CryptoSymCipher *decCtx = nullptr;
    OH_CryptoSymKey *keyCtx = nullptr;
    OH_CryptoSymCipherParams *params = nullptr;
    Crypto_DataBlob outUpdate = {.data = nullptr, .len = 0};
    Crypto_DataBlob decUpdate = {.data = nullptr, .len = 0};
    uint8_t ivData[] = {
        0x1d, 0xe1, 0xe5, 0x14, 0x38, 0x17, 0xc3, 0x6a, 0x00, 0xc2, 0x6e, 0xeb, 0x28, 0xa3, 0x23, 0x81
    };
    Crypto_DataBlob ivBlob = {.data = ivData, .len = sizeof(ivData)};
    uint8_t msgData[] = {
        0x54, 0x22, 0x6a, 0x77, 0xd3, 0x40, 0x8c, 0x42, 0xff, 0xdb, 0x57, 0x70, 0xbd, 0x44, 0x64, 0x18,
        0x4c, 0x3b, 0x8c, 0x35
    };
    Crypto_DataBlob msgBlob = {.data = msgData, .len = sizeof(msgData)};
    uint8_t keyData[] = {
        0xc0, 0xbb, 0xaa, 0x7c, 0x3a, 0xac, 0x43, 0xbb, 0xb8, 0x09, 0x27, 0xf5, 0x55, 0x26, 0x81, 0x38
    };
    Crypto_DataBlob keyBlob = {.data = keyData, .len = sizeof(keyData)};
    EXPECT_EQ(OH_CryptoSymKeyGenerator_Create((const char *)"AES128", &genCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymKeyGenerator_Convert(genCtx, (Crypto_DataBlob *)&keyBlob, &keyCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_Create(&params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_SetParam(params, CRYPTO_IV_DATABLOB, (Crypto_DataBlob *)&ivBlob),
        CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Create((const char *)"AES128|CBC|PKCS7", &encCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Init(encCtx, CRYPTO_ENCRYPT_MODE, keyCtx, params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Final(encCtx, (Crypto_DataBlob *)&msgBlob, &outUpdate), CRYPTO_SUCCESS);
    outUpdate.data[msgBlob.len]++;
    EXPECT_EQ(OH_CryptoSymCipher_Create((const char *)"AES128|CBC|PKCS7", &decCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Init(decCtx, CRYPTO_DECRYPT_MODE, keyCtx, params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Final(decCtx, &outUpdate, &decUpdate), CRYPTO_OPERTION_ERROR);

    OH_CryptoSymCipherParams_Destroy(params);
    OH_CryptoSymCipher_Destroy(encCtx);
    OH_CryptoSymCipher_Destroy(decCtx);
    OH_CryptoSymKeyGenerator_Destroy(genCtx);
    OH_CryptoSymKey_Destroy(keyCtx);
    HcfBlobDataClearAndFree((Crypto_DataBlob *)&outUpdate);
    HcfBlobDataClearAndFree((Crypto_DataBlob *)&decUpdate);
    return 0;
}

int SubCryptoFrameworkNapiSymCipherTest1400()
{
    OH_CryptoSymKeyGenerator *genCtx = nullptr;
    OH_CryptoSymCipher *encCtx = nullptr;
    OH_CryptoSymCipher *decCtx = nullptr;
    OH_CryptoSymKey *keyCtx = nullptr;
    OH_CryptoSymCipherParams *params = nullptr;
    int32_t randomLen = 20;
    int32_t ivLen = 16;
    
    OH_CryptoRand *randomObj = nullptr;
    Crypto_DataBlob msgBlob = {0};
    Crypto_DataBlob ivBlob = {0};
    Crypto_DataBlob outUpdate = {.data = nullptr, .len = 0};
    Crypto_DataBlob decUpdate = {.data = nullptr, .len = 0};

    OH_CryptoRand_Create(&randomObj);
    EXPECT_TRUE(randomObj != nullptr);
    EXPECT_EQ(OH_CryptoRand_GenerateRandom(randomObj, randomLen, &msgBlob), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoRand_GenerateRandom(randomObj, ivLen, &ivBlob), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoSymKeyGenerator_Create(reinterpret_cast<const char*>("AES128"), &genCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymKeyGenerator_Generate(genCtx, &keyCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_Create(&params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_SetParam(params, CRYPTO_IV_DATABLOB, (Crypto_DataBlob *)&ivBlob),
        CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Create(reinterpret_cast<const char*>("AES128|CBC|PKCS7"), &encCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Init(encCtx, CRYPTO_ENCRYPT_MODE, keyCtx, params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Final(encCtx, (Crypto_DataBlob *)&msgBlob, &outUpdate), CRYPTO_SUCCESS);
    outUpdate.data[randomLen - OH_CRYPTO_AES_BLOCKSIZE - 1]++;
    EXPECT_EQ(OH_CryptoSymCipher_Create(reinterpret_cast<const char*>("AES128|CBC|PKCS7"), &decCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Init(decCtx, CRYPTO_DECRYPT_MODE, keyCtx, params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Final(decCtx, &outUpdate, &decUpdate), CRYPTO_SUCCESS);
    EXPECT_TRUE(memcmp(msgBlob.data, decUpdate.data, msgBlob.len) != 0);

    OH_CryptoSymCipherParams_Destroy(params);
    OH_CryptoSymCipher_Destroy(encCtx);
    OH_CryptoSymCipher_Destroy(decCtx);
    OH_CryptoSymKeyGenerator_Destroy(genCtx);
    OH_CryptoSymKey_Destroy(keyCtx);
    HcfBlobDataClearAndFree((Crypto_DataBlob *)&outUpdate);
    HcfBlobDataClearAndFree(&msgBlob);
    HcfBlobDataClearAndFree(&ivBlob);
    HcfBlobDataClearAndFree((Crypto_DataBlob *)&decUpdate);
    OH_CryptoRand_Destroy(randomObj);
    return 0;
}

int SubCryptoFrameworkNapiSymCipherTest1500()
{
    OH_CryptoSymKeyGenerator *genCtx = nullptr;
    OH_CryptoSymCipher *encCtx = nullptr;
    OH_CryptoSymCipher *decCtx = nullptr;
    OH_CryptoSymKey *keyCtx = nullptr;
    OH_CryptoSymCipherParams *params = nullptr;
    int32_t randomLen = 20;
    int32_t ivLen = 16;
    
    OH_CryptoRand *randomObj = nullptr;
    Crypto_DataBlob msgBlob = {0};
    Crypto_DataBlob ivBlob = {0};
    Crypto_DataBlob outUpdate = {.data = nullptr, .len = 0};
    Crypto_DataBlob decUpdate = {.data = nullptr, .len = 0};

    OH_CryptoRand_Create(&randomObj);
    EXPECT_TRUE(randomObj != nullptr);
    EXPECT_EQ(OH_CryptoRand_GenerateRandom(randomObj, randomLen, &msgBlob), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoRand_GenerateRandom(randomObj, ivLen, &ivBlob), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoSymKeyGenerator_Create(reinterpret_cast<const char*>("AES128"), &genCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymKeyGenerator_Generate(genCtx, &keyCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_Create(&params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_SetParam(params, CRYPTO_IV_DATABLOB, (Crypto_DataBlob *)&ivBlob),
        CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Create(reinterpret_cast<const char*>("AES128|CBC|PKCS7"), &encCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Init(encCtx, CRYPTO_ENCRYPT_MODE, keyCtx, params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Final(encCtx, (Crypto_DataBlob *)&msgBlob, &outUpdate), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Create(reinterpret_cast<const char*>("AES128|CBC|NoPadding"),
        &decCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Init(decCtx, CRYPTO_DECRYPT_MODE, keyCtx, params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Final(decCtx, &outUpdate, &decUpdate), CRYPTO_SUCCESS);
    EXPECT_TRUE(memcmp(msgBlob.data, decUpdate.data, msgBlob.len) == 0);
    EXPECT_TRUE(msgBlob.len != decUpdate.len);

    OH_CryptoSymCipherParams_Destroy(params);
    OH_CryptoSymCipher_Destroy(encCtx);
    OH_CryptoSymCipher_Destroy(decCtx);
    OH_CryptoSymKeyGenerator_Destroy(genCtx);
    OH_CryptoSymKey_Destroy(keyCtx);
    HcfBlobDataClearAndFree((Crypto_DataBlob *)&outUpdate);
    HcfBlobDataClearAndFree((Crypto_DataBlob *)&decUpdate);
    HcfBlobDataClearAndFree(&msgBlob);
    HcfBlobDataClearAndFree(&ivBlob);
    OH_CryptoRand_Destroy(randomObj);
    return 0;
}

int SubCryptoFrameworkNapiSymCipherTest1600()
{
    OH_CryptoSymKeyGenerator *genCtx = nullptr;
    OH_CryptoSymCipher *encCtx = nullptr;
    OH_CryptoSymCipher *decCtx = nullptr;
    OH_CryptoSymKey *keyCtx = nullptr;
    OH_CryptoSymCipherParams *params = nullptr;
    int32_t randomLen = VALUE_64;
    int32_t ivLen = VALUE_16;
    
    OH_CryptoRand *randomObj = nullptr;
    Crypto_DataBlob msgBlob = {0};
    Crypto_DataBlob ivBlob = {0};
    Crypto_DataBlob outUpdate = {.data = nullptr, .len = 0};
    Crypto_DataBlob decUpdate = {.data = nullptr, .len = 0};

    OH_CryptoRand_Create(&randomObj);
    EXPECT_TRUE(randomObj != nullptr);
    EXPECT_EQ(OH_CryptoRand_GenerateRandom(randomObj, randomLen, &msgBlob), HCF_SUCCESS);
    msgBlob.data[VALUE_63] = PKCS7_PADDING_FLAG; // 刚好符合PKCS7填充方式
    EXPECT_EQ(OH_CryptoRand_GenerateRandom(randomObj, ivLen, &ivBlob), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoSymKeyGenerator_Create(reinterpret_cast<const char*>("AES128"), &genCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymKeyGenerator_Generate(genCtx, &keyCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_Create(&params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_SetParam(params, CRYPTO_IV_DATABLOB, (Crypto_DataBlob *)&ivBlob),
        CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Create(reinterpret_cast<const char*>("AES256|ECB|NoPadding"),
        &encCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Init(encCtx, CRYPTO_ENCRYPT_MODE, keyCtx, params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Final(encCtx, (Crypto_DataBlob *)&msgBlob, &outUpdate), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Create(reinterpret_cast<const char*>("AES256|ECB|PKCS7"), &decCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Init(decCtx, CRYPTO_DECRYPT_MODE, keyCtx, params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Final(decCtx, &outUpdate, &decUpdate), CRYPTO_SUCCESS);
    EXPECT_TRUE(memcmp(msgBlob.data, decUpdate.data, msgBlob.len) != 0);
    EXPECT_TRUE(msgBlob.len == decUpdate.len + 1);

    OH_CryptoSymCipherParams_Destroy(params);
    OH_CryptoSymCipher_Destroy(encCtx);
    OH_CryptoSymCipher_Destroy(decCtx);
    OH_CryptoSymKeyGenerator_Destroy(genCtx);
    OH_CryptoSymKey_Destroy(keyCtx);
    HcfBlobDataClearAndFree((Crypto_DataBlob *)&outUpdate);
    HcfBlobDataClearAndFree((Crypto_DataBlob *)&decUpdate);
    HcfBlobDataClearAndFree(&msgBlob);
    HcfBlobDataClearAndFree(&ivBlob);
    OH_CryptoRand_Destroy(randomObj);
    return 0;
}

int SubCryptoFrameworkNapiSymCipherTest1700()
{
    OH_CryptoSymKeyGenerator *genCtx = nullptr;
    OH_CryptoSymCipher *encCtx = nullptr;
     
    OH_CryptoSymCipher *decCtx = nullptr;
    OH_CryptoSymKey *keyCtx = nullptr;
    OH_CryptoSymCipherParams *params = nullptr;
    int32_t randomLen = 16;
    int32_t ivLen = 16;
    
    OH_CryptoRand *randomObj = nullptr;
    Crypto_DataBlob msgBlob = {0};
    Crypto_DataBlob ivBlob = {0};
    Crypto_DataBlob outUpdate = {.data = nullptr, .len = 0};
    Crypto_DataBlob decUpdate = {.data = nullptr, .len = 0};

    OH_CryptoRand_Create(&randomObj);
    EXPECT_TRUE(randomObj != nullptr);
    EXPECT_EQ(OH_CryptoRand_GenerateRandom(randomObj, randomLen, &msgBlob), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoRand_GenerateRandom(randomObj, ivLen, &ivBlob), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoSymKeyGenerator_Create(reinterpret_cast<const char*>("AES256"), &genCtx),
        CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymKeyGenerator_Generate(genCtx, &keyCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_Create(&params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_SetParam(params, CRYPTO_IV_DATABLOB, (Crypto_DataBlob *)&ivBlob),
        CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Create(reinterpret_cast<const char*>("AES256|ECB|NoPadding"),
        &encCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Init(encCtx, CRYPTO_ENCRYPT_MODE, keyCtx, params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Final(encCtx, (Crypto_DataBlob *)&msgBlob, &outUpdate), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Create(reinterpret_cast<const char*>("AES256|ECB|PKCS7"), &decCtx),
        CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Init(decCtx, CRYPTO_DECRYPT_MODE, keyCtx, params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Final(decCtx, &outUpdate, &decUpdate), CRYPTO_OPERTION_ERROR);

    OH_CryptoSymCipherParams_Destroy(params);
    OH_CryptoSymCipher_Destroy(encCtx);
    OH_CryptoSymCipher_Destroy(decCtx);
    OH_CryptoSymKeyGenerator_Destroy(genCtx);
    OH_CryptoSymKey_Destroy(keyCtx);
    HcfBlobDataClearAndFree((Crypto_DataBlob *)&outUpdate);
    HcfBlobDataClearAndFree((Crypto_DataBlob *)&decUpdate);
    HcfBlobDataClearAndFree(&msgBlob);
    HcfBlobDataClearAndFree(&ivBlob);
    OH_CryptoRand_Destroy(randomObj);
    return 0;
}

int SubCryptoFrameworkNapiSymCipherTest1800()
{
    OH_CryptoSymKeyGenerator *genCtx = nullptr;
    OH_CryptoSymCipher *encCtx = nullptr;
    OH_CryptoSymKey *keyCtx = nullptr;
    OH_CryptoSymCipherParams *params = nullptr;
    int32_t randomLen = 17; // 加密最小值16字节，且是8的倍数
    int32_t ivLen = 8;
    OH_CryptoRand *randomObj = nullptr;
    Crypto_DataBlob msgBlob = {0};
    Crypto_DataBlob ivBlob = {0};
    Crypto_DataBlob outUpdate = {.data = nullptr, .len = 0};

    OH_CryptoRand_Create(&randomObj);
    EXPECT_TRUE(randomObj != nullptr);
    EXPECT_EQ(OH_CryptoRand_GenerateRandom(randomObj, randomLen, &msgBlob), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoRand_GenerateRandom(randomObj, ivLen, &ivBlob), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoSymKeyGenerator_Create(reinterpret_cast<const char*>("AES256"), &genCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymKeyGenerator_Generate(genCtx, &keyCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_Create(&params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_SetParam(params, CRYPTO_IV_DATABLOB, (Crypto_DataBlob *)&ivBlob),
        CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Create(reinterpret_cast<const char*>("AES256-WRAP"), &encCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Init(encCtx, CRYPTO_ENCRYPT_MODE, keyCtx, params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Final(encCtx, (Crypto_DataBlob *)&msgBlob, &outUpdate), CRYPTO_OPERTION_ERROR);

    OH_CryptoSymCipherParams_Destroy(params);
    OH_CryptoSymCipher_Destroy(encCtx);
    OH_CryptoSymKeyGenerator_Destroy(genCtx);
    OH_CryptoSymKey_Destroy(keyCtx);
    HcfBlobDataClearAndFree((Crypto_DataBlob *)&outUpdate);
    HcfBlobDataClearAndFree(&msgBlob);
    HcfBlobDataClearAndFree(&ivBlob);
    OH_CryptoRand_Destroy(randomObj);
    return 0;
}

int SubCryptoFrameworkNapiSymCipherTest1900()
{
    OH_CryptoSymKeyGenerator *genCtx = nullptr;
    OH_CryptoSymCipher *encCtx = nullptr;
    OH_CryptoSymKey *keyCtx = nullptr;
    OH_CryptoSymCipherParams *params = nullptr;
    int32_t randomLen = 8; // 加密最小值16字节，且是8的倍数
    int32_t ivLen = 8;
    OH_CryptoRand *randomObj = nullptr;
    Crypto_DataBlob msgBlob = {0};
    Crypto_DataBlob ivBlob = {0};
    Crypto_DataBlob outUpdate = {.data = nullptr, .len = 0};

    OH_CryptoRand_Create(&randomObj);
    EXPECT_TRUE(randomObj != nullptr);
    EXPECT_EQ(OH_CryptoRand_GenerateRandom(randomObj, randomLen, &msgBlob), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoRand_GenerateRandom(randomObj, ivLen, &ivBlob), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoSymKeyGenerator_Create(reinterpret_cast<const char*>("AES128"), &genCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymKeyGenerator_Generate(genCtx, &keyCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_Create(&params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_SetParam(params, CRYPTO_IV_DATABLOB, (Crypto_DataBlob *)&ivBlob),
        CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Create(reinterpret_cast<const char*>("AES128-WRAP"), &encCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Init(encCtx, CRYPTO_ENCRYPT_MODE, keyCtx, params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Final(encCtx, (Crypto_DataBlob *)&msgBlob, &outUpdate), CRYPTO_OPERTION_ERROR);

    OH_CryptoSymCipherParams_Destroy(params);
    OH_CryptoSymCipher_Destroy(encCtx);
    OH_CryptoSymKeyGenerator_Destroy(genCtx);
    OH_CryptoSymKey_Destroy(keyCtx);
    HcfBlobDataClearAndFree((Crypto_DataBlob *)&outUpdate);
    HcfBlobDataClearAndFree(&msgBlob);
    HcfBlobDataClearAndFree(&ivBlob);
    OH_CryptoRand_Destroy(randomObj);
    return 0;
}

int SubCryptoFrameworkNapiSymCipherTest2000()
{
    OH_CryptoSymKeyGenerator *genCtx = nullptr;
    OH_CryptoSymCipher *decCtx = nullptr;
    OH_CryptoSymKey *keyCtx = nullptr;
    OH_CryptoSymCipherParams *params = nullptr;
    int32_t randomLen = 16; // 解密最小值24字节，且是8的倍数
    int32_t ivLen = 8;
    OH_CryptoRand *randomObj = nullptr;
    Crypto_DataBlob msgBlob = {0};
    Crypto_DataBlob ivBlob = {0};
    Crypto_DataBlob decUpdate = {.data = nullptr, .len = 0};

    OH_CryptoRand_Create(&randomObj);
    EXPECT_TRUE(randomObj != nullptr);
    EXPECT_EQ(OH_CryptoRand_GenerateRandom(randomObj, randomLen, &msgBlob), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoRand_GenerateRandom(randomObj, ivLen, &ivBlob), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoSymKeyGenerator_Create(reinterpret_cast<const char*>("AES192"), &genCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymKeyGenerator_Generate(genCtx, &keyCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_Create(&params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_SetParam(params, CRYPTO_IV_DATABLOB, (Crypto_DataBlob *)&ivBlob),
        CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Create(reinterpret_cast<const char*>("AES192-WRAP"), &decCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Init(decCtx, CRYPTO_DECRYPT_MODE, keyCtx, params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Final(decCtx, (Crypto_DataBlob *)&msgBlob, &decUpdate), CRYPTO_OPERTION_ERROR);

    OH_CryptoSymCipherParams_Destroy(params);
    OH_CryptoSymCipher_Destroy(decCtx);
    OH_CryptoSymKeyGenerator_Destroy(genCtx);
    OH_CryptoSymKey_Destroy(keyCtx);
    HcfBlobDataClearAndFree((Crypto_DataBlob *)&decUpdate);
    HcfBlobDataClearAndFree(&msgBlob);
    HcfBlobDataClearAndFree(&ivBlob);
    OH_CryptoRand_Destroy(randomObj);
    return 0;
}

int SubCryptoFrameworkNapiSymCipherTest2100()
{
    OH_CryptoSymKeyGenerator *genCtx = nullptr;
    OH_CryptoSymCipher *decCtx = nullptr;
    OH_CryptoSymKey *keyCtx = nullptr;
    OH_CryptoSymCipherParams *params = nullptr;
    int32_t ivLen = 9; // 固定值8字节
    OH_CryptoRand *randomObj = nullptr;
    Crypto_DataBlob ivBlob = {0};

    OH_CryptoRand_Create(&randomObj);
    EXPECT_TRUE(randomObj != nullptr);
    EXPECT_EQ(OH_CryptoRand_GenerateRandom(randomObj, ivLen, &ivBlob), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoSymKeyGenerator_Create(reinterpret_cast<const char*>("AES192"), &genCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymKeyGenerator_Generate(genCtx, &keyCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_Create(&params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_SetParam(params, CRYPTO_IV_DATABLOB, (Crypto_DataBlob *)&ivBlob),
        CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Create(reinterpret_cast<const char*>("AES192-WRAP"), &decCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Init(decCtx, CRYPTO_DECRYPT_MODE, keyCtx, params), CRYPTO_INVALID_PARAMS);

    OH_CryptoSymCipherParams_Destroy(params);
    OH_CryptoSymCipher_Destroy(decCtx);
    OH_CryptoSymKeyGenerator_Destroy(genCtx);
    OH_CryptoSymKey_Destroy(keyCtx);
    HcfBlobDataClearAndFree(&ivBlob);
    OH_CryptoRand_Destroy(randomObj);
    return 0;
}

int SubCryptoFrameworkNapiSymCipherTest2200()
{
    OH_CryptoSymKeyGenerator *genCtx = nullptr;
    OH_CryptoSymCipher *encCtx = nullptr;
    OH_CryptoSymCipher *decCtx = nullptr;
    OH_CryptoSymKey *keyCtx = nullptr;
    OH_CryptoSymCipherParams *params = nullptr;
    uint8_t ivData[] = {
        0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f, 0x09, 0x08
    };
    uint8_t kekData[] = {
        0x17, 0x94, 0x52, 0x19, 0x76, 0xff, 0xbe, 0x3f, 0xa9, 0xda, 0x73, 0x6c, 0xae, 0xc3, 0x02, 0x18
    };
    uint8_t keyData[] = {
        0xb7, 0x8a, 0xc9, 0xec, 0xc3, 0xdc, 0xb9, 0xba, 0x31, 0xf3, 0x60, 0x29, 0x54, 0x13, 0x7c, 0x43
    };

    Crypto_DataBlob ivBlob = {.data = ivData, .len = sizeof(ivData)};
    Crypto_DataBlob kekBlob = {.data = kekData, .len = sizeof(kekData)};
    Crypto_DataBlob keyBlob = {.data = keyData, .len = sizeof(keyData)};
    Crypto_DataBlob outUpdate = {.data = nullptr, .len = 0};
    Crypto_DataBlob decUpdate = {.data = nullptr, .len = 0};

    EXPECT_EQ(OH_CryptoSymKeyGenerator_Create(reinterpret_cast<const char*>("AES128"), &genCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymKeyGenerator_Convert(genCtx, (Crypto_DataBlob *)&kekBlob, &keyCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Create(reinterpret_cast<const char*>("AES128-WRAP"), &encCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_Create(&params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Init(encCtx, CRYPTO_ENCRYPT_MODE, keyCtx, params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Final(encCtx, (Crypto_DataBlob *)&keyBlob, &outUpdate), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Create(reinterpret_cast<const char*>("AES128-WRAP"), &decCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_SetParam(params, CRYPTO_IV_DATABLOB, (Crypto_DataBlob *)&ivBlob),
        CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Init(decCtx, CRYPTO_DECRYPT_MODE, keyCtx, params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Final(decCtx, &outUpdate, &decUpdate), CRYPTO_OPERTION_ERROR);

    OH_CryptoSymCipherParams_Destroy(params);
    OH_CryptoSymCipher_Destroy(encCtx);
    OH_CryptoSymCipher_Destroy(decCtx);
    OH_CryptoSymKeyGenerator_Destroy(genCtx);
    OH_CryptoSymKey_Destroy(keyCtx);
    HcfBlobDataClearAndFree((Crypto_DataBlob *)&outUpdate);
    HcfBlobDataClearAndFree((Crypto_DataBlob *)&decUpdate);
    return 0;
}

int SubCryptoFrameworkNapiSymCipherTest2300()
{
    OH_CryptoSymKeyGenerator *genCtx = nullptr;
    OH_CryptoSymCipher *encCtx = nullptr;
    OH_CryptoSymKey *keyCtx = nullptr;
    OH_CryptoSymCipherParams *params = nullptr;
    uint8_t kekData[] = {
        0x17, 0x94, 0x52, 0x19, 0x76, 0xff, 0xbe, 0x3f, 0xa9, 0xda, 0x73, 0x6c, 0xae, 0xc3, 0x02, 0x18
    };
    uint8_t keyData[] = {
        0xb7, 0x8a, 0xc9, 0xec, 0xc3, 0xdc, 0xb9, 0xba, 0x31, 0xf3, 0x60, 0x29, 0x54, 0x13, 0x7c, 0x43
    };
    Crypto_DataBlob kekBlob = {.data = kekData, .len = sizeof(kekData)};
    Crypto_DataBlob keyBlob = {.data = keyData, .len = sizeof(keyData)};
    Crypto_DataBlob outUpdate = {.data = nullptr, .len = 0};

    EXPECT_EQ(OH_CryptoSymKeyGenerator_Create(reinterpret_cast<const char*>("AES128"), &genCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymKeyGenerator_Convert(genCtx, (Crypto_DataBlob *)&kekBlob, &keyCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Create(reinterpret_cast<const char*>("AES128-WRAP"), &encCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_Create(&params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Init(encCtx, CRYPTO_ENCRYPT_MODE, keyCtx, params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Update(encCtx, (Crypto_DataBlob *)&keyBlob, &outUpdate), CRYPTO_OPERTION_ERROR);

    OH_CryptoSymCipherParams_Destroy(params);
    OH_CryptoSymCipher_Destroy(encCtx);
    OH_CryptoSymKeyGenerator_Destroy(genCtx);
    OH_CryptoSymKey_Destroy(keyCtx);
    HcfBlobDataClearAndFree((Crypto_DataBlob *)&outUpdate);
    return 0;
}

static void InitAesWrapBlobs(SymCipherSpec spec, Crypto_DataBlob *msgBlob, Crypto_DataBlob *ivBlob)
{
    OH_CryptoRand *randomObj = nullptr;
    OH_CryptoRand_Create(&randomObj);
    EXPECT_TRUE(randomObj != nullptr);
    EXPECT_EQ(OH_CryptoRand_GenerateRandom(randomObj, spec.msgLen, msgBlob), HCF_SUCCESS);
    if (spec.ivLen != 0) {
        EXPECT_EQ(OH_CryptoRand_GenerateRandom(randomObj, spec.ivLen, ivBlob), HCF_SUCCESS);
    }
    OH_CryptoRand_Destroy(randomObj);
}

static OH_CryptoSymKey* CreateAesWrapKey(const char *algName)
{
    OH_CryptoSymKeyGenerator *genCtx = nullptr;
    OH_CryptoSymKey *keyCtx = nullptr;
    EXPECT_EQ(OH_CryptoSymKeyGenerator_Create(algName, &genCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymKeyGenerator_Generate(genCtx, &keyCtx), CRYPTO_SUCCESS);
    OH_CryptoSymKeyGenerator_Destroy(genCtx);
    return keyCtx;
}

static OH_CryptoSymCipherParams* CreateAesWrapParams(int32_t ivLen, Crypto_DataBlob *ivBlob)
{
    OH_CryptoSymCipherParams *params = nullptr;
    EXPECT_EQ(OH_CryptoSymCipherParams_Create(&params), CRYPTO_SUCCESS);
    if (ivLen != 0) {
        EXPECT_EQ(OH_CryptoSymCipherParams_SetParam(params, CRYPTO_IV_DATABLOB, ivBlob), CRYPTO_SUCCESS);
    }
    return params;
}

static void AesWrapEncrypt(const char *alg, OH_CryptoSymKey *key,
    OH_CryptoSymCipherParams *params, Crypto_DataBlob *msgBlob, Crypto_DataBlob *outUpdate)
{
    OH_CryptoSymCipher *encCtx = nullptr;
    EXPECT_EQ(OH_CryptoSymCipher_Create(alg, &encCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Init(encCtx, CRYPTO_ENCRYPT_MODE, key, params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Final(encCtx, msgBlob, outUpdate), CRYPTO_SUCCESS);
    OH_CryptoSymCipher_Destroy(encCtx);
}

static void AesWrapDecryptCheck(const char *alg, OH_CryptoSymKey *key,
    OH_CryptoSymCipherParams *params, Crypto_DataBlob *outUpdate, Crypto_DataBlob *msgBlob)
{
    OH_CryptoSymCipher *decCtx = nullptr;
    Crypto_DataBlob decUpdate = {0};
    EXPECT_EQ(OH_CryptoSymCipher_Create(alg, &decCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Init(decCtx, CRYPTO_DECRYPT_MODE, key, params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Final(decCtx, outUpdate, &decUpdate), CRYPTO_SUCCESS);
    EXPECT_TRUE(memcmp(msgBlob->data, decUpdate.data, msgBlob->len) == 0);
    HcfBlobDataClearAndFree(&decUpdate);
    OH_CryptoSymCipher_Destroy(decCtx);
}

static void ReleaseAesWrapResources(OH_CryptoSymCipherParams *params, OH_CryptoSymKey *key,
                                    Crypto_DataBlob *blobs, int count)
{
    OH_CryptoSymCipherParams_Destroy(params);
    OH_CryptoSymKey_Destroy(key);
    for (int i = 0; i < count; i++) {
        HcfBlobDataClearAndFree(blobs + i);
    }
}

int SubCryptoFrameworkNapiSymCipherTest2600()
{
    int count = SYM_AES_WRAP_CIPHER_DATA_COUNT;
    for (int i = 0; i < count; i++) {
        SymCipherSpec spec = g_symAesWrapCipherData[i];
        OH_CryptoSymKey *keyCtx = nullptr;
        OH_CryptoSymCipher *encCtx = nullptr;
        OH_CryptoSymCipher *decCtx = nullptr;
        OH_CryptoSymCipherParams *params = nullptr;
        Crypto_DataBlob msgBlob = {0};
        Crypto_DataBlob ivBlob = {0};
        Crypto_DataBlob outUpdate = {0};
        Crypto_DataBlob decUpdate = {0};

        InitAesWrapBlobs(spec, &msgBlob, &ivBlob);
        keyCtx = CreateAesWrapKey(reinterpret_cast<const char*>(spec.algName));
        params = CreateAesWrapParams(spec.ivLen, &ivBlob);
        AesWrapEncrypt(reinterpret_cast<const char*>(spec.cipherAlgName), keyCtx, params,
            &msgBlob, &outUpdate);
        AesWrapDecryptCheck(reinterpret_cast<const char*>(spec.cipherAlgName),
            keyCtx, params, &outUpdate, &msgBlob);

        Crypto_DataBlob blobs[] = {outUpdate, msgBlob, ivBlob, decUpdate};
        ReleaseAesWrapResources(params, keyCtx, blobs, VALUE_4);
    }
    return 0;
}

typedef struct {
    SymCipherSpec cipherSpec;
    OH_CryptoSymKeyGenerator *genCtx;
    OH_CryptoSymCipher *encCtx;
    OH_CryptoSymCipher *decCtx;
    OH_CryptoSymKey *keyCtx;
    OH_CryptoSymCipherParams *params;
    OH_CryptoRand *randomObj;

    Crypto_DataBlob msgBlob;
    Crypto_DataBlob ivBlob;
    Crypto_DataBlob aadBlob;
    Crypto_DataBlob outUpdate;
    Crypto_DataBlob decUpdate;
    Crypto_DataBlob tag;
    Crypto_DataBlob tagInit;

    uint8_t tagArr[OH_CRYPTO_CHACHA20_POLY1305_TAG_LEN];
} ChaChaTestCtx;


static void ChaChaTestCtxInit(ChaChaTestCtx *ctx, const SymCipherSpec *spec)
{
    uint8_t zero = VALUE_0;
    SafeMemset(ctx, sizeof(ChaChaTestCtx), &zero, sizeof(ChaChaTestCtx));

    ctx->cipherSpec = *spec;

    // 初始化TAG
    ctx->tagInit.data = ctx->tagArr;
    ctx->tagInit.len = OH_CRYPTO_CHACHA20_POLY1305_TAG_LEN;

    ctx->outUpdate.data = nullptr;
    ctx->outUpdate.len = 0;
    ctx->decUpdate.data = nullptr;
    ctx->decUpdate.len = 0;
    ctx->tag.data = nullptr;
    ctx->tag.len = 0;
}

static int32_t ChaChaCipherDoTest(ChaChaTestCtx *ctx)
{
    SymCipherSpec *spec = &ctx->cipherSpec;

    // 生成随机数
    OH_CryptoRand_Create(&ctx->randomObj);
    EXPECT_TRUE(ctx->randomObj != nullptr);
    EXPECT_EQ(OH_CryptoRand_GenerateRandom(ctx->randomObj, spec->msgLen, &ctx->msgBlob), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoRand_GenerateRandom(ctx->randomObj, spec->ivLen, &ctx->ivBlob), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoRand_GenerateRandom(ctx->randomObj, spec->aadLen, &ctx->aadBlob), HCF_SUCCESS);

    // 生成密钥
    EXPECT_EQ(OH_CryptoSymKeyGenerator_Create((const char *)spec->algName, &ctx->genCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymKeyGenerator_Generate(ctx->genCtx, &ctx->keyCtx), CRYPTO_SUCCESS);

    // 设置参数
    EXPECT_EQ(OH_CryptoSymCipherParams_Create(&ctx->params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_SetParam(ctx->params, CRYPTO_IV_DATABLOB, &ctx->ivBlob), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_SetParam(ctx->params, CRYPTO_AAD_DATABLOB, &ctx->aadBlob), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_SetParam(ctx->params, CRYPTO_TAG_DATABLOB, &ctx->tagInit), CRYPTO_SUCCESS);

    // 加密
    EXPECT_EQ(OH_CryptoSymCipher_Create((const char *)spec->cipherAlgName, &ctx->encCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Init(ctx->encCtx, CRYPTO_ENCRYPT_MODE, ctx->keyCtx, ctx->params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Update(ctx->encCtx, &ctx->msgBlob, &ctx->outUpdate), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Final(ctx->encCtx, nullptr, &ctx->tag), CRYPTO_SUCCESS);

    // 解密
    EXPECT_EQ(OH_CryptoSymCipher_Create((const char *)spec->cipherAlgName, &ctx->decCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_SetParam(ctx->params, CRYPTO_TAG_DATABLOB, &ctx->tag), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Init(ctx->decCtx, CRYPTO_DECRYPT_MODE, ctx->keyCtx, ctx->params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Final(ctx->decCtx, &ctx->outUpdate, &ctx->decUpdate), CRYPTO_SUCCESS);

    EXPECT_TRUE(memcmp(ctx->msgBlob.data, ctx->decUpdate.data, ctx->msgBlob.len) == 0);
    return CRYPTO_SUCCESS;
}

// 资源销毁
static void ChaChaTestCtxDestroy(ChaChaTestCtx *ctx)
{
    if (ctx->params) {
        OH_CryptoSymCipherParams_Destroy(ctx->params);
    }
    if (ctx->encCtx) {
        OH_CryptoSymCipher_Destroy(ctx->encCtx);
    }
    if (ctx->decCtx) {
        OH_CryptoSymCipher_Destroy(ctx->decCtx);
    }
    if (ctx->genCtx) {
        OH_CryptoSymKeyGenerator_Destroy(ctx->genCtx);
    }
    if (ctx->keyCtx) {
        OH_CryptoSymKey_Destroy(ctx->keyCtx);
    }
    if (ctx->randomObj) {
        OH_CryptoRand_Destroy(ctx->randomObj);
    }

    HcfBlobDataClearAndFree(&ctx->outUpdate);
    HcfBlobDataClearAndFree(&ctx->msgBlob);
    HcfBlobDataClearAndFree(&ctx->ivBlob);
    HcfBlobDataClearAndFree(&ctx->aadBlob);
    HcfBlobDataClearAndFree(&ctx->tag);
    HcfBlobDataClearAndFree(&ctx->decUpdate);
}

int SubCryptoFrameworkNapiSymCipherTest2700()
{
    const int symCipherSpecCount = SYM_CHA_CHA20_POLY1305_CIPHER_DATA_COUNT;
    for (int i = 0; i < symCipherSpecCount; i++) {
        ChaChaTestCtx testCtx;
        ChaChaTestCtxInit(&testCtx, &g_symChaCha20Poly1305CipherData[i]);
        ChaChaCipherDoTest(&testCtx);
        ChaChaTestCtxDestroy(&testCtx);
    }
    return 0;
}


typedef struct {
    SymCipherSpec cipherSpec;
    OH_CryptoSymKeyGenerator *genCtx;
    OH_CryptoSymCipher *encCtx;
    OH_CryptoSymCipher *decCtx;
    OH_CryptoSymKey *keyCtx;
    OH_CryptoSymCipherParams *params;
    OH_CryptoRand *randomObj;

    Crypto_DataBlob msgBlob;
    Crypto_DataBlob ivBlob;
    Crypto_DataBlob aadBlob;
    Crypto_DataBlob outUpdate;
    Crypto_DataBlob decUpdate;
    Crypto_DataBlob tag;
    Crypto_DataBlob tagInit;
    Crypto_DataBlob cipherBlob;

    uint8_t tagArr[OH_CRYPTO_CHACHA20_POLY1305_TAG_LEN];
    uint8_t cipherText[OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE + 16];

    int32_t randomLen;
    int32_t ivLen;
    int32_t aadLen;
    int32_t cipherLen;
    int blockSize;
    int cnt;
    int rem;
} ChaChaBlockTestCtx;

static void ChaChaBlockTestCtxInit(ChaChaBlockTestCtx *ctx, const SymCipherSpec *spec)
{
    uint8_t zero = VALUE_0;
    SafeMemset(ctx, sizeof(ChaChaBlockTestCtx), &zero, sizeof(ChaChaBlockTestCtx));

    ctx->cipherSpec = *spec;
    ctx->randomLen = OH_CRYPTO_SYM_CIPHER_TEST_DATA_SIZE;
    ctx->ivLen = spec->ivLen;
    ctx->aadLen = spec->aadLen;
    ctx->blockSize = VALUE_20;
    ctx->cipherLen = 0;

    ctx->tagInit.data = ctx->tagArr;
    ctx->tagInit.len = OH_CRYPTO_CHACHA20_POLY1305_TAG_LEN;

    ctx->outUpdate.data = nullptr;
    ctx->outUpdate.len = 0;
    ctx->decUpdate.data = nullptr;
    ctx->decUpdate.len = 0;
    ctx->tag.data = nullptr;
    ctx->tag.len = 0;
}

static void InitRandomAndGenerateData(ChaChaBlockTestCtx *ctx)
{
    OH_CryptoRand_Create(&ctx->randomObj);
    EXPECT_TRUE(ctx->randomObj != nullptr);
    EXPECT_EQ(OH_CryptoRand_GenerateRandom(ctx->randomObj, ctx->randomLen, &ctx->msgBlob), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoRand_GenerateRandom(ctx->randomObj, ctx->ivLen, &ctx->ivBlob), HCF_SUCCESS);
    EXPECT_EQ(OH_CryptoRand_GenerateRandom(ctx->randomObj, ctx->aadLen, &ctx->aadBlob), HCF_SUCCESS);
}

static void GenerateAndSetKey(ChaChaBlockTestCtx *ctx)
{
    SymCipherSpec *spec = &ctx->cipherSpec;
    EXPECT_EQ(OH_CryptoSymKeyGenerator_Create((const char *)spec->algName, &ctx->genCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymKeyGenerator_Generate(ctx->genCtx, &ctx->keyCtx), CRYPTO_SUCCESS);
}

static void InitCipherParams(ChaChaBlockTestCtx *ctx)
{
    EXPECT_EQ(OH_CryptoSymCipherParams_Create(&ctx->params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_SetParam(ctx->params, CRYPTO_IV_DATABLOB, &ctx->ivBlob), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_SetParam(ctx->params, CRYPTO_AAD_DATABLOB, &ctx->aadBlob), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_SetParam(ctx->params, CRYPTO_TAG_DATABLOB, &ctx->tagInit), CRYPTO_SUCCESS);
}

static void DoBlockEncrypt(ChaChaBlockTestCtx *ctx)
{
    SymCipherSpec *spec = &ctx->cipherSpec;

    EXPECT_EQ(OH_CryptoSymCipher_Create((const char *)spec->cipherAlgName, &ctx->encCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Init(ctx->encCtx, CRYPTO_ENCRYPT_MODE, ctx->keyCtx, ctx->params), CRYPTO_SUCCESS);

    ctx->cnt = ctx->randomLen / ctx->blockSize;
    ctx->rem = ctx->randomLen % ctx->blockSize;

    // 分段加密
    for (int i = 0; i < ctx->cnt; i++) {
        ctx->msgBlob.len = ctx->blockSize;
        OH_Crypto_FreeDataBlob(&ctx->outUpdate);
        EXPECT_EQ(OH_CryptoSymCipher_Update(ctx->encCtx, &ctx->msgBlob, &ctx->outUpdate), CRYPTO_SUCCESS);
        ctx->msgBlob.data += ctx->blockSize;
        SafeMemcpy(&ctx->cipherText[ctx->cipherLen], sizeof(ctx->cipherText) - ctx->cipherLen,
            ctx->outUpdate.data, ctx->outUpdate.len);
        ctx->cipherLen += ctx->outUpdate.len;
    }

    // 剩余数据
    if (ctx->rem > 0) {
        OH_Crypto_FreeDataBlob(&ctx->outUpdate);
        ctx->msgBlob.len = ctx->rem;
        EXPECT_EQ(OH_CryptoSymCipher_Update(ctx->encCtx, &ctx->msgBlob, &ctx->outUpdate), CRYPTO_SUCCESS);
        SafeMemcpy(&ctx->cipherText[ctx->cipherLen], sizeof(ctx->cipherText) - ctx->cipherLen,
            ctx->outUpdate.data, ctx->outUpdate.len);
        ctx->cipherLen += ctx->outUpdate.len;
    }

    // 最终加密获取TAG
    if (spec->ispadding) {
        EXPECT_EQ(OH_CryptoSymCipher_Final(ctx->encCtx, nullptr, &ctx->tag), CRYPTO_SUCCESS);
    }
    ctx->cipherBlob.data = ctx->cipherText;
    ctx->cipherBlob.len = ctx->cipherLen;
}

static void DoDecryptAndVerify(ChaChaBlockTestCtx *ctx)
{
    SymCipherSpec *spec = &ctx->cipherSpec;

    ctx->msgBlob.data -= (ctx->randomLen - ctx->rem);
    ctx->msgBlob.len = ctx->randomLen;

    EXPECT_EQ(OH_CryptoSymCipher_Create((const char *)spec->cipherAlgName, &ctx->decCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_SetParam(ctx->params, CRYPTO_TAG_DATABLOB, &ctx->tag), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Init(ctx->decCtx, CRYPTO_DECRYPT_MODE, ctx->keyCtx, ctx->params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Final(ctx->decCtx, &ctx->cipherBlob, &ctx->decUpdate), CRYPTO_SUCCESS);

    EXPECT_TRUE(memcmp(ctx->msgBlob.data, ctx->decUpdate.data, ctx->msgBlob.len) == 0);
}

static int32_t ChaChaBlockCipherDoTest(ChaChaBlockTestCtx *ctx)
{
    InitRandomAndGenerateData(ctx);
    GenerateAndSetKey(ctx);
    InitCipherParams(ctx);
    DoBlockEncrypt(ctx);
    DoDecryptAndVerify(ctx);
    return CRYPTO_SUCCESS;
}

static void ChaChaBlockTestCtxDestroy(ChaChaBlockTestCtx *ctx)
{
    if (ctx->params) {
        OH_CryptoSymCipherParams_Destroy(ctx->params);
    }
    if (ctx->encCtx) {
        OH_CryptoSymCipher_Destroy(ctx->encCtx);
    }
    if (ctx->decCtx) {
        OH_CryptoSymCipher_Destroy(ctx->decCtx);
    }
    if (ctx->genCtx) {
        OH_CryptoSymKeyGenerator_Destroy(ctx->genCtx);
    }
    if (ctx->keyCtx) {
        OH_CryptoSymKey_Destroy(ctx->keyCtx);
    }
    if (ctx->randomObj) {
        OH_CryptoRand_Destroy(ctx->randomObj);
    }

    HcfBlobDataClearAndFree(&ctx->outUpdate);
    HcfBlobDataClearAndFree(&ctx->msgBlob);
    HcfBlobDataClearAndFree(&ctx->ivBlob);
    HcfBlobDataClearAndFree(&ctx->aadBlob);
    HcfBlobDataClearAndFree(&ctx->tag);
    HcfBlobDataClearAndFree(&ctx->decUpdate);
}

int SubCryptoFrameworkNapiSymCipherTest2800()
{
    const int symCipherSpecCount = SYM_CHA_CHA20_POLY1305_CIPHER_DATA_COUNT;
    for (int i = 0; i < symCipherSpecCount; i++) {
        ChaChaBlockTestCtx testCtx;
        ChaChaBlockTestCtxInit(&testCtx, &g_symChaCha20Poly1305CipherData[i]);
        ChaChaBlockCipherDoTest(&testCtx);
        ChaChaBlockTestCtxDestroy(&testCtx);
    }
    return 0;
}

int SubCryptoFrameworkNapiSymCipherTest2900()
{
    const int symCipherSpecCount = CHA_CHA20_IV_ERROR_COUNT;
    for (int i = 0; i < symCipherSpecCount; i++) {
        SymCipherSpec symCipherData = g_chaCha20IvError[i];
        OH_CryptoSymKeyGenerator *genCtx = nullptr;
        OH_CryptoSymCipher *encCtx = nullptr;
        OH_CryptoSymKey *keyCtx = nullptr;
        OH_CryptoSymCipherParams *params = nullptr;
        int32_t ivLen = symCipherData.ivLen;
        OH_CryptoRand *randomObj = nullptr;
        Crypto_DataBlob ivBlob = {0};
        OH_CryptoRand_Create(&randomObj);
        EXPECT_TRUE(randomObj != nullptr);
        EXPECT_EQ(OH_CryptoRand_GenerateRandom(randomObj, ivLen, &ivBlob), HCF_SUCCESS);
        EXPECT_EQ(OH_CryptoSymKeyGenerator_Create(reinterpret_cast<const char*>(symCipherData.algName),
            &genCtx), CRYPTO_SUCCESS);
        EXPECT_EQ(OH_CryptoSymKeyGenerator_Generate(genCtx, &keyCtx), CRYPTO_SUCCESS);
        EXPECT_EQ(OH_CryptoSymCipherParams_Create(&params), CRYPTO_SUCCESS);
        EXPECT_EQ(OH_CryptoSymCipherParams_SetParam(params, CRYPTO_IV_DATABLOB, (Crypto_DataBlob *)&ivBlob),
            CRYPTO_SUCCESS);
        EXPECT_EQ(OH_CryptoSymCipher_Create(reinterpret_cast<const char*>(symCipherData.cipherAlgName),
            &encCtx), CRYPTO_SUCCESS);
        EXPECT_EQ(OH_CryptoSymCipher_Init(encCtx, CRYPTO_ENCRYPT_MODE, keyCtx, params),
            CRYPTO_OPERTION_ERROR);
        OH_CryptoSymCipherParams_Destroy(params);
        OH_CryptoSymCipher_Destroy(encCtx);
        OH_CryptoSymKeyGenerator_Destroy(genCtx);
        OH_CryptoSymKey_Destroy(keyCtx);
        HcfBlobDataClearAndFree(&ivBlob);
        OH_CryptoRand_Destroy(randomObj);
    }
    return 0;
}
    
int SubCryptoFrameworkNapiSymCipherTest3000()
{
    OH_CryptoSymKeyGenerator *genCtx = nullptr;
    OH_CryptoSymCipher *encCtx = nullptr;
    OH_CryptoSymCipher *decCtx = nullptr;
    OH_CryptoSymKey *keyCtx = nullptr;
    OH_CryptoSymCipherParams *params = nullptr;
    Crypto_DataBlob outUpdate = {.data = nullptr, .len = 0};
    Crypto_DataBlob decUpdate = {.data = nullptr, .len = 0};
    uint8_t ivData[] = {
        0x04, 0xe1, 0xe2, 0xa8, 0xcc, 0x3e, 0x75, 0xa0, 0x23, 0x74, 0xbc, 0x38, 0xb2, 0xb8, 0xd3, 0x42
    };
    Crypto_DataBlob ivBlob = {.data = ivData, .len = sizeof(ivData)};
    uint8_t msgData[] = {
        0x3e, 0x31, 0x4a, 0x62, 0x68, 0xd6, 0xe0, 0x45, 0xc9, 0xe1, 0x3c, 0x36, 0x65, 0xbb, 0x18, 0x5e,
        0x8f, 0x9c, 0xc4, 0xfc
    };
    Crypto_DataBlob msgBlob = {.data = msgData, .len = sizeof(msgData)};
    uint8_t keyData[] = {
        0x46, 0x01, 0x3c, 0xb4, 0x38, 0x9e, 0x14, 0xc4, 0xf6, 0x68, 0x2e, 0x6b, 0x95, 0x4e, 0x14, 0x8c
    };
    Crypto_DataBlob keyBlob = {.data = keyData, .len = sizeof(keyData)};
    EXPECT_EQ(OH_CryptoSymKeyGenerator_Create((const char *)"AES128", &genCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymKeyGenerator_Convert(genCtx, (Crypto_DataBlob *)&keyBlob, &keyCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_Create(&params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipherParams_SetParam(params, CRYPTO_IV_DATABLOB, (Crypto_DataBlob *)&ivBlob),
        CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Create((const char *)"AES128|CBC|PKCS7", &encCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Init(encCtx, CRYPTO_ENCRYPT_MODE, keyCtx, params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Final(encCtx, (Crypto_DataBlob *)&msgBlob, &outUpdate), CRYPTO_SUCCESS);
    outUpdate.data[msgBlob.len]++;
    EXPECT_EQ(OH_CryptoSymCipher_Create((const char *)"AES128|CBC|PKCS7", &decCtx), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Init(decCtx, CRYPTO_DECRYPT_MODE, keyCtx, params), CRYPTO_SUCCESS);
    EXPECT_EQ(OH_CryptoSymCipher_Final(decCtx, &outUpdate, &decUpdate), CRYPTO_SUCCESS);

    OH_CryptoSymCipherParams_Destroy(params);
    OH_CryptoSymCipher_Destroy(encCtx);
    OH_CryptoSymCipher_Destroy(decCtx);
    OH_CryptoSymKeyGenerator_Destroy(genCtx);
    OH_CryptoSymKey_Destroy(keyCtx);
    HcfBlobDataClearAndFree((Crypto_DataBlob *)&outUpdate);
    HcfBlobDataClearAndFree((Crypto_DataBlob *)&decUpdate);
    return 0;
}
        
} // namespace Unittest::CryptoFrameworkSymCipherNapiTest