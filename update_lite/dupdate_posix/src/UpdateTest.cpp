/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
 */
/*
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

#include <stdio.h>
#include "gtest/gtest.h"
#include "hota_updater.h"
#include "ohos_types.h"

const int USE_HOS_PKG = 1;
const int NOT_HOS_PKG = 0;
const int ERR_PAK_FALG = 2;
const int DATA_LENGTH = 190;
const int DATA_OFFSET = 0;

using namespace std;
using namespace testing::ext;

class UpdateTest : public testing::Test {
protected:
    static void SetUpTestCase(void) {}
    static void TearDownTestCase(void) {}
    virtual void SetUp() {}
    virtual void TearDown() {}
};

/**
 * @tc.number    : SUB_Upgrade_API_0200
 * @tc.name      : Sets the switch for using the default upgrade package format
 * @tc.desc      : [C- SOFTWARE -0200]
 */
HWTEST_F(UpdateTest, subUpgradeAPI0200, Function | MediumTest | Level1)
{
    unsigned int ret;
    ret = HotaSetPackageType(USE_HOS_PKG);
    printf("use package flag = %d\r\n, return = %d\r\n", USE_HOS_PKG, ret);
    EXPECT_EQ(OHOS_SUCCESS, ret);
};

/**
 * @tc.number    : SUB_Upgrade_API_0300
 * @tc.name      : Sets the switch for using the non default upgrade package format
 * @tc.desc      : [C- SOFTWARE -0200]
 */
HWTEST_F(UpdateTest, subUpgradeAPI0300, Function | MediumTest | Level1)
{
    unsigned int ret;
    ret = HotaSetPackageType(NOT_HOS_PKG);
    printf("use package flag = %d\r\n, return = %d\r\n", NOT_HOS_PKG, ret);
    EXPECT_EQ(OHOS_SUCCESS, ret);
};

/**
 * @tc.number    : SUB_Upgrade_API_0400
 * @tc.name      : Sets the switch for using the default upgrade package format fail
 * @tc.desc      : [C- SOFTWARE -0200]
 */
HWTEST_F(UpdateTest, subUpgradeAPI0400, Function | MediumTest | Level1)
{
    unsigned int ret;
    ret = HotaSetPackageType(ERR_PAK_FALG);
    printf("use package flag = %d, return = %d\r\n", ERR_PAK_FALG, ret);
    EXPECT_EQ(OHOS_FAILURE, ret);
};

/**
 * @tc.number    : SUB_Upgrade_API_0500
 * @tc.name      : Obtains the index of the A or B partition to be upgraded
 * @tc.desc      : [C- SOFTWARE -0200]
 */
HWTEST_F(UpdateTest, subUpgradeAPI0500, Function | MediumTest | Level1)
{
    unsigned int ret;
    unsigned int index = 0;
    ret = HotaGetUpdateIndex(&index);
    printf("index = %d\r\n, get index return = %d\r\n", index, ret);
    EXPECT_EQ(OHOS_SUCCESS, ret);
};