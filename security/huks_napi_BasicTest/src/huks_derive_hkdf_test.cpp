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

#include "huks_derive_hkdf_test.h"
#include "huks_derive_hkdf_test_common.h"

#include <gtest/gtest.h>

using namespace testing::ext;
namespace Unittest::HkdfDerive {
class HuksDeriveHKDFTest : public testing::Test {
public:
    static void SetUpTestCase(void);

    static void TearDownTestCase(void);

    void SetUp();

    void TearDown();
};

void HuksDeriveHKDFTest::SetUpTestCase(void)
{
}

void HuksDeriveHKDFTest::TearDownTestCase(void)
{
}

void HuksDeriveHKDFTest::SetUp()
{
    
}

void HuksDeriveHKDFTest::TearDown()
{
}
static struct OH_Huks_Param g_genParams001[] = {
    {
        .tag =  OH_HUKS_TAG_ALGORITHM,
        .uint32Param = OH_HUKS_ALG_AES
    }, {
        .tag =  OH_HUKS_TAG_PURPOSE,
        .uint32Param = OH_HUKS_KEY_PURPOSE_DERIVE
    }, {
        .tag =  OH_HUKS_TAG_DIGEST,
        .uint32Param = OH_HUKS_DIGEST_SHA256
    }, {
        .tag =  OH_HUKS_TAG_KEY_SIZE,
        .uint32Param = OH_HUKS_AES_KEY_SIZE_256
    }
};
static struct OH_Huks_Param g_hkdfParams001[] = {
    {
        .tag =  OH_HUKS_TAG_ALGORITHM,
        .uint32Param = OH_HUKS_ALG_HKDF
    }, {
        .tag =  OH_HUKS_TAG_PURPOSE,
        .uint32Param = OH_HUKS_KEY_PURPOSE_DERIVE
    }, {
        .tag =  OH_HUKS_TAG_DIGEST,
        .uint32Param = OH_HUKS_DIGEST_SHA256
    }, {
        .tag =  OH_HUKS_TAG_DERIVE_KEY_SIZE,
        .uint32Param = DERIVE_KEY_SIZE_32
    }
};
static struct OH_Huks_Param g_hkdfFinishParams001[] = {
    {
        .tag =  OH_HUKS_TAG_KEY_STORAGE_FLAG,
        .uint32Param = OH_HUKS_STORAGE_PERSISTENT
    }, {
        .tag =  OH_HUKS_TAG_KEY_ALIAS,
        .blob = {
            strlen("HksHKDFDeriveKeyAliasFinalTest001"),
            (uint8_t *)"HksHKDFDeriveKeyAliasFinalTest001"
        }
    }, {
        .tag =  OH_HUKS_TAG_ALGORITHM,
        .uint32Param = OH_HUKS_ALG_HKDF
    }, {
        .tag =  OH_HUKS_TAG_KEY_SIZE,
        .uint32Param = DERIVE_KEY_SIZE_32
    }, {
        .tag =  OH_HUKS_TAG_PURPOSE,
        .uint32Param = OH_HUKS_KEY_PURPOSE_DERIVE
    }, {
        .tag =  OH_HUKS_TAG_DIGEST,
        .uint32Param = OH_HUKS_DIGEST_SHA256
    }
};

/**
 * @tc.name: HuksDeriveHKDFTest.Security_HUKS_NAPI_Derive_hkdf_0100
 * @tc.desc: alg-HKDF pur-Derive dig-SHA256 KEY_SIZE-128
 * @tc.type: FUNC
 */
HWTEST_F(HuksDeriveHKDFTest, Security_HUKS_NAPI_Derive_hkdf_0100, TestSize.Level0)
{
    struct OH_Huks_Blob keyAlias = { strlen("HksHKDFDeriveKeyAliasTest001"), (uint8_t *)"HksHKDFDeriveKeyAliasTest001" };

    /* 1. Generate Key */
    struct OH_Huks_ParamSet *genParamSet = nullptr;
    OH_Huks_Result ret = InitParamSet(&genParamSet, g_genParams001, sizeof(g_genParams001) / sizeof(OH_Huks_Param));
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "InitParamSet failed.";

    /* 2. HKDF Three Stage */
    struct OH_Huks_ParamSet *hkdfParamSet = nullptr;
    struct OH_Huks_ParamSet *hkdfFinishParamSet = nullptr;
    ret = InitParamSet(&hkdfParamSet, g_hkdfParams001, sizeof(g_hkdfParams001) / sizeof(OH_Huks_Param));
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "InitParamSet failed.";
    // finish paramset
    ret = InitParamSet(&hkdfFinishParamSet, g_hkdfFinishParams001, sizeof(g_hkdfFinishParams001) / sizeof(OH_Huks_Param));
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "InitParamSet failed.";

    // Init-Update-final
    HksHkdfDeriveTestNormalCase(keyAlias, genParamSet, hkdfParamSet, hkdfFinishParamSet);
    /* 3. Delete Key */
    ret = OH_Huks_DeleteKeyItem(&keyAlias, genParamSet);
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "DeleteKey failed.";
    struct OH_Huks_Blob deleteKeyAlias = { .size = strlen("HksHKDFDeriveKeyAliasFinalTest001"),
        .data = (uint8_t *)"HksHKDFDeriveKeyAliasFinalTest001"};
    ret = OH_Huks_DeleteKeyItem(&deleteKeyAlias, NULL);
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "Delete Final Key failed.";

    OH_Huks_FreeParamSet(&genParamSet);
    OH_Huks_FreeParamSet(&hkdfParamSet);
    OH_Huks_FreeParamSet(&hkdfFinishParamSet);
}
} // namespace Unittest::HkdfDerive