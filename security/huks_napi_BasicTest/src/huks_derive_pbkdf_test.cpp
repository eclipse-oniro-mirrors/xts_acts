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

#include "huks_derive_pbkdf_test.h"
#include "huks_derive_pbkdf_test_common.h"

#include <gtest/gtest.h>

using namespace testing::ext;
namespace Unittest::Pbkdf2Derive {
class HuksDerivePBKDFTest : public testing::Test {
public:
    static void SetUpTestCase(void);

    static void TearDownTestCase(void);

    void SetUp();

    void TearDown();
};

void HuksDerivePBKDFTest::SetUpTestCase(void)
{
}

void HuksDerivePBKDFTest::TearDownTestCase(void)
{
}

void HuksDerivePBKDFTest::SetUp()
{
    
}

void HuksDerivePBKDFTest::TearDown()
{
}

uint8_t g_saltgen[16] = {
    0x14, 0x10, 0x11, 0x3a, 0x27, 0x9e, 0xc8, 0x5f, 0xe0, 0xf3, 0x36, 0x17, 0x57, 0x42, 0x8e, 0xff
};

static struct OH_Huks_Param g_genParams001[] = {
    {
        .tag = OH_HUKS_TAG_ALGORITHM,
        .uint32Param = OH_HUKS_ALG_AES
    }, {
        .tag = OH_HUKS_TAG_PURPOSE,
        .uint32Param = OH_HUKS_KEY_PURPOSE_DERIVE
    }, {
        .tag = OH_HUKS_TAG_DIGEST,
        .uint32Param = OH_HUKS_DIGEST_SHA256
    }, {
        .tag = OH_HUKS_TAG_KEY_SIZE,
        .uint32Param = OH_HUKS_AES_KEY_SIZE_256
    }, {
        .tag = OH_HUKS_TAG_ITERATION,
        .uint32Param = 1000
    }, {
        .tag = OH_HUKS_TAG_SALT,
        .blob = {
            sizeof(g_saltgen),
            (uint8_t *)g_saltgen
        }
    }
};
static struct OH_Huks_Param g_pbkdf2Params001[] = {
    {
        .tag = OH_HUKS_TAG_ALGORITHM,
        .uint32Param = OH_HUKS_ALG_PBKDF2
    }, {
        .tag = OH_HUKS_TAG_PURPOSE,
        .uint32Param = OH_HUKS_KEY_PURPOSE_DERIVE
    }, {
        .tag = OH_HUKS_TAG_DIGEST,
        .uint32Param = OH_HUKS_DIGEST_SHA256
    }, {
        .tag = OH_HUKS_TAG_KEY_SIZE,
        .uint32Param = 256
    }, {
        .tag = OH_HUKS_TAG_ITERATION,
        .int32Param = DERIVE_ITERATION
    }, {
        .tag = OH_HUKS_TAG_SALT,
        .blob = {
            sizeof(g_saltgen),
            (uint8_t *)g_saltgen
        }
    }, {
        .tag = OH_HUKS_TAG_DERIVE_KEY_SIZE,
        .uint32Param = DERIVE_KEY_SIZE_32
    }
};
static struct OH_Huks_Param g_pbkdf2FinishParams001[] = {
    {
        .tag = OH_HUKS_TAG_KEY_STORAGE_FLAG,
        .uint32Param = OH_HUKS_STORAGE_PERSISTENT
    }, {
        .tag = OH_HUKS_TAG_KEY_ALIAS,
        .blob = {
            strlen("HksPBKDF2DeriveKeyAliasTest001_2"),
            (uint8_t *)"HksPBKDF2DeriveKeyAliasTest001_2"
        }
    }, {
        .tag = OH_HUKS_TAG_ALGORITHM,
        .uint32Param = OH_HUKS_ALG_AES
    }, {
        .tag = OH_HUKS_TAG_KEY_SIZE,
        .uint32Param = DERIVE_KEY_SIZE_32
    }, {
        .tag = OH_HUKS_TAG_PURPOSE,
        .uint32Param = OH_HUKS_KEY_PURPOSE_DERIVE
    }, {
        .tag = OH_HUKS_TAG_DIGEST,
        .uint32Param = OH_HUKS_DIGEST_SHA256
    }
};

/**
 * @tc.name: HuksDerivePBKDFTest.Security_HUKS_NAPI_Derive_pbkdf_0100
 * @tc.desc: alg-PBKDF2 pur-Derive dig-SHA256.
 * @tc.type: FUNC
 */
HWTEST_F(HuksDerivePBKDFTest, Security_HUKS_NAPI_Derive_pbkdf_0100, TestSize.Level0)
{
    struct OH_Huks_Blob keyAlias = { strlen("HksPBKDF2DeriveKeyAliasTest001_1"),
        (uint8_t *)"HksPBKDF2DeriveKeyAliasTest001_1" };
    /* 1. Generate Key */
    struct OH_Huks_ParamSet *genParamSet = nullptr;
    OH_Huks_Result ret = InitParamSet(&genParamSet, g_genParams001, sizeof(g_genParams001) / sizeof(OH_Huks_Param));
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "InitParamSet failed.";

    /* 2. PBKDF2 Three Stage */
    struct OH_Huks_ParamSet *pbkdf2ParamSet = nullptr;
    struct OH_Huks_ParamSet *pbkdf2FinishParamSet = nullptr;
    ret = InitParamSet(&pbkdf2ParamSet, g_pbkdf2Params001, sizeof(g_pbkdf2Params001) / sizeof(OH_Huks_Param));
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "InitParamSet failed.";
    // Finish paramset
    ret = InitParamSet(&pbkdf2FinishParamSet, g_pbkdf2FinishParams001,
        sizeof(g_pbkdf2FinishParams001) / sizeof(OH_Huks_Param));
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "InitParamSet failed.";

    // init-update-final
    HksPbkdf2DeriveTestNormalCase(keyAlias, genParamSet, pbkdf2ParamSet, pbkdf2FinishParamSet);
    /* 3. Delete Key */
    ret = OH_Huks_DeleteKeyItem(&keyAlias, genParamSet);
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "DeleteKey failed.";
    struct OH_Huks_Blob deleteKeyAlias = { .size = strlen("HksPBKDF2DeriveKeyAliasTest001_2"),
        .data = (uint8_t *)"HksPBKDF2DeriveKeyAliasTest001_2"};
    ret = OH_Huks_DeleteKeyItem(&deleteKeyAlias, NULL);
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "Delete Final Key failed.";

    OH_Huks_FreeParamSet(&genParamSet);
    OH_Huks_FreeParamSet(&pbkdf2ParamSet);
    OH_Huks_FreeParamSet(&pbkdf2FinishParamSet);
}
} // namespace Unittest::Pbkdf2Derive