/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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

#include "hks_cipher_test.h"

#include "hks_api.h"
#include "hks_param.h"
#include "hks_test_cipher.h"

#include "securec.h"

using namespace testing::ext;
namespace {
class HksCipherTest : public testing::Test {
public:
    static void SetUpTestCase(void);

    static void TearDownTestCase(void);

    void SetUp();

    void TearDown();
};

void HksCipherTest::SetUpTestCase(void)
{
}

void HksCipherTest::TearDownTestCase(void)
{
}

void HksCipherTest::SetUp()
{
    EXPECT_EQ(HksInitialize(), 0);
}

void HksCipherTest::TearDown()
{
}

/**
 * @tc.name   HksCipherTest001
 * @tc.number HksCipherTest001
 * @tc.desc   The static function will return true;
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(HksCipherTest, HksCipherTest001, TestSize.Level1)
{
    ASSERT_TRUE(BaseTestCipher(1, 0, 1) == 0);
}

#ifndef _CUT_AUTHENTICATE_
/**
 * @tc.name   HksCipherTest002
 * @tc.number HksCipherTest002
 * @tc.desc   HksCipherTest002
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(HksCipherTest, HksCipherTest002, TestSize.Level1)
{
    ASSERT_TRUE(BaseTestCipher(1, 1, 1) == 0);
}

/**
 * @tc.name   HksCipherTest003
 * @tc.number HksCipherTest003
 * @tc.desc   HksCipherTest003
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(HksCipherTest, HksCipherTest003, TestSize.Level1)
{
    ASSERT_TRUE(BaseTestEncrypt(1, 0, 1) == 0);
}

/**
 * @tc.name   HksCipherTest004
 * @tc.number HksCipherTest004
 * @tc.desc   HksCipherTest004
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(HksCipherTest, HksCipherTest004, TestSize.Level1)
{
    ASSERT_TRUE(BaseTestEncrypt(1, 1, 1) == 0);
}

/**
 * @tc.name   HksCipherTest005
 * @tc.number HksCipherTest005
 * @tc.desc   HksCipherTest005
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(HksCipherTest, HksCipherTest005, TestSize.Level1)
{
    ASSERT_TRUE(BaseTestEncrypt(1, 2, 1) == 0);
}

/**
 * @tc.name   HksCipherTest006
 * @tc.number HksCipherTest006
 * @tc.desc   HksCipherTest006
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(HksCipherTest, HksCipherTest006, TestSize.Level1)
{
    ASSERT_TRUE(BaseTestEncrypt(1, 3, 1) == 0);
}

/**
 * @tc.name   HksCipherTest007
 * @tc.number HksCipherTest007
 * @tc.desc   HksCipherTest007
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(HksCipherTest, HksCipherTest007, TestSize.Level1)
{
    ASSERT_TRUE(BaseTestEncrypt(1, 4, 1) == 0);
}

/**
 * @tc.name   HksCipherTest008
 * @tc.number HksCipherTest008
 * @tc.desc   HksCipherTest008
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(HksCipherTest, HksCipherTest008, TestSize.Level1)
{
    ASSERT_TRUE(BaseTestDecrypt(1, 0, 1) == 0);
}

/**
 * @tc.name   HksCipherTest009
 * @tc.number HksCipherTest009
 * @tc.desc   HksCipherTest009
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(HksCipherTest, HksCipherTest009, TestSize.Level1)
{
    ASSERT_TRUE(BaseTestDecrypt(1, 1, 1) == 0);
}

/**
 * @tc.name   HksCipherTest010
 * @tc.number HksCipherTest010
 * @tc.desc   HksCipherTest010
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(HksCipherTest, HksCipherTest010, TestSize.Level1)
{
    ASSERT_TRUE(BaseTestCipher(1, 2, 1) == 0);
}

/**
 * @tc.name   HksCipherTest011
 * @tc.number HksCipherTest011
 * @tc.desc   HksCipherTest011
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(HksCipherTest, HksCipherTest011, TestSize.Level1)
{
    ASSERT_TRUE(BaseTestDecrypt(1, 3, 1) == 0);
}

/**
 * @tc.name   HksCipherTest012
 * @tc.number HksCipherTest012
 * @tc.desc   HksCipherTest012
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(HksCipherTest, HksCipherTest012, TestSize.Level1)
{
    ASSERT_TRUE(BaseTestDecrypt(1, 4, 1) == 0);
}
#endif /* _CUT_AUTHENTICATE_ */
}