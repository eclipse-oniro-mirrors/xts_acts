/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

#include <gtest/gtest.h>

#include "huks_attest_test.h"
#include "huks_attest_test_common.h"

using namespace testing::ext;
namespace Unittest::AttestKey {
static struct OH_Huks_Blob g_secInfo = { sizeof(SEC_INFO_DATA), (uint8_t *)SEC_INFO_DATA };
static struct OH_Huks_Blob g_challenge = { sizeof(CHALLENGE_DATA), (uint8_t *)CHALLENGE_DATA };
static struct OH_Huks_Blob g_version = { sizeof(VERSION_DATA), (uint8_t *)VERSION_DATA };
bool useSoftware = true;

class HuksAttestKeyNoIdsTest : public testing::Test {
public:
    static void SetUpTestCase(void);

    static void TearDownTestCase(void);

    void SetUp();

    void TearDown();
};

void HuksAttestKeyNoIdsTest::SetUpTestCase(void)
{
    useSoftware = checkUseSoftware();
}

void HuksAttestKeyNoIdsTest::TearDownTestCase(void)
{
}

void HuksAttestKeyNoIdsTest::SetUp()
{
}

void HuksAttestKeyNoIdsTest::TearDown()
{
}

static const struct OH_Huks_Blob g_keyAlias = { sizeof(ALIAS), (uint8_t *)ALIAS };

static const struct OH_Huks_Param g_commonParams[] = {
    { .tag = OH_HUKS_TAG_ATTESTATION_ID_SEC_LEVEL_INFO, .blob = g_secInfo },
    { .tag = OH_HUKS_TAG_ATTESTATION_CHALLENGE, .blob = g_challenge },
    { .tag = OH_HUKS_TAG_ATTESTATION_ID_VERSION_INFO, .blob = g_version },
    { .tag = OH_HUKS_TAG_ATTESTATION_ID_ALIAS, .blob = g_keyAlias },
};

/**
 * @tc.name: HuksAttestKeyNoIdsTest.Security_HUKS_NAPI_Attest_0100
 * @tc.desc: attest with right params and validate success.
 * @tc.type: FUNC
 * @tc.require: issueI5NY0L
 */
HWTEST_F(HuksAttestKeyNoIdsTest, Security_HUKS_NAPI_Attest_0100, TestSize.Level0)
{
    if (useSoftware)
    {
        OH_Huks_Result ret = TestGenerateKey(&g_keyAlias);
        ASSERT_TRUE(ret.errorCode == (int32_t)OH_HUKS_SUCCESS);
        struct OH_Huks_ParamSet *paramSet = NULL;
        GenerateParamSet(&paramSet, g_commonParams, sizeof(g_commonParams) / sizeof(g_commonParams[0]));
        OH_Huks_CertChain *certChain = NULL;
        const struct HksTestCertChain certParam = { true, true, true, g_size };
        (void)ConstructDataToCertChain(&certChain, &certParam);
        ret = OH_Huks_AttestKeyItem(&g_keyAlias, paramSet, certChain);
        ASSERT_TRUE(ret.errorCode != (int32_t)OH_HUKS_SUCCESS);
        ret = ValidateCertChainTest(certChain, g_commonParams, NON_IDS_PARAM);
        ASSERT_TRUE(ret.errorCode != (int32_t)OH_HUKS_SUCCESS);
        FreeCertChain(&certChain, certChain->certsCount);
        certChain = NULL;

        OH_Huks_FreeParamSet(&paramSet);

        OH_Huks_Result ret1 = OH_Huks_DeleteKeyItem(&g_keyAlias, NULL);
        ASSERT_TRUE(ret1.errorCode == (int32_t)OH_HUKS_SUCCESS);
    }
    ASSERT_TRUE(0 == 0);
}
}
