/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

#include "huks_cipher_sm4_test.h"
#include <gtest/gtest.h>

#include "huks_cipher_sm4_test_common.h"

using namespace testing::ext;
namespace Unittest::Sm4Cipher {
class HuksCipherSM4Test : public testing::Test {
public:
    static void SetUpTestCase(void);

    static void TearDownTestCase(void);

    void SetUp();

    void TearDown();
};

void HuksCipherSM4Test::SetUpTestCase(void)
{
}

void HuksCipherSM4Test::TearDownTestCase(void)
{
}

void HuksCipherSM4Test::SetUp()
{
    
}

void HuksCipherSM4Test::TearDown()
{
}

static struct OH_Huks_Param g_genParams001[] = {
    {
        .tag = OH_HUKS_TAG_ALGORITHM,
        .uint32Param = OH_HUKS_ALG_SM4,
    }, {
        .tag = OH_HUKS_TAG_PURPOSE,
        .uint32Param = OH_HUKS_KEY_PURPOSE_ENCRYPT | OH_HUKS_KEY_PURPOSE_DECRYPT
    }, {
        .tag = OH_HUKS_TAG_KEY_SIZE,
        .uint32Param = OH_HUKS_SM4_KEY_SIZE_128
    }, {
        .tag = OH_HUKS_TAG_PADDING,
        .uint32Param = OH_HUKS_PADDING_NONE
    }, {
        .tag = OH_HUKS_TAG_BLOCK_MODE,
        .uint32Param = OH_HUKS_MODE_CBC
    }
};

static uint8_t g_hksSm4TestIv[HKS_SM4_IV_SIZE] = {0};

static struct OH_Huks_Param g_encryptParams001[] = {
    {
        .tag = OH_HUKS_TAG_ALGORITHM,
        .uint32Param = OH_HUKS_ALG_SM4
    }, {
        .tag = OH_HUKS_TAG_PURPOSE,
        .uint32Param = OH_HUKS_KEY_PURPOSE_ENCRYPT
    }, {
        .tag = OH_HUKS_TAG_KEY_SIZE,
        .uint32Param = OH_HUKS_SM4_KEY_SIZE_128
    }, {
        .tag = OH_HUKS_TAG_PADDING,
        .uint32Param = OH_HUKS_PADDING_NONE
    }, {
        .tag = OH_HUKS_TAG_BLOCK_MODE,
        .uint32Param = OH_HUKS_MODE_CBC
    }, {
        .tag = OH_HUKS_TAG_IV,
        .blob = {
            .size = HKS_SM4_IV_SIZE,
            .data = (uint8_t *)g_hksSm4TestIv
        }
    }
};

static struct OH_Huks_Param g_decryptParams001[] = {
    {
        .tag = OH_HUKS_TAG_ALGORITHM,
        .uint32Param = OH_HUKS_ALG_SM4
    }, {
        .tag = OH_HUKS_TAG_PURPOSE,
        .uint32Param = OH_HUKS_KEY_PURPOSE_DECRYPT
    }, {
        .tag = OH_HUKS_TAG_KEY_SIZE,
        .uint32Param = OH_HUKS_SM4_KEY_SIZE_128
    }, {
        .tag = OH_HUKS_TAG_PADDING,
        .uint32Param = OH_HUKS_PADDING_NONE
    }, {
        .tag = OH_HUKS_TAG_BLOCK_MODE,
        .uint32Param = OH_HUKS_MODE_CBC
    }, {
        .tag = OH_HUKS_TAG_IV,
        .blob = {
            .size = HKS_SM4_IV_SIZE,
            .data = (uint8_t *)g_hksSm4TestIv
        }
    }
};

/**
 * @tc.name: HuksCipherSM4Test.Security_HUKS_NAPI_Cipher_SM4_0100
 * @tc.desc: alg-SM4
 * @tc.type: FUNC
 */
HWTEST_F(HuksCipherSM4Test, Security_HUKS_NAPI_Cipher_SM4_0100, TestSize.Level0)
{
    char tmpKeyAlias[] = "HksSm4CipherKeyAliasTest001";
    struct OH_Huks_Blob keyAlias = { strlen(tmpKeyAlias), (uint8_t *)tmpKeyAlias };

    struct OH_Huks_ParamSet *genParamSet = nullptr;
    OH_Huks_Result ret = InitParamSet(&genParamSet, g_genParams001, sizeof(g_genParams001) / sizeof(OH_Huks_Param));
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "InitParamSet(gen) failed.";

    struct OH_Huks_ParamSet *encryptParamSet = nullptr;
    ret = InitParamSet(&encryptParamSet, g_encryptParams001, sizeof(g_encryptParams001) / sizeof(OH_Huks_Param));
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "InitParamSet(encrypt) failed.";

    struct OH_Huks_ParamSet *decryptParamSet = nullptr;
    ret = InitParamSet(&decryptParamSet, g_decryptParams001, sizeof(g_decryptParams001) / sizeof(OH_Huks_Param));
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "InitParamSet(decrypt) failed.";

    ret = HksSm4CipherTestCaseOther(&keyAlias, genParamSet, encryptParamSet, decryptParamSet);
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "this case failed.";

    OH_Huks_FreeParamSet(&genParamSet);
    OH_Huks_FreeParamSet(&encryptParamSet);
    OH_Huks_FreeParamSet(&decryptParamSet);
}
}
