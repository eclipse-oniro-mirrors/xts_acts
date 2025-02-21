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

#include "huks_signverify_rsa_test.h"
#include "huks_signverify_rsa_test_common.h"

#include <gtest/gtest.h>

using namespace testing::ext;
namespace Unittest::RsaSignVerify {
class HuksSignVerifyRSATest : public testing::Test {
public:
    static void SetUpTestCase(void);

    static void TearDownTestCase(void);

    void SetUp();

    void TearDown();
};

void HuksSignVerifyRSATest::SetUpTestCase(void)
{
}

void HuksSignVerifyRSATest::TearDownTestCase(void)
{
}

void HuksSignVerifyRSATest::SetUp()
{
    
}

void HuksSignVerifyRSATest::TearDown()
{
}

static struct OH_Huks_Param g_genParamsTest071[] = {
    {
        .tag = OH_HUKS_TAG_ALGORITHM,
        .uint32Param = OH_HUKS_ALG_RSA
    }, {
        .tag = OH_HUKS_TAG_PURPOSE,
        .uint32Param = OH_HUKS_KEY_PURPOSE_SIGN | OH_HUKS_KEY_PURPOSE_VERIFY
    }, {
        .tag = OH_HUKS_TAG_KEY_SIZE,
        .uint32Param = OH_HUKS_RSA_KEY_SIZE_4096
    }, {
        .tag = OH_HUKS_TAG_PADDING,
        .uint32Param = OH_HUKS_PADDING_PSS
    }, {
        .tag = OH_HUKS_TAG_DIGEST,
        .uint32Param = OH_HUKS_DIGEST_SHA384
    },
};
static struct OH_Huks_Param g_signParamsTest071[] = {
    {
        .tag = OH_HUKS_TAG_ALGORITHM,
        .uint32Param = OH_HUKS_ALG_RSA
    }, {
        .tag = OH_HUKS_TAG_PURPOSE,
        .uint32Param = OH_HUKS_KEY_PURPOSE_SIGN
    }, {
        .tag = OH_HUKS_TAG_KEY_SIZE,
        .uint32Param = OH_HUKS_RSA_KEY_SIZE_4096
    }, {
        .tag = OH_HUKS_TAG_PADDING,
        .uint32Param = OH_HUKS_PADDING_PSS
    }, {
        .tag = OH_HUKS_TAG_DIGEST,
        .uint32Param = OH_HUKS_DIGEST_SHA384
    }
};
static struct OH_Huks_Param g_verifyParamsTest071[] = {
    {
        .tag = OH_HUKS_TAG_ALGORITHM,
        .uint32Param = OH_HUKS_ALG_RSA
    }, {
        .tag = OH_HUKS_TAG_PURPOSE,
        .uint32Param = OH_HUKS_KEY_PURPOSE_VERIFY
    }, {
        .tag = OH_HUKS_TAG_KEY_SIZE,
        .uint32Param = OH_HUKS_RSA_KEY_SIZE_4096
    }, {
        .tag = OH_HUKS_TAG_PADDING,
        .uint32Param = OH_HUKS_PADDING_PSS
    }, {
        .tag = OH_HUKS_TAG_DIGEST,
        .uint32Param = OH_HUKS_DIGEST_SHA384
    }
};

/**
 * @tc.name: HuksSignVerifyRSATest.Security_HUKS_NAPI_SignVerify_RSA_0100
 * @tc.desc: alg-RSA pur-Sign pad-PKCS1_V1_5 digest-MD5.
 * @tc.type: FUNC
 */
HWTEST_F(HuksSignVerifyRSATest, Security_HUKS_NAPI_SignVerify_RSA_0100, TestSize.Level1)
{
    const char *keyAliasString = "HksRSASignVerifyKeyAliasTest071";
    struct OH_Huks_ParamSet *genParamSet = nullptr;
    struct OH_Huks_ParamSet *signParamSet = nullptr;
    struct OH_Huks_ParamSet *verifyParamSet = nullptr;

    OH_Huks_Result ret = InitParamSet(&genParamSet, g_genParamsTest071, sizeof(g_genParamsTest071) / sizeof(OH_Huks_Param));
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "InitParamSet failed.";
    ret = InitParamSet(&signParamSet, g_signParamsTest071, sizeof(g_signParamsTest071) / sizeof(OH_Huks_Param));
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "InitParamSet failed.";
    ret = InitParamSet(&verifyParamSet, g_verifyParamsTest071, sizeof(g_verifyParamsTest071) / sizeof(OH_Huks_Param));
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "InitParamSet failed.";

    /* Generate Key */
    struct OH_Huks_Blob keyAlias = {strlen(keyAliasString), (uint8_t *)keyAliasString};

    if ((genParamSet != nullptr) || (signParamSet != nullptr) || (verifyParamSet != nullptr)) {
        ret = HksRsaSignVerifyTestNormalCase(keyAlias, genParamSet, signParamSet, verifyParamSet);
    }

    /* Delete Key */
    ret = OH_Huks_DeleteKeyItem(&keyAlias, genParamSet);
    EXPECT_EQ(ret.errorCode, (int32_t)OH_HUKS_SUCCESS) << "DeleteKey failed.";

    OH_Huks_FreeParamSet(&genParamSet);
    OH_Huks_FreeParamSet(&signParamSet);
    OH_Huks_FreeParamSet(&verifyParamSet);
}
} // namespace Unittest::RsaSignVerify