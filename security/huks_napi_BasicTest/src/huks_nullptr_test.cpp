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

#include "huks_nullptr_test.h"
#include <gtest/gtest.h>

using namespace testing::ext;
namespace Unittest::NullPtrTest{
class HuksNullptrTest : public testing::Test{
public:
    static void SetUpTestCase(void);

    static void TearDownTestCase(void);

    void SetUp();

    void TearDown();
};

void HuksNullptrTest::SetUpTestCase(void)
{
}

void HuksNullptrTest::TearDownTestCase(void)
{
}

void HuksNullptrTest::SetUp()
{
    
}

void HuksNullptrTest::TearDown()
{
}

static struct OH_Huks_ParamSet *paramSetNullptr=nullptr;
static struct OH_Huks_Param *paramNullptr=nullptr;
static struct OH_Huks_Blob *blobNullptr=nullptr;
static struct OH_Huks_CertChain *certChainNullptr=nullptr;

/**
 * @tc.name: HuksNullptrTest.Security_HUKS_NAPI_nullptr_0100
 * @tc.desc: use nullptr.
 * @tc.type: FUNC
 */
HWTEST_F(HuksNullptrTest, Security_HUKS_NAPI_nullptr_0100, TestSize.Level0)
{
    OH_Huks_Result ret=OH_Huks_InitParamSet(&paramSetNullptr);
    EXPECT_EQ(ret.errorCode, OH_HUKS_SUCCESS) << "this case failed.";

    ret=OH_Huks_AddParams(paramSetNullptr,paramNullptr,0);
    EXPECT_NE(ret.errorCode, OH_HUKS_SUCCESS) << "this case failed.";

    ret=OH_Huks_BuildParamSet(&paramSetNullptr);
    EXPECT_EQ(ret.errorCode, OH_HUKS_SUCCESS) << "this case failed.";

    ret=OH_Huks_CopyParamSet(paramSetNullptr,0,&paramSetNullptr);
    EXPECT_NE(ret.errorCode, OH_HUKS_SUCCESS) << "this case failed.";

    ret=OH_Huks_GetParam(paramSetNullptr,0,&paramNullptr);
    EXPECT_NE(ret.errorCode, OH_HUKS_SUCCESS) << "this case failed.";

    ret=OH_Huks_FreshParamSet(paramSetNullptr,0);
    EXPECT_EQ(ret.errorCode, OH_HUKS_SUCCESS) << "this case failed.";

    ret=OH_Huks_IsParamSetTagValid(paramSetNullptr);
    EXPECT_EQ(ret.errorCode, OH_HUKS_SUCCESS) << "this case failed.";

    ret=OH_Huks_IsParamSetValid(paramSetNullptr,0);
    EXPECT_NE(ret.errorCode, OH_HUKS_SUCCESS) << "this case failed.";

    struct OH_Huks_Param baseParam = { .tag = OH_HUKS_TAG_ALGORITHM, .uint64Param = (uint64_t)1 };
    struct OH_Huks_Param otherParam = { .tag = OH_HUKS_TAG_ALGORITHM, .uint64Param = (uint64_t)2 };
    ret=OH_Huks_CheckParamMatch(&baseParam,&otherParam);
    EXPECT_NE(ret.errorCode, OH_HUKS_SUCCESS) << "this case failed.";

    ret=OH_Huks_GetSdkVersion(blobNullptr);
    EXPECT_NE(ret.errorCode, OH_HUKS_SUCCESS) << "this case failed.";

    ret=OH_Huks_GenerateKeyItem(blobNullptr,paramSetNullptr,paramSetNullptr);
    EXPECT_NE(ret.errorCode, OH_HUKS_SUCCESS) << "this case failed.";

    ret=OH_Huks_ImportWrappedKeyItem(blobNullptr,blobNullptr,paramSetNullptr,blobNullptr);
    EXPECT_NE(ret.errorCode, OH_HUKS_SUCCESS) << "this case failed.";

    ret=OH_Huks_ExportPublicKeyItem(blobNullptr,paramSetNullptr,blobNullptr);
    EXPECT_NE(ret.errorCode, OH_HUKS_SUCCESS) << "this case failed.";

    ret=OH_Huks_DeleteKeyItem(blobNullptr,paramSetNullptr);
    EXPECT_NE(ret.errorCode, OH_HUKS_SUCCESS) << "this case failed.";

    ret=OH_Huks_GetKeyItemParamSet(blobNullptr,paramSetNullptr,paramSetNullptr);
    EXPECT_NE(ret.errorCode, OH_HUKS_SUCCESS) << "this case failed.";

    ret=OH_Huks_IsKeyItemExist(blobNullptr,paramSetNullptr);
    EXPECT_NE(ret.errorCode, OH_HUKS_SUCCESS) << "this case failed.";

    ret=OH_Huks_AttestKeyItem(blobNullptr,paramSetNullptr,certChainNullptr);
    EXPECT_NE(ret.errorCode, OH_HUKS_SUCCESS) << "this case failed.";

    ret=OH_Huks_InitSession(blobNullptr,paramSetNullptr,blobNullptr,blobNullptr);
    EXPECT_NE(ret.errorCode, OH_HUKS_SUCCESS) << "this case failed.";

    ret=OH_Huks_UpdateSession(blobNullptr,paramSetNullptr,blobNullptr,blobNullptr);
    EXPECT_NE(ret.errorCode, OH_HUKS_SUCCESS) << "this case failed.";

    ret=OH_Huks_FinishSession(blobNullptr,paramSetNullptr,blobNullptr,blobNullptr);
    EXPECT_NE(ret.errorCode, OH_HUKS_SUCCESS) << "this case failed.";

    ret=OH_Huks_AbortSession(blobNullptr,paramSetNullptr);
    EXPECT_NE(ret.errorCode, OH_HUKS_SUCCESS) << "this case failed.";
}
};
